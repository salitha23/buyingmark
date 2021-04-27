import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flyweb/i18n/AppLanguage.dart';
import 'package:flyweb/i18n/i18n.dart';
import 'package:flyweb/src/enum/connectivity_status.dart';
import 'package:flyweb/src/helpers/ConnectivityService.dart';
import 'package:flyweb/src/pages/SplashScreen.dart';
import 'package:flyweb/src/services/theme_manager.dart';
import 'package:global_configuration/global_configuration.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GlobalConfiguration().loadFromAsset("configuration");
  AppLanguage appLanguage = AppLanguage();
  await appLanguage.fetchLocale();

  /*  For Enable WebRTC (Remove this comment)
  await Permission.camera.request();
  await Permission.microphone.request();
  */

  return runApp(ChangeNotifierProvider<ThemeNotifier>(
    create: (_) => new ThemeNotifier(),
    child: MyApp(
      appLanguage: appLanguage,
    ),
  ));
}

class MyApp extends StatelessWidget {
  final AppLanguage appLanguage;

  MyApp({this.appLanguage});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<AppLanguage>(
      create: (_) => appLanguage,
      child: Consumer<AppLanguage>(builder: (context, model, child) {
        return StreamProvider<ConnectivityStatus>(
            create: (context) =>
            ConnectivityService().connectionStatusController.stream,
            child:Consumer<ThemeNotifier>(
            builder: (context, theme, _) => MaterialApp(
                theme: theme.getTheme(),
                locale: model.appLocal,
                localizationsDelegates: [
                  I18n.delegate,
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                ],
                supportedLocales: I18n.delegate.supportedLocales,
                debugShowCheckedModeBanner: false,
                home: SplashScreen())));
      }),
    );
  }
}




