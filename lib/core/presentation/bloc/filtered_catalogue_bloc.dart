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

import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../domain/entities/module/module.dart';
import '../utils/module/module_filter.dart';
import 'catalogue_bloc.dart';
import 'catalogue_state.dart';
import 'filtered_catalogue_event.dart';
import 'filtered_catalogue_state.dart';

class FilteredCatalogueBloc
    extends Bloc<FilteredCatalogueEvent, FilteredCatalogueState> {
  final CatalogueBloc modulesBloc;
  StreamSubscription modulesSubscription;

  FilteredCatalogueBloc({@required this.modulesBloc})
      : super(
          modulesBloc.state is CatalogueLoaded
              ? FilteredCatalogueLoaded(
                  starredModules: null,
                  filteredModules:
                      (modulesBloc.state as CatalogueLoaded).modules,
                  activeFilter: ModuleFilter.none,
                )
              : FilteredCatalogueLoading(),
        ) {
    modulesSubscription = modulesBloc.listen((state) {
      if (state is CatalogueLoaded) {
        add(ModulesUpdated(
            modules: (modulesBloc.state as CatalogueLoaded).modules));
      }
    });
  }

  @override
  Stream<FilteredCatalogueState> mapEventToState(
      FilteredCatalogueEvent event) async* {
    if (event is FilterUpdated) {
      yield* _mapFilterUpdatedToState(event);
    } else if (event is ModulesUpdated) {
      yield* _mapModulesUpdatedToState(event);
    }
  }

  Stream<FilteredCatalogueState> _mapFilterUpdatedToState(
      FilterUpdated event) async* {
    if (modulesBloc.state is CatalogueLoaded) {
      yield FilteredCatalogueLoaded(
        starredModules: null,
        filteredModules: _mapModulesToFilteredModules(
          (modulesBloc.state as CatalogueLoaded).modules,
          event.filter,
        ),
        activeFilter: event.filter,
      );
    }
  }

  Stream<FilteredCatalogueState> _mapModulesUpdatedToState(
      ModulesUpdated event) async* {
    final moduleFilter = state is FilteredCatalogueLoaded
        ? (state as FilteredCatalogueLoaded).activeFilter
        : ModuleFilter.none;
    yield FilteredCatalogueLoaded(
      starredModules: null,
      filteredModules: _mapModulesToFilteredModules(
        (modulesBloc.state as CatalogueLoaded).modules,
        moduleFilter,
      ),
      activeFilter: moduleFilter,
    );
  }

  List<Module> _mapModulesToFilteredModules(
      List<Module> modules, ModuleFilter filter) {
    return modules.where((module) {
      return ((filter.level == null)
              ? true
              : module.levels.contains(filter.level)) &&
          ((filter.moduleType == null)
              ? true
              : module.moduleType == filter.moduleType) &&
          ((filter.semesterType == null)
              ? true
              : module.semesterType == filter.semesterType);
    }).toList();
  }

  @override
  Future<void> close() {
    modulesSubscription.cancel();
    return super.close();
  }
}
