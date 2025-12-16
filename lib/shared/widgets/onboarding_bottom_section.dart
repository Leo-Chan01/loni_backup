import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loni_africa/shared/widgets/onboarding_page_indicator.dart';
import 'package:loni_africa/shared/widgets/primary_button.dart';
import 'package:loni_africa/shared/widgets/secondary_button.dart';

class OnboardingBottomSection extends StatelessWidget {
  const OnboardingBottomSection({
    super.key,
    required this.currentPage,
    required this.totalPages,
    required this.onNext,
    this.onSecondaryAction,
  });

  final int currentPage;
  final int totalPages;
  final Future<void> Function()? onNext;
  final VoidCallback? onSecondaryAction;

  @override
  Widget build(BuildContext context) {
    final isLastPage = currentPage == totalPages - 1;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h),
      child: Column(
        children: [
          OnboardingPageIndicator(
            currentPage: currentPage,
            totalPages: totalPages,
          ),
          SizedBox(height: 32.h),
          PrimaryButton(
            text: isLastPage ? 'Get Started' : 'Next',
            onPressed: onNext,
          ),
          if (isLastPage && onSecondaryAction != null) ...[
            SizedBox(height: 8.h),
            SecondaryButton(
              text: 'I already have an account',
              onPressed: onSecondaryAction,
            ),
          ],
        ],
      ),
    );
  }
}
