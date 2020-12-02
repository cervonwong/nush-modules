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

import 'package:moor/moor.dart';
import 'package:moor/moor_web.dart';

part 'moor_database.g.dart';

/// This contains all the modules offered.
///
/// The modules in this table in usually only read. Rarely are modules updated,
/// deleted, or inserted into this table, unless the modules offered has changed
/// or there was a mistake in this table. The modules in this table is generated
/// from a JSON file which contains all the information about all modules
/// offered.
@DataClassName('ModuleModel') // To remove conflict with Model entity.
class Modules extends Table {
  /// An arbitrarily assigned integer that should remain constant throyhout
  /// future versions of the module.
  IntColumn get id => integer().customConstraint('UNIQUE')();

  /// A unique string that can identify the module.
  TextColumn get code => text().withLength(min: 6, max: 7)();

  /// A human-readable name to identify the module. Multiple modules can have
  /// the same name.
  TextColumn get name => text().withLength(max: 150)();

  /// A short paragraph describing what the module offers and other relevant
  /// information.
  TextColumn get description => text()();

  /// An optional (nullable) phrase or sentence describing additional criteria
  /// needed to take the module, or additional information to note about the
  /// module.
  TextColumn get remarks => text().nullable()();

  /// The number of modular credits of the module.
  IntColumn get modularCredits => integer()();

  /// The workload of the module in hours per week.
  RealColumn get workload => real()();

  // TODO(cervonwong): 01/12/2020 Add foreign key constraints for columns below.
  /// The foreign key which refers to the subject the module belongs to.
  IntColumn get subjectId =>
      integer().customConstraint('NOT NULL REFERENCES subjects(id)')();

  /// The foreign key which refers to the semester(s) which the module can be
  /// taken in.
  IntColumn get semesterTypeId => integer()();

  /// The foreign key which refers to the module type (core, elective,
  /// enrichment, etc.) of the module.
  IntColumn get moduleTypeId => integer()();

  @override
  Set<Column> get primaryKey => {id};
}

@DataClassName('SubjectModel') // To remove conflict with Subject entity.
class Subjects extends Table {
  IntColumn get id => integer().customConstraint('UNIQUE')();

  TextColumn get name => text().customConstraint('UNIQUE')();

  IntColumn get subjectColorId =>
      integer().customConstraint('NOT NULL REFERENCES subject_colors(id)')();

  @override
  Set<Column> get primaryKey => {id};
}

@DataClassName('SubjectColorModel')
class SubjectColors extends Table {
  IntColumn get id => integer().customConstraint('UNIQUE')();

  TextColumn get name => text().customConstraint('UNIQUE')();

  @override
  Set<Column> get primaryKey => {id};
}

@UseMoor(tables: [Modules, Subjects, SubjectColors])
class MoorDatabase extends _$MoorDatabase {
  MoorDatabase() : super(WebDatabase('db'));

  // Should update this each time the schema of the tables is updated.
  // Also consider creating a migration strategy.
  @override
  int get schemaVersion => 1;
}