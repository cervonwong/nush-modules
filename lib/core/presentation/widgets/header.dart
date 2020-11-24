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

enum Destination { overview, catalogue, timetable, settings }

class Header extends StatelessWidget {
  /// This is nullable.
  final currentDestination;

  Header({
    this.currentDestination,
  });

  @override
  Widget build(BuildContext context) {
    const appBarHeight = 64.0;

    final _themeData = ThemeData(
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(
            Theme.of(context).colorScheme.secondary,
          ),
          foregroundColor: MaterialStateProperty.all<Color>(
            kDarkHighEmphasisTextColor,
          ),
          textStyle: MaterialStateProperty.all<TextStyle>(
            Theme.of(context).textTheme.button,
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
      ),
      textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
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
        ),
      ),
    );

    return Theme(
      data: _themeData,
      child: SliverAppBar(
        toolbarHeight: appBarHeight,
        floating: true,
        pinned: true,
        snap: false,
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: Stack(
          children: [
            Container(
              height: appBarHeight,
              alignment: Alignment.centerRight,
              child: ElevatedButton(
                child: Text('Connect'),
                onPressed: () {},
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: appBarHeight,
                  child: TextButton(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Text(
                        'Overview',
                        style: currentDestination == Destination.overview
                            ? Theme.of(context).textTheme.bodyText1.copyWith(
                                  fontWeight: FontWeight.w600,
                                  color:
                                      Theme.of(context).colorScheme.secondary,
                                )
                            : null,
                      ),
                    ),
                    onPressed: () {},
                  ),
                ),
                Container(
                  height: appBarHeight,
                  child: TextButton(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Text(
                        'Catalogue',
                        style: currentDestination == Destination.catalogue
                            ? Theme.of(context).textTheme.bodyText1.copyWith(
                                  fontWeight: FontWeight.w600,
                                  color:
                                      Theme.of(context).colorScheme.secondary,
                                )
                            : null,
                      ),
                    ),
                    onPressed: () {},
                  ),
                ),
                Container(
                  height: appBarHeight,
                  child: TextButton(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Text(
                        'Timetable',
                        style: currentDestination == Destination.timetable
                            ? Theme.of(context).textTheme.bodyText1.copyWith(
                                  fontWeight: FontWeight.w600,
                                  color:
                                      Theme.of(context).colorScheme.secondary,
                                )
                            : null,
                      ),
                    ),
                    onPressed: () {},
                  ),
                ),
                Container(
                  height: appBarHeight,
                  child: TextButton(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Text(
                        'Settings',
                        style: currentDestination == Destination.settings
                            ? Theme.of(context).textTheme.bodyText1.copyWith(
                                  fontWeight: FontWeight.w600,
                                  color:
                                      Theme.of(context).colorScheme.secondary,
                                )
                            : null,
                      ),
                    ),
                    onPressed: () {},
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
