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
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../../constants/color_constants.dart';
import '../../../constants/widget_constants.dart';
import '../../../domain/module/module.dart';
import '../../utils/module/module_utils.dart';

class ModuleCard extends StatelessWidget {
  ModuleCard({
    @required this.module,
  }) : assert(module != null);

  final Module module;

  @override
  Widget build(BuildContext context) {
    const _cardHeight = 210.0;

    return Expanded(
      child: Material(
        color: Theme.of(context).colorScheme.surface,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(kSmallCornerRadius),
        ),
        child: Container(
          height: _cardHeight,
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          decoration: BoxDecoration(
            border: Border.all(color: kBorderColor, width: 1.0),
            borderRadius: BorderRadius.circular(kSmallCornerRadius),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _ModuleCardHeaderBar(module: module),
              _ModuleCardNameText(module: module),
              Spacer(),
              _ModuleCardFooterText(module: module),
            ],
          ),
        ),
      ),
    );
  }
}

class _ModuleCardHeaderBar extends StatelessWidget {
  const _ModuleCardHeaderBar({
    @required this.module,
  }) : assert(module != null);

  final Module module;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0, right: 6.0),
      child: Row(
        children: [
          Text(
            module.code.toString(),
            style: Theme.of(context).textTheme.bodyText1.copyWith(
                  color: kDarkMediumEmphasisTextColor,
                ),
          ),
          Spacer(),
          SizedBox(
            height: 24.0,
            width: 24.0,
            child: IconButton(
              padding: const EdgeInsets.all(0.0),
              splashRadius: 18.0,
              icon: Icon(
                FluentIcons.more_vertical_24_regular,
                color: kDarkMediumEmphasisTextColor,
              ),
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }
}

class _ModuleCardNameText extends StatelessWidget {
  const _ModuleCardNameText({
    @required this.module,
  }) : assert(module != null);

  final Module module;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Text(
        module.name,
        maxLines: 3,
        overflow: TextOverflow.ellipsis,
        style: Theme.of(context).textTheme.headline6.copyWith(
              color: module.subject.nmColor.s700,
            ),
      ),
    );
  }
}

class _ModuleCardFooterText extends StatelessWidget {
  const _ModuleCardFooterText({
    @required this.module,
  }) : assert(module != null);

  final Module module;

  /// E.g. Y1 · Sem 2 · Enrichment.
  String _getFooterText() {
    return '${getLevelsText(module: module)} · '
        '${getSemesterTypeTextShort(module: module)} · '
        '${getModuleTypeText(module: module)}';
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Align(
        alignment: Alignment.centerRight,
        child: Text(
          _getFooterText(),
          textAlign: TextAlign.right,
          style: Theme.of(context).textTheme.caption.copyWith(
                color: kDarkMediumEmphasisTextColor,
              ),
        ),
      ),
    );
  }
}
