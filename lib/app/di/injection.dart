part of app_layer;

GetIt getIt = GetIt.instance;

Future setupInjection() async {
  await _registerAppComponents();
  await _registerNetworkComponents();
  _registerRepository();
}

Future _registerAppComponents() async {
  final SharedPreferencesManager? sharePreferences =
      await SharedPreferencesManager.getInstance();
  getIt.registerSingleton<SharedPreferencesManager>(sharePreferences!);

  final appTheme = ThemeManager();
  getIt.registerLazySingleton(() => appTheme);
}

Future<void> _registerNetworkComponents() async {
  final dio = Dio(
    BaseOptions(
      baseUrl: ConfigManager.getInstance()!.apiBaseUrl,
      connectTimeout: 10000,
    ),
  );

  dio.interceptors.addAll(
    [
      PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseHeader: true,
        responseBody: true,
      ),
    ],
  );
  getIt.registerSingleton(dio);

  getIt.registerLazySingleton(
    (() => LoginApi(dio, baseUrl: '${dio.options.baseUrl}user/')),
  );
}

void _registerRepository() {
  getIt.registerLazySingleton<LoginRepository>(
    () => LoginRepositoryImpl(getIt<LoginApi>()),
  );
}
