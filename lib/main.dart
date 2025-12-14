import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loni_africa/config/theme/theme.dart';
import 'package:loni_africa/config/routes/app_routes.dart';
import 'package:loni_africa/config/theme/screen_size.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return OrientationBuilder(
          builder: (context, orientation) {
            return ScreenUtilInit(
              designSize: DesignSizeConfig().designSize(
                orientation: Orientation.portrait,
                constraints: constraints,
              ),
              minTextAdapt: true,
              useInheritedMediaQuery: true,
              ensureScreenSize: true,
              rebuildFactor: (old, data) => true,
              builder: (context, child) {
                return MaterialApp.router(
                  title: 'Ahiaoma',
                  theme: AppTheme.instance.lightTheme,
                  routerConfig: AppRoutes.router,
                  debugShowCheckedModeBanner: false,
                );
              },
            );
          },
        );
      },
    );
  }
}
