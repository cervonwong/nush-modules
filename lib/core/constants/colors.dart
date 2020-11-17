/*
 * NUSH Modules is a web app to help you explore the modules offered by
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

// The colors below have been adapted from TailwindCSS v2.0 Colors:
// https://github.com/tailwindlabs/tailwindcss/blob/master/colors.js
// Changes:
// * Renamed 'light blue' -> 'sky'.
// * Removed 'cool gray', 'gray', 'true gray', 'warm gray'.
// * Renamed 'blue gray' -> 'gray'.
// * Selected some colors for the Material baseline color theme and others.

const Color kPrimaryColor = Color(0xff1e40af); // Also kBlueColor800.
const Color kPrimaryColorLight = Color(0xffdbeafe); // Also kBlueColor100.
const Color kPrimaryColorDark = Color(0xff1e3a8a); // Also kBlueColor900.

const Color kSecondaryColor = Color(0xfffb923c); // Also kOrangeColor400.
const Color kSecondaryColorLight = Color(0xffffedd5); // Also kOrangeColor100.
const Color kSecondaryColorDark = Color(0xffea580c); // Also kOrangeColor600.

const Color kSuccessColor = Color(0xff34d399); // Also kEmeraldColor400.
const Color kWarningColor = Color(0xfffacc15); // Also kYellowColor 400.
const Color kErrorColor = Color(0xfff87171); // Also kRedColor400.

const Color kRoseColor050 = Color(0xfffff1f2);
const Color kRoseColor100 = Color(0xffffe4e6);
const Color kRoseColor200 = Color(0xfffecdd3);
const Color kRoseColor300 = Color(0xfffda4af);
const Color kRoseColor400 = Color(0xfffb7185);
const Color kRoseColor500 = Color(0xfff43f5e);
const Color kRoseColor600 = Color(0xffe11d48);
const Color kRoseColor700 = Color(0xffbe123c);
const Color kRoseColor800 = Color(0xff9f1239);
const Color kRoseColor900 = Color(0xff881337);

const Color kPinkColor050 = Color(0xfffdf2f8);
const Color kPinkColor100 = Color(0xfffce7f3);
const Color kPinkColor200 = Color(0xfffbcfe8);
const Color kPinkColor300 = Color(0xfff9a8d4);
const Color kPinkColor400 = Color(0xfff472b6);
const Color kPinkColor500 = Color(0xffec4899);
const Color kPinkColor600 = Color(0xffdb2777);
const Color kPinkColor700 = Color(0xffbe185d);
const Color kPinkColor800 = Color(0xff9d174d);
const Color kPinkColor900 = Color(0xff831843);

const Color kFuchsiaColor050 = Color(0xfffdf4ff);
const Color kFuchsiaColor100 = Color(0xfffae8ff);
const Color kFuchsiaColor200 = Color(0xfff5d0fe);
const Color kFuchsiaColor300 = Color(0xfff0abfc);
const Color kFuchsiaColor400 = Color(0xffe879f9);
const Color kFuchsiaColor500 = Color(0xffd946ef);
const Color kFuchsiaColor600 = Color(0xffc026d3);
const Color kFuchsiaColor700 = Color(0xffa21caf);
const Color kFuchsiaColor800 = Color(0xff86198f);
const Color kFuchsiaColor900 = Color(0xff701a75);

const Color kPurpleColor050 = Color(0xfffaf5ff);
const Color kPurpleColor100 = Color(0xfff3e8ff);
const Color kPurpleColor200 = Color(0xffe9d5ff);
const Color kPurpleColor300 = Color(0xffd8b4fe);
const Color kPurpleColor400 = Color(0xffc084fc);
const Color kPurpleColor500 = Color(0xffa855f7);
const Color kPurpleColor600 = Color(0xff9333ea);
const Color kPurpleColor700 = Color(0xff7e22ce);
const Color kPurpleColor800 = Color(0xff6b21a8);
const Color kPurpleColor900 = Color(0xff581c87);

const Color kVioletColor050 = Color(0xfff5f3ff);
const Color kVioletColor100 = Color(0xffede9fe);
const Color kVioletColor200 = Color(0xffddd6fe);
const Color kVioletColor300 = Color(0xffc4b5fd);
const Color kVioletColor400 = Color(0xffa78bfa);
const Color kVioletColor500 = Color(0xff8b5cf6);
const Color kVioletColor600 = Color(0xff7c3aed);
const Color kVioletColor700 = Color(0xff6d28d9);
const Color kVioletColor800 = Color(0xff5b21b6);
const Color kVioletColor900 = Color(0xff4c1d95);

const Color kIndigoColor050 = Color(0xffeef2ff);
const Color kIndigoColor100 = Color(0xffe0e7ff);
const Color kIndigoColor200 = Color(0xffc7d2fe);
const Color kIndigoColor300 = Color(0xffa5b4fc);
const Color kIndigoColor400 = Color(0xff818cf8);
const Color kIndigoColor500 = Color(0xff6366f1);
const Color kIndigoColor600 = Color(0xff4f46e5);
const Color kIndigoColor700 = Color(0xff4338ca);
const Color kIndigoColor800 = Color(0xff3730a3);
const Color kIndigoColor900 = Color(0xff312e81);

const Color kBlueColor050 = Color(0xffeff6ff);
const Color kBlueColor100 = Color(0xffdbeafe); // Also kPrimaryColorLight.
const Color kBlueColor200 = Color(0xffbfdbfe);
const Color kBlueColor300 = Color(0xff93c5fd);
const Color kBlueColor400 = Color(0xff60a5fa);
const Color kBlueColor500 = Color(0xff3b82f6);
const Color kBlueColor600 = Color(0xff2563eb);
const Color kBlueColor700 = Color(0xff1d4ed8);
const Color kBlueColor800 = Color(0xff1e40af); // Also kPrimaryColor.
const Color kBlueColor900 = Color(0xff1e3a8a); // Also kPrimaryColorDark.

const Color kSkyColor050 = Color(0xfff0f9ff);
const Color kSkyColor100 = Color(0xffe0f2fe);
const Color kSkyColor200 = Color(0xffbae6fd);
const Color kSkyColor300 = Color(0xff7dd3fc);
const Color kSkyColor400 = Color(0xff38bdf8);
const Color kSkyColor500 = Color(0xff0ea5e9);
const Color kSkyColor600 = Color(0xff0284c7);
const Color kSkyColor700 = Color(0xff0369a1);
const Color kSkyColor800 = Color(0xff075985);
const Color kSkyColor900 = Color(0xff0c4a6e);

const Color kCyanColor050 = Color(0xffecfeff);
const Color kCyanColor100 = Color(0xffcffafe);
const Color kCyanColor200 = Color(0xffa5f3fc);
const Color kCyanColor300 = Color(0xff67e8f9);
const Color kCyanColor400 = Color(0xff22d3ee);
const Color kCyanColor500 = Color(0xff06b6d4);
const Color kCyanColor600 = Color(0xff0891b2);
const Color kCyanColor700 = Color(0xff0e7490);
const Color kCyanColor800 = Color(0xff155e75);
const Color kCyanColor900 = Color(0xff164e63);

const Color kTealColor050 = Color(0xfff0fdfa);
const Color kTealColor100 = Color(0xffccfbf1);
const Color kTealColor200 = Color(0xff99f6e4);
const Color kTealColor300 = Color(0xff5eead4);
const Color kTealColor400 = Color(0xff2dd4bf);
const Color kTealColor500 = Color(0xff14b8a6);
const Color kTealColor600 = Color(0xff0d9488);
const Color kTealColor700 = Color(0xff0f766e);
const Color kTealColor800 = Color(0xff115e59);
const Color kTealColor900 = Color(0xff134e4a);

const Color kEmeraldColor050 = Color(0xffecfdf5);
const Color kEmeraldColor100 = Color(0xffd1fae5);
const Color kEmeraldColor200 = Color(0xffa7f3d0);
const Color kEmeraldColor300 = Color(0xff6ee7b7);
const Color kEmeraldColor400 = Color(0xff34d399); // Also kSuccessColor.
const Color kEmeraldColor500 = Color(0xff10b981);
const Color kEmeraldColor600 = Color(0xff059669);
const Color kEmeraldColor700 = Color(0xff047857);
const Color kEmeraldColor800 = Color(0xff065f46);
const Color kEmeraldColor900 = Color(0xff064e3b);

const Color kGreenColor050 = Color(0xfff0fdf4);
const Color kGreenColor100 = Color(0xffdcfce7);
const Color kGreenColor200 = Color(0xffbbf7d0);
const Color kGreenColor300 = Color(0xff86efac);
const Color kGreenColor400 = Color(0xff4ade80);
const Color kGreenColor500 = Color(0xff22c55e);
const Color kGreenColor600 = Color(0xff16a34a);
const Color kGreenColor700 = Color(0xff15803d);
const Color kGreenColor800 = Color(0xff166534);
const Color kGreenColor900 = Color(0xff14532d);

const Color kLimeColor050 = Color(0xfff7fee7);
const Color kLimeColor100 = Color(0xffecfccb);
const Color kLimeColor200 = Color(0xffd9f99d);
const Color kLimeColor300 = Color(0xffbef264);
const Color kLimeColor400 = Color(0xffa3e635);
const Color kLimeColor500 = Color(0xff84cc16);
const Color kLimeColor600 = Color(0xff65a30d);
const Color kLimeColor700 = Color(0xff4d7c0f);
const Color kLimeColor800 = Color(0xff3f6212);
const Color kLimeColor900 = Color(0xff365314);

const Color kYellowColor050 = Color(0xfffefce8);
const Color kYellowColor100 = Color(0xfffef9c3);
const Color kYellowColor200 = Color(0xfffef08a);
const Color kYellowColor300 = Color(0xfffde047);
const Color kYellowColor400 = Color(0xfffacc15); // Also kWarningColor.
const Color kYellowColor500 = Color(0xffeab308);
const Color kYellowColor600 = Color(0xffca8a04);
const Color kYellowColor700 = Color(0xffa16207);
const Color kYellowColor800 = Color(0xff854d0e);
const Color kYellowColor900 = Color(0xff713f12);

const Color kAmberColor050 = Color(0xfffffbeb);
const Color kAmberColor100 = Color(0xfffef3c7);
const Color kAmberColor200 = Color(0xfffde68a);
const Color kAmberColor300 = Color(0xfffcd34d);
const Color kAmberColor400 = Color(0xfffbbf24);
const Color kAmberColor500 = Color(0xfff59e0b);
const Color kAmberColor600 = Color(0xffd97706);
const Color kAmberColor700 = Color(0xffb45309);
const Color kAmberColor800 = Color(0xff92400e);
const Color kAmberColor900 = Color(0xff78350f);

const Color kOrangeColor050 = Color(0xfffff7ed);
const Color kOrangeColor100 = Color(0xffffedd5); // Also kSecondaryColorLight.
const Color kOrangeColor200 = Color(0xfffed7aa);
const Color kOrangeColor300 = Color(0xfffdba74);
const Color kOrangeColor400 = Color(0xfffb923c); // Also kSecondaryColor.
const Color kOrangeColor500 = Color(0xfff97316);
const Color kOrangeColor600 = Color(0xffea580c); // Also kSecondaryColorDark.
const Color kOrangeColor700 = Color(0xffc2410c);
const Color kOrangeColor800 = Color(0xff9a3412);
const Color kOrangeColor900 = Color(0xff7c2d12);

const Color kRedColor050 = Color(0xfffef2f2);
const Color kRedColor100 = Color(0xfffee2e2);
const Color kRedColor200 = Color(0xfffecaca);
const Color kRedColor300 = Color(0xfffca5a5);
const Color kRedColor400 = Color(0xfff87171); // Also kErrorColor.
const Color kRedColor500 = Color(0xffef4444);
const Color kRedColor600 = Color(0xffdc2626);
const Color kRedColor700 = Color(0xffb91c1c);
const Color kRedColor800 = Color(0xff991b1b);
const Color kRedColor900 = Color(0xff7f1d1d);

const Color kGrayColor050 = Color(0xfff8fafc);
const Color kGrayColor100 = Color(0xfff1f5f9);
const Color kGrayColor200 = Color(0xffe2e8f0);
const Color kGrayColor300 = Color(0xffcbd5e1);
const Color kGrayColor400 = Color(0xff94a3b8);
const Color kGrayColor500 = Color(0xff64748b);
const Color kGrayColor600 = Color(0xff475569);
const Color kGrayColor700 = Color(0xff334155);
const Color kGrayColor800 = Color(0xff1e293b);
const Color kGrayColor900 = Color(0xff0f172a);
