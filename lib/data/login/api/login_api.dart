// Package imports:
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

// Project imports:
import '../models/request/login_request.dart';
import '../models/response/login_response.dart';

// Project imports:

part 'login_api.g.dart';

@RestApi()
abstract class LoginApi {
  factory LoginApi(Dio dio, {String baseUrl}) = _LoginApi;

  @POST('/login')
  Future<LoginResponse> login(@Body() LoginRequest request);
}
