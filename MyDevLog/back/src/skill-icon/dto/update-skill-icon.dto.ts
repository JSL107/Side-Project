import { PartialType } from '@nestjs/mapped-types';
import { CreateSkillIconDto } from './create-skill-icon.dto';

export class UpdateSkillIconDto extends PartialType(CreateSkillIconDto) {}
