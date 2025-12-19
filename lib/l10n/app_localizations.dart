import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_es.dart';
import 'app_localizations_fr.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('es'),
    Locale('fr'),
  ];

  /// No description provided for @signIn.
  ///
  /// In en, this message translates to:
  /// **'Sign In'**
  String get signIn;

  /// No description provided for @signUp.
  ///
  /// In en, this message translates to:
  /// **'Sign Up'**
  String get signUp;

  /// No description provided for @welcomeBack.
  ///
  /// In en, this message translates to:
  /// **'Welcome Back'**
  String get welcomeBack;

  /// No description provided for @createAccount.
  ///
  /// In en, this message translates to:
  /// **'Create Account'**
  String get createAccount;

  /// No description provided for @enterEmail.
  ///
  /// In en, this message translates to:
  /// **'Enter your email'**
  String get enterEmail;

  /// No description provided for @enterPassword.
  ///
  /// In en, this message translates to:
  /// **'Enter your password'**
  String get enterPassword;

  /// No description provided for @enterName.
  ///
  /// In en, this message translates to:
  /// **'Enter your name'**
  String get enterName;

  /// No description provided for @forgotPassword.
  ///
  /// In en, this message translates to:
  /// **'Forgot Password?'**
  String get forgotPassword;

  /// No description provided for @dontHaveAccount.
  ///
  /// In en, this message translates to:
  /// **'Don\'t have an account?'**
  String get dontHaveAccount;

  /// No description provided for @alreadyHaveAccount.
  ///
  /// In en, this message translates to:
  /// **'Already have an account?'**
  String get alreadyHaveAccount;

  /// No description provided for @orContinueWith.
  ///
  /// In en, this message translates to:
  /// **'Or continue with'**
  String get orContinueWith;

  /// No description provided for @google.
  ///
  /// In en, this message translates to:
  /// **'Google'**
  String get google;

  /// No description provided for @apple.
  ///
  /// In en, this message translates to:
  /// **'Apple'**
  String get apple;

  /// No description provided for @emailLabel.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get emailLabel;

  /// No description provided for @passwordLabel.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get passwordLabel;

  /// No description provided for @nameLabel.
  ///
  /// In en, this message translates to:
  /// **'Full Name'**
  String get nameLabel;

  /// No description provided for @phoneLabel.
  ///
  /// In en, this message translates to:
  /// **'Phone Number'**
  String get phoneLabel;

  /// No description provided for @verifyPhone.
  ///
  /// In en, this message translates to:
  /// **'Verify Phone'**
  String get verifyPhone;

  /// No description provided for @enterOtp.
  ///
  /// In en, this message translates to:
  /// **'Enter the code we sent to'**
  String get enterOtp;

  /// No description provided for @didntReceiveCode.
  ///
  /// In en, this message translates to:
  /// **'Didn\'t receive code?'**
  String get didntReceiveCode;

  /// No description provided for @verifyYourAccount.
  ///
  /// In en, this message translates to:
  /// **'Verify Your Account'**
  String get verifyYourAccount;

  /// No description provided for @enterSixDigitCode.
  ///
  /// In en, this message translates to:
  /// **'Enter the 6-digit code sent to'**
  String get enterSixDigitCode;

  /// No description provided for @verifyAndContinue.
  ///
  /// In en, this message translates to:
  /// **'Verify & Continue'**
  String get verifyAndContinue;

  /// No description provided for @resend.
  ///
  /// In en, this message translates to:
  /// **'Resend'**
  String get resend;

  /// No description provided for @verify.
  ///
  /// In en, this message translates to:
  /// **'Verify'**
  String get verify;

  /// No description provided for @continueButton.
  ///
  /// In en, this message translates to:
  /// **'Continue'**
  String get continueButton;

  /// No description provided for @onboardingTitle1.
  ///
  /// In en, this message translates to:
  /// **'Discover African Literature'**
  String get onboardingTitle1;

  /// No description provided for @onboardingDesc1.
  ///
  /// In en, this message translates to:
  /// **'Explore thousands of books from African authors and publishers'**
  String get onboardingDesc1;

  /// No description provided for @onboardingTitle2.
  ///
  /// In en, this message translates to:
  /// **'Read Anywhere, Anytime'**
  String get onboardingTitle2;

  /// No description provided for @onboardingDesc2.
  ///
  /// In en, this message translates to:
  /// **'Download books and read offline on all your devices'**
  String get onboardingDesc2;

  /// No description provided for @onboardingTitle3.
  ///
  /// In en, this message translates to:
  /// **'Support African Authors'**
  String get onboardingTitle3;

  /// No description provided for @onboardingDesc3.
  ///
  /// In en, this message translates to:
  /// **'Your purchases directly support writers and the literary community'**
  String get onboardingDesc3;

  /// No description provided for @skip.
  ///
  /// In en, this message translates to:
  /// **'Skip'**
  String get skip;

  /// No description provided for @next.
  ///
  /// In en, this message translates to:
  /// **'Next'**
  String get next;

  /// No description provided for @getStarted.
  ///
  /// In en, this message translates to:
  /// **'Get Started'**
  String get getStarted;

  /// No description provided for @goodMorning.
  ///
  /// In en, this message translates to:
  /// **'Good morning'**
  String get goodMorning;

  /// No description provided for @goodAfternoon.
  ///
  /// In en, this message translates to:
  /// **'Good afternoon'**
  String get goodAfternoon;

  /// No description provided for @goodEvening.
  ///
  /// In en, this message translates to:
  /// **'Good evening'**
  String get goodEvening;

  /// No description provided for @goodNight.
  ///
  /// In en, this message translates to:
  /// **'Good night'**
  String get goodNight;

  /// No description provided for @searchBooksAuthors.
  ///
  /// In en, this message translates to:
  /// **'Search books, authors...'**
  String get searchBooksAuthors;

  /// No description provided for @continueReading.
  ///
  /// In en, this message translates to:
  /// **'Continue Reading'**
  String get continueReading;

  /// No description provided for @trendingNow.
  ///
  /// In en, this message translates to:
  /// **'Trending Now'**
  String get trendingNow;

  /// No description provided for @browseByGenre.
  ///
  /// In en, this message translates to:
  /// **'Browse by Genre'**
  String get browseByGenre;

  /// No description provided for @newReleases.
  ///
  /// In en, this message translates to:
  /// **'New Releases'**
  String get newReleases;

  /// No description provided for @seeAll.
  ///
  /// In en, this message translates to:
  /// **'See All'**
  String get seeAll;

  /// No description provided for @hot.
  ///
  /// In en, this message translates to:
  /// **'HOT'**
  String get hot;

  /// No description provided for @digital.
  ///
  /// In en, this message translates to:
  /// **'Digital'**
  String get digital;

  /// No description provided for @booksCount.
  ///
  /// In en, this message translates to:
  /// **'{count} books'**
  String booksCount(String count);

  /// No description provided for @searchForBooks.
  ///
  /// In en, this message translates to:
  /// **'Search for books...'**
  String get searchForBooks;

  /// No description provided for @foundResults.
  ///
  /// In en, this message translates to:
  /// **'Found {count} results for \"{query}\"'**
  String foundResults(int count, String query);

  /// No description provided for @all.
  ///
  /// In en, this message translates to:
  /// **'All'**
  String get all;

  /// No description provided for @books.
  ///
  /// In en, this message translates to:
  /// **'Books'**
  String get books;

  /// No description provided for @authors.
  ///
  /// In en, this message translates to:
  /// **'Authors'**
  String get authors;

  /// No description provided for @publishers.
  ///
  /// In en, this message translates to:
  /// **'Publishers'**
  String get publishers;

  /// No description provided for @view.
  ///
  /// In en, this message translates to:
  /// **'View'**
  String get view;

  /// No description provided for @reviews.
  ///
  /// In en, this message translates to:
  /// **'{count} reviews'**
  String reviews(String count);

  /// No description provided for @categories.
  ///
  /// In en, this message translates to:
  /// **'Categories'**
  String get categories;

  /// No description provided for @fiction.
  ///
  /// In en, this message translates to:
  /// **'Fiction'**
  String get fiction;

  /// No description provided for @history.
  ///
  /// In en, this message translates to:
  /// **'History'**
  String get history;

  /// No description provided for @poetry.
  ///
  /// In en, this message translates to:
  /// **'Poetry'**
  String get poetry;

  /// No description provided for @children.
  ///
  /// In en, this message translates to:
  /// **'Children'**
  String get children;

  /// No description provided for @education.
  ///
  /// In en, this message translates to:
  /// **'Education'**
  String get education;

  /// No description provided for @selfHelp.
  ///
  /// In en, this message translates to:
  /// **'Self-Help'**
  String get selfHelp;

  /// No description provided for @business.
  ///
  /// In en, this message translates to:
  /// **'Business'**
  String get business;

  /// No description provided for @romance.
  ///
  /// In en, this message translates to:
  /// **'Romance'**
  String get romance;

  /// No description provided for @popular.
  ///
  /// In en, this message translates to:
  /// **'Popular'**
  String get popular;

  /// No description provided for @newFilter.
  ///
  /// In en, this message translates to:
  /// **'New'**
  String get newFilter;

  /// No description provided for @bestsellers.
  ///
  /// In en, this message translates to:
  /// **'Bestsellers'**
  String get bestsellers;

  /// No description provided for @priceLow.
  ///
  /// In en, this message translates to:
  /// **'Price: Low'**
  String get priceLow;

  /// No description provided for @booksInCategory.
  ///
  /// In en, this message translates to:
  /// **'{count} books in {category}'**
  String booksInCategory(int count, String category);

  /// No description provided for @nigerianNovelist.
  ///
  /// In en, this message translates to:
  /// **'Nigerian Novelist'**
  String get nigerianNovelist;

  /// No description provided for @readers.
  ///
  /// In en, this message translates to:
  /// **'Readers'**
  String get readers;

  /// No description provided for @rating.
  ///
  /// In en, this message translates to:
  /// **'Rating'**
  String get rating;

  /// No description provided for @followAuthor.
  ///
  /// In en, this message translates to:
  /// **'Follow Author'**
  String get followAuthor;

  /// No description provided for @about.
  ///
  /// In en, this message translates to:
  /// **'About'**
  String get about;

  /// No description provided for @popularBooks.
  ///
  /// In en, this message translates to:
  /// **'Popular Books'**
  String get popularBooks;

  /// No description provided for @publisher.
  ///
  /// In en, this message translates to:
  /// **'Publisher'**
  String get publisher;

  /// No description provided for @africanWritersSeries.
  ///
  /// In en, this message translates to:
  /// **'African Writers Series'**
  String get africanWritersSeries;

  /// No description provided for @followPublisher.
  ///
  /// In en, this message translates to:
  /// **'Follow Publisher'**
  String get followPublisher;

  /// No description provided for @latestReleases.
  ///
  /// In en, this message translates to:
  /// **'Latest Releases'**
  String get latestReleases;

  /// No description provided for @trending.
  ///
  /// In en, this message translates to:
  /// **'Trending'**
  String get trending;

  /// No description provided for @topBooksThisWeek.
  ///
  /// In en, this message translates to:
  /// **'Top books in {country} this week'**
  String topBooksThisWeek(String country);

  /// No description provided for @nigeria.
  ///
  /// In en, this message translates to:
  /// **'Nigeria'**
  String get nigeria;

  /// No description provided for @kenya.
  ///
  /// In en, this message translates to:
  /// **'Kenya'**
  String get kenya;

  /// No description provided for @southAfrica.
  ///
  /// In en, this message translates to:
  /// **'South Africa'**
  String get southAfrica;

  /// No description provided for @ghana.
  ///
  /// In en, this message translates to:
  /// **'Ghana'**
  String get ghana;

  /// No description provided for @fromLastWeek.
  ///
  /// In en, this message translates to:
  /// **'{change} from last week'**
  String fromLastWeek(String change);

  /// No description provided for @noChange.
  ///
  /// In en, this message translates to:
  /// **'No change'**
  String get noChange;

  /// No description provided for @featured.
  ///
  /// In en, this message translates to:
  /// **'Featured'**
  String get featured;

  /// No description provided for @collection.
  ///
  /// In en, this message translates to:
  /// **'Collection'**
  String get collection;

  /// No description provided for @aboutThisCollection.
  ///
  /// In en, this message translates to:
  /// **'About This Collection'**
  String get aboutThisCollection;

  /// No description provided for @booksInCollection.
  ///
  /// In en, this message translates to:
  /// **'Books in This Collection'**
  String get booksInCollection;

  /// No description provided for @avgRating.
  ///
  /// In en, this message translates to:
  /// **'Avg Rating'**
  String get avgRating;

  /// No description provided for @add.
  ///
  /// In en, this message translates to:
  /// **'Add'**
  String get add;

  /// No description provided for @celebratingPowerfulVoices.
  ///
  /// In en, this message translates to:
  /// **'Celebrating powerful voices from across the continent'**
  String get celebratingPowerfulVoices;

  /// No description provided for @authorsCount.
  ///
  /// In en, this message translates to:
  /// **'{count} Authors'**
  String authorsCount(int count);

  /// No description provided for @library.
  ///
  /// In en, this message translates to:
  /// **'Library'**
  String get library;

  /// No description provided for @myBooks.
  ///
  /// In en, this message translates to:
  /// **'My Books'**
  String get myBooks;

  /// No description provided for @favorites.
  ///
  /// In en, this message translates to:
  /// **'Favorites'**
  String get favorites;

  /// No description provided for @downloaded.
  ///
  /// In en, this message translates to:
  /// **'Downloaded'**
  String get downloaded;

  /// No description provided for @profile.
  ///
  /// In en, this message translates to:
  /// **'Profile'**
  String get profile;

  /// No description provided for @settings.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settings;

  /// No description provided for @notifications.
  ///
  /// In en, this message translates to:
  /// **'Notifications'**
  String get notifications;

  /// No description provided for @language.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get language;

  /// No description provided for @theme.
  ///
  /// In en, this message translates to:
  /// **'Theme'**
  String get theme;

  /// No description provided for @logout.
  ///
  /// In en, this message translates to:
  /// **'Logout'**
  String get logout;

  /// No description provided for @home.
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get home;

  /// No description provided for @explore.
  ///
  /// In en, this message translates to:
  /// **'Explore'**
  String get explore;

  /// No description provided for @cancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel;

  /// No description provided for @ok.
  ///
  /// In en, this message translates to:
  /// **'OK'**
  String get ok;

  /// No description provided for @delete.
  ///
  /// In en, this message translates to:
  /// **'Delete'**
  String get delete;

  /// No description provided for @edit.
  ///
  /// In en, this message translates to:
  /// **'Edit'**
  String get edit;

  /// No description provided for @save.
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get save;

  /// No description provided for @close.
  ///
  /// In en, this message translates to:
  /// **'Close'**
  String get close;

  /// No description provided for @loading.
  ///
  /// In en, this message translates to:
  /// **'Loading...'**
  String get loading;

  /// No description provided for @error.
  ///
  /// In en, this message translates to:
  /// **'Error'**
  String get error;

  /// No description provided for @retry.
  ///
  /// In en, this message translates to:
  /// **'Retry'**
  String get retry;

  /// No description provided for @success.
  ///
  /// In en, this message translates to:
  /// **'Success'**
  String get success;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'es', 'fr'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'es':
      return AppLocalizationsEs();
    case 'fr':
      return AppLocalizationsFr();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
