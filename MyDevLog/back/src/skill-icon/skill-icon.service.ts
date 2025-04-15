import { Injectable } from '@nestjs/common';
import { CreateSkillIconDto } from './dto/create-skill-icon.dto';
import { UpdateSkillIconDto } from './dto/update-skill-icon.dto';

@Injectable()
export class SkillIconService {
  create(createSkillIconDto: CreateSkillIconDto) {
    return 'This action adds a new skillIcon';
  }

  findAll() {
    return `This action returns all skillIcon`;
  }

  findOne(id: number) {
    return `This action returns a #${id} skillIcon`;
  }

  update(id: number, updateSkillIconDto: UpdateSkillIconDto) {
    return `This action updates a #${id} skillIcon`;
  }

  remove(id: number) {
    return `This action removes a #${id} skillIcon`;
  }
}
