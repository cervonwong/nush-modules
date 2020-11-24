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

import '../../theme/nm_colors.dart';

@immutable
class Module {
  final ModuleCode code;
  final String name;
  final String description;
  final Subject subject;
  final Set<Level> levels;
  final SemesterType semesterType;
  final ModuleType moduleType;
  final int modularCredits;

  /// The unit is hours/week.
  final double workload;

  /// This is nullable.
  final String criteria;

  Module({
    @required this.code,
    @required this.name,
    @required this.description,
    @required this.subject,
    @required this.levels,
    @required this.semesterType,
    @required this.moduleType,
    @required this.modularCredits,
    @required this.workload,
    this.criteria,
  })  : assert(code != null),
        assert(name != null),
        assert(description != null),
        assert(subject != null),
        assert(levels != null),
        assert(semesterType != null),
        assert(moduleType != null),
        assert(modularCredits != null),
        assert(workload != null),
        assert(levels.isNotEmpty),
        assert(levels.length < 3),
        assert(modularCredits >= 0),
        assert(workload > 0);
}

/// Represents the unique module code of each module.
/// E.g. MA1232V
@immutable
class ModuleCode {
  /// E.g. MA
  final String prefixChars;

  /// E.g. 1232
  final int digits;

  /// This is nullable.
  /// E.g. V
  final String suffixChar;

  ModuleCode({
    @required this.prefixChars,
    @required this.digits,
    this.suffixChar,
  })  : assert(prefixChars != null),
        assert(digits != null),
        assert(prefixChars.length == 2),
        assert(digits > 999 && digits < 7000),
        assert(suffixChar == null || suffixChar.length == 1);

  @override
  String toString() => '$prefixChars$digits${suffixChar ?? ''}';
}

@immutable
class Subject {
  final String prefixChars;
  final String name;
  final NMColor nmColor;

  // This class is not meant to be instantiated by other libraries; a private
  // constructor is used.
  const Subject._({
    @required this.prefixChars,
    @required this.name,
    @required this.nmColor,
  })  : assert(prefixChars != null),
        assert(name != null),
        assert(nmColor != null),
        assert(prefixChars.length == 2);
}

class Subjects {
  // This class is not meant to be instantiated or extended; this constructor
  // prevents instantiation and extension.
  Subjects._();

  static const list = [
    art,
    bengali,
    biology,
    cce,
    higherChinese,
    chinese,
    chemistry,
    cs,
    daVinci,
    economics,
    english,
    englishLiterature,
    french,
    geography,
    gujarati,
    german,
    hindi,
    history,
    humanities,
    japanese,
    mathematics,
    higherMalay,
    malay,
    music,
    physics,
    pe,
    punjabi,
    higherTamil,
    tamil,
    urdu,
  ];

  static const art = Subject._(
    prefixChars: 'AR',
    name: 'Art',
    nmColor: NMColors.red,
  );

  static const bengali = Subject._(
    prefixChars: 'BG',
    name: 'Bengali',
    nmColor: NMColors.red,
  );

  static const biology = Subject._(
    prefixChars: 'BL',
    name: 'Biology',
    nmColor: NMColors.red,
  );

  static const cce = Subject._(
    prefixChars: 'CE',
    name: 'Character & Citizenship Education',
    nmColor: NMColors.red,
  );

  static const higherChinese = Subject._(
    prefixChars: 'CH',
    name: 'Higher Chinese',
    nmColor: NMColors.red,
  );

  static const chinese = Subject._(
    prefixChars: 'CL',
    name: 'Chinese',
    nmColor: NMColors.red,
  );

  static const chemistry = Subject._(
    prefixChars: 'CM',
    name: 'Chemistry',
    nmColor: NMColors.red,
  );

  static const cs = Subject._(
    prefixChars: 'CS',
    name: 'Computer Science',
    nmColor: NMColors.red,
  );

  static const daVinci = Subject._(
    prefixChars: 'DV',
    name: 'Da Vinci',
    nmColor: NMColors.red,
  );

  static const economics = Subject._(
    prefixChars: 'EC',
    name: 'Economics',
    nmColor: NMColors.red,
  );

  static const english = Subject._(
    prefixChars: 'EL',
    name: 'English Language',
    nmColor: NMColors.red,
  );

  static const englishLiterature = Subject._(
    prefixChars: 'EN',
    name: 'English Literature',
    nmColor: NMColors.red,
  );

  static const french = Subject._(
    prefixChars: 'FR',
    name: 'French',
    nmColor: NMColors.red,
  );

  static const geography = Subject._(
    prefixChars: 'GE',
    name: 'Geography',
    nmColor: NMColors.red,
  );

  static const gujarati = Subject._(
    prefixChars: 'GJ',
    name: 'Gujarati',
    nmColor: NMColors.red,
  );

  static const german = Subject._(
    prefixChars: 'GM',
    name: 'German',
    nmColor: NMColors.red,
  );

  static const hindi = Subject._(
    prefixChars: 'HD',
    name: 'Hindi',
    nmColor: NMColors.red,
  );

  static const history = Subject._(
    prefixChars: 'HY',
    name: 'History',
    nmColor: NMColors.red,
  );

  static const humanities = Subject._(
    prefixChars: 'HU',
    name: 'Humanities',
    nmColor: NMColors.red,
  );

  static const japanese = Subject._(
    prefixChars: 'JP',
    name: 'Japanese',
    nmColor: NMColors.red,
  );

  static const mathematics = Subject._(
    prefixChars: 'MA',
    name: 'Mathematics',
    nmColor: NMColors.red,
  );

  static const higherMalay = Subject._(
    prefixChars: 'MH',
    name: 'Higher Malay',
    nmColor: NMColors.red,
  );

  static const malay = Subject._(
    prefixChars: 'ML',
    name: 'Malay',
    nmColor: NMColors.red,
  );

  static const music = Subject._(
    prefixChars: 'MU',
    name: 'Music',
    nmColor: NMColors.red,
  );

  static const physics = Subject._(
    prefixChars: 'PC',
    name: 'Physics',
    nmColor: NMColors.red,
  );

  static const pe = Subject._(
    prefixChars: 'PE',
    name: 'Physical Education',
    nmColor: NMColors.red,
  );

  static const punjabi = Subject._(
    prefixChars: 'PJ',
    name: 'Punjabi',
    nmColor: NMColors.red,
  );

  static const higherTamil = Subject._(
    prefixChars: 'TH',
    name: 'Higher Tamil',
    nmColor: NMColors.red,
  );

  static const tamil = Subject._(
    prefixChars: 'TL',
    name: 'Tamil',
    nmColor: NMColors.red,
  );

  static const urdu = Subject._(
    prefixChars: 'UD',
    name: 'Urdu',
    nmColor: NMColors.red,
  );
}

enum Level { year1, year2, year3, year4, year5, year6 }

enum SemesterType { first, second, either, both }

enum ModuleType { core, elective, enrichment, major, honours, honoursInLieu }
