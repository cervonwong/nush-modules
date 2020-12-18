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

// The following constants are used in the database and repository layer to
// easily map between entity enums to lookup table foreign keys, initialising
// the lookup tables with non-generated columns, etc.

const int kSubjectArtId = 1;
const int kSubjectBengaliId = 2;
const int kSubjectBiologyId = 3;
const int kSubjectCceId = 4;
const int kSubjectHigherChineseId = 5;
const int kSubjectChineseId = 6;
const int kSubjectChemistryId = 7;
const int kSubjectCsId = 8;
const int kSubjectDaVinciId = 9;
const int kSubjectEnglishId = 10;
const int kSubjectEnglishLiteratureId = 11;
const int kSubjectFrenchId = 12;
const int kSubjectGeographyId = 13;
const int kSubjectGujaratiId = 14;
const int kSubjectGermanId = 15;
const int kSubjectHindiId = 16;
const int kSubjectHistoryId = 17;
const int kSubjectHumanitiesId = 18;
const int kSubjectJapaneseId = 19;
const int kSubjectMathematicsId = 20;
const int kSubjectHigherMalayId = 21;
const int kSubjectMalayId = 22;
const int kSubjectMusicId = 23;
const int kSubjectPhysicsId = 24;
const int kSubjectPunjabiId = 25;
const int kSubjectHigherTamilId = 26;
const int kSubjectTamilId = 27;
const int kSubjectUrduId = 28;

const String kSubjectArtName = 'ART';
const String kSubjectBengaliName = 'BENGALI';
const String kSubjectBiologyName = 'BIOLOGY';
const String kSubjectCceName = 'CCE';
const String kSubjectHigherChineseName = 'HIGHER CHINESE';
const String kSubjectChineseName = 'CHINESE';
const String kSubjectChemistryName = 'CHEMISTRY';
const String kSubjectCsName = 'CS';
const String kSubjectDaVinciName = 'DA VINCI';
const String kSubjectEnglishName = 'ENGLISH';
const String kSubjectEnglishLiteratureName = 'ENG LIT';
const String kSubjectFrenchName = 'FRENCH';
const String kSubjectGeographyName = 'GEOGRAPHY';
const String kSubjectGujaratiName = 'GUJARATI';
const String kSubjectGermanName = 'GERMAN';
const String kSubjectHindiName = 'HINDI';
const String kSubjectHistoryName = 'HISTORY';
const String kSubjectHumanitiesName = 'HUMANITIES';
const String kSubjectJapaneseName = 'JAPANESE';
const String kSubjectMathematicsName = 'MATH';
const String kSubjectHigherMalayName = 'HIGHER MALAY';
const String kSubjectMalayName = 'MALAY';
const String kSubjectMusicName = 'MUSIC';
const String kSubjectPhysicsName = 'PHYSICS';
const String kSubjectPunjabiName = 'PUNJABI';
const String kSubjectHigherTamilName = 'HIGHER TAMIL';
const String kSubjectTamilName = 'TAMIL';
const String kSubjectUrduName = 'URDU';

const int kModuleTypeCoreId = 1;
const int kModuleTypeElectiveId = 2;
const int kModuleTypeEnrichmentId = 3;
const int kModuleTypeMajorId = 4;
const int kModuleTypeHonours = 5;
const int kModuleTypeHonoursInLieu = 6;

const String kModuleTypeCodeName = 'CORE';
const String kModuleTypeElectiveName = 'ELECTIVE';
const String kModuleTypeEnrichmentName = 'ENRICHMENT';
const String kModuleTypeMajorName = 'MAJOR';
const String kModuleTypeHonoursName = 'HONOURS';
const String kModuleTypeHonoursInLieuName = 'HONOURS IN LIEU';

const int kSemesterTypeFirstId = 1;
const int kSemesterTypeSecondId = 2;
const int kSemesterTypeEitherId = 3;
const int kSemesterTypeBothId = 4;

const String kSemesterTypeFirstName = 'FIRST';
const String kSemesterTypeSecondName = 'SECOND';
const String kSemesterTypeEitherName = 'EITHER';
const String kSemesterTypeBothName = 'BOTH';

const int kColorRoseId = 1;
const int kColorPinkId = 2;
const int kColorFuchsiaId = 3;
const int kColorPurpleId = 4;
const int kColorVioletId = 5;
const int kColorIndigoId = 6;
const int kColorBlueId = 7;
const int kColorSkyId = 8;
const int kColorCyanId = 9;
const int kColorTealId = 10;
const int kColorEmeraldId = 11;
const int kColorGreenId = 12;
const int kColorLimeId = 13;
const int kColorYellowId = 14;
const int kColorAmberId = 15;
const int kColorOrangeId = 16;
const int kColorRedId = 17;

const String kColorRoseName = 'ROSE';
const String kColorPinkName = 'PINK';
const String kColorFuchsiaName = 'FUCHSIA';
const String kColorPurpleName = 'PURPLE';
const String kColorVioletName = 'VIOLET';
const String kColorIndigoName = 'INDIGO';
const String kColorBlueName = 'BLUE';
const String kColorSkyName = 'SKY';
const String kColorCyanName = 'CYAN';
const String kColorTealName = 'TEAL';
const String kColorEmeraldName = 'EMERALD';
const String kColorGreenName = 'GREEN';
const String kColorLimeName = 'LIME';
const String kColorYellowName = 'YELLOW';
const String kColorAmberName = 'AMBER';
const String kColorOrangeName = 'ORANGE';
const String kColorRedName = 'RED';
