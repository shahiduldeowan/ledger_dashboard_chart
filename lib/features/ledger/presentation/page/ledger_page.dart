import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../../../core/constants/app_sizes.dart';
import '../../../../core/constants/strings.dart';
import '../../../../core/utility/build_progress_indicator_widget.dart';
import '../../../current_month/presentation/bloc/ledger_current_month_bloc.dart';
import '../../../overview/domain/entity/ledger_overview_entity.dart';
import '../../../overview/presentation/bloc/ledger_overview_bloc.dart';
import '../../../overview/presentation/widgets/build_overview_chart_widget.dart';

class LedgerPage extends HookWidget {
  const LedgerPage({super.key});

  static const String routeName = '/';

  @override
  Widget build(BuildContext context) {
    final isDataLoaded = useState(false);
    void setDataLoaded() => isDataLoaded.value = true;

    return Scaffold(
      appBar: _buildAppBar(isDataLoaded),
      body: BlocConsumer<LedgerOverviewBloc, LedgerOverviewState>(
        listener: (context, overviewListenerState) {
          if (overviewListenerState is LedgerOverviewLoadedState) setDataLoaded();
        },
        builder: (context, overviewState) => switch (overviewState) {
          LedgerOverviewFailedState() => _buildEmptyWidget(),
          LedgerOverviewLoadedState(overviewBalance: var overviewBalance) => _buildScaffoldBody(context, overviewBalance!),
          _ => buildProgressIndicatorWidget(),
        },
      ),
    );
  }

  AppBar? _buildAppBar(ValueNotifier<bool> isDataLoaded) {
    if (!isDataLoaded.value) return null;

    return AppBar(
      title: const Text(Strings.ledgerDashboardTitle),
    );
  }

  Center _buildEmptyWidget() => Center(
        child: Icon(
          CupertinoIcons.exclamationmark_octagon,
          color: Colors.grey.shade300,
        ),
      );

  RefreshIndicator _buildScaffoldBody(BuildContext context, LedgerOverviewEntity overviewBalance) {
    return RefreshIndicator.adaptive(
      onRefresh: () => _refreshHandler(context),
      child: ListView(
        padding: const EdgeInsets.all(AppSizes.padding),
        children: [
          BuildOverviewChart(overviewBalance: overviewBalance),
        ],
      ),
    );
  }

  Future<void> _refreshHandler(BuildContext context) {
    context.read<LedgerOverviewBloc>().add(const GetLedgerOverviewEvent());
    context.read<LedgerCurrentMonthBloc>().add(const GetLedgerCurrentMonthEvent());
    return Future.delayed(const Duration(milliseconds: 3000));
  }
}
