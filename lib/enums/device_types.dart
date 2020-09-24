import '../config.dart';

enum DeviceScreenType { Mobile, Tablet, Desktop }
var config = Config();

extension Extension on DeviceScreenType {
  double get loginBoxSize {
    switch (this) {
      case DeviceScreenType.Desktop:
        return 430;
      case DeviceScreenType.Tablet:
        return 400;
      default:
        return 305;
    }
  }

  String get loginBackgroundImage {
    String url = '';
    switch (this) {
      case DeviceScreenType.Mobile:
        url = 'assets/images/Login_mobile_bg.png';
        break;
      case DeviceScreenType.Tablet:
        url = '${config.imagePath}/Login_tab_bg.png';
        break;
      default:
        url = '${config.imagePath}/Login_web_bg.png';
        break;
    }
    return url;
  }

  double get imageWidth {
    double width = 0.0;
    switch (this) {
      case DeviceScreenType.Mobile:
        width = 150.0;
        break;
      case DeviceScreenType.Tablet:
        width = 180.0;
        break;
      default:
        width = 250;
        break;
    }
    return width;
  }
}
