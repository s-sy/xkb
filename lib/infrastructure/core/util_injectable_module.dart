import 'package:flutter_ui/infrastructure/datasources/auth_remote_data_source.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';

@module
abstract class UtilInjectableModule {
  @preResolve
  Future<SharedPreferences> get prefs => SharedPreferences.getInstance();
  @lazySingleton
  http.Client get client => http.Client();
  @Named("baseSession")
  String apiBaseSession(BaseSessionProvider provider) => provider.baseSession();
}

@lazySingleton
class BaseSessionProvider {
  final SharedPreferences sharedPreferences;
  BaseSessionProvider({@required this.sharedPreferences});
  String baseSession() => sharedPreferences.getString(CACHED_SESSION_KEY);
}
