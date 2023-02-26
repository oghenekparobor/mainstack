import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData theme = ThemeData(
  useMaterial3: true,
  scaffoldBackgroundColor: Colors.white,
  visualDensity: VisualDensity.adaptivePlatformDensity,
  textTheme: TextTheme(
    displayLarge: GoogleFonts.robotoMono(
      fontSize: 24.sp,
      fontWeight: FontWeight.w600,
      color: const Color.fromRGBO(0, 0, 0, 1),
      fontStyle: FontStyle.normal,
    ),
    displayMedium: GoogleFonts.robotoMono(
      fontSize: 20.sp,
      fontWeight: FontWeight.w600,
      color: const Color.fromRGBO(0, 0, 0, 1),
      fontStyle: FontStyle.normal,
    ),
    bodyLarge: GoogleFonts.robotoMono(
      fontSize: 15.sp,
      fontWeight: FontWeight.w400,
      color: const Color.fromRGBO(0, 0, 0, 1),
    ),
    bodyMedium: GoogleFonts.robotoMono(
      fontSize: 12.sp,
      fontWeight: FontWeight.w400,
      color: const Color.fromRGBO(0, 0, 0, 1),
    ),
    titleMedium: GoogleFonts.robotoMono(
      fontSize: 8.sp,
      fontWeight: FontWeight.w400,
      color: const Color.fromRGBO(0, 0, 0, 1),
    ),
    titleSmall: GoogleFonts.robotoMono(
      fontSize: 10.sp,
      fontWeight: FontWeight.w400,
      color: const Color.fromRGBO(0, 0, 0, 1),
    ),
  ),
  canvasColor: const Color(0xFFFFFFFF),
  fontFamily: GoogleFonts.robotoMono.toString(),
  primaryColor: const Color(0xFF000000),
  iconTheme: const IconThemeData(color: Colors.black),
  primaryIconTheme: const IconThemeData(color: Colors.black),
  cardTheme: CardTheme(
    margin: EdgeInsets.symmetric(vertical: 5.sp),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
    elevation: 0,
    color: const Color.fromRGBO(242, 242, 247, 1),
  ),
  dialogTheme: DialogTheme(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(4),
    ),
  ),
  appBarTheme: const AppBarTheme(
    elevation: 0,
    iconTheme: IconThemeData(color: Colors.black),
    backgroundColor: Colors.transparent,
  ),
  inputDecorationTheme: InputDecorationTheme(
    fillColor: const Color.fromRGBO(242, 242, 247, 1),
    filled: true,
    hintStyle: GoogleFonts.nunito(
      fontSize: 14.sp,
      fontWeight: FontWeight.w400,
    ),
    labelStyle: GoogleFonts.nunito(fontWeight: FontWeight.w400),
    prefixIconColor: Colors.black,
    iconColor: Colors.black,
  ),
);
