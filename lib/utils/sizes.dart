
import 'package:aviatorpredict/utils/size-config.dart';

double widthSize(double value) {
  double size = value / 4.14;
  return size * SizeConfig.widthMultiplier;
}

double heightSize(double value) {
  double size = value / 8.96;
  return size * SizeConfig.heightMultiplier;
}

double fontSize(double value) {
  double size = value / 8.96;
  return size * SizeConfig.textMultiplier;
}

// This below is to cut down the length of Text characters
String truncate(String text, {required int length}) {
  String omission = "....";
  if (text.length > length) {
    return text.replaceRange(length, text.length, omission);
  }
  return text;
}
