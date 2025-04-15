import { Controller, Get, Post, Body, Patch, Param, Delete } from '@nestjs/common';
import { SkillIconService } from './skill-icon.service';
import { CreateSkillIconDto } from './dto/create-skill-icon.dto';
import { UpdateSkillIconDto } from './dto/update-skill-icon.dto';

@Controller('skill-icon')
export class SkillIconController {
  constructor(private readonly skillIconService: SkillIconService) {}

  @Post()
  create(@Body() createSkillIconDto: CreateSkillIconDto) {
    return this.skillIconService.create(createSkillIconDto);
  }

  @Get()
  findAll() {
    return this.skillIconService.findAll();
  }

  @Get(':id')
  findOne(@Param('id') id: string) {
    return this.skillIconService.findOne(+id);
  }

  @Patch(':id')
  update(@Param('id') id: string, @Body() updateSkillIconDto: UpdateSkillIconDto) {
    return this.skillIconService.update(+id, updateSkillIconDto);
  }

  @Delete(':id')
  remove(@Param('id') id: string) {
    return this.skillIconService.remove(+id);
  }
}
