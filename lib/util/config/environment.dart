import 'package:arcibo/util/constant/env_enum.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

final Environment environment = Environment.instance;

class Environment {
  Environment._internal();

  static final Environment _instance = Environment._internal();

  static Environment get instance => _instance;

  //#region CORE
  Env? env;

  static String get hostUrl => dotenv.env['HOST_URL'] ?? 'HOST URL not configured';

  static String get apiUrl => dotenv.env['API_URL'] ?? 'API URL not configured';

  static String get appT => dotenv.env['APP_TITLE'] ?? 'APP TITLE not configured';

  //#endregion CORE

  //#region INIT CONFIG
  Future<void> initConfig(Env env) async {
    try {
      this.env = env;
      await dotenv.load(fileName: '.env.${env.name}');
    } catch (_) {
      await dotenv.load(fileName: '.env.example');
    }
  }
//#endregion INIT CONFIG
}
