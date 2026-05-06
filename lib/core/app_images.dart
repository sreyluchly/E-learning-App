import 'package:flutter/widgets.dart';

class AppImages {
  AppImages._();

  static const String _basePath = 'assets/images';

  // Path Constants
  static const String login = '$_basePath/login.png';
  static const String accountPf = '$_basePath/account_pf.png';
  static const String sreyluchIcon = '$_basePath/sreyluch_icon.png';
  static const String sreypinIcon = '$_basePath/sreypin_icon.png';
  static const String welcome1 = '$_basePath/welcome1.png';
  static const String welcome2 = '$_basePath/welcome2.png';
  static const String welcome3 = '$_basePath/welcome3.png';

  /// A single reusable method to build any image from this class.
  static Image build({
    required String asset,
    double? width,
    double? height,
    BoxFit fit = BoxFit.contain,
    Color? color,
  }) {
    return Image.asset(
      asset,
      width: width,
      height: height,
      fit: fit,
      color: color,
    );
  }
}