import { Controller, Get, Post, Body, Patch, Param, Delete } from '@nestjs/common';
import { SkillExperienceService } from './skill-experience.service';
import { CreateSkillExperienceDto } from './dto/create-skill-experience.dto';
import { UpdateSkillExperienceDto } from './dto/update-skill-experience.dto';

@Controller('skill-experience')
export class SkillExperienceController {
  constructor(private readonly skillExperienceService: SkillExperienceService) {}

  @Post()
  create(@Body() createSkillExperienceDto: CreateSkillExperienceDto) {
    return this.skillExperienceService.create(createSkillExperienceDto);
  }

  @Get()
  findAll() {
    return this.skillExperienceService.findAll();
  }

  @Get(':id')
  findOne(@Param('id') id: string) {
    return this.skillExperienceService.findOne(+id);
  }

  @Patch(':id')
  update(@Param('id') id: string, @Body() updateSkillExperienceDto: UpdateSkillExperienceDto) {
    return this.skillExperienceService.update(+id, updateSkillExperienceDto);
  }

  @Delete(':id')
  remove(@Param('id') id: string) {
    return this.skillExperienceService.remove(+id);
  }
}
