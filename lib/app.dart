import 'package:flutter/material.dart';

import 'configs/routes/app_router.dart';
import 'features/ledger/presentation/page/ledger_page.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp(
        title: 'Ledger Dashboard Chart',
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        ),
        initialRoute: LedgerPage.routeName,
        onGenerateRoute: AppRouter.onGenerateRoute,
      );
}
