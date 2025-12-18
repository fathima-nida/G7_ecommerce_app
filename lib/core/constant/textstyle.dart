import 'package:flutter/material.dart';
import 'package:g7_comerce_app/core/constant/app_colors.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextstyle {
    static TextStyle small(
   {
    Color? fontColor,
    double? fontSize,
    FontWeight?fontWeight, 
    
   
  }) {
    return GoogleFonts.plusJakartaSans(
   color:fontColor?? AppColors.black,
   fontSize:fontSize?? 14,
  fontWeight: fontWeight ?? FontWeight.w400,
   
    );
  }
  static TextStyle medium({
    Color? fontColor,
    double?fontSize,
    FontWeight?fontWeight,
  }){
    return GoogleFonts.plusJakartaSans(
   color:fontColor??AppColors.black,
   fontSize: fontSize??16,
   fontWeight: fontWeight??FontWeight.w600,
    );
  }
  static TextStyle large({
Color?fontColor,
double?fontSize,
FontWeight?fontWeight,

  })
  {
    return GoogleFonts.plusJakartaSans(
color: fontColor??AppColors.black,
fontSize: fontSize??22,
fontWeight: fontWeight??FontWeight.w700,
    );
  }
}


