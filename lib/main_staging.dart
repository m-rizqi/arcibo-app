import 'package:arcibo/app.dart';
import 'package:arcibo/bootstrap.dart';
import 'package:arcibo/util/constant/env_enum.dart';

void main() async {
  await bootstrap(
    Env.staging,
    (isFirstLaunch) => App(
      isFirstLaunch: isFirstLaunch,
    ),
  );
}
