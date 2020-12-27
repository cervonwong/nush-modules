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

import 'dart:math';

import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

import '../core/constants/color_constants.dart';
import '../core/domain/entities/module/module.dart';
import '../core/presentation/utils/module/module_utils.dart';
import '../core/presentation/widgets/footer.dart';
import '../core/presentation/widgets/header.dart';
import '../core/presentation/widgets/module/widget_utils.dart';

final module = Module(
  code: ModuleCode(
    prefixChars: 'BL',
    digits: 5534,
    suffixChar: 'V',
  ),
  name: 'NUS/LSM1105 Evolutionary Biology',
  description:
      'Evolutionary biology covers the history of life on our planet and the processes that produced the multiple life forms of Earth. Topics include: the origins of life; the eukaryotic cell, and multicellularity; the generation of genetic variation and the sorting of that variation through random processes and through natural and sexual selection; the origin of new traits, new life histories, and new species; the origins of sex, sociality, and altruism; the evolution of humans; and applications of evolutionary biology of solving modern day problems.',
  subject: Subjects.biology,
  levels: {Level.year5},
  semesterType: SemesterType.first,
  moduleType: ModuleType.honoursInLieu,
  modularCredits: 4,
  workload: 4,
  criteria: 'This module has a quota of only 5 students per semester.',
);

final textWrappingWidth = 640.0;

class ModuleInfoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          Header(activeDestination: Destination.overview),
          SliverList(
            delegate: SliverChildListDelegate([
              _ModuleInfoScreenTitle(),
              SizedBox(height: 32.0),
              _ModuleDescription(),
              SizedBox(height: 64.0),
              Footer(),
            ]),
          ),
        ],
      ),
    );
  }
}

class _ModuleInfoScreenTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: getContentHorizontalPadding(context),
      color: kBackgroundColorAlt,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 64.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              module.code.toString(),
              textAlign: TextAlign.left,
              style: Theme.of(context).textTheme.headline3,
            ),
            SizedBox(
              width: textWrappingWidth,
              child: Text(
                module.name,
                textAlign: TextAlign.left,
                style: Theme.of(context).textTheme.headline2,
                softWrap: true,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ModuleDescription extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: getContentHorizontalPadding(context),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'DESCRIPTION',
                textAlign: TextAlign.left,
                style: Theme.of(context)
                    .textTheme
                    .overline
                    .copyWith(color: kDarkMediumEmphasisTextColor),
              ),
              SizedBox(
                width: min(
                    textWrappingWidth,
                    MediaQuery.of(context).size.width -
                        getContentHorizontalPadding(context).left * 2),
                child: Text(
                  module.description,
                  softWrap: true,
                  textAlign: TextAlign.left,
                  style: Theme.of(context).textTheme.bodyText2,
                ),
              ),
              SizedBox(height: 32),
              Text(
                'CRITERIA',
                textAlign: TextAlign.left,
                style: Theme.of(context)
                    .textTheme
                    .overline
                    .copyWith(color: kDarkMediumEmphasisTextColor),
              ),
              SizedBox(
                width: min(
                    textWrappingWidth,
                    MediaQuery.of(context).size.width -
                        getContentHorizontalPadding(context).left * 2),
                child: Text(
                  module.criteria,
                  softWrap: true,
                  textAlign: TextAlign.left,
                  style: Theme.of(context).textTheme.bodyText2,
                ),
              ),
              SizedBox(height: 64),
              _PrerequisiteGraphSection(),
            ],
          ),
          SizedBox(width: 64),
          _SidebarInfoSection(),
        ],
      ),
    );
  }
}

class _PrerequisiteGraphSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Pre-requisite graph',
            textAlign: TextAlign.left,
            style: Theme.of(context).textTheme.headline5,
          ),
        ],
      ),
    );
  }
}

class _SidebarInfoSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Container _getFormattedSection({
      @required Icon icon,
      @required String title,
      @required String subtitle,
    }) {
      return Container(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              children: [
                SizedBox(height: 16),
                icon,
                SizedBox(height: 16),
              ],
            ),
            SizedBox(width: 8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 16),
                Text(
                  title,
                  style: Theme.of(context).textTheme.bodyText2,
                ),
                Text(
                  subtitle,
                  style: Theme.of(context).textTheme.subtitle1,
                ),
                SizedBox(height: 16),
              ],
            )
          ],
        ),
      );
    }

    return Container(
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: SizedBox(
            width: 192.0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                _getFormattedSection(
                  icon: Icon(FluentIcons.class_24_regular),
                  title: 'Department',
                  subtitle: module.subject.name,
                ),
                _getFormattedSection(
                  icon: Icon(FluentIcons.tag_24_regular),
                  title: 'Module type',
                  subtitle: getModuleTypeText(module: module),
                ),
                _getFormattedSection(
                  icon: Icon(FluentIcons.person_24_regular),
                  title: 'Level',
                  subtitle: getLevelsText(module: module),
                ),
                _getFormattedSection(
                  icon: Icon(FluentIcons.calendar_24_regular),
                  title: 'Semester',
                  subtitle: getSemesterTypeTextShort(module: module),
                ),
                _getFormattedSection(
                  icon: Icon(FluentIcons.ribbon_24_regular),
                  title: 'Modular credits',
                  subtitle: module.modularCredits.toString(),
                ),
                _getFormattedSection(
                  icon: Icon(FluentIcons.shifts_activity_24_regular),
                  title: 'Hours/week',
                  subtitle: module.workload.toString(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
