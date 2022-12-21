import 'package:arabee_voice_recorder/core/dependency_injection/injection_container.dart';
import 'package:arabee_voice_recorder/core/utils/constants/constants.dart';
import 'package:arabee_voice_recorder/core/utils/constants/shared_keys.dart';
import 'package:arabee_voice_recorder/core/utils/general/app_screens.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'core/localizations/L10n.dart';
import 'core/localizations/LocalProvider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey();

class App extends StatefulWidget {
  static void changeLocal(BuildContext context) {
    _AppState? state = context.findAncestorStateOfType();

    WidgetsBinding.instance!.addPostFrameCallback(
      (_) => state!.changeLocal(),
    );
  }

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  final prefs = getIt<SharedPreferences>();
  Locale? locale;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  changeLocal() {
    setState(() {
      locale = Locale(prefs.getString(SharedPreferencesKeys.appLanguage) ??
          defaultLanguage);
    });
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (BuildContext context) => LocaleProvider(),
        builder: (context, child) {
          final provider = Provider.of<LocaleProvider>(context);
          return MaterialApp(
            theme: ThemeData(fontFamily: "Dubai"),
            debugShowCheckedModeBanner: false,
            builder: (context, child) {
              return child!;
            },
            initialRoute: AppScreens.onBoardingPage,
            onGenerateRoute: ScreenGenerator.onGenerate,
            locale: provider.locale,
            supportedLocales: L10n.all,
            localizationsDelegates: const [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate
            ],
          );
        });
  }
}
