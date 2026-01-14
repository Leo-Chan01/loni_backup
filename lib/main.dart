import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:loni_africa/config/theme/theme.dart';
import 'package:loni_africa/config/routes/app_routes.dart';
import 'package:loni_africa/config/theme/screen_size.dart';
import 'package:loni_africa/core/utilities/theme_service.dart';
import 'package:loni_africa/core/utilities/language_service.dart';
import 'package:loni_africa/features/auth/data/repository/auth_repository_impl.dart';
import 'package:loni_africa/features/auth/data/repository/auth_account_repository_impl.dart';
import 'package:loni_africa/features/auth/domain/repository/auth_repository.dart';
import 'package:loni_africa/features/auth/domain/repository/auth_account_repository.dart';
import 'package:loni_africa/features/auth/presentation/provider/auth_provider.dart';
import 'package:loni_africa/features/auth/presentation/provider/auth_account_provider.dart';
import 'package:loni_africa/features/auth/domain/usecases/account/delete_auth_device_usecase.dart';
import 'package:loni_africa/features/auth/domain/usecases/account/get_auth_consents_usecase.dart';
import 'package:loni_africa/features/auth/domain/usecases/account/get_auth_preferences_usecase.dart';
import 'package:loni_africa/features/auth/domain/usecases/account/get_parental_controls_usecase.dart';
import 'package:loni_africa/features/auth/domain/usecases/account/list_auth_devices_usecase.dart';
import 'package:loni_africa/features/auth/domain/usecases/account/list_auth_purchases_usecase.dart';
import 'package:loni_africa/features/auth/domain/usecases/account/list_auth_sessions_usecase.dart';
import 'package:loni_africa/features/auth/domain/usecases/account/register_auth_device_usecase.dart';
import 'package:loni_africa/features/auth/domain/usecases/account/request_privacy_delete_usecase.dart';
import 'package:loni_africa/features/auth/domain/usecases/account/request_privacy_export_usecase.dart';
import 'package:loni_africa/features/auth/domain/usecases/account/revoke_auth_session_usecase.dart';
import 'package:loni_africa/features/auth/domain/usecases/account/update_auth_consents_usecase.dart';
import 'package:loni_africa/features/auth/domain/usecases/account/update_auth_preferences_usecase.dart';
import 'package:loni_africa/features/auth/domain/usecases/account/update_parental_controls_usecase.dart';
import 'package:loni_africa/features/profile/data/repository/profile_repository_impl.dart';
import 'package:loni_africa/features/profile/domain/repository/profile_repository.dart';
import 'package:loni_africa/features/profile/domain/usecases/get_profile_usecase.dart';
import 'package:loni_africa/features/profile/domain/usecases/update_profile_usecase.dart';
import 'package:loni_africa/features/profile/presentation/provider/profile_provider.dart';
import 'package:loni_africa/features/community/data/repository/notifications_repository_impl.dart';
import 'package:loni_africa/features/community/domain/repository/notifications_repository.dart';
import 'package:loni_africa/features/community/domain/usecases/list_notifications_usecase.dart';
import 'package:loni_africa/features/community/domain/usecases/mark_all_notifications_read_usecase.dart';
import 'package:loni_africa/features/community/domain/usecases/mark_notification_read_usecase.dart';
import 'package:loni_africa/features/community/presentation/provider/notifications_provider.dart';
import 'package:loni_africa/l10n/app_localizations.dart';
import 'package:loni_africa/shared/widgets/global_snackbar.dart';
import 'package:provider/provider.dart';

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
  final LanguageService _languageService = LanguageService();
  late final AuthRepository _authRepository;
  late final AuthAccountRepository _authAccountRepository;
  late final ProfileRepository _profileRepository;
  late final NotificationsRepository _notificationsRepository;
  ThemeMode _themeMode = ThemeMode.system;
  Locale? _locale;

  @override
  void initState() {
    super.initState();
    _authRepository = AuthRepositoryImpl();
    _authAccountRepository = AuthAccountRepositoryImpl();
    _profileRepository = ProfileRepositoryImpl();
    _notificationsRepository = NotificationsRepositoryImpl();
    _loadTheme();
    _loadLocale();
  }

  Future<void> _loadTheme() async {
    final savedMode = await _themeService.getSavedThemeMode();
    if (!mounted) return;
    setState(() {
      _themeMode = savedMode;
    });
  }

  Future<void> _loadLocale() async {
    final savedLocale = await _languageService.getSavedLocale();
    if (!mounted) return;
    setState(() {
      _locale = savedLocale;
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

  Future<void> _changeLocale(Locale locale) async {
    setState(() {
      _locale = locale;
    });
    await _languageService.saveLocale(locale);
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
                return LocaleNotifier(
                  locale: _locale,
                  onLocaleChange: _changeLocale,
                  child: ThemeNotifier(
                    themeMode: _themeMode,
                    onToggle: _toggleTheme,
                    child: MultiProvider(
                      providers: [
                        ChangeNotifierProvider<AuthProvider>(
                          create: (_) =>
                              AuthProvider(authRepository: _authRepository),
                        ),
                        ChangeNotifierProvider<AuthAccountProvider>(
                          create: (_) => AuthAccountProvider(
                            getPreferences: GetAuthPreferencesUseCase(
                              _authAccountRepository,
                            ),
                            updatePreferences: UpdateAuthPreferencesUseCase(
                              _authAccountRepository,
                            ),
                            getConsents: GetAuthConsentsUseCase(
                              _authAccountRepository,
                            ),
                            updateConsents: UpdateAuthConsentsUseCase(
                              _authAccountRepository,
                            ),
                            getParentalControls: GetParentalControlsUseCase(
                              _authAccountRepository,
                            ),
                            updateParentalControls:
                                UpdateParentalControlsUseCase(
                                  _authAccountRepository,
                                ),
                            listSessions: ListAuthSessionsUseCase(
                              _authAccountRepository,
                            ),
                            revokeSession: RevokeAuthSessionUseCase(
                              _authAccountRepository,
                            ),
                            listDevices: ListAuthDevicesUseCase(
                              _authAccountRepository,
                            ),
                            registerDevice: RegisterAuthDeviceUseCase(
                              _authAccountRepository,
                            ),
                            deleteDevice: DeleteAuthDeviceUseCase(
                              _authAccountRepository,
                            ),
                            listPurchases: ListAuthPurchasesUseCase(
                              _authAccountRepository,
                            ),
                            requestPrivacyExport: RequestPrivacyExportUseCase(
                              _authAccountRepository,
                            ),
                            requestPrivacyDelete: RequestPrivacyDeleteUseCase(
                              _authAccountRepository,
                            ),
                          ),
                        ),
                        ChangeNotifierProvider<ProfileProvider>(
                          create: (_) => ProfileProvider(
                            getProfile: GetProfileUseCase(_profileRepository),
                            updateProfile: UpdateProfileUseCase(
                              _profileRepository,
                            ),
                          ),
                        ),
                        ChangeNotifierProvider<NotificationsProvider>(
                          create: (_) => NotificationsProvider(
                            listNotifications: ListNotificationsUseCase(
                              _notificationsRepository,
                            ),
                            markNotificationRead: MarkNotificationReadUseCase(
                              _notificationsRepository,
                            ),
                            markAllNotificationsRead:
                                MarkAllNotificationsReadUseCase(
                                  _notificationsRepository,
                                ),
                          ),
                        ),
                      ],
                      child: MaterialApp.router(
                        title: 'Loni',
                        theme: AppTheme.instance.lightTheme,
                        darkTheme: AppTheme.instance.darkTheme,
                        themeMode: _themeMode,
                        locale: _locale,
                        routerConfig: AppRoutes.router,
                        scaffoldMessengerKey:
                            GlobalSnackBar.scaffoldMessengerKey,
                        debugShowCheckedModeBanner: false,
                        localizationsDelegates: const [
                          AppLocalizations.delegate,
                          GlobalMaterialLocalizations.delegate,
                          GlobalWidgetsLocalizations.delegate,
                          GlobalCupertinoLocalizations.delegate,
                        ],
                        supportedLocales: const [
                          Locale('en'), // English
                          Locale('fr'), // French
                          Locale('es'), // Spanish
                        ],
                      ),
                    ),
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

class LocaleNotifier extends InheritedWidget {
  const LocaleNotifier({
    super.key,
    required this.locale,
    required this.onLocaleChange,
    required super.child,
  });

  final Locale? locale;
  final Function(Locale) onLocaleChange;

  static LocaleNotifier? maybeOf(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<LocaleNotifier>();
  }

  static LocaleNotifier of(BuildContext context) {
    final LocaleNotifier? result = maybeOf(context);
    assert(result != null, 'No LocaleNotifier found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(LocaleNotifier oldWidget) {
    return locale != oldWidget.locale;
  }
}
