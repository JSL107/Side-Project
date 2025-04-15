import { Module } from '@nestjs/common';
import { AppController } from './app.controller';
import { AppService } from './app.service';
import { ConfigModule } from '@nestjs/config';
import { TypeOrmModule } from '@nestjs/typeorm';
import { TypeOrmConfigService } from './config/typeorm-config-service';
import { UserModule } from './user/user.module';
import { SkillIconModule } from './skill-icon/skill-icon.module';
import { SkillExperienceModule } from './skill-experience/skill-experience.module';
@Module({
  imports: [
    ConfigModule.forRoot({
      isGlobal: true, // 전역으로 환경 변수 접근 가능하게 설정
    }),
    TypeOrmModule.forRootAsync({
      useClass: TypeOrmConfigService,
    }),
    UserModule,
    SkillIconModule,
    SkillExperienceModule,
  ],
  controllers: [AppController],
  providers: [AppService, TypeOrmConfigService],
})
export class AppModule {}
