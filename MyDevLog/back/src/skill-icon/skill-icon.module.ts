import { Module } from '@nestjs/common';
import { SkillIconService } from './skill-icon.service';
import { SkillIconController } from './skill-icon.controller';

@Module({
  controllers: [SkillIconController],
  providers: [SkillIconService],
})
export class SkillIconModule {}
