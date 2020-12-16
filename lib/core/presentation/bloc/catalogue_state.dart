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

import '../../domain/entities/module/module.dart';

abstract class CatalogueState {
  const CatalogueState();
}

class CatalogueSearched extends CatalogueState {
  final Set<Module> matchingNameModules;
  final Set<Module> matchingDescriptionModules;

  const CatalogueSearched({
    @required this.matchingNameModules,
    @required this.matchingDescriptionModules,
  });
}

class CatalogueFiltered extends CatalogueState {
  //TODO: Do this after filter screen and parameters are finalised.
}

class ModuleStarred extends CatalogueState {
  final Module module;

  const ModuleStarred(this.module);
}

class ModuleUnstarred extends CatalogueState {
  final Module module;

  const ModuleUnstarred(this.module);
}

class ModuleInfoShown extends CatalogueState {
  final Module module;

  const ModuleInfoShown(this.module);
}

class ModuleReported extends CatalogueState {
  final Module module;

  const ModuleReported(this.module);
}
