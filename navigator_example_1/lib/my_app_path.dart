class MyAppPath {
  final bool _isUnknown;
  final String _isDetail;

  MyAppPath.home()
      : _isDetail = null,
        _isUnknown = false;

  MyAppPath.unknown()
      : _isDetail = null,
        _isUnknown = true;

  MyAppPath.detail(String index)
      : _isDetail = index,
        _isUnknown = false;

  bool get isHomePage => _isDetail == null;

  bool get isUnknown => _isUnknown;

  bool get isDetailPage => _isDetail != null;

  int get id => int.tryParse(_isDetail);

  static MyAppPath parse(String url) {
    print('URL $url ');

    final uri = Uri.parse(url);

    if (uri.pathSegments.isEmpty) {
      return MyAppPath.home();
    }

    if (uri.pathSegments.length == 2 && uri.pathSegments.first == 'detail') {
      print('${uri.pathSegments.last}');
      return MyAppPath.detail(uri.pathSegments.last);
    }

    return MyAppPath.unknown();
  }
}
