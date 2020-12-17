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

import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/mappers/module_json_to_entity_mapper.dart';
import '../../domain/entities/module/module.dart';
import 'catalogue_event.dart';
import 'catalogue_state.dart';

class CatalogueBloc extends Bloc<CatalogueEvent, CatalogueState> {
  CatalogueBloc(CatalogueState initialState) : super(initialState);

  @override
  Stream<CatalogueState> mapEventToState(CatalogueEvent event) async* {
    if (event is SearchCatalogue) {
      yield CatalogueLoading();
      try {
        final matchingNameModules = <Module>{};
        final matchingDescriptionModules = <Module>{};
        final mapper = ModuleJsonToEntityMapper();
        final moduleList = mapper.call(
            jsonString:
                File('../../../json/modules/modules.json').readAsStringSync());

        for (var module in moduleList) {
          if (module.name.toLowerCase().contains(event.input.toLowerCase())) {
            matchingNameModules.add(module);
          }
          if (module.description
              .toLowerCase()
              .contains(event.input.toLowerCase())) {
            matchingDescriptionModules.add(module);
          }
        }

        yield CatalogueLoaded();
      } catch (_) {
        yield CatalogueLoadFailed();
      }
    } else if (event is StarModule) {
      yield CatalogueLoading();
      try {
        yield CatalogueLoaded();
      } catch (_) {
        yield CatalogueLoadFailed();
      }
      yield CatalogueLoaded();
    } else if (event is UnstarModule) {
      yield CatalogueLoading();
      try {
        yield CatalogueLoaded();
      } catch (_) {
        yield CatalogueLoadFailed();
      }
      yield CatalogueLoaded();
    } else if (event is ReportModule) {
      yield ModuleReported(isSuccessful: true);
    }
  }
}
