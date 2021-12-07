class AppAsset {
  static final logo = 'assets/images/logo.png';
  static final logo2 = 'assets/images/logo_2.png';
  static final logo3 = 'assets/images/logo_3.png';
  static final logo4 = 'assets/images/logo_4.png';

  static final AppAsset _instance = AppAsset._internal();

  factory AppAsset() {
    return _instance;
  }

  AppAsset._internal();
}
