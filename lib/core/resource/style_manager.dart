import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'font_manager.dart';

TextStyle _getTextStyle(
  double fontSize,
  String fontFamily,
  FontWeight fontWeight,
  Color color,
  double height,
) {
  try {
    return GoogleFonts.getFont(
      fontFamily,
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: color,
      height: height,
    );
  } catch (e) {
    return TextStyle(
      fontSize: fontSize,
      fontFamily: fontFamily,
      fontWeight: fontWeight,
      color: color,
      height: height,
    );
  }
}

//light text style
TextStyle getLight300Style12({
  double fontSize = FontSize.s12,
  FontWeight fontWeight = FontWeightManager.light300,
  required Color color,
  double height = 1.2,
  String fontFamily = FontConstants.fontFamily,
}) {
  return _getTextStyle(fontSize, fontFamily, fontWeight, color, height);
}

//regular  text style
TextStyle getRegular400Style10({
  double fontSize = FontSize.s10,
  FontWeight fontWeight = FontWeightManager.regular400,
  required Color color,
  String fontFamily = FontConstants.fontFamily,
  double height = 1.2,
}) {
  return _getTextStyle(fontSize, fontFamily, fontWeight, color, height);
}

TextStyle getRegular400Style12({
  double fontSize = FontSize.s12,
  FontWeight fontWeight = FontWeightManager.regular400,
  required Color color,
  String fontFamily = FontConstants.fontFamily,
  double height = 1.2,
}) {
  return _getTextStyle(fontSize, fontFamily, fontWeight, color, height);
}

TextStyle getRegular400Style14({
  double fontSize = FontSize.s14,
  FontWeight fontWeight = FontWeightManager.regular400,
  required Color color,
  String fontFamily = FontConstants.fontFamily,
  double height = 1.2,
}) {
  return _getTextStyle(fontSize, fontFamily, fontWeight, color, height);
}

TextStyle getRegular400Style16({
  double fontSize = FontSize.s16,
  FontWeight fontWeight = FontWeightManager.regular400,
  required Color color,
  String fontFamily = FontConstants.fontFamily,
  double height = 1.2,
}) {
  return _getTextStyle(fontSize, fontFamily, fontWeight, color, height);
}

//mediun text style
TextStyle getMedium500Style14({
  double fontSize = FontSize.s14,
  FontWeight fontWeight = FontWeightManager.medium500,
  required Color color,
  String fontFamily = FontConstants.fontFamily,
  double height = 1.2,
}) {
  return _getTextStyle(fontSize, fontFamily, fontWeight, color, height);
}

TextStyle getMedium500Style12({
  double fontSize = FontSize.s12,
  FontWeight fontWeight = FontWeightManager.medium500,
  required Color color,
  String fontFamily = FontConstants.fontFamily,
  double height = 1.2,
}) {
  return _getTextStyle(fontSize, fontFamily, fontWeight, color, height);
}

TextStyle getMedium500Style16({
  double fontSize = FontSize.s16,
  FontWeight fontWeight = FontWeightManager.medium500,
  required Color color,
  String fontFamily = FontConstants.fontFamily,
  double height = 1.2,
}) {
  return _getTextStyle(fontSize, fontFamily, fontWeight, color, height);
}

TextStyle getMedium500Style18({
  double fontSize = FontSize.s18,
  FontWeight fontWeight = FontWeightManager.medium500,
  required Color color,
  String fontFamily = FontConstants.fontFamily,
  double height = 1.2,
}) {
  return _getTextStyle(fontSize, fontFamily, fontWeight, color, height);
}

TextStyle getMedium500Style20({
  double fontSize = FontSize.s20,
  FontWeight fontWeight = FontWeightManager.medium500,
  required Color color,
  String fontFamily = FontConstants.fontFamily,
  double height = 1.2,
}) {
  return _getTextStyle(fontSize, fontFamily, fontWeight, color, height);
}

TextStyle getMedium500Style24({
  double fontSize = FontSize.s24,
  FontWeight fontWeight = FontWeightManager.medium500,
  required Color color,
  String fontFamily = FontConstants.fontFamily,
  double height = 1.2,
}) {
  return _getTextStyle(fontSize, fontFamily, fontWeight, color, height);
}

//semi bold text style
TextStyle getSemiBold600Style12({
  double fontSize = FontSize.s12,
  FontWeight fontWeight = FontWeightManager.semiBold600,
  required Color color,
  String fontFamily = FontConstants.fontFamily,
  double height = 1.2,
}) {
  return _getTextStyle(fontSize, fontFamily, fontWeight, color, height);
}

TextStyle getSemiBold600Style14({
  double fontSize = FontSize.s14,
  FontWeight fontWeight = FontWeightManager.semiBold600,
  required Color color,
  String fontFamily = FontConstants.fontFamily,
  double height = 1.2,
}) {
  return _getTextStyle(fontSize, fontFamily, fontWeight, color, height);
}

TextStyle getSemiBold600Style16({
  double fontSize = FontSize.s16,
  FontWeight fontWeight = FontWeightManager.semiBold600,
  required Color color,
  String fontFamily = FontConstants.fontFamily,
  double height = 1.2,
}) {
  return _getTextStyle(fontSize, fontFamily, fontWeight, color, height);
}

TextStyle getSemiBold600Style18({
  double fontSize = FontSize.s18,
  FontWeight fontWeight = FontWeightManager.semiBold600,
  required Color color,
  String fontFamily = FontConstants.fontFamily,
  double height = 1.2,
}) {
  return _getTextStyle(fontSize, fontFamily, fontWeight, color, height);
}

TextStyle getSemiBold600Style20({
  double fontSize = FontSize.s20,
  FontWeight fontWeight = FontWeightManager.semiBold600,
  required Color color,
  String fontFamily = FontConstants.fontFamily,
  double height = 1.2,
}) {
  return _getTextStyle(fontSize, fontFamily, fontWeight, color, height);
}

TextStyle getSemiBold600Style24({
  double fontSize = FontSize.s24,
  FontWeight fontWeight = FontWeightManager.semiBold600,
  required Color color,
  String fontFamily = FontConstants.fontFamily,
  double height = 1.2,
}) {
  return _getTextStyle(fontSize, fontFamily, fontWeight, color, height);
}

TextStyle getSemiBold600Style28({
  double fontSize = FontSize.s28,
  FontWeight fontWeight = FontWeightManager.semiBold600,
  required Color color,
  String fontFamily = FontConstants.fontFamily,
  double height = 1.2,
}) {
  return _getTextStyle(fontSize, fontFamily, fontWeight, color, height);
}
TextStyle getSemiBold600Style30({
  double fontSize = FontSize.s30,
  FontWeight fontWeight = FontWeightManager.semiBold600,
  required Color color,
  String fontFamily = FontConstants.fontFamily,
  double height = 1.2,
}) {
  return _getTextStyle(fontSize, fontFamily, fontWeight, color, height);
}
TextStyle getSemiBold600Style32({
  double fontSize = FontSize.s32,
  FontWeight fontWeight = FontWeightManager.semiBold600,
  required Color color,
  String fontFamily = FontConstants.fontFamily,
  double height = 1.2,
}) {
  return _getTextStyle(fontSize, fontFamily, fontWeight, color, height);
}

//bold text style
TextStyle getBold700Style14({
  double fontSize = FontSize.s14,
  FontWeight fontWeight = FontWeightManager.bold700,
  required Color color,
  String fontFamily = FontConstants.fontFamily,
  double height = 1.2,
}) {
  return _getTextStyle(fontSize, fontFamily, fontWeight, color, height);
}

TextStyle getBold700Style18({
  double fontSize = FontSize.s18,
  FontWeight fontWeight = FontWeightManager.bold700,
  required Color color,
  String fontFamily = FontConstants.fontFamily,
  double height = 1.2,
}) {
  return _getTextStyle(fontSize, fontFamily, fontWeight, color, height);
}

TextStyle getBold700Style16({
  double fontSize = FontSize.s16,
  FontWeight fontWeight = FontWeightManager.bold700,
  required Color color,
  String fontFamily = FontConstants.fontFamily,
  double height = 1.2,
}) {
  return _getTextStyle(fontSize, fontFamily, fontWeight, color, height);
}

TextStyle getBold700Style22({
  double fontSize = FontSize.s22,
  FontWeight fontWeight = FontWeightManager.bold700,
  required Color color,
  String fontFamily = FontConstants.fontFamily,
  double height = 1.2,
}) {
  return _getTextStyle(fontSize, fontFamily, fontWeight, color, height);
}

TextStyle getBold700Style24({
  double fontSize = FontSize.s24,
  FontWeight fontWeight = FontWeightManager.bold700,
  required Color color,
  String fontFamily = FontConstants.fontFamily,
  double height = 1.2,
}) {
  return _getTextStyle(fontSize, fontFamily, fontWeight, color, height);
}

TextStyle getBold700Style28({
  double fontSize = FontSize.s28,
  FontWeight fontWeight = FontWeightManager.bold700,
  required Color color,
  String fontFamily = FontConstants.fontFamily,
  double height = 1.2,
}) {
  return _getTextStyle(fontSize, fontFamily, fontWeight, color, height);
}

TextStyle getBold700Style32({
  double fontSize = FontSize.s32,
  FontWeight fontWeight = FontWeightManager.bold700,
  required Color color,
  String fontFamily = FontConstants.fontFamily,
  double height = 1.2,
}) {
  return _getTextStyle(fontSize, fontFamily, fontWeight, color, height);
}

TextStyle getBold700Style40({
  double fontSize = FontSize.s40,
  FontWeight fontWeight = FontWeightManager.bold700,
  required Color color,
  String fontFamily = FontConstants.fontFamily,
  double height = 1.2,
}) {
  return _getTextStyle(fontSize, fontFamily, fontWeight, color, height);
}