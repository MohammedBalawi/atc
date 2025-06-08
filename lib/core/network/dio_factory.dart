import 'package:act_hub_mobile/config/constants.dart';
import 'package:act_hub_mobile/config/dependency_injection.dart';
import 'package:act_hub_mobile/core/storage/local/app_settings_prefs.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioFactory {
  final AppSettingsPrefs _appPreferences = instance<AppSettingsPrefs>();

  Future<Dio> getDio() async {
    Dio dio = Dio();
    Map<String, String> headers = {
      Constants.authorization: getAuthorization(_appPreferences.getToken()),
      Constants.acceptLanguage: _appPreferences.getLocale(),
      Constants.accept: Constants.applicationJson,
      Constants.contentType: Constants.applicationJson,
    };

    dio.options = BaseOptions(
      baseUrl: Constants.baseUrl,
      headers: headers,
      receiveTimeout: Duration(
        seconds: Constants.sendTimeOutDuration,
      ),
      sendTimeout: Duration(
        seconds: Constants.receiveTimeOutDuration,
      ),
    );

    InterceptorsWrapper authInterceptor = InterceptorsWrapper(
      onRequest:
          (RequestOptions options, RequestInterceptorHandler handler) async {
        options.headers[Constants.authorization] = getAuthorization(
          _appPreferences.getToken(),
        );
        return handler.next(options);
      },
    );
    dio.interceptors.add(authInterceptor);

    if (!kReleaseMode) {
      dio.interceptors.add(
        PrettyDioLogger(
          requestBody: true,
          requestHeader: true,
          responseBody: true,
          responseHeader: true,
        ),
      );
    }
    return dio;
  }

  String getAuthorization(String token) {
    return '${Constants.bearer} $token';
  }
}
