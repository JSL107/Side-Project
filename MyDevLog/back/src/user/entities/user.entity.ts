import { Entity, PrimaryGeneratedColumn, Column } from 'typeorm';

@Entity()
export class User {
  @PrimaryGeneratedColumn()
  id: number;

  @Column()
  email: string;

  @Column()
  nick_name: string;

  @Column()
  password: string;

  @Column()
  profileImage: string;

  @Column()
  createAt: Date;
}
