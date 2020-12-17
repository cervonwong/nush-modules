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

import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../domain/entities/module/module.dart';
import '../utils/module/module_filter.dart';

abstract class FilteredCatalogueEvent extends Equatable {
  const FilteredCatalogueEvent();
}

class FilterUpdated extends FilteredCatalogueEvent {
  final ModuleFilter filter;

  const FilterUpdated({@required this.filter});

  @override
  List<Object> get props => [filter];
}

class ModulesUpdated extends FilteredCatalogueEvent {
  final List<Module> modules;

  const ModulesUpdated({@required this.modules});

  @override
  List<Object> get props => [modules];
}
