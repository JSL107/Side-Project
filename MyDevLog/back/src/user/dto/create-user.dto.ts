import { IsEmail, IsNotEmpty, IsString, MinLength, IsUrl, IsOptional } from 'class-validator';

export class CreateUserDto {
  @IsString()
  id: string;

  @IsEmail()
  email: string;

  @IsNotEmpty()
  @IsString()
  nick_name: string;

  @IsNotEmpty()
  @MinLength(6)
  password: string;

  @IsOptional()
  @IsUrl()
  profileImage?: string;

  @IsOptional()
  createAt?: Date;
}
