import '../config.dart';

enum DeviceScreenType { Mobile, Tablet, Desktop }
var config = Config();

extension Extension on DeviceScreenType {
  double get loginBoxSize {
    switch (this) {
      case DeviceScreenType.Desktop:
        return 525;
      case DeviceScreenType.Tablet:
        return 475;
      default:
        return 305;
    }
  }

  String get loginBackgroundImage {
    String url = '';
    switch (this) {
      case DeviceScreenType.Mobile:
        url = '${config.imagePath}/Login_mobile_bg.png';
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

  
}
