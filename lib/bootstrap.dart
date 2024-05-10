import 'dart:async';
import 'dart:developer';

import 'package:arcibo/util/config/environment.dart';
import 'package:arcibo/util/constant/env_enum.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

class AppBlocObserver extends BlocObserver {
  const AppBlocObserver();

  @override
  void onChange(BlocBase<dynamic> bloc, Change<dynamic> change) {
    super.onChange(bloc, change);
    log('onChange(${bloc.runtimeType}, $change)');
  }

  @override
  void onError(BlocBase<dynamic> bloc, Object error, StackTrace stackTrace) {
    log('onError(${bloc.runtimeType}, $error, $stackTrace)');
    super.onError(bloc, error, stackTrace);
  }
}

Future<void> bootstrap(
  Env env,
  FutureOr<Widget> Function(
    bool isFirstLaunch,
  ) builder,
) async {
  FlutterError.onError = (details) {
    log(details.exceptionAsString(), stackTrace: details.stack);
  };

  Bloc.observer = const AppBlocObserver();

  await initConfig(env);

  // TODO(Rizqi): get hive key
  const isFirstLaunch = false;

  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    await builder(
      isFirstLaunch,
    ),
  );
}

Future<void> initConfig(Env env) async {
  await environment.initConfig(env);

}
