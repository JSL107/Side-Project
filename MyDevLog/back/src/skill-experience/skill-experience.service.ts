import { Injectable } from '@nestjs/common';
import { CreateSkillExperienceDto } from './dto/create-skill-experience.dto';
import { UpdateSkillExperienceDto } from './dto/update-skill-experience.dto';

@Injectable()
export class SkillExperienceService {
  create(createSkillExperienceDto: CreateSkillExperienceDto) {
    return 'This action adds a new skillExperience';
  }

  findAll() {
    return `This action returns all skillExperience`;
  }

  findOne(id: number) {
    return `This action returns a #${id} skillExperience`;
  }

  update(id: number, updateSkillExperienceDto: UpdateSkillExperienceDto) {
    return `This action updates a #${id} skillExperience`;
  }

  remove(id: number) {
    return `This action removes a #${id} skillExperience`;
  }
}
