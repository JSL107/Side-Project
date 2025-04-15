import { Test, TestingModule } from '@nestjs/testing';
import { SkillIconController } from './skill-icon.controller';
import { SkillIconService } from './skill-icon.service';

describe('SkillIconController', () => {
  let controller: SkillIconController;

  beforeEach(async () => {
    const module: TestingModule = await Test.createTestingModule({
      controllers: [SkillIconController],
      providers: [SkillIconService],
    }).compile();

    controller = module.get<SkillIconController>(SkillIconController);
  });

  it('should be defined', () => {
    expect(controller).toBeDefined();
  });
});
