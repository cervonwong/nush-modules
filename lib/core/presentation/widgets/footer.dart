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
import '../../utils/widget_utils.dart';

class Footer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).colorScheme.primary,
      padding: getContentHorizontalPadding(context),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 32.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _LinkButtonBar(),
            SizedBox(height: 16.0),
            _ContentSection(),
            SizedBox(height: 16.0),
            _CopyrightSection(),
          ],
        ),
      ),
    );
  }
}

class _LinkButtonBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _themeData = Theme.of(context).copyWith(
      textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
          foregroundColor: MaterialStateProperty.resolveWith<Color>(
              (Set<MaterialState> states) {
            if (states.contains(MaterialState.hovered)) {
              return Theme.of(context).colorScheme.secondary;
            }
            return kLightHighEmphasisTextColor;
          }),
          overlayColor: MaterialStateProperty.all<Color>(
            Colors.transparent,
          ),
          textStyle: MaterialStateProperty.all<TextStyle>(
            Theme.of(context).textTheme.bodyText2.copyWith(
                  decoration: TextDecoration.underline,
                ),
          ),
          minimumSize: MaterialStateProperty.all<Size>(Size.zero),
          animationDuration: Duration(milliseconds: 150),
        ),
      ),
    );

    return Theme(
      data: _themeData,
      child: Wrap(
        spacing: 16.0,
        runSpacing: 16.0,
        children: [
          TextButton(
            child: Text('Github'),
            onPressed: () {},
          ),
          TextButton(
            child: Text('About'),
            onPressed: () {},
          ),
          TextButton(
            child: Text('Terms of Service'),
            onPressed: () {},
          ),
          TextButton(
            child: Text('Privacy Policy'),
            onPressed: () {},
          ),
          TextButton(
            child: Text('License'),
            onPressed: () {},
          ),
          TextButton(
            child: Text('Changelog'),
            onPressed: () {},
          ),
          TextButton(
            child: Text('Contribute'),
            onPressed: () {},
          ),
          TextButton(
            child: Text('FAQ'),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}

class _ContentSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text(
      'Developed for NUS High School students by Cervon Wong, '
      'Lee I-Shiang, and Tia Shi Wei. :)\n'
      'This service is unaffiliated with NUS High School.\n'
      'Data on this site is updated on 1 April 2020.',
      style: Theme.of(context).textTheme.caption.copyWith(
            color: kLightMediumEmphasisTextColor,
          ),
    );
  }
}

class _CopyrightSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text(
      'Copyright (C) 2020 Cervon Wong, Lee I-Shiang, and Tia Shi Wei. '
      'Rights are reserved selectively.',
      style: Theme.of(context).textTheme.caption.copyWith(
            color: kLightMediumEmphasisTextColor,
          ),
    );
  }
}
