
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_colors.dart';

class FontStyles{

/// This textStyles for Task item Title
static TextStyle titleTextStyle = GoogleFonts.poppins(
    fontSize: 15,
    color: AppColors.blackColor,
    fontWeight: FontWeight.w600
);

/// This textStyles for Task item description
static TextStyle descriptionTextStyle = GoogleFonts.poppins(
    fontSize: 10,
    color: AppColors.darkGrey,
    fontWeight: FontWeight.normal
);

/// This textStyle for task date
static TextStyle dateTextStyle = GoogleFonts.poppins(
    fontSize: 10,
    color: AppColors.blackColor,
    fontWeight: FontWeight.bold
);

/// This style for task item status
static TextStyle statusTextStyle = GoogleFonts.poppins(
    fontSize: 10,
    color: AppColors.defaultWhite,
    fontWeight: FontWeight.bold
);

/// This text style for App Header
static TextStyle headerTextStyle = GoogleFonts.poppins(
  fontWeight: FontWeight.w600,
  fontSize: 28,
  color: AppColors.blackColor
);

/// This text style for sub header
static TextStyle subHeaderTextStyle = GoogleFonts.poppins(
    fontWeight: FontWeight.normal,
    fontSize: 13,
    color: AppColors.greyColor
);




}