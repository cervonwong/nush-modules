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

import 'package:meta/meta.dart';

import '../../domain/entities/module/module.dart';

/// A mapper class from a JSON string to the entity class [Module].
///
/// This is a callable class. You can call its only public method as such:
///
/// ```dart
/// final mapper = ModuleJsonToEntityMapper();
/// final modules = mapper('...'); // Returns type List<Module>.
/// ```
class ModuleJsonToEntityMapper {
  /// Parses the [jsonString] and returns the resulting list of [Module]s.
  ///
  /// [jsonString] should be the JSON representation of the list of all modules
  /// offered. This maps each JSON object in [jsonString] to its entity
  /// representation [Module].
  ///
  /// This method throws [FormatException] if the passed [jsonString] is
  /// unparsable due to an unexpected character. This method also throws
  /// [FormatException] if [jsonString] is a valid JSON but has properties with
  /// unexpected values. Note that JSON with different structures than expected
  /// can lead to unexpected behaviour. [jsonString] should abide by a JSON
  /// schema. It is recommended to wrap this method around a try-catch
  /// block to catch this exception and recover from it if needed.
  List<Module> call({@required String jsonString}) {
    assert(jsonString != null);

    final jsonObject = json.decode(jsonString);

    return _parseModules(jsonObject);
  }

  List<Module> _parseModules(Map<String, dynamic> jsonObject) {
    final List<dynamic> jsonModulesList = jsonObject['modules'];

    return jsonModulesList.map<Module>(_parseModule).toList();
  }

  Module _parseModule(dynamic jsonModuleObject) {
    final code = _parseModuleCode(jsonModuleObject['code']);
    final String name = jsonModuleObject['moduleName'];
    final String description = jsonModuleObject['description'];
    final subject = _parseSubject(jsonModuleObject['subject']);
    final levels = _parseLevels(jsonModuleObject['levels']);
    final semesterType = _parseSemesterType(jsonModuleObject['semesterType']);
    final moduleType = _parseModuleType(jsonModuleObject['moduleType']);
    final modularCredits = jsonModuleObject['mc'];
    final workload = jsonModuleObject['workload'];
    final criteria = jsonModuleObject.containsKey('remarks')
        ? jsonModuleObject['remarks']
        : null;

    return Module(
      code: code,
      name: name,
      description: description,
      subject: subject,
      levels: levels,
      semesterType: semesterType,
      moduleType: moduleType,
      modularCredits: modularCredits,
      workload: workload,
      criteria: criteria,
    );
  }

  ModuleCode _parseModuleCode(String codeString) {
    return ModuleCode(
      prefixChars: codeString.substring(0, 2),
      digits: int.parse(codeString.substring(2, 6)),
      suffixChar: codeString.length == 6 ? null : codeString.substring(6, 7),
    );
  }

  Subject _parseSubject(String subjectString) {
    switch (subjectString) {
      case 'ART':
        return Subjects.art;
      case 'BENGALI':
        return Subjects.bengali;
      case 'BIOLOGY':
        return Subjects.biology;
      case 'CCE':
        return Subjects.cce;
      case 'HIGHER CHINESE':
        return Subjects.higherChinese;
      case 'CHINESE':
        return Subjects.chinese;
      case 'CHEMISTRY':
        return Subjects.chemistry;
      case 'CS':
        return Subjects.cs;
      case 'DA VINCI':
        return Subjects.daVinci;
      case 'ENGLISH':
        return Subjects.english;
      case 'ENG LIT':
        return Subjects.englishLiterature;
      case 'FRENCH':
        return Subjects.french;
      case 'GEOGRAPHY':
        return Subjects.geography;
      case 'GUJARATI':
        return Subjects.gujarati;
      case 'GERMAN':
        return Subjects.german;
      case 'HINDI':
        return Subjects.hindi;
      case 'HISTORY':
        return Subjects.history;
      case 'HUMANITIES':
        return Subjects.humanities;
      case 'JAPANESE':
        return Subjects.japanese;
      case 'MATH':
        return Subjects.mathematics;
      case 'HIGHER MALAY':
        return Subjects.higherMalay;
      case 'MALAY':
        return Subjects.malay;
      case 'MUSIC':
        return Subjects.music;
      case 'PHYSICS':
        return Subjects.physics;
      case 'PUNJABI':
        return Subjects.punjabi;
      case 'HIGHER TAMIL':
        return Subjects.higherTamil;
      case 'TAMIL':
        return Subjects.tamil;
      case 'URDU':
        return Subjects.urdu;
      default:
        throw FormatException('Unable to parse subject');
    }
  }

  Set<Level> _parseLevels(List<dynamic> levelDynamicList) {
    return levelDynamicList.map<Level>((levelInt) {
      switch (levelInt) {
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
          throw FormatException('Unable to parse level');
      }
    }).toSet();
  }

  SemesterType _parseSemesterType(String semesterTypeString) {
    switch (semesterTypeString) {
      case 'FIRST':
        return SemesterType.first;
      case 'SECOND':
        return SemesterType.second;
      case 'EITHER':
        return SemesterType.either;
      case 'BOTH':
        return SemesterType.both;
      default:
        throw FormatException('Unable to parse semesterType');
    }
  }

  ModuleType _parseModuleType(String moduleTypeString) {
    switch (moduleTypeString) {
      case 'CORE':
        return ModuleType.core;
      case 'ELECTIVE':
        return ModuleType.elective;
      case 'ENRICHMENT':
        return ModuleType.enrichment;
      case 'MAJOR':
        return ModuleType.major;
      case 'HONOURS':
        return ModuleType.honours;
      case 'HONOURS IN LIEU':
        return ModuleType.honoursInLieu;
      default:
        throw FormatException('Unable to parse moduleType');
    }
  }
}
