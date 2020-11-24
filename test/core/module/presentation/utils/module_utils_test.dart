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

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:nush_modules/core/module/domain/module.dart';
import 'package:nush_modules/core/module/presentation/utils/module_utils.dart';

// ignore: must_be_immutable
class MockModule extends Mock implements Module {}

void main() {
  MockModule mockModule;

  setUp(() {
    mockModule = MockModule();
  });

  group(
    'getLevelsText',
    () {
      test(
        'when passed null, '
        'should fail asserts',
        () {
          expect(
            () {
              getLevelsText(module: null);
            },
            throwsAssertionError,
          );
        },
      );

      test(
        'when passed module\'s levels has one level, '
        'should return expected text',
        () {
          when(mockModule.levels).thenReturn({Level.year3});

          final levelsText = getLevelsText(module: mockModule);

          expect(levelsText, 'Y3');
        },
      );

      test(
        'when passed module\'s levels has two levels, '
        'should return expected text',
        () {
          when(mockModule.levels).thenReturn({Level.year6, Level.year5});

          final levelsText = getLevelsText(module: mockModule);

          expect(levelsText, 'Y5/6');
        },
      );
    },
  );

  group(
    'getSemesterTypeTextShort',
    () {
      test(
        'when passed null, '
        'should fail asserts',
        () {
          expect(
            () {
              getSemesterTypeTextShort(module: null);
            },
            throwsAssertionError,
          );
        },
      );

      group(
        'when passed module with each possible SemesterType, '
        'should return expected text',
        () {
          test(
            'SemesterType.first',
            () {
              when(mockModule.semesterType).thenReturn(SemesterType.first);

              final semesterTypeText =
                  getSemesterTypeTextShort(module: mockModule);

              expect(semesterTypeText, 'Sem 1');
            },
          );

          test(
            'SemesterType.second',
            () {
              when(mockModule.semesterType).thenReturn(SemesterType.second);

              final semesterTypeText =
                  getSemesterTypeTextShort(module: mockModule);

              expect(semesterTypeText, 'Sem 2');
            },
          );

          test(
            'SemesterType.either',
            () {
              when(mockModule.semesterType).thenReturn(SemesterType.either);

              final semesterTypeText =
                  getSemesterTypeTextShort(module: mockModule);

              expect(semesterTypeText, 'Sem 1/2');
            },
          );

          test(
            'SemesterType.both',
            () {
              when(mockModule.semesterType).thenReturn(SemesterType.both);

              final semesterTypeText =
                  getSemesterTypeTextShort(module: mockModule);

              expect(semesterTypeText, 'Year long');
            },
          );
        },
      );
    },
  );

  group(
    'getModuleTypeText',
    () {
      test(
        'when passed null, '
        'should fail asserts',
        () {
          expect(
            () {
              getModuleTypeText(module: null);
            },
            throwsAssertionError,
          );
        },
      );

      group(
        'when passed module with each possible ModuleType, '
        'should return expected text',
        () {
          test(
            'ModuleType.core',
            () {
              when(mockModule.moduleType).thenReturn(ModuleType.core);

              final moduleTypeText = getModuleTypeText(module: mockModule);

              expect(moduleTypeText, 'Core');
            },
          );

          test(
            'ModuleType.elective',
            () {
              when(mockModule.moduleType).thenReturn(ModuleType.elective);

              final moduleTypeText = getModuleTypeText(module: mockModule);

              expect(moduleTypeText, 'Elective');
            },
          );

          test(
            'ModuleType.enrichment',
            () {
              when(mockModule.moduleType).thenReturn(ModuleType.enrichment);

              final moduleTypeText = getModuleTypeText(module: mockModule);

              expect(moduleTypeText, 'Enrichment');
            },
          );

          test(
            'ModuleType.major',
            () {
              when(mockModule.moduleType).thenReturn(ModuleType.major);

              final moduleTypeText = getModuleTypeText(module: mockModule);

              expect(moduleTypeText, 'Major');
            },
          );

          test(
            'ModuleType.honours',
            () {
              when(mockModule.moduleType).thenReturn(ModuleType.honours);

              final moduleTypeText = getModuleTypeText(module: mockModule);

              expect(moduleTypeText, 'Honours');
            },
          );

          test(
            'ModuleType.honoursInLieu',
            () {
              when(mockModule.moduleType).thenReturn(ModuleType.honoursInLieu);

              final moduleTypeText = getModuleTypeText(module: mockModule);

              expect(moduleTypeText, 'Honours in lieu');
            },
          );
        },
      );
    },
  );
}
