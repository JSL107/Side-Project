import { Module } from '@nestjs/common';
import { SkillExperienceService } from './skill-experience.service';
import { SkillExperienceController } from './skill-experience.controller';

@Module({
  controllers: [SkillExperienceController],
  providers: [SkillExperienceService],
})
export class SkillExperienceModule {}
