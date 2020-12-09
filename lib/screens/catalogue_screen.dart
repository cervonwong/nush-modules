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

import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';

import '../core/constants/color_constants.dart';
import '../core/domain/entities/module/module.dart';
import '../core/presentation/widgets/footer.dart';
import '../core/presentation/widgets/header.dart';
import '../core/presentation/widgets/module/module_card.dart';
import '../core/presentation/widgets/module/widget_utils.dart';

class CatalogueScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          Header(activeDestination: Destination.catalogue),
          SliverList(
            delegate: SliverChildListDelegate([
              _CatalogueScreenTitle(),
              SizedBox(height: 32.0),
              _ModulesSection(),
              SizedBox(height: 64.0),
              Footer(),
            ]),
          ),
        ],
      ),
    );
  }
}

class _CatalogueScreenTitle extends StatelessWidget {
  final OutlineInputBorder searchBorder = OutlineInputBorder(
    borderSide: BorderSide(
      color: kBorderColor,
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: getContentHorizontalPadding(context),
      color: kBackgroundColorAlt,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 64.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Catalogue',
              textAlign: TextAlign.left,
              style: Theme.of(context).textTheme.headline2,
            ),
            SizedBox(height: 32.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                OutlinedButton.icon(
                  onPressed: () {},
                  icon: Icon(FluentIcons.filter_24_regular),
                  label: Text('Filters'),
                ),
                Expanded(
                  flex: 1,
                  child: SizedBox(),
                ),
                Expanded(
                  flex: 6,
                  child: Theme(
                    data: ThemeData(
                      primaryColor: Theme.of(context).colorScheme.primary,
                    ),
                    child: TextField(
                      style: Theme.of(context).textTheme.bodyText2.copyWith(
                            color: Theme.of(context).colorScheme.primary,
                          ),
                      decoration: InputDecoration(
                        border: searchBorder,
                        enabledBorder: searchBorder,
                        focusedBorder: searchBorder,
                        prefixIcon: Icon(FluentIcons.search_24_regular),
                        hintText: 'Module codes, names or descriptions...',
                        hintStyle:
                            Theme.of(context).textTheme.bodyText2.copyWith(
                                  color: kDarkMediumEmphasisTextColor,
                                ),
                        isDense: true,
                        contentPadding: EdgeInsets.all(8.0),
                      ),
                      cursorColor: kDarkLowEmphasisTextColor,
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class _ModulesSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: getContentHorizontalPadding(context),
      child: Column(
        children: [
          _ModulesStarredSection(),
          SizedBox(height: 104.0),
          _ModulesAllSection(),
          SizedBox(height: 64.0),
          OutlinedButton.icon(
            onPressed: () {},
            icon: Icon(FluentIcons.chevron_down_24_regular),
            label: Text('Load More'),
          ),
        ],
      ),
    );
  }
}

class _ModulesStarredSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Row(children: [
            Text(
              'Starred',
              style: Theme.of(context).textTheme.headline5,
            ),
            Text(
              ' · 3 modules',
              style: Theme.of(context).textTheme.headline5.copyWith(
                    color: kDarkLowEmphasisTextColor,
                  ),
            ),
          ]),
          LayoutBuilder(builder: (context, constraints) {
            return GridView.count(
              shrinkWrap: true,
              crossAxisCount: getGridColumnCount(constraints),
              children: [
                ModuleCard(
                  module: Module(
                    code: ModuleCode(
                      prefixChars: 'CH',
                      digits: 1531,
                    ),
                    name: 'Higher Chinese I',
                    description: 'Dumb subject',
                    subject: Subjects.higherChinese,
                    levels: <Level>{Level.year1},
                    semesterType: SemesterType.both,
                    moduleType: ModuleType.core,
                    modularCredits: 6,
                    workload: 10,
                  ),
                ),
                ModuleCard(
                  module: Module(
                    code: ModuleCode(
                      prefixChars: 'CH',
                      digits: 1531,
                    ),
                    name: 'Higher Chinese I',
                    description: 'Dumb subject',
                    subject: Subjects.higherChinese,
                    levels: <Level>{Level.year1},
                    semesterType: SemesterType.both,
                    moduleType: ModuleType.core,
                    modularCredits: 6,
                    workload: 10,
                  ),
                ),
                ModuleCard(
                  module: Module(
                    code: ModuleCode(
                      prefixChars: 'CH',
                      digits: 1531,
                    ),
                    name: 'Higher Chinese I',
                    description: 'Dumb subject',
                    subject: Subjects.higherChinese,
                    levels: <Level>{Level.year1},
                    semesterType: SemesterType.both,
                    moduleType: ModuleType.core,
                    modularCredits: 6,
                    workload: 10,
                  ),
                ),
                ModuleCard(
                  module: Module(
                    code: ModuleCode(
                      prefixChars: 'CH',
                      digits: 1531,
                    ),
                    name: 'Higher Chinese I',
                    description: 'Dumb subject',
                    subject: Subjects.higherChinese,
                    levels: <Level>{Level.year1},
                    semesterType: SemesterType.both,
                    moduleType: ModuleType.core,
                    modularCredits: 6,
                    workload: 10,
                  ),
                ),
              ],
            );
          }),
        ],
      ),
    );
  }
}

class _ModulesAllSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Row(children: [
            Text(
              'All',
              style: Theme.of(context).textTheme.headline5,
            ),
            Text(
              ' · 420 modules',
              style: Theme.of(context).textTheme.headline5.copyWith(
                    color: kDarkLowEmphasisTextColor,
                  ),
            ),
          ]),
          LayoutBuilder(builder: (context, constraints) {
            return GridView.count(
              shrinkWrap: true,
              crossAxisCount: getGridColumnCount(constraints),
              children: [
                ModuleCard(
                  module: Module(
                    code: ModuleCode(
                      prefixChars: 'CH',
                      digits: 1531,
                    ),
                    name: 'Higher Chinese I',
                    description: 'Dumb subject',
                    subject: Subjects.higherChinese,
                    levels: <Level>{Level.year1},
                    semesterType: SemesterType.both,
                    moduleType: ModuleType.core,
                    modularCredits: 6,
                    workload: 10,
                  ),
                ),
                ModuleCard(
                  module: Module(
                    code: ModuleCode(
                      prefixChars: 'CH',
                      digits: 1531,
                    ),
                    name: 'Higher Chinese I',
                    description: 'Dumb subject',
                    subject: Subjects.higherChinese,
                    levels: <Level>{Level.year1},
                    semesterType: SemesterType.both,
                    moduleType: ModuleType.core,
                    modularCredits: 6,
                    workload: 10,
                  ),
                ),
                ModuleCard(
                  module: Module(
                    code: ModuleCode(
                      prefixChars: 'CH',
                      digits: 1531,
                    ),
                    name: 'Higher Chinese I',
                    description: 'Dumb subject',
                    subject: Subjects.higherChinese,
                    levels: <Level>{Level.year1},
                    semesterType: SemesterType.both,
                    moduleType: ModuleType.core,
                    modularCredits: 6,
                    workload: 10,
                  ),
                ),
                ModuleCard(
                  module: Module(
                    code: ModuleCode(
                      prefixChars: 'CH',
                      digits: 1531,
                    ),
                    name: 'Higher Chinese I',
                    description: 'Dumb subject',
                    subject: Subjects.higherChinese,
                    levels: <Level>{Level.year1},
                    semesterType: SemesterType.both,
                    moduleType: ModuleType.core,
                    modularCredits: 6,
                    workload: 10,
                  ),
                ),
              ],
            );
          }),
        ],
      ),
    );
  }
}
