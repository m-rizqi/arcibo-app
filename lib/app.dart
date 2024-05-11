import 'package:arcibo/presentation/home/view/home_page.dart';
import 'package:arcibo/util/config/theme.dart';
import 'package:arcibo/util/l10n/l10n.dart';
import 'package:arcibo/util/route/route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class App extends StatelessWidget {
  const App({
    super.key,
    this.isFirstLaunch = false,
  });

  final bool isFirstLaunch;

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      minTextAdapt: true,
      useInheritedMediaQuery: true,
      builder: (context, child) {
        return MaterialApp(
          locale: const Locale('in', 'ID'),
          theme: lightTheme,
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          navigatorObservers: [routeObserver],
          onGenerateRoute: AppNavigator.onGenerateRoute,
          initialRoute: HomePage.routeName,
        );
      },
    );
  }
}
