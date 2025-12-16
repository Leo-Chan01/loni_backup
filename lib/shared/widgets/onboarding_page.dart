import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loni_africa/shared/widgets/onboarding_content.dart';
import 'package:loni_africa/shared/widgets/onboarding_image_card.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({
    super.key,
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.icon,
  });

  final String title;
  final String description;
  final String imageUrl;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 24.h),
          OnboardingImageCard(
            imageUrl: imageUrl,
            icon: icon,
          ),
          SizedBox(height: 48.h),
          OnboardingContent(
            title: title,
            description: description,
          ),
        ],
      ),
    );
  }
}
