import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'configs/routes/app_router.dart';
import 'configs/themes/app_dark_theme.dart';
import 'core/di/dependencies_setup.dart';
import 'features/ledger/presentation/page/ledger_page.dart';
import 'features/overview/presentation/bloc/ledger_overview_bloc.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) => MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => getIt<LedgerOverviewBloc>()..add(const GetLedgerOverviewEvent())),
        ],
        child: MaterialApp(
          title: 'Ledger Dashboard Chart',
          debugShowCheckedModeBanner: false,
          themeMode: ThemeMode.dark,
          darkTheme: appDarkTheme,
          initialRoute: LedgerPage.routeName,
          onGenerateRoute: AppRouter.onGenerateRoute,
        ),
      );
}
