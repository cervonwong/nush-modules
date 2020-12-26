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

import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'core/data/data_sources/json/module_json_data_source.dart';
import 'core/data/data_sources/moor_database.dart';
import 'core/domain/use_cases/GetAllModules.dart';

final getIt = GetIt.instance;

void init() {
  getIt.registerLazySingleton(() => GetAllModules(db: getIt()));

  getIt.registerLazySingleton(
    () => MoorDatabase(
      sharedPreferences: getIt(),
      moduleJsonDataSource: getIt(),
    ),
  );

  getIt.registerLazySingletonAsync(
    () async => await SharedPreferences.getInstance(),
  );

  getIt.registerLazySingleton<ModuleJsonDataSource>(
    () => ModuleJsonDataSourceImpl(),
  );
}
