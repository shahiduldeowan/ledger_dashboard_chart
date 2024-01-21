import 'package:flutter/material.dart';

import '../../../../core/constants/app_sizes.dart';
import '../../domain/entity/ledger_overview_entity.dart';
import 'build_remain_chart_indicator.dart';

class BuildOverviewChart extends StatelessWidget {
  const BuildOverviewChart({super.key, required this.overviewBalance});

  final LedgerOverviewEntity overviewBalance;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 16 / 9,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(AppSizes.cardContentPadding),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Spacer(
                flex: 2,
              ),
              BuildRemainChartIndicator(overviewBalance: overviewBalance)
            ],
          ),
        ),
      ),
    );
  }
}
