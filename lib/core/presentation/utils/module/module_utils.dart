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

import '../../../domain/module/module.dart';

String getLevelsText({@required Module module}) {
  assert(module != null);
  final levels = module.levels;

  if (levels.length == 1) {
    return 'Y${levels.elementAt(0).index + 1}';
  } else {
    final clonedLevels = List.of(levels);
    clonedLevels.sort((l1, l2) => l1.index.compareTo(l2.index));

    return 'Y${clonedLevels[0].index + 1}/${clonedLevels[1].index + 1}';
  }
}

String getSemesterTypeTextShort({@required Module module}) {
  assert(module != null);

  switch (module.semesterType) {
    case SemesterType.first:
      return 'Sem 1';
    case SemesterType.second:
      return 'Sem 2';
    case SemesterType.either:
      return 'Sem 1/2';
    case SemesterType.both:
      return 'Year long';
  }

  throw UnimplementedError();
}

String getModuleTypeText({@required Module module}) {
  assert(module != null);

  switch (module.moduleType) {
    case ModuleType.core:
      return 'Core';
    case ModuleType.elective:
      return 'Elective';
    case ModuleType.enrichment:
      return 'Enrichment';
    case ModuleType.major:
      return 'Major';
    case ModuleType.honours:
      return 'Honours';
    case ModuleType.honoursInLieu:
      return 'Honours in lieu';
  }

  throw UnimplementedError();
}
