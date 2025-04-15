import { Test, TestingModule } from '@nestjs/testing';
import { SkillExperienceController } from './skill-experience.controller';
import { SkillExperienceService } from './skill-experience.service';

describe('SkillExperienceController', () => {
  let controller: SkillExperienceController;

  beforeEach(async () => {
    const module: TestingModule = await Test.createTestingModule({
      controllers: [SkillExperienceController],
      providers: [SkillExperienceService],
    }).compile();

    controller = module.get<SkillExperienceController>(SkillExperienceController);
  });

  it('should be defined', () => {
    expect(controller).toBeDefined();
  });
});
