import { PartialType } from '@nestjs/mapped-types';
import { CreateSkillExperienceDto } from './create-skill-experience.dto';

export class UpdateSkillExperienceDto extends PartialType(CreateSkillExperienceDto) {}
