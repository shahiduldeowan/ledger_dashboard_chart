import 'package:flutter/material.dart';

import '../../features/ledger/presentation/page/ledger_page.dart';

class AppRouter {
  static Route? onGenerateRoute(RouteSettings settings) => switch (settings.name) {
        LedgerPage.routeName => _route(const LedgerPage()),
        _ => null,
      };

  static Route _route(Widget page) => MaterialPageRoute(builder: (_) => page);
}
