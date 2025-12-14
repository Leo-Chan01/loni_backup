import 'package:flutter/material.dart';
import 'package:loni_africa/config/theme/color.dart';
import 'package:loni_africa/core/utilities/extension/num_extension.dart';

greetUserAccordingToTimeofDay() {
  var hour = DateTime.now().hour;
  if (hour < 12) {
    return 'Good Morning';
  }
  if (hour < 17) {
    return 'Good Afternoon';
  }
  return 'Good Evening';
}

Row buildNameAndGreetingWidget(BuildContext context, String userName) {
  return Row(
    children: [
      Icon(
        greetUserAccordingToTimeofDay() == 'Good Morning'
            ? Icons.wb_sunny
            : greetUserAccordingToTimeofDay() == 'Good Afternoon'
            ? Icons.wb_cloudy
            : Icons.nights_stay,
        color: greetUserAccordingToTimeofDay() == 'Good Morning'
            ? Colors.greenAccent
            : greetUserAccordingToTimeofDay() == 'Good Afternoon'
            ? Colors.orange
            : Colors.green,
      ),
      const SizedBox(width: 8),
      Expanded(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              greetUserAccordingToTimeofDay(),
              style: 14.w400.copyWith(color: AppColor.black),
            ),
            Text(
              userName,
              style: 16.w700.copyWith(color: AppColor.black),
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    ],
  );
}
