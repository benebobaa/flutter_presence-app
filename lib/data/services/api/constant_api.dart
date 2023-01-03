class ConstantApi {
  ConstantApi._();

  /// Base Url
  static const String baseUrl = 'https://mhsmobile.amikom.ac.id/';

  /// Receive Timeout
  static const int receiveTimeout = 50000;

  /// Conection Timeout
  static const int connectionTimeout = 50000;

  /// Endpoints
  static const String authEndpoint = 'login';
  static const String matkulEndpoint = '/api/personal/init_data_mhs';

  ///headers
  static const String userAgent = '@m!k0mXv=#neMob!le';
}
