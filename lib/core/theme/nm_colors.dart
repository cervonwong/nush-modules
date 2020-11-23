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

import 'dart:ui';

import 'package:meta/meta.dart';

import '../constants/color_constants.dart';

@immutable
class NMColor {
  final Color s050, s100, s200, s300, s400, s500, s600, s700, s800, s900;

  // This class is not meant to be instantiated by other libraries; a private
  // constructor is used.
  const NMColor._({
    @required this.s050,
    @required this.s100,
    @required this.s200,
    @required this.s300,
    @required this.s400,
    @required this.s500,
    @required this.s600,
    @required this.s700,
    @required this.s800,
    @required this.s900,
  })  : assert(s050 != null),
        assert(s100 != null),
        assert(s200 != null),
        assert(s300 != null),
        assert(s400 != null),
        assert(s500 != null),
        assert(s600 != null),
        assert(s700 != null),
        assert(s800 != null),
        assert(s900 != null);
}

class NMColors {
  // This class is not meant to be instantiated or extended; this constructor
  // prevents instantiation and extension.
  NMColors._();

  static const list = [
    rose,
    pink,
    fuchsia,
    purple,
    violet,
    indigo,
    blue,
    sky,
    cyan,
    teal,
    emerald,
    green,
    lime,
    yellow,
    amber,
    orange,
    red,
    // Gray is omitted from the list. When selecting a color from a list to, for
    // example, assign a color for a module. The gray may make it seem disabled.
  ];

  static const rose = NMColor._(
    s050: kRoseColor050,
    s100: kRoseColor100,
    s200: kRoseColor200,
    s300: kRoseColor300,
    s400: kRoseColor400,
    s500: kRoseColor500,
    s600: kRoseColor600,
    s700: kRoseColor700,
    s800: kRoseColor800,
    s900: kRoseColor900,
  );

  static const pink = NMColor._(
    s050: kPinkColor050,
    s100: kPinkColor100,
    s200: kPinkColor200,
    s300: kPinkColor300,
    s400: kPinkColor400,
    s500: kPinkColor500,
    s600: kPinkColor600,
    s700: kPinkColor700,
    s800: kPinkColor800,
    s900: kPinkColor900,
  );

  static const fuchsia = NMColor._(
    s050: kFuchsiaColor050,
    s100: kFuchsiaColor100,
    s200: kFuchsiaColor200,
    s300: kFuchsiaColor300,
    s400: kFuchsiaColor400,
    s500: kFuchsiaColor500,
    s600: kFuchsiaColor600,
    s700: kFuchsiaColor700,
    s800: kFuchsiaColor800,
    s900: kFuchsiaColor900,
  );

  static const purple = NMColor._(
    s050: kPurpleColor050,
    s100: kPurpleColor100,
    s200: kPurpleColor200,
    s300: kPurpleColor300,
    s400: kPurpleColor400,
    s500: kPurpleColor500,
    s600: kPurpleColor600,
    s700: kPurpleColor700,
    s800: kPurpleColor800,
    s900: kPurpleColor900,
  );

  static const violet = NMColor._(
    s050: kVioletColor050,
    s100: kVioletColor100,
    s200: kVioletColor200,
    s300: kVioletColor300,
    s400: kVioletColor400,
    s500: kVioletColor500,
    s600: kVioletColor600,
    s700: kVioletColor700,
    s800: kVioletColor800,
    s900: kVioletColor900,
  );

  static const indigo = NMColor._(
    s050: kIndigoColor050,
    s100: kIndigoColor100,
    s200: kIndigoColor200,
    s300: kIndigoColor300,
    s400: kIndigoColor400,
    s500: kIndigoColor500,
    s600: kIndigoColor600,
    s700: kIndigoColor700,
    s800: kIndigoColor800,
    s900: kIndigoColor900,
  );

  static const blue = NMColor._(
    s050: kBlueColor050,
    s100: kBlueColor100,
    s200: kBlueColor200,
    s300: kBlueColor300,
    s400: kBlueColor400,
    s500: kBlueColor500,
    s600: kBlueColor600,
    s700: kBlueColor700,
    s800: kBlueColor800,
    s900: kBlueColor900,
  );

  static const sky = NMColor._(
    s050: kSkyColor050,
    s100: kSkyColor100,
    s200: kSkyColor200,
    s300: kSkyColor300,
    s400: kSkyColor400,
    s500: kSkyColor500,
    s600: kSkyColor600,
    s700: kSkyColor700,
    s800: kSkyColor800,
    s900: kSkyColor900,
  );

  static const cyan = NMColor._(
    s050: kCyanColor050,
    s100: kCyanColor100,
    s200: kCyanColor200,
    s300: kCyanColor300,
    s400: kCyanColor400,
    s500: kCyanColor500,
    s600: kCyanColor600,
    s700: kCyanColor700,
    s800: kCyanColor800,
    s900: kCyanColor900,
  );

  static const teal = NMColor._(
    s050: kTealColor050,
    s100: kTealColor100,
    s200: kTealColor200,
    s300: kTealColor300,
    s400: kTealColor400,
    s500: kTealColor500,
    s600: kTealColor600,
    s700: kTealColor700,
    s800: kTealColor800,
    s900: kTealColor900,
  );

  static const emerald = NMColor._(
    s050: kEmeraldColor050,
    s100: kEmeraldColor100,
    s200: kEmeraldColor200,
    s300: kEmeraldColor300,
    s400: kEmeraldColor400,
    s500: kEmeraldColor500,
    s600: kEmeraldColor600,
    s700: kEmeraldColor700,
    s800: kEmeraldColor800,
    s900: kEmeraldColor900,
  );

  static const green = NMColor._(
    s050: kGreenColor050,
    s100: kGreenColor100,
    s200: kGreenColor200,
    s300: kGreenColor300,
    s400: kGreenColor400,
    s500: kGreenColor500,
    s600: kGreenColor600,
    s700: kGreenColor700,
    s800: kGreenColor800,
    s900: kGreenColor900,
  );

  static const lime = NMColor._(
    s050: kLimeColor050,
    s100: kLimeColor100,
    s200: kLimeColor200,
    s300: kLimeColor300,
    s400: kLimeColor400,
    s500: kLimeColor500,
    s600: kLimeColor600,
    s700: kLimeColor700,
    s800: kLimeColor800,
    s900: kLimeColor900,
  );

  static const yellow = NMColor._(
    s050: kYellowColor050,
    s100: kYellowColor100,
    s200: kYellowColor200,
    s300: kYellowColor300,
    s400: kYellowColor400,
    s500: kYellowColor500,
    s600: kYellowColor600,
    s700: kYellowColor700,
    s800: kYellowColor800,
    s900: kYellowColor900,
  );

  static const amber = NMColor._(
    s050: kAmberColor050,
    s100: kAmberColor100,
    s200: kAmberColor200,
    s300: kAmberColor300,
    s400: kAmberColor400,
    s500: kAmberColor500,
    s600: kAmberColor600,
    s700: kAmberColor700,
    s800: kAmberColor800,
    s900: kAmberColor900,
  );

  static const orange = NMColor._(
    s050: kOrangeColor050,
    s100: kOrangeColor100,
    s200: kOrangeColor200,
    s300: kOrangeColor300,
    s400: kOrangeColor400,
    s500: kOrangeColor500,
    s600: kOrangeColor600,
    s700: kOrangeColor700,
    s800: kOrangeColor800,
    s900: kOrangeColor900,
  );

  static const red = NMColor._(
    s050: kRedColor050,
    s100: kRedColor100,
    s200: kRedColor200,
    s300: kRedColor300,
    s400: kRedColor400,
    s500: kRedColor500,
    s600: kRedColor600,
    s700: kRedColor700,
    s800: kRedColor800,
    s900: kRedColor900,
  );

  static const gray = NMColor._(
    s050: kGrayColor050,
    s100: kGrayColor100,
    s200: kGrayColor200,
    s300: kGrayColor300,
    s400: kGrayColor400,
    s500: kGrayColor500,
    s600: kGrayColor600,
    s700: kGrayColor700,
    s800: kGrayColor800,
    s900: kGrayColor900,
  );
}
