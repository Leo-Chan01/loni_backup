import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loni_africa/core/utilities/localization_extension.dart';
import 'package:loni_africa/features/reading/domain/models/storage_model.dart';

class StorageOverviewCard extends StatelessWidget {
  final StorageModel storage;
  final VoidCallback onManage;

  const StorageOverviewCard({
    super.key,
    required this.storage,
    required this.onManage,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Container(
      decoration: BoxDecoration(
        color: colorScheme.surface,
        border: Border.all(color: colorScheme.outline.withValues(alpha: 0.2)),
        borderRadius: BorderRadius.circular(16.r),
      ),
      padding: EdgeInsets.all(24.w),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    context.l10n.storageUsed,
                    style: textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: colorScheme.onSurface,
                    ),
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    '${context.l10n.gbOf(storage.usedGB.toStringAsFixed(1), storage.totalGB.toInt().toString())} GB',
                    style: textTheme.bodySmall?.copyWith(
                      color: colorScheme.onSurfaceVariant,
                    ),
                  ),
                ],
              ),
              Text(
                '${storage.percentUsed.toInt()}%',
                style: textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: colorScheme.onSurface,
                ),
              ),
            ],
          ),
          SizedBox(height: 20.h),
          Container(
            height: 16.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.r),
              gradient: LinearGradient(
                colors: [colorScheme.primary, const Color(0xFFC46A3A)],
              ),
            ),
            child: FractionallySizedBox(
              alignment: Alignment.centerLeft,
              widthFactor: storage.percentUsed / 100,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.r),
                  gradient: LinearGradient(
                    colors: [colorScheme.primary, const Color(0xFFC46A3A)],
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 16.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                context.l10n.available(
                  '${storage.availableGB.toStringAsFixed(1)} GB',
                ),
                style: textTheme.bodySmall?.copyWith(
                  color: colorScheme.onSurfaceVariant,
                ),
              ),
              GestureDetector(
                onTap: onManage,
                child: Text(
                  context.l10n.manage,
                  style: textTheme.bodySmall?.copyWith(
                    color: colorScheme.primary,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
