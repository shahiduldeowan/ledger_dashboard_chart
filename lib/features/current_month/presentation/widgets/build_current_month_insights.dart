import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/constants/app_sizes.dart';
import '../../../../core/constants/strings.dart';
import '../../../../core/utility/build_progress_indicator_widget.dart';
import '../../../../core/utility/date_format_service.dart';
import '../../domain/entity/current_month_entity.dart';
import '../bloc/ledger_current_month_bloc.dart';
import 'build_monthly_insight_item.dart';

class BuildCurrentMonthInsights extends StatelessWidget {
  const BuildCurrentMonthInsights({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LedgerCurrentMonthBloc, LedgerCurrentMonthState>(
      builder: (context, currentMonthState) => switch (currentMonthState) {
        LedgerCurrentMonthEmptyState() => const SizedBox(),
        LedgerCurrentMonthLoadedState(details: var details) => _buildMonthlyInsights(context, details!),
        _ => buildProgressIndicatorWidget(),
      },
    );
  }

  Card _buildMonthlyInsights(BuildContext context, List<LedgerCurrentMonthEntity> details) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(AppSizes.cardContentPadding),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _titleText(Strings.monthlyInsight),
                _titleText(DateTime.now().toGetMonthYearFormat),
              ],
            ),
          ),
          const Divider(),
          _buildMonthlyInsightList(details),
        ],
      ),
    );
  }

  Text _titleText(String title) {
    return Text(
      title,
      style: const TextStyle(
        fontWeight: FontWeight.w800,
      ),
      textScaler: const TextScaler.linear(1.5),
    );
  }

  ListView _buildMonthlyInsightList(List<LedgerCurrentMonthEntity> details) {
    return ListView.separated(
      shrinkWrap: true,
      primary: false,
      itemBuilder: (_, index) => BuildMonthlyInsightItem(
        item: details[index],
      ),
      separatorBuilder: (_, i) => const Divider(),
      itemCount: details.length,
    );
  }
}
