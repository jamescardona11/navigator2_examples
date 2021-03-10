class MyAppPath {
  final bool _isHome;
  final bool _isUnknown;

  MyAppPath.home()
      : _isHome = true,
        _isUnknown = false;
  MyAppPath.unknown()
      : _isHome = false,
        _isUnknown = true;

  bool get isHomePage => _isHome;
  bool get isUnknown => _isUnknown;
}
