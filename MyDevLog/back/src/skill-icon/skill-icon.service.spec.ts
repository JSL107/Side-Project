import { Test, TestingModule } from '@nestjs/testing';
import { SkillIconService } from './skill-icon.service';

describe('SkillIconService', () => {
  let service: SkillIconService;

  beforeEach(async () => {
    const module: TestingModule = await Test.createTestingModule({
      providers: [SkillIconService],
    }).compile();

    service = module.get<SkillIconService>(SkillIconService);
  });

  it('should be defined', () => {
    expect(service).toBeDefined();
  });
});
