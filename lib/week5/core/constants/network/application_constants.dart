class ApplicationConstant {
  static ApplicationConstant? _instance;
  static ApplicationConstant get instance {
    if (_instance != null)
      return _instance!;
    else {
      _instance = ApplicationConstant._init();
      return _instance!;
    }
  }

  ApplicationConstant._init();

  final String baseUrl = 'https://jsonplaceholder.typicode.com/';
}
