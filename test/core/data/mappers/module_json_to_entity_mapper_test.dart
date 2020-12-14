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

import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:nush_modules/core/data/mappers/module_json_to_entity_mapper.dart';
import 'package:nush_modules/core/domain/entities/module/module.dart';

String _readFixture() {
  String jsonString;

  try {
    jsonString = File('test/fixtures/modules_fixture.json').readAsStringSync();
  } on FileSystemException {
    jsonString =
        File('../../../fixtures/modules_fixture.json').readAsStringSync();
  }

  return jsonString;
}

void main() {
  final jsonString = _readFixture();
  ModuleJsonToEntityMapper mapper;

  setUp(
    () {
      mapper = ModuleJsonToEntityMapper();
    },
  );

  test(
    'Reading fixture smoke test',
    () {
      expect(jsonString, isNotNull);
    },
  );

  test(
    'ModuleJsonToEntityMapper when called with fixture, '
    'should return mapped Module',
    () {
      final modules = mapper(jsonString: jsonString);

      expect(modules.length, 2);

      final module1 = modules[0];
      final module2 = modules[1];

      expect(
        module1.code,
        ModuleCode(prefixChars: 'MA', digits: 1131),
      );
      expect(module1.name, 'Foundations in Math IA');
      expect(module1.description, 'Description 1');
      expect(module1.subject, Subjects.mathematics);
      expect(module1.levels, {Level.year1});
      expect(module1.semesterType, SemesterType.first);
      expect(module1.moduleType, ModuleType.core);
      expect(module1.modularCredits, 3);
      expect(module1.workload, 3.0);
      expect(module1.criteria, isNull);

      expect(
        module2.code,
        ModuleCode(prefixChars: 'BL', digits: 1322, suffixChar: 'V'),
      );
      expect(module2.name, 'Math Olympiad Training I');
      expect(module2.description, 'Description 2');
      expect(module2.subject, Subjects.biology);
      expect(module2.levels, {Level.year1, Level.year2});
      expect(module2.semesterType, SemesterType.both);
      expect(module2.moduleType, ModuleType.elective);
      expect(module2.modularCredits, 2);
      expect(module2.workload, 3.0);
      expect(module2.criteria, 'Random remark');
    },
  );
}
