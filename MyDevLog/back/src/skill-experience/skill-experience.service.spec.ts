import { Test, TestingModule } from '@nestjs/testing';
import { SkillExperienceService } from './skill-experience.service';

describe('SkillExperienceService', () => {
  let service: SkillExperienceService;

  beforeEach(async () => {
    const module: TestingModule = await Test.createTestingModule({
      providers: [SkillExperienceService],
    }).compile();

    service = module.get<SkillExperienceService>(SkillExperienceService);
  });

  it('should be defined', () => {
    expect(service).toBeDefined();
  });
});
