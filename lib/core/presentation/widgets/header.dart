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

import 'package:flutter/material.dart';

import '../../constants/color_constants.dart';
import '../../constants/widget_constants.dart';

enum Destination { overview, catalogue, timetable, settings }

class Header extends StatelessWidget {
  /// This is nullable.
  /// If null, it represents that the user is in a top-level navigation
  /// destination that is not part of [Destination].
  /// E.g. AboutScreen.
  final Destination activeDestination;

  Header({
    this.activeDestination,
  });

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: _createThemeData(context),
      child: SliverAppBar(
        toolbarHeight: kAppBarHeight,
        floating: true,
        pinned: true,
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: Stack(
          children: [
            _ConnectButton(),
            _DestinationButtonBar(activeDestination: activeDestination),
          ],
        ),
      ),
    );
  }

  ThemeData _createThemeData(BuildContext context) {
    final elevatedButtonThemeData = ElevatedButtonThemeData(
      style: Theme.of(context).elevatedButtonTheme.style.copyWith(
            backgroundColor: MaterialStateProperty.all<Color>(
              Theme.of(context).colorScheme.secondary,
            ),
            foregroundColor: MaterialStateProperty.all<Color>(
              kDarkHighEmphasisTextColor,
            ),
            minimumSize: MaterialStateProperty.all<Size>(Size(100.0, 40.0)),
            elevation: MaterialStateProperty.resolveWith<double>(
                (Set<MaterialState> states) {
              if (states.contains(MaterialState.hovered) ||
                  states.contains(MaterialState.pressed) ||
                  states.contains(MaterialState.selected)) {
                return 4.0;
              }
              return 0.0;
            }),
          ),
    );

    final textButtonThemeData = TextButtonThemeData(
      style: Theme.of(context).textButtonTheme.style.copyWith(
            foregroundColor: MaterialStateProperty.resolveWith<Color>(
                (Set<MaterialState> states) {
              if (states.contains(MaterialState.hovered) ||
                  states.contains(MaterialState.pressed) ||
                  states.contains(MaterialState.selected)) {
                return kLightHighEmphasisTextColor;
              }
              return kLightMediumEmphasisTextColor;
            }),
            textStyle: MaterialStateProperty.all<TextStyle>(
              Theme.of(context).textTheme.bodyText1,
            ),
            shape: MaterialStateProperty.all<OutlinedBorder>(
              RoundedRectangleBorder(),
            ),
          ),
    );

    return Theme.of(context).copyWith(
      elevatedButtonTheme: elevatedButtonThemeData,
      textButtonTheme: textButtonThemeData,
    );
  }
}

class _ConnectButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: kAppBarHeight,
      alignment: Alignment.centerRight,
      child: ElevatedButton(
        child: Text('Connect'),
        onPressed: () {},
      ),
    );
  }
}

class _DestinationButtonBar extends StatelessWidget {
  const _DestinationButtonBar({
    @required this.activeDestination,
  });

  final Destination activeDestination;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _DestinationButton(
          text: 'Overview',
          isActive: activeDestination == Destination.overview,
          onPressed: () {},
        ),
        _DestinationButton(
          text: 'Catalogue',
          isActive: activeDestination == Destination.catalogue,
          onPressed: () {},
        ),
        _DestinationButton(
          text: 'Timetable',
          isActive: activeDestination == Destination.timetable,
          onPressed: () {},
        ),
        _DestinationButton(
          text: 'Settings',
          isActive: activeDestination == Destination.settings,
          onPressed: () {},
        ),
      ],
    );
  }
}

class _DestinationButton extends StatelessWidget {
  final String text;
  final bool isActive;
  final VoidCallback onPressed;

  _DestinationButton({
    @required this.text,
    @required this.isActive,
    @required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final _activeTextStyle = Theme.of(context).textTheme.bodyText1.copyWith(
          fontWeight: FontWeight.w600,
          color: Theme.of(context).colorScheme.secondary,
        );

    const horizontalPadding = 16.0;

    return Container(
      height: kAppBarHeight,
      child: TextButton(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: horizontalPadding),
          child: Text(
            text,
            style: isActive ? _activeTextStyle : null,
          ),
        ),
        onPressed: onPressed,
      ),
    );
  }
}
