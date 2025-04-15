// src/common/common.service.ts
import { Injectable, InternalServerErrorException } from '@nestjs/common';
import {
  DataSource,
  QueryRunner,
  ObjectLiteral,
  EntityTarget,
  Repository,
  FindOptionsWhere,
} from 'typeorm';

@Injectable()
export class CommonService {
  constructor(private readonly dataSource: DataSource) {}

  /**
   * 트랜잭션이 필요한 비즈니스 로직을 감싸는 헬퍼
   */
  async withTransaction<T>(callback: (qr: QueryRunner) => Promise<T>): Promise<T> {
    const qr = this.dataSource.createQueryRunner();
    await qr.connect();
    await qr.startTransaction();

    try {
      const result = await callback(qr);
      await qr.commitTransaction();
      return result;
    } catch (error) {
      await qr.rollbackTransaction();
      throw error;
    } finally {
      await qr.release();
    }
  }

  /**
   * 어떤 Entity든 트랜잭션 내에서 저장
   */
  async saveEntity<T extends ObjectLiteral>(
    entityClass: EntityTarget<T>,
    entityData: T,
  ): Promise<T> {
    try {
      return this.withTransaction(async (qr) => {
        const repo: Repository<T> = qr.manager.getRepository(entityClass);
        const entity = repo.create(entityData);
        return await repo.save(entity);
      });
    } catch (e) {
      throw new InternalServerErrorException(e);
    }
  }

  /**
   * 어떤 Entity든 트랜잭션 내에서 수정
   */
  async updateEntity<T extends ObjectLiteral>(
    entityClass: EntityTarget<T>,
    criteria: FindOptionsWhere<T>,
    partialData: Partial<T>,
  ): Promise<void> {
    return this.withTransaction(async (qr) => {
      const repo = qr.manager.getRepository(entityClass);
      await repo.update(criteria, partialData);
    });
  }

  /**
   * 어떤 Entity든 트랜잭션 내에서 삭제
   */
  async deleteEntity<T extends ObjectLiteral>(
    entityClass: EntityTarget<T>,
    where: FindOptionsWhere<T>,
  ): Promise<void> {
    return this.withTransaction(async (qr) => {
      const repo = qr.manager.getRepository(entityClass);
      await repo.delete(where);
    });
  }

  /**
   * 어떤 Entity든 단일 조회 (트랜잭션 없이)
   */
  async findOneEntity<T extends ObjectLiteral>(
    entityClass: EntityTarget<T>,
    where: FindOptionsWhere<T>,
  ): Promise<T | null> {
    const repo = this.dataSource.getRepository(entityClass);
    return repo.findOneBy(where);
  }

  /**
   * 어떤 Entity든 전체 조회 (트랜잭션 없이)
   */
  async findAllEntities<T extends ObjectLiteral>(entityClass: EntityTarget<T>): Promise<T[]> {
    const repo = this.dataSource.getRepository(entityClass);
    return repo.find();
  }
}
