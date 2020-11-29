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

import '../constants/color_constants.dart';
import '../constants/widget_constants.dart';

ThemeData init() {
  return ThemeData(
    scaffoldBackgroundColor: Colors.white,
    colorScheme: _createColorScheme(),
    cardTheme: _createCardTheme(),
    textTheme: _createTextTheme(),
    textButtonTheme: _createTextButtonTheme(),
    elevatedButtonTheme: _createElevatedButtonTheme(),
  );
}

CardTheme _createCardTheme() {
  return CardTheme(
    margin: const EdgeInsets.all(0.0),
    color: Colors.white,
    elevation: 0.0,
    shape: RoundedRectangleBorder(
      side: BorderSide(color: kBorderColor, width: 1.0),
      borderRadius: BorderRadius.circular(kMediumCornerRadius),
    ),
  );
}

ColorScheme _createColorScheme() {
  return ColorScheme(
    primary: kPrimaryColor,
    primaryVariant: kPrimaryColorLight,
    secondary: kSecondaryColor,
    secondaryVariant: kSecondaryColorLight,
    surface: Colors.white,
    background: Colors.white,
    error: kErrorColor,
    onPrimary: kLightHighEmphasisTextColor,
    onSecondary: kDarkHighEmphasisTextColor,
    onSurface: kDarkHighEmphasisTextColor,
    onBackground: kDarkHighEmphasisTextColor,
    onError: kLightHighEmphasisTextColor,
    brightness: Brightness.light,
  );
}

TextTheme _createTextTheme() {
  return TextTheme(
    headline1: TextStyle(
      fontWeight: FontWeight.w300,
      fontSize: 96.0,
    ),
    headline2: TextStyle(
      fontWeight: FontWeight.w700,
      fontSize: 60.0,
      height: 1.3,
    ),
    headline3: TextStyle(
      fontWeight: FontWeight.w400,
      fontSize: 48.0,
    ),
    headline4: TextStyle(
      fontWeight: FontWeight.w700,
      fontSize: 34.0,
    ),
    headline5: TextStyle(
      fontWeight: FontWeight.w700,
      fontSize: 24.0,
    ),
    headline6: TextStyle(
      fontWeight: FontWeight.w500,
      fontSize: 20.0,
    ),
    subtitle1: TextStyle(
      fontWeight: FontWeight.w600,
      fontSize: 16.0,
    ),
    subtitle2: TextStyle(
      fontWeight: FontWeight.w600,
      fontSize: 14.0,
    ),
    bodyText1: TextStyle(
      fontWeight: FontWeight.w400,
      fontSize: 17.0,
    ),
    bodyText2: TextStyle(
      fontWeight: FontWeight.w400,
      fontSize: 15.0,
    ),
    button: TextStyle(
      fontWeight: FontWeight.w600,
      fontSize: 14.0,
    ),
    caption: TextStyle(
      fontWeight: FontWeight.w400,
      fontSize: 12,
    ),
    overline: TextStyle(
      fontWeight: FontWeight.w500,
      fontSize: 10,
    ),
  ).apply(
    fontFamily: 'Poppins',
    bodyColor: kDarkHighEmphasisTextColor,
    displayColor: kDarkHighEmphasisTextColor,
  );
}

TextButtonThemeData _createTextButtonTheme() {
  return TextButtonThemeData(
    style: ButtonStyle(
      shape: MaterialStateProperty.all(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(kSmallCornerRadius),
        ),
      ),
      textStyle: MaterialStateProperty.all<TextStyle>(
        _createTextTheme().button,
      ),
    ),
  );
}

ElevatedButtonThemeData _createElevatedButtonTheme() {
  return ElevatedButtonThemeData(
    style: ButtonStyle(
      shape: MaterialStateProperty.all(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(kSmallCornerRadius),
        ),
      ),
      textStyle: MaterialStateProperty.all<TextStyle>(
        _createTextTheme().button,
      ),
    ),
  );
}
