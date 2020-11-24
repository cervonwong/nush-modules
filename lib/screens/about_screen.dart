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

import '../core/constants/color_constants.dart';
import '../core/presentation/widgets/footer.dart';
import '../core/presentation/widgets/header.dart';
import '../core/utils/widget_utils.dart';

class AboutScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          Header(),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                _AboutScreenTitle(),
                SizedBox(height: 32.0),
                _ProblemSection(),
                SizedBox(height: 64.0),
                _BannerSection(),
                SizedBox(height: 64.0),
                Footer(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _AboutScreenTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: getContentHorizontalPadding(context),
      color: Theme.of(context).colorScheme.primary,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 64.0),
        child: Column(
          children: [
            Text(
              'NUSH Modules helps you explore modules.',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headline2.copyWith(
                    color: kLightHighEmphasisTextColor,
                  ),
            ),
            SizedBox(height: 32.0),
            Text(
              'Our goal is to make exploring modules offered in NUS High School '
              'more accessible and intuitive to students.',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyText1.copyWith(
                    color: kLightMediumEmphasisTextColor,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ProblemSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: getContentHorizontalPadding(context),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'The problem',
            style: Theme.of(context).textTheme.headline4.copyWith(
                  color: kDarkHighEmphasisTextColor,
                ),
          ),
          SizedBox(height: 32.0),
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Problem 1',
                      style: Theme.of(context).textTheme.headline6.copyWith(
                            color: kDarkHighEmphasisTextColor,
                          ),
                    ),
                    Text(
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, '
                      'sed do eiusmod tempor incididunt ut labore et dolore '
                      'magna aliqua. Ut enim ad minim veniam, quis nostrud '
                      'exercitation ullamco laboris nisi ut aliquip ex ea '
                      'commodo consequat',
                      softWrap: true,
                      style: Theme.of(context).textTheme.bodyText2.copyWith(
                            color: kDarkHighEmphasisTextColor,
                          ),
                    ),
                  ],
                ),
              ),
              SizedBox(width: 16.0),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Problem 2',
                      style: Theme.of(context).textTheme.headline6.copyWith(
                            color: kDarkHighEmphasisTextColor,
                          ),
                    ),
                    Text(
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, '
                      'sed do eiusmod tempor incididunt ut labore et dolore '
                      'magna aliqua. Ut enim ad minim veniam, quis nostrud '
                      'exercitation ullamco laboris nisi ut aliquip ex ea '
                      'commodo consequat',
                      softWrap: true,
                      style: Theme.of(context).textTheme.bodyText2.copyWith(
                            color: kDarkHighEmphasisTextColor,
                          ),
                    ),
                  ],
                ),
              ),
              SizedBox(width: 16.0),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Problem 3',
                      style: Theme.of(context).textTheme.headline6.copyWith(
                            color: kDarkHighEmphasisTextColor,
                          ),
                    ),
                    Text(
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, '
                      'sed do eiusmod tempor incididunt ut labore et dolore '
                      'magna aliqua. Ut enim ad minim veniam, quis nostrud '
                      'exercitation ullamco laboris nisi ut aliquip ex ea '
                      'commodo consequat',
                      style: Theme.of(context).textTheme.bodyText2.copyWith(
                            color: kDarkHighEmphasisTextColor,
                          ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _BannerSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: getContentHorizontalPadding(context),
      color: kBackgroundColorAlt,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 32.0),
        child: Column(
          children: [
            Text(
              'A centralised resource for everything module related.',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headline4.copyWith(
                    color: kDarkHighEmphasisTextColor,
                  ),
            ),
            SizedBox(height: 16.0),
            Text(
              'We compiled information from the various official websites '
              'and documents, and compiled it into a single website.',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyText1.copyWith(
                    color: kDarkHighEmphasisTextColor,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
