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
import 'package:moor/moor.dart';
import 'package:moor/moor_web.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../constants/lookup_constants.dart';
import 'json/module_json_data_source.dart';

part 'moor_database.g.dart';

/// This contains all the modules offered.
///
/// The modules in this table in usually only read. Rarely are modules updated,
/// deleted, or inserted into this table, unless the modules offered has changed
/// or there was a mistake in this table. The modules in this table is generated
/// from a JSON file which contains all the information about all modules
/// offered.
@DataClassName('ModuleModel')
class Modules extends Table {
  /// An arbitrarily assigned integer that should remain constant throughout
  /// future versions of the module.
  IntColumn get id => integer()();

  /// A unique string that can identify the module.
  TextColumn get code => text()
      .withLength(
        min: 6,
        max: 7,
      )
      .customConstraint(
        'NOT NULL UNIQUE',
      )();

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
  IntColumn get semesterTypeId =>
      integer().customConstraint('NOT NULL REFERENCES semester_types(id)')();

  /// The foreign key which refers to the module type (core, elective,
  /// enrichment, etc.) of the module.
  IntColumn get moduleTypeId =>
      integer().customConstraint('NOT NULL REFERENCES module_types(id)')();

  @override
  Set<Column> get primaryKey => {id};
}

@DataClassName('SubjectModel')
class Subjects extends Table {
  IntColumn get id => integer()();

  TextColumn get name => text().customConstraint('NOT NULL UNIQUE')();

  IntColumn get subjectColorId =>
      integer().customConstraint('NOT NULL REFERENCES subject_colors(id)')();

  @override
  Set<Column> get primaryKey => {id};
}

@DataClassName('SubjectColorModel')
class SubjectColors extends Table {
  IntColumn get id => integer()();

  TextColumn get name => text().customConstraint('NOT NULL UNIQUE')();

  @override
  Set<Column> get primaryKey => {id};
}

@DataClassName('SemesterTypeModel')
class SemesterTypes extends Table {
  IntColumn get id => integer()();

  TextColumn get name => text().customConstraint('NOT NULL UNIQUE')();

  @override
  Set<Column> get primaryKey => {id};
}

@DataClassName('ModuleTypeModel')
class ModuleTypes extends Table {
  IntColumn get id => integer()();

  TextColumn get name => text().customConstraint('NOT NULL UNIQUE')();

  @override
  Set<Column> get primaryKey => {id};
}

@DataClassName('LevelModel')
class Levels extends Table {
  IntColumn get year => integer()();

  @override
  Set<Column> get primaryKey => {year};
}

@DataClassName('ModulesLevelsModel')
class ModulesLevels extends Table {
  IntColumn get moduleId =>
      integer().customConstraint('NOT NULL REFERENCES modules(id)')();

  IntColumn get levelYear =>
      integer().customConstraint('NOT NULL REFERENCES levels(year)')();

  @override
  Set<Column> get primaryKey => {moduleId, levelYear};
}

/// Mappable to a Module entity. This combines data from two tables, [Modules]
/// and [Levels], in a many-to-many relationship.
class ModuleWithLevelsModel {
  final ModuleModel module;
  final List<LevelModel> levels;

  ModuleWithLevelsModel({
    @required this.module,
    @required List<LevelModel> levels,
  }) : levels = levels.toList();
}

@UseMoor(tables: [
  Modules,
  Subjects,
  SubjectColors,
  SemesterTypes,
  ModuleTypes,
  Levels,
  ModulesLevels,
])
class MoorDatabase extends _$MoorDatabase {
  final SharedPreferences sharedPreferences;
  final ModuleJsonDataSource moduleJsonDataSource;

  MoorDatabase({
    @required this.sharedPreferences,
    @required this.moduleJsonDataSource,
  }) : super(WebDatabase('db'));

  @override
  MigrationStrategy get migration => MigrationStrategy(
        beforeOpen: (details) async {
          // Checks if this is the first time the app is being run by checking
          // if the database is newly created.
          if (details.wasCreated) {
            // Then, initialize the database with initial values!
            // Initialize reference/look-up tables:
            await batch((batch) {
              _insertAllSubjectColors(batch);
              _insertAllSubjects(batch);
              _insertAllModuleTypes(batch);
              _insertAllSemesterTypes(batch);
              _insertAllLevels(batch);
            });
          }

          await _upsertModulesIfNeeded();
        },
      );

  // Should update this each time the schema of the tables is updated.
  // Also consider creating a migration strategy.
  @override
  int get schemaVersion => 1;

  void _insertAllSubjectColors(Batch batch) async {
    batch.insertAll(
      subjectColors,
      [
        SubjectColorModel(id: kColorRoseId, name: kColorRoseName),
        SubjectColorModel(id: kColorPinkId, name: kColorPinkName),
        SubjectColorModel(id: kColorFuchsiaId, name: kColorFuchsiaName),
        SubjectColorModel(id: kColorPurpleId, name: kColorPurpleName),
        SubjectColorModel(id: kColorVioletId, name: kColorVioletName),
        SubjectColorModel(id: kColorIndigoId, name: kColorIndigoName),
        SubjectColorModel(id: kColorBlueId, name: kColorBlueName),
        SubjectColorModel(id: kColorSkyId, name: kColorSkyName),
        SubjectColorModel(id: kColorCyanId, name: kColorCyanName),
        SubjectColorModel(id: kColorTealId, name: kColorTealName),
        SubjectColorModel(id: kColorEmeraldId, name: kColorEmeraldName),
        SubjectColorModel(id: kColorGreenId, name: kColorGreenName),
        SubjectColorModel(id: kColorLimeId, name: kColorLimeName),
        SubjectColorModel(id: kColorYellowId, name: kColorYellowName),
        SubjectColorModel(id: kColorAmberId, name: kColorAmberName),
        SubjectColorModel(id: kColorOrangeId, name: kColorOrangeName),
        SubjectColorModel(id: kColorRedId, name: kColorRedName),
      ],
    );
  }

  void _insertAllSubjects(Batch batch) async {
    batch.insertAll(
      subjects,
      [
        SubjectModel(
          id: kSubjectArtId,
          name: kSubjectArtName,
          subjectColorId: 1,
        ),
        SubjectModel(
          id: kSubjectBengaliId,
          name: kSubjectBengaliName,
          subjectColorId: 1,
        ),
        SubjectModel(
          id: kSubjectBiologyId,
          name: kSubjectBiologyName,
          subjectColorId: 1,
        ),
        SubjectModel(
          id: kSubjectCceId,
          name: kSubjectCceName,
          subjectColorId: 1,
        ),
        SubjectModel(
          id: kSubjectHigherChineseId,
          name: kSubjectHigherChineseName,
          subjectColorId: 1,
        ),
        SubjectModel(
          id: kSubjectChineseId,
          name: kSubjectChineseName,
          subjectColorId: 1,
        ),
        SubjectModel(
          id: kSubjectChemistryId,
          name: kSubjectChemistryName,
          subjectColorId: 1,
        ),
        SubjectModel(
          id: kSubjectCsId,
          name: kSubjectCsName,
          subjectColorId: 1,
        ),
        SubjectModel(
          id: kSubjectDaVinciId,
          name: kSubjectDaVinciName,
          subjectColorId: 1,
        ),
        SubjectModel(
          id: kSubjectEnglishId,
          name: kSubjectEnglishName,
          subjectColorId: 1,
        ),
        SubjectModel(
          id: kSubjectEnglishLiteratureId,
          name: kSubjectEnglishLiteratureName,
          subjectColorId: 1,
        ),
        SubjectModel(
          id: kSubjectFrenchId,
          name: kSubjectFrenchName,
          subjectColorId: 1,
        ),
        SubjectModel(
          id: kSubjectGeographyId,
          name: kSubjectGeographyName,
          subjectColorId: 1,
        ),
        SubjectModel(
          id: kSubjectGujaratiId,
          name: kSubjectGujaratiName,
          subjectColorId: 1,
        ),
        SubjectModel(
          id: kSubjectGermanId,
          name: kSubjectGermanName,
          subjectColorId: 1,
        ),
        SubjectModel(
          id: kSubjectHindiId,
          name: kSubjectHindiName,
          subjectColorId: 1,
        ),
        SubjectModel(
          id: kSubjectHistoryId,
          name: kSubjectHistoryName,
          subjectColorId: 1,
        ),
        SubjectModel(
          id: kSubjectHumanitiesId,
          name: kSubjectHumanitiesName,
          subjectColorId: 1,
        ),
        SubjectModel(
          id: kSubjectJapaneseId,
          name: kSubjectJapaneseName,
          subjectColorId: 1,
        ),
        SubjectModel(
          id: kSubjectMathematicsId,
          name: kSubjectMathematicsName,
          subjectColorId: 1,
        ),
        SubjectModel(
          id: kSubjectHigherMalayId,
          name: kSubjectHigherMalayName,
          subjectColorId: 1,
        ),
        SubjectModel(
          id: kSubjectMalayId,
          name: kSubjectMalayName,
          subjectColorId: 1,
        ),
        SubjectModel(
          id: kSubjectMusicId,
          name: kSubjectMusicName,
          subjectColorId: 1,
        ),
        SubjectModel(
          id: kSubjectPhysicsId,
          name: kSubjectPhysicsName,
          subjectColorId: 1,
        ),
        SubjectModel(
          id: kSubjectPunjabiId,
          name: kSubjectPunjabiName,
          subjectColorId: 1,
        ),
        SubjectModel(
          id: kSubjectHigherTamilId,
          name: kSubjectHigherTamilName,
          subjectColorId: 1,
        ),
        SubjectModel(
          id: kSubjectTamilId,
          name: kSubjectTamilName,
          subjectColorId: 1,
        ),
        SubjectModel(
          id: kSubjectUrduId,
          name: kSubjectUrduName,
          subjectColorId: 1,
        ),
      ],
    );
  }

  void _insertAllModuleTypes(Batch batch) async {
    batch.insertAll(
      moduleTypes,
      [
        ModuleTypeModel(
          id: kModuleTypeCoreId,
          name: kModuleTypeCodeName,
        ),
        ModuleTypeModel(
          id: kModuleTypeElectiveId,
          name: kModuleTypeElectiveName,
        ),
        ModuleTypeModel(
          id: kModuleTypeEnrichmentId,
          name: kModuleTypeEnrichmentName,
        ),
        ModuleTypeModel(
          id: kModuleTypeMajorId,
          name: kModuleTypeMajorName,
        ),
        ModuleTypeModel(
          id: kModuleTypeHonours,
          name: kModuleTypeHonoursName,
        ),
        ModuleTypeModel(
          id: kModuleTypeHonoursInLieu,
          name: kModuleTypeHonoursInLieuName,
        ),
      ],
    );
  }

  void _insertAllSemesterTypes(Batch batch) async {
    batch.insertAll(
      semesterTypes,
      [
        SemesterTypeModel(
          id: kSemesterTypeFirstId,
          name: kSemesterTypeFirstName,
        ),
        SemesterTypeModel(
          id: kSemesterTypeSecondId,
          name: kSemesterTypeSecondName,
        ),
        SemesterTypeModel(
          id: kSemesterTypeEitherId,
          name: kSemesterTypeEitherName,
        ),
        SemesterTypeModel(
          id: kSemesterTypeBothId,
          name: kSemesterTypeBothName,
        ),
      ],
    );
  }

  void _insertAllLevels(Batch batch) async {
    batch.insertAll(
      levels,
      [
        LevelModel(year: 1),
        LevelModel(year: 2),
        LevelModel(year: 3),
        LevelModel(year: 4),
        LevelModel(year: 5),
        LevelModel(year: 6),
      ],
    );
  }

  Future<void> _upsertModulesIfNeeded() async {
    if (!_shouldUpsertModules()) return;

    final models = moduleJsonDataSource.getAll();

    final List<ModuleModel> moduleModels = models.map((model) => model.module);

    List<ModulesLevelsModel> modulesLevelsModels;

    for (var model in models) {
      for (var level in model.levels) {
        modulesLevelsModels.add(
          ModulesLevelsModel(
            moduleId: model.module.id,
            levelYear: level.year,
          ),
        );
      }
    }

    await batch((batch) {
      batch.insertAllOnConflictUpdate(modules, moduleModels);
      batch.insertAllOnConflictUpdate(modulesLevels, modulesLevelsModels);
    });
  }

  bool _shouldUpsertModules() {
    const key = 'MODULES VERSION';
    final currentVersion = sharedPreferences.getInt(key);
    final latestVersion = moduleJsonDataSource.getVersion();

    return latestVersion != currentVersion;
  }
}
