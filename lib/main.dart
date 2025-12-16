import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loni_africa/config/theme/theme.dart';
import 'package:loni_africa/config/routes/app_routes.dart';
import 'package:loni_africa/config/theme/screen_size.dart';
import 'package:loni_africa/core/utilities/theme_service.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  final ThemeService _themeService = ThemeService();
  ThemeMode _themeMode = ThemeMode.system;

  @override
  void initState() {
    super.initState();
    _loadTheme();
  }

  Future<void> _loadTheme() async {
    final savedMode = await _themeService.getSavedThemeMode();
    if (!mounted) return;
    setState(() {
      _themeMode = savedMode;
    });
  }

  Future<void> _toggleTheme() async {
    final nextMode = _themeMode == ThemeMode.light
        ? ThemeMode.dark
        : ThemeMode.light;
    setState(() {
      _themeMode = nextMode;
    });
    await _themeService.saveThemeMode(nextMode);
  }

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
                return ThemeNotifier(
                  themeMode: _themeMode,
                  onToggle: _toggleTheme,
                  child: MaterialApp.router(
                    title: 'Loni',
                    theme: AppTheme.instance.lightTheme,
                    darkTheme: AppTheme.instance.darkTheme,
                    themeMode: _themeMode,
                    routerConfig: AppRoutes.router,
                    debugShowCheckedModeBanner: false,
                  ),
                );
              },
            );
          },
        );
      },
    );
  }
}

class ThemeNotifier extends InheritedWidget {
  const ThemeNotifier({
    super.key,
    required this.themeMode,
    required this.onToggle,
    required super.child,
  });

  final ThemeMode themeMode;
  final VoidCallback onToggle;

  static ThemeNotifier? maybeOf(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<ThemeNotifier>();
  }

  static ThemeNotifier of(BuildContext context) {
    final ThemeNotifier? result = maybeOf(context);
    assert(result != null, 'No ThemeNotifier found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(ThemeNotifier oldWidget) {
    return themeMode != oldWidget.themeMode;
  }
}
