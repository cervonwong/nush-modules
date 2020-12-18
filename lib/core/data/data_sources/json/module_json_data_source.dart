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

import 'dart:convert';
import 'dart:io';

import 'package:meta/meta.dart';

import '../../constants/lookup_constants.dart';
import '../moor_database.dart';

abstract class ModuleJsonDataSource {
  List<ModuleWithLevelsModel> getAll();

  int getVersion();
}

class ModuleJsonDataSourceImpl implements ModuleJsonDataSource {
  @override
  List<ModuleWithLevelsModel> getAll() =>
      _mapModulesJsonToModels(jsonString: _getJsonString());

  @override
  int getVersion() {
    final jsonString = _getJsonString();
    final jsonObject = json.decode(jsonString);
    return jsonObject['version'];
  }

  String _getJsonString() =>
      File('json/modules/modules/json').readAsStringSync();

  List<ModuleWithLevelsModel> _mapModulesJsonToModels({
    @required String jsonString,
  }) {
    assert(jsonString != null);

    final jsonObject = json.decode(jsonString);

    return _parseModules(jsonObject);
  }

  List<ModuleWithLevelsModel> _parseModules(Map<String, dynamic> jsonObject) {
    final List<dynamic> jsonModulesList = jsonObject['modules'];

    return jsonModulesList.map<ModuleWithLevelsModel>(_parseModule).toList();
  }

  ModuleWithLevelsModel _parseModule(dynamic jsonModuleObject) {
    final int id = jsonModuleObject['id'];
    final String code = jsonModuleObject['moduleId'];
    final String name = jsonModuleObject['moduleName'];
    final String description = jsonModuleObject['description'];
    final subjectId = _parseSubject(jsonModuleObject['subject']);
    final levels = _parseLevels(jsonModuleObject['levels']);
    final semesterTypeId = _parseSemesterType(jsonModuleObject['semesterType']);
    final moduleTypeId = _parseModuleType(jsonModuleObject['moduleType']);
    final modularCredits = jsonModuleObject['mc'];
    final workload = jsonModuleObject['workload'];
    final remarks = jsonModuleObject.containsKey('remarks')
        ? jsonModuleObject['remarks']
        : null;

    return ModuleWithLevelsModel(
      module: ModuleModel(
        id: id,
        code: code,
        name: name,
        description: description,
        remarks: remarks,
        modularCredits: modularCredits,
        workload: workload,
        subjectId: subjectId,
        semesterTypeId: semesterTypeId,
        moduleTypeId: moduleTypeId,
      ),
      levels: levels,
    );
  }

  int _parseSubject(String subjectString) {
    switch (subjectString) {
      case 'ART':
        return kSubjectArtId;
      case 'BENGALI':
        return kSubjectBengaliId;
      case 'BIOLOGY':
        return kSubjectBiologyId;
      case 'CCE':
        return kSubjectCceId;
      case 'HIGHER CHINESE':
        return kSubjectHigherChineseId;
      case 'CHINESE':
        return kSubjectChineseId;
      case 'CHEMISTRY':
        return kSubjectChemistryId;
      case 'CS':
        return kSubjectCsId;
      case 'DA VINCI':
        return kSubjectDaVinciId;
      case 'ENGLISH':
        return kSubjectEnglishId;
      case 'ENG LIT':
        return kSubjectEnglishLiteratureId;
      case 'FRENCH':
        return kSubjectFrenchId;
      case 'GEOGRAPHY':
        return kSubjectGeographyId;
      case 'GUJARATI':
        return kSubjectGujaratiId;
      case 'GERMAN':
        return kSubjectGermanId;
      case 'HINDI':
        return kSubjectHindiId;
      case 'HISTORY':
        return kSubjectHistoryId;
      case 'HUMANITIES':
        return kSubjectHumanitiesId;
      case 'JAPANESE':
        return kSubjectJapaneseId;
      case 'MATH':
        return kSubjectMathematicsId;
      case 'HIGHER MALAY':
        return kSubjectHigherMalayId;
      case 'MALAY':
        return kSubjectMalayId;
      case 'MUSIC':
        return kSubjectMusicId;
      case 'PHYSICS':
        return kSubjectPhysicsId;
      case 'PUNJABI':
        return kSubjectPunjabiId;
      case 'HIGHER TAMIL':
        return kSubjectHigherTamilId;
      case 'TAMIL':
        return kSubjectTamilId;
      case 'URDU':
        return kSubjectUrduId;
      default:
        throw FormatException('Unable to parse subject');
    }
  }

  List<LevelModel> _parseLevels(List<dynamic> levelDynamicList) {
    return levelDynamicList.map<LevelModel>((levelInt) {
      switch (levelInt) {
        case 1:
          return LevelModel(year: 1);
        case 2:
          return LevelModel(year: 2);
        case 3:
          return LevelModel(year: 3);
        case 4:
          return LevelModel(year: 4);
        case 5:
          return LevelModel(year: 5);
        case 6:
          return LevelModel(year: 6);
        default:
          throw FormatException('Unable to parse level');
      }
    });
  }

  int _parseSemesterType(String semesterTypeString) {
    switch (semesterTypeString) {
      case 'FIRST':
        return kSemesterTypeFirstId;
      case 'SECOND':
        return kSemesterTypeSecondId;
      case 'EITHER':
        return kSemesterTypeEitherId;
      case 'BOTH':
        return kSemesterTypeBothId;
      default:
        throw FormatException('Unable to parse semesterType');
    }
  }

  int _parseModuleType(String moduleTypeString) {
    switch (moduleTypeString) {
      case 'CORE':
        return kModuleTypeCoreId;
      case 'ELECTIVE':
        return kModuleTypeElectiveId;
      case 'ENRICHMENT':
        return kModuleTypeEnrichmentId;
      case 'MAJOR':
        return kModuleTypeMajorId;
      case 'HONOURS':
        return kModuleTypeHonours;
      case 'HONOURS IN LIEU':
        return kModuleTypeHonoursInLieu;
      default:
        throw FormatException('Unable to parse moduleType');
    }
  }
}
