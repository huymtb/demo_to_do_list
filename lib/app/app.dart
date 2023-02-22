import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:todo/app/app_store.dart';
import 'package:todo/generated/l10n.dart';
import 'package:todo/router/router.dart';
import 'package:todo/theme/app_themes.dart';
import 'package:todo/utils/size_config.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<AppStore>(create: (_) => AppStore()),
      ],
      child: MaterialApp.router(
        localizationsDelegates: const [
          S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate
        ],
        supportedLocales: S.delegate.supportedLocales,
        debugShowCheckedModeBanner: false,
        title: 'Todo List',
        routerDelegate: router.routerDelegate,
        routeInformationParser: router.routeInformationParser,
        routeInformationProvider: router.routeInformationProvider,
        theme: AppThemes.lightTheme,
        builder: (context, child) {
          SizeConfig().init(context);
          return MediaQuery(
            data: MediaQuery.of(context)
                .copyWith(textScaleFactor: SizeConfig.scaleFactor),
            child: child ?? const SizedBox(),
          );
        },
      ),
    );
  }
}
