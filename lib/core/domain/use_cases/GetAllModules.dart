/*
 * NUSH Modules is a web app that helps you explore modules offered by
 * NUS High School of Math and Science.
 * Copyright (C) 2020 Cervon Wong, Lee I-Shiang, and Tia Shi Wei
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <https://www.gnu.org/licenses/>.
 */

import 'package:meta/meta.dart';

import '../../data/constants/lookup_constants.dart';
import '../../data/data_sources/moor_database.dart' as moor;
import '../entities/module/module.dart';

class GetAllModules {
  final moor.MoorDatabase db;

  GetAllModules({@required this.db});

  Future<List<Module>> call() async {
    final models = await db.getAllModules();

    return models.map((model) {
      return Module(
        code: ModuleCode(
          prefixChars: model.module.code.substring(0, 2),
          digits: int.parse(model.module.code.substring(2, 6)),
          suffixChar: model.module.code.length == 6
              ? null
              : model.module.code.substring(6, 7),
        ),
        name: model.module.name,
        description: model.module.description,
        subject: _toSubject(model.module.subjectId),
        levels: model.levels.map(_toLevel),
        semesterType: _toSemesterType(model.module.semesterTypeId),
        moduleType: _toModuleType(model.module.moduleTypeId),
        modularCredits: model.module.modularCredits,
        workload: model.module.workload,
        criteria: model.module.remarks,
      );
    });
  }

  Subject _toSubject(int id) {
    switch (id) {
      case kSubjectArtId:
        return Subjects.art;
      case kSubjectBengaliId:
        return Subjects.bengali;
      case kSubjectBiologyId:
        return Subjects.biology;
      case kSubjectCceId:
        return Subjects.cce;
      case kSubjectHigherChineseId:
        return Subjects.higherChinese;
      case kSubjectChineseId:
        return Subjects.chinese;
      case kSubjectChemistryId:
        return Subjects.chemistry;
      case kSubjectCsId:
        return Subjects.cs;
      case kSubjectDaVinciId:
        return Subjects.daVinci;
      case kSubjectEnglishId:
        return Subjects.english;
      case kSubjectEnglishLiteratureId:
        return Subjects.englishLiterature;
      case kSubjectFrenchId:
        return Subjects.french;
      case kSubjectGeographyId:
        return Subjects.geography;
      case kSubjectGujaratiId:
        return Subjects.gujarati;
      case kSubjectGermanId:
        return Subjects.german;
      case kSubjectHindiId:
        return Subjects.hindi;
      case kSubjectHistoryId:
        return Subjects.history;
      case kSubjectHumanitiesId:
        return Subjects.humanities;
      case kSubjectJapaneseId:
        return Subjects.japanese;
      case kSubjectMathematicsId:
        return Subjects.mathematics;
      case kSubjectHigherMalayId:
        return Subjects.higherMalay;
      case kSubjectMalayId:
        return Subjects.malay;
      case kSubjectMusicId:
        return Subjects.music;
      case kSubjectPhysicsId:
        return Subjects.physics;
      case kSubjectPunjabiId:
        return Subjects.punjabi;
      case kSubjectHigherTamilId:
        return Subjects.higherTamil;
      case kSubjectTamilId:
        return Subjects.tamil;
      case kSubjectUrduId:
        return Subjects.urdu;
      default:
        throw UnimplementedError();
    }
  }

  Level _toLevel(moor.LevelModel model) {
    switch (model.year) {
      case 1:
        return Level.year1;
      case 2:
        return Level.year2;
      case 3:
        return Level.year3;
      case 4:
        return Level.year4;
      case 5:
        return Level.year5;
      case 6:
        return Level.year6;
      default:
        throw UnimplementedError();
    }
  }

  SemesterType _toSemesterType(int id) {
    switch (id) {
      case kSemesterTypeFirstId:
        return SemesterType.first;
      case kSemesterTypeSecondId:
        return SemesterType.second;
      case kSemesterTypeEitherId:
        return SemesterType.either;
      case kSemesterTypeBothId:
        return SemesterType.both;
      default:
        throw UnimplementedError();
    }
  }

  ModuleType _toModuleType(int id) {
    switch (id) {
      case kModuleTypeCoreId:
        return ModuleType.core;
      case kModuleTypeElectiveId:
        return ModuleType.elective;
      case kModuleTypeEnrichmentId:
        return ModuleType.enrichment;
      case kModuleTypeMajorId:
        return ModuleType.major;
      case kModuleTypeHonoursId:
        return ModuleType.honours;
      case kModuleTypeHonoursInLieuId:
        return ModuleType.honoursInLieu;
      default:
        throw UnimplementedError();
    }
  }
}
