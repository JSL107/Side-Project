import { Entity, Column, PrimaryColumn, BeforeInsert, CreateDateColumn } from 'typeorm';
import * as bcrypt from 'bcrypt';

@Entity()
export class User {
  @PrimaryColumn()
  id: string;

  @Column()
  email: string;

  @Column()
  nick_name: string;

  @Column()
  password: string;

  @Column({ nullable: true })
  profileImage: string;

  @CreateDateColumn()
  createAt: Date;

  @BeforeInsert()
  async hashPassword() {
    this.password = await bcrypt.hash(this.password, 10);
  }
}
