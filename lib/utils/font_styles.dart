
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_colors.dart';

class FontStyles{

static TextStyle titleTextStyle = GoogleFonts.poppins(
    fontSize: 15,
    color: AppColors.blackColor,
    fontWeight: FontWeight.w600
);

static TextStyle descriptionTextStyle = GoogleFonts.poppins(
    fontSize: 10,
    color: AppColors.darkGrey,
    fontWeight: FontWeight.normal
);

static TextStyle dateTextStyle = GoogleFonts.poppins(
    fontSize: 10,
    color: AppColors.blackColor,
    fontWeight: FontWeight.bold
);

static TextStyle statusTextStyle = GoogleFonts.poppins(
    fontSize: 10,
    color: AppColors.defaultWhite,
    fontWeight: FontWeight.bold
);


static TextStyle headerTextStyle = GoogleFonts.poppins(
  fontWeight: FontWeight.w600,
  fontSize: 28,
  color: AppColors.blackColor
);


static TextStyle subHeaderTextStyle = GoogleFonts.poppins(
    fontWeight: FontWeight.normal,
    fontSize: 13,
    color: AppColors.greyColor
);




}