import { Injectable } from '@nestjs/common';
import { CreateUserDto } from './dto/create-user.dto';
import { UpdateUserDto } from './dto/update-user.dto';
import { CommonService } from '../common/common-service';
import { User } from './entities/user.entity';

@Injectable()
export class UserService {
  constructor(private readonly commonService: CommonService) {}
  async create(createUserDto: CreateUserDto) {
    const result = await this.commonService.saveEntity(User, createUserDto);
    return result.id != '';
  }

  findAll() {
    return `This action returns all user`;
  }

  async findOne(id: string) {
    return await this.commonService.findOneEntity(User, { id: id });
  }

  update(id: number, updateUserDto: UpdateUserDto) {
    return `This action updates a #${id} user`;
  }

  remove(id: number) {
    return `This action removes a #${id} user`;
  }
}
