import 'package:flutter/material.dart';

import '../../../../core/constants/app_sizes.dart';
import '../../domain/entity/ledger_overview_entity.dart';

class BuildOverviewChart extends StatelessWidget {
  const BuildOverviewChart({super.key, required this.overview});

  final LedgerOverviewEntity overview;

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
              Expanded(
                child: Center(
                  child: FractionallySizedBox(
                    heightFactor: 0.65,
                    widthFactor: 1,
                    child: CircularProgressIndicator(
                      value: overview.getRemainWithPercent,
                      strokeCap: StrokeCap.round,
                      strokeWidth: 8,
                      backgroundColor: Colors.white12,
                      color: null,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
