class ApiConfig {
  static const String baseUrl = 'https://loni.kouakoudomagni.com/v1';
  // Increased timeout to 120 seconds for slow server responses
  static const Duration requestTimeout = Duration(seconds: 120);
}
