import 'package:flutter/material.dart';

import 'configs/routes/app_router.dart';
import 'configs/themes/app_dark_theme.dart';
import 'features/ledger/presentation/page/ledger_page.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp(
        title: 'Ledger Dashboard Chart',
        debugShowCheckedModeBanner: false,
        themeMode: ThemeMode.dark,
        darkTheme: appDarkTheme,
        initialRoute: LedgerPage.routeName,
        onGenerateRoute: AppRouter.onGenerateRoute,
      );
}
