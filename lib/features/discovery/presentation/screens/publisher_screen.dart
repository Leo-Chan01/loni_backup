import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:loni_africa/core/utilities/localization_extension.dart';
import 'package:loni_africa/features/discovery/data/services/discovery_service.dart';
import 'package:loni_africa/features/discovery/domain/models/book_item.dart';
import 'package:loni_africa/features/discovery/presentation/controllers/discovery_controller.dart';
import 'package:loni_africa/shared/widgets/new_release_tile.dart';
import 'package:loni_africa/shared/widgets/texture_overlay.dart';

class PublisherScreen extends StatefulWidget {
  const PublisherScreen({super.key, this.publisherId});

  static const String path = 'publisher';
  static const String name = 'PublisherScreen';

  final String? publisherId;

  @override
  State<PublisherScreen> createState() => _PublisherScreenState();
}

class _PublisherScreenState extends State<PublisherScreen> {
  late final DiscoveryController _discovery;
  List<BookItem> _releases = const [];

  @override
  void initState() {
    super.initState();
    _discovery = DiscoveryController(DiscoveryService());
    _loadReleases();
  }

  Future<void> _loadReleases() async {
    final releases = await _discovery.newReleases();
    if (!mounted) return;
    setState(() {
      _releases = releases.take(3).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: colorScheme.surface,
      body: Stack(
        children: [
          const TextureOverlay(),
          SafeArea(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 20.w,
                    vertical: 16.h,
                  ),
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () => Navigator.of(context).pop(),
                        child: HugeIcon(
                          icon: HugeIcons.strokeRoundedArrowLeft01,
                          color: colorScheme.onSurface,
                          size: 24.sp,
                        ),
                      ),
                      SizedBox(width: 12.w),
                      Expanded(
                        child: Text(
                          context.l10n.publisher,
                          style: Theme.of(context).textTheme.headlineSmall
                              ?.copyWith(
                                fontWeight: FontWeight.bold,
                                color: colorScheme.onSurface,
                              ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Container(
                              width: 80.w,
                              height: 80.h,
                              decoration: BoxDecoration(
                                color: colorScheme.primary.withValues(
                                  alpha: 0.1,
                                ),
                                borderRadius: BorderRadius.circular(16.r),
                                border: Border.all(
                                  color: colorScheme.primary.withValues(
                                    alpha: 0.3,
                                  ),
                                  width: 1,
                                ),
                              ),
                              child: HugeIcon(
                                icon: HugeIcons.strokeRoundedBuilding03,
                                color: colorScheme.primary,
                                size: 32.sp,
                              ),
                            ),
                            SizedBox(width: 16.w),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Heinemann',
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineSmall
                                        ?.copyWith(
                                          fontWeight: FontWeight.bold,
                                          color: colorScheme.onSurface,
                                        ),
                                  ),
                                  SizedBox(height: 4.h),
                                  Text(
                                    context.l10n.africanWritersSeries,
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium
                                        ?.copyWith(
                                          color: colorScheme.onSurfaceVariant,
                                        ),
                                  ),
                                  SizedBox(height: 12.h),
                                  Row(
                                    children: [
                                      _StatColumn(
                                        value: '340',
                                        label: context.l10n.books,
                                      ),
                                      SizedBox(width: 16.w),
                                      _StatColumn(
                                        value: '120',
                                        label: context.l10n.authors,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 20.h),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton.icon(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: colorScheme.primary,
                              foregroundColor: colorScheme.onPrimary,
                              padding: EdgeInsets.symmetric(vertical: 14.h),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12.r),
                              ),
                            ),
                            icon: HugeIcon(
                              icon: HugeIcons.strokeRoundedAdd01,
                              size: 18.sp,
                            ),
                            label: Text(
                              context.l10n.followPublisher,
                              style: Theme.of(context).textTheme.titleSmall
                                  ?.copyWith(
                                    fontWeight: FontWeight.w600,
                                    color: colorScheme.onPrimary,
                                  ),
                            ),
                          ),
                        ),
                        SizedBox(height: 20.h),
                        Container(
                          padding: EdgeInsets.all(16.w),
                          decoration: BoxDecoration(
                            color: colorScheme.surfaceContainerHighest,
                            borderRadius: BorderRadius.circular(16.r),
                            border: Border.all(
                              color: colorScheme.outline.withValues(
                                alpha: 0.15,
                              ),
                              width: 1,
                            ),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                context.l10n.about,
                                style: Theme.of(context).textTheme.titleMedium
                                    ?.copyWith(
                                      fontWeight: FontWeight.bold,
                                      color: colorScheme.onSurface,
                                    ),
                              ),
                              SizedBox(height: 12.h),
                              Text(
                                "Heinemann's African Writers Series has been publishing African literature since 1962, bringing the works of Africa's finest writers to a worldwide audience. The series has published over 350 titles.",
                                style: Theme.of(context).textTheme.bodyMedium
                                    ?.copyWith(
                                      color: colorScheme.onSurfaceVariant,
                                      height: 1.5,
                                    ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 24.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              context.l10n.latestReleases,
                              style: Theme.of(context).textTheme.titleLarge
                                  ?.copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: colorScheme.onSurface,
                                  ),
                            ),
                            Text(
                              context.l10n.seeAll,
                              style: Theme.of(context).textTheme.bodyMedium
                                  ?.copyWith(
                                    color: colorScheme.primary,
                                    fontWeight: FontWeight.w600,
                                  ),
                            ),
                          ],
                        ),
                        SizedBox(height: 16.h),
                        ListView.separated(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: _releases.length,
                          separatorBuilder: (context, index) =>
                              SizedBox(height: 12.h),
                          itemBuilder: (context, index) {
                            final book = _releases[index];
                            return NewReleaseTile(
                              title: book.title,
                              author: book.author,
                              priceLabel: book.priceLabel ?? '\$9.99',
                              onTap: () {},
                              onAdd: () {},
                            );
                          },
                        ),
                        SizedBox(height: 24.h),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _StatColumn extends StatelessWidget {
  const _StatColumn({required this.value, required this.label});

  final String value;
  final String label;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          value,
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.bold,
            color: colorScheme.onSurface,
          ),
        ),
        Text(
          label,
          style: Theme.of(
            context,
          ).textTheme.labelSmall?.copyWith(color: colorScheme.onSurfaceVariant),
        ),
      ],
    );
  }
}
