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
import 'package:nush_modules/core/domain/entities/module/module.dart';

// ignore: must_be_immutable
class MockModuleCode extends Mock implements ModuleCode {}

void main() {
  group(
    'Module when constructed',
    () {
      group(
        'with null for non-nullable parameters, '
        'should fail asserts',
        () {
          test(
            'when code is null',
            () {
              expect(
                () {
                  Module(
                    code: null,
                    name: 'Test name',
                    description: 'Test description',
                    subject: Subjects.art,
                    levels: {Level.year1},
                    semesterType: SemesterType.first,
                    moduleType: ModuleType.core,
                    modularCredits: 5,
                    workload: 5.0,
                  );
                },
                throwsAssertionError,
              );
            },
          );

          test(
            'when name is null',
            () {
              expect(
                () {
                  Module(
                    code: MockModuleCode(),
                    name: null,
                    description: 'Test description',
                    subject: Subjects.art,
                    levels: {Level.year1},
                    semesterType: SemesterType.first,
                    moduleType: ModuleType.core,
                    modularCredits: 5,
                    workload: 5.0,
                  );
                },
                throwsAssertionError,
              );
            },
          );

          test(
            'when description is null',
            () {
              expect(
                () {
                  Module(
                    code: MockModuleCode(),
                    name: 'Test name',
                    description: null,
                    subject: Subjects.art,
                    levels: {Level.year1},
                    semesterType: SemesterType.first,
                    moduleType: ModuleType.core,
                    modularCredits: 5,
                    workload: 5.0,
                  );
                },
                throwsAssertionError,
              );
            },
          );

          test(
            'when subject is null',
            () {
              expect(
                () {
                  Module(
                    code: MockModuleCode(),
                    name: 'Test name',
                    description: 'Test description',
                    subject: null,
                    levels: {Level.year1},
                    semesterType: SemesterType.first,
                    moduleType: ModuleType.core,
                    modularCredits: 5,
                    workload: 5.0,
                  );
                },
                throwsAssertionError,
              );
            },
          );

          test(
            'when levels is null',
            () {
              expect(
                () {
                  Module(
                    code: MockModuleCode(),
                    name: 'Test name',
                    description: 'Test description',
                    subject: Subjects.art,
                    levels: null,
                    semesterType: SemesterType.first,
                    moduleType: ModuleType.core,
                    modularCredits: 5,
                    workload: 5.0,
                  );
                },
                throwsAssertionError,
              );
            },
          );

          test(
            'when semesterType is null',
            () {
              expect(
                () {
                  Module(
                    code: MockModuleCode(),
                    name: 'Test name',
                    description: 'Test description',
                    subject: Subjects.art,
                    levels: {Level.year1},
                    semesterType: null,
                    moduleType: ModuleType.core,
                    modularCredits: 5,
                    workload: 5.0,
                  );
                },
                throwsAssertionError,
              );
            },
          );

          test(
            'when moduleType is null',
            () {
              expect(
                () {
                  Module(
                    code: MockModuleCode(),
                    name: 'Test name',
                    description: 'Test description',
                    subject: Subjects.art,
                    levels: {Level.year1},
                    semesterType: SemesterType.first,
                    moduleType: null,
                    modularCredits: 5,
                    workload: 5.0,
                  );
                },
                throwsAssertionError,
              );
            },
          );

          test(
            'when modularCredits is null',
            () {
              expect(
                () {
                  Module(
                    code: MockModuleCode(),
                    name: 'Test name',
                    description: 'Test description',
                    subject: Subjects.art,
                    levels: {Level.year1},
                    semesterType: SemesterType.first,
                    moduleType: ModuleType.core,
                    modularCredits: null,
                    workload: 5.0,
                  );
                },
                throwsAssertionError,
              );
            },
          );

          test(
            'when workload is null',
            () {
              expect(
                () {
                  Module(
                    code: MockModuleCode(),
                    name: 'Test name',
                    description: 'Test description',
                    subject: Subjects.art,
                    levels: {Level.year1},
                    semesterType: SemesterType.first,
                    moduleType: ModuleType.core,
                    modularCredits: 5,
                    workload: null,
                  );
                },
                throwsAssertionError,
              );
            },
          );
        },
      );

      group(
        'with illegal parameters, '
        'should fail asserts',
        () {
          test(
            'when levels contains null',
            () {
              expect(
                () {
                  Module(
                    code: MockModuleCode(),
                    name: 'Test name',
                    description: 'Test description',
                    subject: Subjects.art,
                    levels: {null},
                    semesterType: SemesterType.first,
                    moduleType: ModuleType.core,
                    modularCredits: 5,
                    workload: 5.0,
                  );
                },
                throwsAssertionError,
              );
            },
          );

          test(
            'when empty levels',
            () {
              expect(
                () {
                  Module(
                    code: MockModuleCode(),
                    name: 'Test name',
                    description: 'Test description',
                    subject: Subjects.art,
                    levels: {},
                    semesterType: SemesterType.first,
                    moduleType: ModuleType.core,
                    modularCredits: 5,
                    workload: 5.0,
                  );
                },
                throwsAssertionError,
              );
            },
          );

          test(
            'when more than two levels',
            () {
              expect(
                () {
                  Module(
                    code: MockModuleCode(),
                    name: 'Test name',
                    description: 'Test description',
                    subject: Subjects.art,
                    levels: {Level.year1, Level.year2, Level.year3},
                    semesterType: SemesterType.first,
                    moduleType: ModuleType.core,
                    modularCredits: 5,
                    workload: 5.0,
                  );
                },
                throwsAssertionError,
              );
            },
          );

          test(
            'when negative modularCredits',
            () {
              expect(
                () {
                  Module(
                    code: MockModuleCode(),
                    name: 'Test name',
                    description: 'Test description',
                    subject: Subjects.art,
                    levels: {Level.year1},
                    semesterType: SemesterType.first,
                    moduleType: ModuleType.core,
                    modularCredits: -1,
                    workload: 5.0,
                  );
                },
                throwsAssertionError,
              );
            },
          );

          test(
            'when negative workload',
            () {
              expect(
                () {
                  Module(
                    code: MockModuleCode(),
                    name: 'Test name',
                    description: 'Test description',
                    subject: Subjects.art,
                    levels: {Level.year1},
                    semesterType: SemesterType.first,
                    moduleType: ModuleType.core,
                    modularCredits: 5,
                    workload: -0.5,
                  );
                },
                throwsAssertionError,
              );
            },
          );
        },
      );

      test(
        'should have optional parameter/field criteria',
        () {
          final module1 = Module(
            code: MockModuleCode(),
            name: 'Test name',
            description: 'Test description',
            subject: Subjects.art,
            levels: {Level.year1},
            semesterType: SemesterType.first,
            moduleType: ModuleType.core,
            modularCredits: 5,
            workload: 5.0,
          );

          expect(module1.criteria, null);

          final module2 = Module(
            code: MockModuleCode(),
            name: 'Test name',
            description: 'Test description',
            subject: Subjects.art,
            levels: {Level.year1},
            semesterType: SemesterType.first,
            moduleType: ModuleType.core,
            modularCredits: 5,
            workload: 5.0,
            criteria: 'Test criteria',
          );

          expect(module2.criteria, 'Test criteria');
        },
      );
    },
  );

  group(
    'Module when equating Modules',
    () {
      test(
        'with equal codes, '
        'should return true',
        () {
          final mockModuleCode = MockModuleCode();

          final module1 = Module(
            code: mockModuleCode,
            name: 'Test name',
            description: 'Test description',
            subject: Subjects.art,
            levels: {Level.year1},
            semesterType: SemesterType.first,
            moduleType: ModuleType.core,
            modularCredits: 5,
            workload: 5.0,
            criteria: 'Test criteria',
          );

          final module2 = Module(
            code: mockModuleCode,
            name: 'Test name',
            description: 'Test description',
            subject: Subjects.art,
            levels: {Level.year1},
            semesterType: SemesterType.first,
            moduleType: ModuleType.core,
            modularCredits: 5,
            workload: 5.0,
            criteria: 'Test criteria',
          );

          expect(module1, module2);
        },
      );

      test(
        'with unequal codes, '
        'should return false',
        () {
          final module1 = Module(
            code: MockModuleCode(),
            name: 'Test name',
            description: 'Test description',
            subject: Subjects.art,
            levels: {Level.year1},
            semesterType: SemesterType.first,
            moduleType: ModuleType.core,
            modularCredits: 5,
            workload: 5.0,
            criteria: 'Test criteria',
          );

          final module2 = Module(
            code: MockModuleCode(),
            name: 'Test name',
            description: 'Test description',
            subject: Subjects.art,
            levels: {Level.year1},
            semesterType: SemesterType.first,
            moduleType: ModuleType.core,
            modularCredits: 5,
            workload: 5.0,
            criteria: 'Test criteria',
          );

          expect(module1, isNot(module2));
        },
      );
    },
  );

  group(
    'ModuleCode when constructed',
    () {
      group(
        'with null for non-nullable parameters, '
        'should fail asserts',
        () {
          test(
            'when prefixChars is null',
            () {
              expect(
                () {
                  ModuleCode(
                    prefixChars: null,
                    digits: 1234,
                  );
                },
                throwsAssertionError,
              );
            },
          );

          test(
            'when digits is null',
            () {
              expect(
                () {
                  ModuleCode(
                    prefixChars: 'MA',
                    digits: null,
                  );
                },
                throwsAssertionError,
              );
            },
          );
        },
      );

      test(
        'should have optional parameter/field suffixChar',
        () {
          final moduleCode1 = ModuleCode(
            prefixChars: 'MA',
            digits: 1234,
          );

          expect(moduleCode1.suffixChar, null);

          final moduleCode2 =
              ModuleCode(prefixChars: 'MA', digits: 1234, suffixChar: 'V');

          expect(moduleCode2.suffixChar, 'V');
        },
      );

      group(
        'with illegal parameters, '
        'should fail asserts',
        () {
          group(
            'when prefixChars is not made of 2 uppercase letters',
            () {
              test(
                'when prefixChars is made of 2 non-letter characters',
                () {
                  expect(
                    () {
                      ModuleCode(
                        prefixChars: '11',
                        digits: 1234,
                      );
                    },
                    throwsAssertionError,
                  );
                },
              );
              test(
                'when prefixChars is made of 2 lowercase letters',
                () {
                  expect(
                    () {
                      ModuleCode(
                        prefixChars: 'ma',
                        digits: 1234,
                      );
                    },
                    throwsAssertionError,
                  );
                },
              );
              test(
                'when prefixChars is made of 1 uppercase letter',
                () {
                  expect(
                    () {
                      ModuleCode(
                        prefixChars: 'M',
                        digits: 1234,
                      );
                    },
                    throwsAssertionError,
                  );
                },
              );
              test(
                'when prefixChars is an empty string',
                () {
                  expect(
                    () {
                      ModuleCode(
                        prefixChars: '',
                        digits: 1234,
                      );
                    },
                    throwsAssertionError,
                  );
                },
              );
              test(
                'when prefixChars is made of 3 upper case letters',
                () {
                  expect(
                    () {
                      ModuleCode(
                        prefixChars: 'MAT',
                        digits: 1234,
                      );
                    },
                    throwsAssertionError,
                  );
                },
              );
            },
          );

          group(
            'when digits is not valid',
            () {
              test(
                'when digits is negative',
                () {
                  expect(
                    () {
                      ModuleCode(
                        prefixChars: 'MA',
                        digits: -1232,
                      );
                    },
                    throwsAssertionError,
                  );
                },
              );

              test(
                'when digits is positive but less than 1000',
                () {
                  expect(
                    () {
                      ModuleCode(
                        prefixChars: 'MA',
                        digits: 999,
                      );
                    },
                    throwsAssertionError,
                  );

                  expect(
                    () {
                      ModuleCode(
                        prefixChars: 'MA',
                        digits: 123,
                      );
                    },
                    throwsAssertionError,
                  );
                },
              );

              test(
                'when digits is not less than 7000',
                () {
                  expect(
                    () {
                      ModuleCode(
                        prefixChars: 'MA',
                        digits: 7000,
                      );
                    },
                    throwsAssertionError,
                  );

                  expect(
                    () {
                      ModuleCode(
                        prefixChars: 'MA',
                        digits: 12321,
                      );
                    },
                    throwsAssertionError,
                  );
                },
              );
            },
          );

          group(
            'when suffixChar is not a single uppercase letter',
            () {
              test(
                'when suffixChar is empty',
                () {
                  expect(
                    () {
                      ModuleCode(
                        prefixChars: 'MA',
                        digits: 1234,
                        suffixChar: '',
                      );
                    },
                    throwsAssertionError,
                  );
                },
              );
              test(
                'when suffixChar is a single non-letter character',
                () {
                  expect(
                    () {
                      ModuleCode(
                        prefixChars: 'MA',
                        digits: 1234,
                        suffixChar: '1',
                      );
                    },
                    throwsAssertionError,
                  );
                },
              );
              test(
                'when suffixChar is a single lowercase letter',
                () {
                  expect(
                    () {
                      ModuleCode(
                        prefixChars: 'MA',
                        digits: 1234,
                        suffixChar: 'v',
                      );
                    },
                    throwsAssertionError,
                  );
                },
              );
              test(
                'when suffixChar is more than one uppercase letter',
                () {
                  expect(
                    () {
                      ModuleCode(
                        prefixChars: 'MA',
                        digits: 1234,
                        suffixChar: 'VA',
                      );
                    },
                    throwsAssertionError,
                  );
                },
              );
            },
          );
        },
      );
    },
  );

  group(
    'ModuleCode toString, '
    'should return expected string',
    () {
      test(
        'when suffixChar is undefined',
        () {
          final moduleCode = ModuleCode(
            prefixChars: 'BL',
            digits: 5131,
          );

          expect(moduleCode.toString(), 'BL5131');
        },
      );

      test(
        'when suffixChar is defined',
        () {
          final moduleCode = ModuleCode(
            prefixChars: 'BL',
            digits: 5131,
            suffixChar: 'V',
          );

          expect(moduleCode.toString(), 'BL5131V');
        },
      );
    },
  );

  group(
    'ModuleCode when equating ModuleCodes',
    () {
      group(
        'with equal fields, '
        'should return true',
        () {
          test(
            'when prefixChar is undefined',
            () {
              final moduleCode1 = ModuleCode(
                prefixChars: 'BL',
                digits: 5131,
              );

              final moduleCode2 = ModuleCode(
                prefixChars: 'BL',
                digits: 5131,
              );

              expect(moduleCode1, moduleCode2);
            },
          );

          test(
            'when prefixChar is defined',
            () {
              final moduleCode1 = ModuleCode(
                prefixChars: 'BL',
                digits: 5131,
                suffixChar: 'V',
              );

              final moduleCode2 = ModuleCode(
                prefixChars: 'BL',
                digits: 5131,
                suffixChar: 'V',
              );

              expect(moduleCode1, moduleCode2);
            },
          );
        },
      );

      group(
        'with any unequal field, '
        'should return false',
        () {
          test(
            'between ModuleCodes with undefined suffixChar',
            () {
              final moduleCode1 = ModuleCode(
                prefixChars: 'BL',
                digits: 5131,
              );

              final moduleCode2 = ModuleCode(
                prefixChars: 'CH',
                digits: 5131,
              );

              final moduleCode3 = ModuleCode(
                prefixChars: 'BL',
                digits: 6131,
              );

              expect(moduleCode1, isNot(moduleCode2));
              expect(moduleCode1, isNot(moduleCode3));
            },
          );

          test(
            'between ModuleCodes with defined suffixChar',
            () {
              final moduleCode1 = ModuleCode(
                prefixChars: 'BL',
                digits: 5131,
                suffixChar: 'V',
              );

              final moduleCode2 = ModuleCode(
                prefixChars: 'CH',
                digits: 5131,
                suffixChar: 'V',
              );

              final moduleCode3 = ModuleCode(
                prefixChars: 'BL',
                digits: 6131,
                suffixChar: 'V',
              );

              final moduleCode4 = ModuleCode(
                prefixChars: 'BL',
                digits: 5131,
                suffixChar: 'A',
              );

              expect(moduleCode1, isNot(moduleCode2));
              expect(moduleCode1, isNot(moduleCode3));
              expect(moduleCode1, isNot(moduleCode4));
            },
          );

          test(
            'between ModuleCodes with defined and undefined suffixChar',
            () {
              final moduleCode1 = ModuleCode(
                prefixChars: 'BL',
                digits: 5131,
              );

              final moduleCode2 = ModuleCode(
                prefixChars: 'BL',
                digits: 5131,
                suffixChar: 'V',
              );

              expect(moduleCode1, isNot(moduleCode2));
            },
          );
        },
      );
    },
  );
}
