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

  /// No description provided for @signUpSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Create an account to start your reading journey'**
  String get signUpSubtitle;

  /// No description provided for @enterEmail.
  ///
  /// In en, this message translates to:
  /// **'Enter your email'**
  String get enterEmail;

  /// No description provided for @enterEmailOrPhone.
  ///
  /// In en, this message translates to:
  /// **'Enter your email or phone number'**
  String get enterEmailOrPhone;

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

  /// No description provided for @emailOrPhoneLabel.
  ///
  /// In en, this message translates to:
  /// **'Email or Phone'**
  String get emailOrPhoneLabel;

  /// No description provided for @fieldRequired.
  ///
  /// In en, this message translates to:
  /// **'{field} is required'**
  String fieldRequired(String field);

  /// No description provided for @fieldMinLength.
  ///
  /// In en, this message translates to:
  /// **'{field} must be at least {min} characters'**
  String fieldMinLength(String field, int min);

  /// No description provided for @fieldMaxLength.
  ///
  /// In en, this message translates to:
  /// **'{field} must be less than {max} characters'**
  String fieldMaxLength(String field, int max);

  /// No description provided for @invalidEmailAddress.
  ///
  /// In en, this message translates to:
  /// **'Please enter a valid email address'**
  String get invalidEmailAddress;

  /// No description provided for @invalidPhoneNumber.
  ///
  /// In en, this message translates to:
  /// **'Please enter a valid phone number'**
  String get invalidPhoneNumber;

  /// No description provided for @invalidEmailOrPhone.
  ///
  /// In en, this message translates to:
  /// **'Please enter a valid email or phone number'**
  String get invalidEmailOrPhone;

  /// No description provided for @passwordRequired.
  ///
  /// In en, this message translates to:
  /// **'Password is required'**
  String get passwordRequired;

  /// No description provided for @passwordsDoNotMatch.
  ///
  /// In en, this message translates to:
  /// **'Passwords do not match'**
  String get passwordsDoNotMatch;

  /// No description provided for @agreeToTermsError.
  ///
  /// In en, this message translates to:
  /// **'You must agree to the terms and conditions'**
  String get agreeToTermsError;

  /// No description provided for @forgotPassword.
  ///
  /// In en, this message translates to:
  /// **'Forgot Password?'**
  String get forgotPassword;

  /// No description provided for @forgotPasswordTitle.
  ///
  /// In en, this message translates to:
  /// **'Forgot password'**
  String get forgotPasswordTitle;

  /// No description provided for @forgotPasswordSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Enter your email or phone and we\'ll send you a reset code.'**
  String get forgotPasswordSubtitle;

  /// No description provided for @sendResetCode.
  ///
  /// In en, this message translates to:
  /// **'Send reset code'**
  String get sendResetCode;

  /// No description provided for @passwordResetCodeSent.
  ///
  /// In en, this message translates to:
  /// **'Reset code sent'**
  String get passwordResetCodeSent;

  /// No description provided for @resetPasswordTitle.
  ///
  /// In en, this message translates to:
  /// **'Reset password'**
  String get resetPasswordTitle;

  /// No description provided for @resetPasswordSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Enter the reset code and choose a new password.'**
  String get resetPasswordSubtitle;

  /// No description provided for @resetTokenLabel.
  ///
  /// In en, this message translates to:
  /// **'Reset code'**
  String get resetTokenLabel;

  /// No description provided for @resetTokenHint.
  ///
  /// In en, this message translates to:
  /// **'Enter your reset code'**
  String get resetTokenHint;

  /// No description provided for @newPasswordLabel.
  ///
  /// In en, this message translates to:
  /// **'New password'**
  String get newPasswordLabel;

  /// No description provided for @confirmPasswordLabel.
  ///
  /// In en, this message translates to:
  /// **'Confirm password'**
  String get confirmPasswordLabel;

  /// No description provided for @confirmPasswordHint.
  ///
  /// In en, this message translates to:
  /// **'Re-enter your password'**
  String get confirmPasswordHint;

  /// No description provided for @resetPasswordAction.
  ///
  /// In en, this message translates to:
  /// **'Set new password'**
  String get resetPasswordAction;

  /// No description provided for @passwordResetSuccess.
  ///
  /// In en, this message translates to:
  /// **'Password updated successfully'**
  String get passwordResetSuccess;

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

  /// No description provided for @signInSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Sign in to continue your reading journey'**
  String get signInSubtitle;

  /// No description provided for @rememberMe.
  ///
  /// In en, this message translates to:
  /// **'Remember me'**
  String get rememberMe;

  /// No description provided for @verificationCodeSent.
  ///
  /// In en, this message translates to:
  /// **'Verification code sent to {contact}'**
  String verificationCodeSent(String contact);

  /// No description provided for @authTermsNotice.
  ///
  /// In en, this message translates to:
  /// **'By continuing, you agree to our {terms} and {privacy}.'**
  String authTermsNotice(String terms, String privacy);

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

  /// No description provided for @newRelease.
  ///
  /// In en, this message translates to:
  /// **'New Release'**
  String get newRelease;

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

  /// No description provided for @recommendedForYou.
  ///
  /// In en, this message translates to:
  /// **'Recommended For You'**
  String get recommendedForYou;

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

  /// No description provided for @aboutThisBook.
  ///
  /// In en, this message translates to:
  /// **'About This Book'**
  String get aboutThisBook;

  /// No description provided for @chooseFormat.
  ///
  /// In en, this message translates to:
  /// **'Choose Format'**
  String get chooseFormat;

  /// No description provided for @digitalEdition.
  ///
  /// In en, this message translates to:
  /// **'Digital Edition'**
  String get digitalEdition;

  /// No description provided for @readOnAnyDevice.
  ///
  /// In en, this message translates to:
  /// **'Instant access • Read anywhere'**
  String get readOnAnyDevice;

  /// No description provided for @hardcopy.
  ///
  /// In en, this message translates to:
  /// **'Hardcopy'**
  String get hardcopy;

  /// No description provided for @printedAndDelivered.
  ///
  /// In en, this message translates to:
  /// **'Printed book • Home delivery'**
  String get printedAndDelivered;

  /// No description provided for @buyNow.
  ///
  /// In en, this message translates to:
  /// **'Buy Now - {price}'**
  String buyNow(String price);

  /// No description provided for @readFreePreview.
  ///
  /// In en, this message translates to:
  /// **'Read Free Preview'**
  String get readFreePreview;

  /// No description provided for @pages.
  ///
  /// In en, this message translates to:
  /// **'Pages'**
  String get pages;

  /// No description provided for @genre.
  ///
  /// In en, this message translates to:
  /// **'Genre'**
  String get genre;

  /// No description provided for @published.
  ///
  /// In en, this message translates to:
  /// **'Published'**
  String get published;

  /// No description provided for @previewMode.
  ///
  /// In en, this message translates to:
  /// **'Preview Mode'**
  String get previewMode;

  /// No description provided for @limitedPages.
  ///
  /// In en, this message translates to:
  /// **'Limited Pages'**
  String get limitedPages;

  /// No description provided for @buyFullBook.
  ///
  /// In en, this message translates to:
  /// **'Buy Full Book'**
  String get buyFullBook;

  /// No description provided for @preview.
  ///
  /// In en, this message translates to:
  /// **'Preview'**
  String get preview;

  /// No description provided for @previewEndsHere.
  ///
  /// In en, this message translates to:
  /// **'Preview Ends Here'**
  String get previewEndsHere;

  /// No description provided for @purchaseFullBook.
  ///
  /// In en, this message translates to:
  /// **'Purchase the full book to continue reading all {pages} pages'**
  String purchaseFullBook(int pages);

  /// No description provided for @buyFor.
  ///
  /// In en, this message translates to:
  /// **'Buy for {price}'**
  String buyFor(String price);

  /// No description provided for @chapter.
  ///
  /// In en, this message translates to:
  /// **'Chapter'**
  String get chapter;

  /// No description provided for @contents.
  ///
  /// In en, this message translates to:
  /// **'Contents'**
  String get contents;

  /// No description provided for @bookmark.
  ///
  /// In en, this message translates to:
  /// **'Bookmark'**
  String get bookmark;

  /// No description provided for @highlight.
  ///
  /// In en, this message translates to:
  /// **'Highlight'**
  String get highlight;

  /// No description provided for @readingSettings.
  ///
  /// In en, this message translates to:
  /// **'Reading Settings'**
  String get readingSettings;

  /// No description provided for @fontSize.
  ///
  /// In en, this message translates to:
  /// **'Font Size'**
  String get fontSize;

  /// No description provided for @readingTheme.
  ///
  /// In en, this message translates to:
  /// **'Reading Theme'**
  String get readingTheme;

  /// No description provided for @dark.
  ///
  /// In en, this message translates to:
  /// **'Dark'**
  String get dark;

  /// No description provided for @light.
  ///
  /// In en, this message translates to:
  /// **'Light'**
  String get light;

  /// No description provided for @sepia.
  ///
  /// In en, this message translates to:
  /// **'Sepia'**
  String get sepia;

  /// No description provided for @fontFamily.
  ///
  /// In en, this message translates to:
  /// **'Font Family'**
  String get fontFamily;

  /// No description provided for @serif.
  ///
  /// In en, this message translates to:
  /// **'Serif'**
  String get serif;

  /// No description provided for @sansSerif.
  ///
  /// In en, this message translates to:
  /// **'Sans-Serif'**
  String get sansSerif;

  /// No description provided for @lineSpacing.
  ///
  /// In en, this message translates to:
  /// **'Line Spacing'**
  String get lineSpacing;

  /// No description provided for @compact.
  ///
  /// In en, this message translates to:
  /// **'Compact'**
  String get compact;

  /// No description provided for @relaxed.
  ///
  /// In en, this message translates to:
  /// **'Relaxed'**
  String get relaxed;

  /// No description provided for @autoScroll.
  ///
  /// In en, this message translates to:
  /// **'Auto-Scroll'**
  String get autoScroll;

  /// No description provided for @automaticallyScrollPages.
  ///
  /// In en, this message translates to:
  /// **'Automatically scroll pages'**
  String get automaticallyScrollPages;

  /// No description provided for @tableOfContents.
  ///
  /// In en, this message translates to:
  /// **'Table of Contents'**
  String get tableOfContents;

  /// No description provided for @chapters.
  ///
  /// In en, this message translates to:
  /// **'{count} Chapters'**
  String chapters(int count);

  /// No description provided for @currentlyReading.
  ///
  /// In en, this message translates to:
  /// **'Currently reading'**
  String get currentlyReading;

  /// No description provided for @complete.
  ///
  /// In en, this message translates to:
  /// **'{percent}% complete'**
  String complete(int percent);

  /// No description provided for @pagesCount.
  ///
  /// In en, this message translates to:
  /// **'{count} pages'**
  String pagesCount(int count);

  /// No description provided for @highlightsAndNotes.
  ///
  /// In en, this message translates to:
  /// **'Highlights & Notes'**
  String get highlightsAndNotes;

  /// No description provided for @items.
  ///
  /// In en, this message translates to:
  /// **'{count} items'**
  String items(int count);

  /// No description provided for @highlights.
  ///
  /// In en, this message translates to:
  /// **'Highlights'**
  String get highlights;

  /// No description provided for @notes.
  ///
  /// In en, this message translates to:
  /// **'Notes'**
  String get notes;

  /// No description provided for @bookmarks.
  ///
  /// In en, this message translates to:
  /// **'Bookmarks'**
  String get bookmarks;

  /// No description provided for @share.
  ///
  /// In en, this message translates to:
  /// **'Share'**
  String get share;

  /// No description provided for @bookmarkedPage.
  ///
  /// In en, this message translates to:
  /// **'Bookmarked Page'**
  String get bookmarkedPage;

  /// No description provided for @goToPage.
  ///
  /// In en, this message translates to:
  /// **'Go to Page'**
  String get goToPage;

  /// No description provided for @daysAgo.
  ///
  /// In en, this message translates to:
  /// **'{count} days ago'**
  String daysAgo(int count);

  /// No description provided for @weeksAgo.
  ///
  /// In en, this message translates to:
  /// **'{count} weeks ago'**
  String weeksAgo(int count);

  /// No description provided for @readingProgress.
  ///
  /// In en, this message translates to:
  /// **'Reading Progress'**
  String get readingProgress;

  /// No description provided for @pagesRead.
  ///
  /// In en, this message translates to:
  /// **'Pages Read'**
  String get pagesRead;

  /// No description provided for @pagesLeft.
  ///
  /// In en, this message translates to:
  /// **'Pages Left'**
  String get pagesLeft;

  /// No description provided for @timeLeft.
  ///
  /// In en, this message translates to:
  /// **'Time Left'**
  String get timeLeft;

  /// No description provided for @thisWeek.
  ///
  /// In en, this message translates to:
  /// **'This Week'**
  String get thisWeek;

  /// No description provided for @readingTime.
  ///
  /// In en, this message translates to:
  /// **'Reading Time'**
  String get readingTime;

  /// No description provided for @dayStreak.
  ///
  /// In en, this message translates to:
  /// **'Day Streak'**
  String get dayStreak;

  /// No description provided for @booksFinished.
  ///
  /// In en, this message translates to:
  /// **'Books Finished'**
  String get booksFinished;

  /// No description provided for @dailyActivity.
  ///
  /// In en, this message translates to:
  /// **'Daily Activity'**
  String get dailyActivity;

  /// No description provided for @weeklyGoal.
  ///
  /// In en, this message translates to:
  /// **'Weekly Goal'**
  String get weeklyGoal;

  /// No description provided for @hours.
  ///
  /// In en, this message translates to:
  /// **'{count} hours'**
  String hours(String count);

  /// No description provided for @hoursLeft.
  ///
  /// In en, this message translates to:
  /// **'{count} hours left to reach your goal'**
  String hoursLeft(String count);

  /// No description provided for @offlineStorage.
  ///
  /// In en, this message translates to:
  /// **'Offline Storage'**
  String get offlineStorage;

  /// No description provided for @storageUsed.
  ///
  /// In en, this message translates to:
  /// **'Storage Used'**
  String get storageUsed;

  /// No description provided for @gbOf.
  ///
  /// In en, this message translates to:
  /// **'{used} of {total}'**
  String gbOf(String used, String total);

  /// No description provided for @available.
  ///
  /// In en, this message translates to:
  /// **'{size} available'**
  String available(String size);

  /// No description provided for @manage.
  ///
  /// In en, this message translates to:
  /// **'Manage'**
  String get manage;

  /// No description provided for @downloadedBooks.
  ///
  /// In en, this message translates to:
  /// **'Downloaded Books'**
  String get downloadedBooks;

  /// No description provided for @booksLowercase.
  ///
  /// In en, this message translates to:
  /// **'{count} books'**
  String booksLowercase(int count);

  /// No description provided for @downloadedStatus.
  ///
  /// In en, this message translates to:
  /// **'Downloaded'**
  String get downloadedStatus;

  /// No description provided for @yourReadingStats.
  ///
  /// In en, this message translates to:
  /// **'Your Reading Stats'**
  String get yourReadingStats;

  /// No description provided for @readingChallenge.
  ///
  /// In en, this message translates to:
  /// **'{year} Reading Challenge'**
  String readingChallenge(int year);

  /// No description provided for @booksRead.
  ///
  /// In en, this message translates to:
  /// **'{count} Books'**
  String booksRead(int count);

  /// No description provided for @booksAheadOfGoal.
  ///
  /// In en, this message translates to:
  /// **'{count} books ahead of your goal'**
  String booksAheadOfGoal(int count);

  /// No description provided for @percentComplete.
  ///
  /// In en, this message translates to:
  /// **'{percent}% complete'**
  String percentComplete(int percent);

  /// No description provided for @booksToGo.
  ///
  /// In en, this message translates to:
  /// **'{count} books to go'**
  String booksToGo(int count);

  /// No description provided for @thisMonth.
  ///
  /// In en, this message translates to:
  /// **'This Month'**
  String get thisMonth;

  /// No description provided for @pagesReadLabel.
  ///
  /// In en, this message translates to:
  /// **'Pages Read'**
  String get pagesReadLabel;

  /// No description provided for @readingTimeLabel.
  ///
  /// In en, this message translates to:
  /// **'Reading Time'**
  String get readingTimeLabel;

  /// No description provided for @favoriteGenres.
  ///
  /// In en, this message translates to:
  /// **'Favorite Genres'**
  String get favoriteGenres;

  /// No description provided for @recentlyFinished.
  ///
  /// In en, this message translates to:
  /// **'Recently Finished'**
  String get recentlyFinished;

  /// No description provided for @finishedAgo.
  ///
  /// In en, this message translates to:
  /// **'Finished {days} days ago'**
  String finishedAgo(int days);

  /// No description provided for @offlineReading.
  ///
  /// In en, this message translates to:
  /// **'Offline reading'**
  String get offlineReading;

  /// No description provided for @syncAcrossDevices.
  ///
  /// In en, this message translates to:
  /// **'Sync across devices'**
  String get syncAcrossDevices;

  /// No description provided for @highlightsNotes.
  ///
  /// In en, this message translates to:
  /// **'Highlights & notes'**
  String get highlightsNotes;

  /// No description provided for @premiumPaperQuality.
  ///
  /// In en, this message translates to:
  /// **'Premium paper quality'**
  String get premiumPaperQuality;

  /// No description provided for @deliveryInDays.
  ///
  /// In en, this message translates to:
  /// **'Delivery in 3-5 days'**
  String get deliveryInDays;

  /// No description provided for @freeShipping.
  ///
  /// In en, this message translates to:
  /// **'Free shipping'**
  String get freeShipping;

  /// No description provided for @continueToCheckout.
  ///
  /// In en, this message translates to:
  /// **'Continue to Checkout'**
  String get continueToCheckout;

  /// No description provided for @checkout.
  ///
  /// In en, this message translates to:
  /// **'Checkout'**
  String get checkout;

  /// No description provided for @orderSummary.
  ///
  /// In en, this message translates to:
  /// **'Order Summary'**
  String get orderSummary;

  /// No description provided for @subtotal.
  ///
  /// In en, this message translates to:
  /// **'Subtotal'**
  String get subtotal;

  /// No description provided for @processingFee.
  ///
  /// In en, this message translates to:
  /// **'Processing Fee'**
  String get processingFee;

  /// No description provided for @total.
  ///
  /// In en, this message translates to:
  /// **'Total'**
  String get total;

  /// No description provided for @promoCode.
  ///
  /// In en, this message translates to:
  /// **'Promo Code'**
  String get promoCode;

  /// No description provided for @enterCode.
  ///
  /// In en, this message translates to:
  /// **'Enter code'**
  String get enterCode;

  /// No description provided for @apply.
  ///
  /// In en, this message translates to:
  /// **'Apply'**
  String get apply;

  /// No description provided for @securePayment.
  ///
  /// In en, this message translates to:
  /// **'Secure Payment'**
  String get securePayment;

  /// No description provided for @securePaymentDesc.
  ///
  /// In en, this message translates to:
  /// **'Your payment information is encrypted and secure. We support all major mobile money providers.'**
  String get securePaymentDesc;

  /// No description provided for @proceedToPayment.
  ///
  /// In en, this message translates to:
  /// **'Proceed to Payment'**
  String get proceedToPayment;

  /// No description provided for @paymentMethod.
  ///
  /// In en, this message translates to:
  /// **'Payment Method'**
  String get paymentMethod;

  /// No description provided for @mobileMoney.
  ///
  /// In en, this message translates to:
  /// **'Mobile Money'**
  String get mobileMoney;

  /// No description provided for @mtnMobileMoney.
  ///
  /// In en, this message translates to:
  /// **'MTN Mobile Money'**
  String get mtnMobileMoney;

  /// No description provided for @fastSecurePayment.
  ///
  /// In en, this message translates to:
  /// **'Fast & secure payment'**
  String get fastSecurePayment;

  /// No description provided for @orangeMoney.
  ///
  /// In en, this message translates to:
  /// **'Orange Money'**
  String get orangeMoney;

  /// No description provided for @instantTransfer.
  ///
  /// In en, this message translates to:
  /// **'Instant transfer'**
  String get instantTransfer;

  /// No description provided for @airtelMoney.
  ///
  /// In en, this message translates to:
  /// **'Airtel Money'**
  String get airtelMoney;

  /// No description provided for @quickCheckout.
  ///
  /// In en, this message translates to:
  /// **'Quick checkout'**
  String get quickCheckout;

  /// No description provided for @mPesa.
  ///
  /// In en, this message translates to:
  /// **'M-Pesa'**
  String get mPesa;

  /// No description provided for @trustedPayment.
  ///
  /// In en, this message translates to:
  /// **'Trusted payment'**
  String get trustedPayment;

  /// No description provided for @enterPhoneNumber.
  ///
  /// In en, this message translates to:
  /// **'Enter Phone Number'**
  String get enterPhoneNumber;

  /// No description provided for @phoneNumberPlaceholder.
  ///
  /// In en, this message translates to:
  /// **'+233 XX XXX XXXX'**
  String get phoneNumberPlaceholder;

  /// No description provided for @paymentPromptMessage.
  ///
  /// In en, this message translates to:
  /// **'You\'ll receive a prompt to approve the payment'**
  String get paymentPromptMessage;

  /// No description provided for @totalAmount.
  ///
  /// In en, this message translates to:
  /// **'Total Amount'**
  String get totalAmount;

  /// No description provided for @payNow.
  ///
  /// In en, this message translates to:
  /// **'Pay Now'**
  String get payNow;

  /// No description provided for @processingPayment.
  ///
  /// In en, this message translates to:
  /// **'Processing Payment'**
  String get processingPayment;

  /// No description provided for @checkPhoneApprove.
  ///
  /// In en, this message translates to:
  /// **'Please check your phone and approve the payment request from {provider}'**
  String checkPhoneApprove(String provider);

  /// No description provided for @amount.
  ///
  /// In en, this message translates to:
  /// **'Amount'**
  String get amount;

  /// No description provided for @phoneNumber.
  ///
  /// In en, this message translates to:
  /// **'Phone Number'**
  String get phoneNumber;

  /// No description provided for @reference.
  ///
  /// In en, this message translates to:
  /// **'Reference'**
  String get reference;

  /// No description provided for @cancelPayment.
  ///
  /// In en, this message translates to:
  /// **'Cancel Payment'**
  String get cancelPayment;

  /// No description provided for @paymentSuccessful.
  ///
  /// In en, this message translates to:
  /// **'Payment Successful!'**
  String get paymentSuccessful;

  /// No description provided for @bookAddedToLibrary.
  ///
  /// In en, this message translates to:
  /// **'Your book has been added to your library. Start reading now!'**
  String get bookAddedToLibrary;

  /// No description provided for @amountPaid.
  ///
  /// In en, this message translates to:
  /// **'Amount Paid'**
  String get amountPaid;

  /// No description provided for @transactionId.
  ///
  /// In en, this message translates to:
  /// **'Transaction ID'**
  String get transactionId;

  /// No description provided for @date.
  ///
  /// In en, this message translates to:
  /// **'Date'**
  String get date;

  /// No description provided for @startReading.
  ///
  /// In en, this message translates to:
  /// **'Start Reading'**
  String get startReading;

  /// No description provided for @viewReceipt.
  ///
  /// In en, this message translates to:
  /// **'View Receipt'**
  String get viewReceipt;

  /// No description provided for @myOrders.
  ///
  /// In en, this message translates to:
  /// **'My Orders'**
  String get myOrders;

  /// No description provided for @filter.
  ///
  /// In en, this message translates to:
  /// **'Filter'**
  String get filter;

  /// No description provided for @orderFilter.
  ///
  /// In en, this message translates to:
  /// **'Order #'**
  String get orderFilter;

  /// No description provided for @completed.
  ///
  /// In en, this message translates to:
  /// **'Completed'**
  String get completed;

  /// No description provided for @readNow.
  ///
  /// In en, this message translates to:
  /// **'Read Now'**
  String get readNow;

  /// No description provided for @inTransit.
  ///
  /// In en, this message translates to:
  /// **'In Transit'**
  String get inTransit;

  /// No description provided for @trackOrder.
  ///
  /// In en, this message translates to:
  /// **'Track Order'**
  String get trackOrder;

  /// No description provided for @contactSupport.
  ///
  /// In en, this message translates to:
  /// **'Contact Support'**
  String get contactSupport;

  /// No description provided for @delivered.
  ///
  /// In en, this message translates to:
  /// **'Delivered'**
  String get delivered;

  /// No description provided for @rateAndReview.
  ///
  /// In en, this message translates to:
  /// **'Rate & Review'**
  String get rateAndReview;

  /// No description provided for @buyAgain.
  ///
  /// In en, this message translates to:
  /// **'Buy Again'**
  String get buyAgain;

  /// No description provided for @trackOrderTitle.
  ///
  /// In en, this message translates to:
  /// **'Track Order'**
  String get trackOrderTitle;

  /// No description provided for @placedOn.
  ///
  /// In en, this message translates to:
  /// **'Placed on {date}'**
  String placedOn(String date);

  /// No description provided for @estimatedDelivery.
  ///
  /// In en, this message translates to:
  /// **'Estimated Delivery'**
  String get estimatedDelivery;

  /// No description provided for @orderWillArriveIn.
  ///
  /// In en, this message translates to:
  /// **'Your order will arrive in {days} days'**
  String orderWillArriveIn(int days);

  /// No description provided for @trackingHistory.
  ///
  /// In en, this message translates to:
  /// **'Tracking History'**
  String get trackingHistory;

  /// No description provided for @outForDelivery.
  ///
  /// In en, this message translates to:
  /// **'Out for Delivery'**
  String get outForDelivery;

  /// No description provided for @packageOnTheWay.
  ///
  /// In en, this message translates to:
  /// **'Your package is on the way'**
  String get packageOnTheWay;

  /// No description provided for @inTransitStatus.
  ///
  /// In en, this message translates to:
  /// **'In Transit'**
  String get inTransitStatus;

  /// No description provided for @arrivedAtSortingFacility.
  ///
  /// In en, this message translates to:
  /// **'Package arrived at sorting facility'**
  String get arrivedAtSortingFacility;

  /// No description provided for @shipped.
  ///
  /// In en, this message translates to:
  /// **'Shipped'**
  String get shipped;

  /// No description provided for @pickedUpByCourier.
  ///
  /// In en, this message translates to:
  /// **'Package picked up by courier'**
  String get pickedUpByCourier;

  /// No description provided for @processing.
  ///
  /// In en, this message translates to:
  /// **'Processing'**
  String get processing;

  /// No description provided for @orderBeingPrepared.
  ///
  /// In en, this message translates to:
  /// **'Your order is being prepared'**
  String get orderBeingPrepared;

  /// No description provided for @orderConfirmed.
  ///
  /// In en, this message translates to:
  /// **'Order Confirmed'**
  String get orderConfirmed;

  /// No description provided for @paymentReceived.
  ///
  /// In en, this message translates to:
  /// **'Payment received successfully'**
  String get paymentReceived;

  /// No description provided for @deliveryAddress.
  ///
  /// In en, this message translates to:
  /// **'Delivery Address'**
  String get deliveryAddress;

  /// No description provided for @editProfile.
  ///
  /// In en, this message translates to:
  /// **'Edit Profile'**
  String get editProfile;

  /// No description provided for @fullName.
  ///
  /// In en, this message translates to:
  /// **'Full Name'**
  String get fullName;

  /// No description provided for @username.
  ///
  /// In en, this message translates to:
  /// **'Username'**
  String get username;

  /// No description provided for @bio.
  ///
  /// In en, this message translates to:
  /// **'Bio'**
  String get bio;

  /// No description provided for @email.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get email;

  /// No description provided for @location.
  ///
  /// In en, this message translates to:
  /// **'Location'**
  String get location;

  /// No description provided for @readingPreferences.
  ///
  /// In en, this message translates to:
  /// **'Reading Preferences'**
  String get readingPreferences;

  /// No description provided for @followers.
  ///
  /// In en, this message translates to:
  /// **'Followers'**
  String get followers;

  /// No description provided for @following.
  ///
  /// In en, this message translates to:
  /// **'Following'**
  String get following;

  /// No description provided for @activity.
  ///
  /// In en, this message translates to:
  /// **'Activity'**
  String get activity;

  /// No description provided for @tellUsAboutYourself.
  ///
  /// In en, this message translates to:
  /// **'Tell us about yourself...'**
  String get tellUsAboutYourself;

  /// No description provided for @biography.
  ///
  /// In en, this message translates to:
  /// **'Biography'**
  String get biography;

  /// No description provided for @addNewPreference.
  ///
  /// In en, this message translates to:
  /// **'+ Add'**
  String get addNewPreference;

  /// No description provided for @saveChanges.
  ///
  /// In en, this message translates to:
  /// **'Save Changes'**
  String get saveChanges;

  /// No description provided for @savedQuotes.
  ///
  /// In en, this message translates to:
  /// **'Saved Quotes'**
  String get savedQuotes;

  /// No description provided for @page.
  ///
  /// In en, this message translates to:
  /// **'Page'**
  String get page;

  /// No description provided for @savedAgo.
  ///
  /// In en, this message translates to:
  /// **'Saved {time} ago'**
  String savedAgo(String time);

  /// No description provided for @forYou.
  ///
  /// In en, this message translates to:
  /// **'For You'**
  String get forYou;

  /// No description provided for @bookClubs.
  ///
  /// In en, this message translates to:
  /// **'Book Clubs'**
  String get bookClubs;

  /// No description provided for @likes.
  ///
  /// In en, this message translates to:
  /// **'{count} likes'**
  String likes(int count);

  /// No description provided for @comments.
  ///
  /// In en, this message translates to:
  /// **'{count} comments'**
  String comments(int count);

  /// No description provided for @reply.
  ///
  /// In en, this message translates to:
  /// **'Reply'**
  String get reply;

  /// No description provided for @attachBook.
  ///
  /// In en, this message translates to:
  /// **'Attach Book'**
  String get attachBook;

  /// No description provided for @addPhotos.
  ///
  /// In en, this message translates to:
  /// **'Add Photos'**
  String get addPhotos;

  /// No description provided for @createPoll.
  ///
  /// In en, this message translates to:
  /// **'Create Poll'**
  String get createPoll;

  /// No description provided for @tagBookClub.
  ///
  /// In en, this message translates to:
  /// **'Tag Book Club'**
  String get tagBookClub;

  /// No description provided for @post.
  ///
  /// In en, this message translates to:
  /// **'Post'**
  String get post;

  /// No description provided for @whatsOnYourMind.
  ///
  /// In en, this message translates to:
  /// **'What\'s on your mind?'**
  String get whatsOnYourMind;

  /// No description provided for @postTooltip.
  ///
  /// In en, this message translates to:
  /// **'Share a post'**
  String get postTooltip;

  /// No description provided for @writeComment.
  ///
  /// In en, this message translates to:
  /// **'Write a comment...'**
  String get writeComment;

  /// No description provided for @attachedBook.
  ///
  /// In en, this message translates to:
  /// **'Attached Book'**
  String get attachedBook;

  /// No description provided for @removeAttachment.
  ///
  /// In en, this message translates to:
  /// **'Remove'**
  String get removeAttachment;

  /// No description provided for @markAllRead.
  ///
  /// In en, this message translates to:
  /// **'Mark All as Read'**
  String get markAllRead;

  /// No description provided for @mentions.
  ///
  /// In en, this message translates to:
  /// **'Mentions'**
  String get mentions;

  /// No description provided for @startedFollowing.
  ///
  /// In en, this message translates to:
  /// **'started following you'**
  String get startedFollowing;

  /// No description provided for @likedYourPost.
  ///
  /// In en, this message translates to:
  /// **'liked your post'**
  String get likedYourPost;

  /// No description provided for @commentedOnPost.
  ///
  /// In en, this message translates to:
  /// **'commented on your post'**
  String get commentedOnPost;

  /// No description provided for @repliedToComment.
  ///
  /// In en, this message translates to:
  /// **'replied to your comment'**
  String get repliedToComment;

  /// No description provided for @mentionedYou.
  ///
  /// In en, this message translates to:
  /// **'mentioned you in a post'**
  String get mentionedYou;

  /// No description provided for @newBookAdded.
  ///
  /// In en, this message translates to:
  /// **'New book added to {category}'**
  String newBookAdded(String category);

  /// No description provided for @newDiscussion.
  ///
  /// In en, this message translates to:
  /// **'New discussion in {clubName}'**
  String newDiscussion(String clubName);

  /// No description provided for @achievementUnlocked.
  ///
  /// In en, this message translates to:
  /// **'Achievement unlocked: {achievement}'**
  String achievementUnlocked(String achievement);

  /// No description provided for @flashSaleAlert.
  ///
  /// In en, this message translates to:
  /// **'{bookTitle} is {percent}% off!'**
  String flashSaleAlert(String bookTitle, int percent);

  /// No description provided for @just.
  ///
  /// In en, this message translates to:
  /// **'Just now'**
  String get just;

  /// No description provided for @minutesAgo.
  ///
  /// In en, this message translates to:
  /// **'{count}m ago'**
  String minutesAgo(int count);

  /// No description provided for @hoursAgo.
  ///
  /// In en, this message translates to:
  /// **'{count}h ago'**
  String hoursAgo(int count);

  /// No description provided for @daysAgoShort.
  ///
  /// In en, this message translates to:
  /// **'{count}d ago'**
  String daysAgoShort(int count);

  /// No description provided for @weeksAgoShort.
  ///
  /// In en, this message translates to:
  /// **'{count}w ago'**
  String weeksAgoShort(int count);

  /// No description provided for @viewProfile.
  ///
  /// In en, this message translates to:
  /// **'View Profile'**
  String get viewProfile;

  /// No description provided for @account.
  ///
  /// In en, this message translates to:
  /// **'Account'**
  String get account;

  /// No description provided for @accountSettings.
  ///
  /// In en, this message translates to:
  /// **'Account Settings'**
  String get accountSettings;

  /// No description provided for @privacySecurity.
  ///
  /// In en, this message translates to:
  /// **'Privacy & Security'**
  String get privacySecurity;

  /// No description provided for @app.
  ///
  /// In en, this message translates to:
  /// **'App'**
  String get app;

  /// No description provided for @appPreferences.
  ///
  /// In en, this message translates to:
  /// **'App Preferences'**
  String get appPreferences;

  /// No description provided for @storageDownloads.
  ///
  /// In en, this message translates to:
  /// **'Storage & Downloads'**
  String get storageDownloads;

  /// No description provided for @languageRegion.
  ///
  /// In en, this message translates to:
  /// **'Language & Region'**
  String get languageRegion;

  /// No description provided for @support.
  ///
  /// In en, this message translates to:
  /// **'Support'**
  String get support;

  /// No description provided for @helpSupport.
  ///
  /// In en, this message translates to:
  /// **'Help & Support'**
  String get helpSupport;

  /// No description provided for @aboutLoni.
  ///
  /// In en, this message translates to:
  /// **'About Loni'**
  String get aboutLoni;

  /// No description provided for @logOut.
  ///
  /// In en, this message translates to:
  /// **'Log Out'**
  String get logOut;

  /// No description provided for @personalInformation.
  ///
  /// In en, this message translates to:
  /// **'Personal Information'**
  String get personalInformation;

  /// No description provided for @dateOfBirth.
  ///
  /// In en, this message translates to:
  /// **'Date of Birth'**
  String get dateOfBirth;

  /// No description provided for @accountManagement.
  ///
  /// In en, this message translates to:
  /// **'Account Management'**
  String get accountManagement;

  /// No description provided for @changePassword.
  ///
  /// In en, this message translates to:
  /// **'Change Password'**
  String get changePassword;

  /// No description provided for @connectedAccounts.
  ///
  /// In en, this message translates to:
  /// **'Connected Accounts'**
  String get connectedAccounts;

  /// No description provided for @paymentMethods.
  ///
  /// In en, this message translates to:
  /// **'Payment Methods'**
  String get paymentMethods;

  /// No description provided for @subscription.
  ///
  /// In en, this message translates to:
  /// **'Subscription'**
  String get subscription;

  /// No description provided for @premium.
  ///
  /// In en, this message translates to:
  /// **'Premium'**
  String get premium;

  /// No description provided for @dangerZone.
  ///
  /// In en, this message translates to:
  /// **'Danger Zone'**
  String get dangerZone;

  /// No description provided for @deactivateAccount.
  ///
  /// In en, this message translates to:
  /// **'Deactivate Account'**
  String get deactivateAccount;

  /// No description provided for @deleteAccount.
  ///
  /// In en, this message translates to:
  /// **'Delete Account'**
  String get deleteAccount;

  /// No description provided for @security.
  ///
  /// In en, this message translates to:
  /// **'Security'**
  String get security;

  /// No description provided for @biometricAuth.
  ///
  /// In en, this message translates to:
  /// **'Biometric Authentication'**
  String get biometricAuth;

  /// No description provided for @biometricAuthDesc.
  ///
  /// In en, this message translates to:
  /// **'Use fingerprint or face ID to unlock'**
  String get biometricAuthDesc;

  /// No description provided for @twoFactorAuth.
  ///
  /// In en, this message translates to:
  /// **'Two-Factor Authentication'**
  String get twoFactorAuth;

  /// No description provided for @twoFactorAuthDesc.
  ///
  /// In en, this message translates to:
  /// **'Add an extra layer of security'**
  String get twoFactorAuthDesc;

  /// No description provided for @activeSessions.
  ///
  /// In en, this message translates to:
  /// **'Active Sessions'**
  String get activeSessions;

  /// No description provided for @loginHistory.
  ///
  /// In en, this message translates to:
  /// **'Login History'**
  String get loginHistory;

  /// No description provided for @privacy.
  ///
  /// In en, this message translates to:
  /// **'Privacy'**
  String get privacy;

  /// No description provided for @profileVisibility.
  ///
  /// In en, this message translates to:
  /// **'Profile Visibility'**
  String get profileVisibility;

  /// No description provided for @publicVisibility.
  ///
  /// In en, this message translates to:
  /// **'Public'**
  String get publicVisibility;

  /// No description provided for @readingActivity.
  ///
  /// In en, this message translates to:
  /// **'Reading Activity'**
  String get readingActivity;

  /// No description provided for @visibleToFollowers.
  ///
  /// In en, this message translates to:
  /// **'Visible to followers'**
  String get visibleToFollowers;

  /// No description provided for @blockedUsers.
  ///
  /// In en, this message translates to:
  /// **'Blocked Users'**
  String get blockedUsers;

  /// No description provided for @mutedConversations.
  ///
  /// In en, this message translates to:
  /// **'Muted Conversations'**
  String get mutedConversations;

  /// No description provided for @dataPermissions.
  ///
  /// In en, this message translates to:
  /// **'Data & Permissions'**
  String get dataPermissions;

  /// No description provided for @downloadYourData.
  ///
  /// In en, this message translates to:
  /// **'Download Your Data'**
  String get downloadYourData;

  /// No description provided for @appPermissions.
  ///
  /// In en, this message translates to:
  /// **'App Permissions'**
  String get appPermissions;

  /// No description provided for @privacyPolicy.
  ///
  /// In en, this message translates to:
  /// **'Privacy Policy'**
  String get privacyPolicy;

  /// No description provided for @termsOfService.
  ///
  /// In en, this message translates to:
  /// **'Terms of Service'**
  String get termsOfService;

  /// No description provided for @searchHelpArticles.
  ///
  /// In en, this message translates to:
  /// **'Search Help Articles'**
  String get searchHelpArticles;

  /// No description provided for @findAnswers.
  ///
  /// In en, this message translates to:
  /// **'Find answers to common questions'**
  String get findAnswers;

  /// No description provided for @whatCanWeHelp.
  ///
  /// In en, this message translates to:
  /// **'What can we help you with?'**
  String get whatCanWeHelp;

  /// No description provided for @quickActions.
  ///
  /// In en, this message translates to:
  /// **'Quick Actions'**
  String get quickActions;

  /// No description provided for @liveChat.
  ///
  /// In en, this message translates to:
  /// **'Live Chat'**
  String get liveChat;

  /// No description provided for @emailUs.
  ///
  /// In en, this message translates to:
  /// **'Email Us'**
  String get emailUs;

  /// No description provided for @callSupport.
  ///
  /// In en, this message translates to:
  /// **'Call Support'**
  String get callSupport;

  /// No description provided for @userGuide.
  ///
  /// In en, this message translates to:
  /// **'User Guide'**
  String get userGuide;

  /// No description provided for @popularTopics.
  ///
  /// In en, this message translates to:
  /// **'Popular Topics'**
  String get popularTopics;

  /// No description provided for @howToDownloadBooks.
  ///
  /// In en, this message translates to:
  /// **'How to download books'**
  String get howToDownloadBooks;

  /// No description provided for @paymentMethodsHelp.
  ///
  /// In en, this message translates to:
  /// **'Payment methods'**
  String get paymentMethodsHelp;

  /// No description provided for @refundPolicy.
  ///
  /// In en, this message translates to:
  /// **'Refund policy'**
  String get refundPolicy;

  /// No description provided for @premiumSubscription.
  ///
  /// In en, this message translates to:
  /// **'Premium subscription'**
  String get premiumSubscription;

  /// No description provided for @shippingDelivery.
  ///
  /// In en, this message translates to:
  /// **'Shipping & delivery'**
  String get shippingDelivery;

  /// No description provided for @contactInformation.
  ///
  /// In en, this message translates to:
  /// **'Contact Information'**
  String get contactInformation;

  /// No description provided for @supportEmail.
  ///
  /// In en, this message translates to:
  /// **'support@loni.com'**
  String get supportEmail;

  /// No description provided for @supportPhone.
  ///
  /// In en, this message translates to:
  /// **'+233 30 123 4567'**
  String get supportPhone;

  /// No description provided for @supportHours.
  ///
  /// In en, this message translates to:
  /// **'Mon-Fri: 8AM - 6PM GMT'**
  String get supportHours;

  /// No description provided for @version.
  ///
  /// In en, this message translates to:
  /// **'Version'**
  String get version;

  /// No description provided for @copyright.
  ///
  /// In en, this message translates to:
  /// **'© 2024 Loni LLC. All rights reserved.'**
  String get copyright;

  /// No description provided for @ourMission.
  ///
  /// In en, this message translates to:
  /// **'Our Mission'**
  String get ourMission;

  /// No description provided for @missionStatement.
  ///
  /// In en, this message translates to:
  /// **'Loni is dedicated to promoting African literature and connecting readers with the rich tapestry of stories from across the continent. We believe in the power of books to educate, inspire, and transform lives.'**
  String get missionStatement;

  /// No description provided for @appInformation.
  ///
  /// In en, this message translates to:
  /// **'App Information'**
  String get appInformation;

  /// No description provided for @whatsNew.
  ///
  /// In en, this message translates to:
  /// **'What\'s New'**
  String get whatsNew;

  /// No description provided for @releaseNotes.
  ///
  /// In en, this message translates to:
  /// **'Release Notes'**
  String get releaseNotes;

  /// No description provided for @licenses.
  ///
  /// In en, this message translates to:
  /// **'Licenses'**
  String get licenses;

  /// No description provided for @legal.
  ///
  /// In en, this message translates to:
  /// **'Legal'**
  String get legal;

  /// No description provided for @cookiePolicy.
  ///
  /// In en, this message translates to:
  /// **'Cookie Policy'**
  String get cookiePolicy;

  /// No description provided for @followUs.
  ///
  /// In en, this message translates to:
  /// **'Follow Us'**
  String get followUs;

  /// No description provided for @rateLoniOnAppStore.
  ///
  /// In en, this message translates to:
  /// **'Rate Loni on App Store'**
  String get rateLoniOnAppStore;

  /// No description provided for @appearance.
  ///
  /// In en, this message translates to:
  /// **'Appearance'**
  String get appearance;

  /// No description provided for @darkMode.
  ///
  /// In en, this message translates to:
  /// **'Dark Mode'**
  String get darkMode;

  /// No description provided for @lightMode.
  ///
  /// In en, this message translates to:
  /// **'Light Mode'**
  String get lightMode;

  /// No description provided for @medium.
  ///
  /// In en, this message translates to:
  /// **'Medium'**
  String get medium;

  /// No description provided for @displayLanguage.
  ///
  /// In en, this message translates to:
  /// **'Display Language'**
  String get displayLanguage;

  /// No description provided for @english.
  ///
  /// In en, this message translates to:
  /// **'English'**
  String get english;

  /// No description provided for @reading.
  ///
  /// In en, this message translates to:
  /// **'Reading'**
  String get reading;

  /// No description provided for @pageTurnAnimation.
  ///
  /// In en, this message translates to:
  /// **'Page Turn Animation'**
  String get pageTurnAnimation;

  /// No description provided for @slide.
  ///
  /// In en, this message translates to:
  /// **'Slide'**
  String get slide;

  /// No description provided for @screenBrightness.
  ///
  /// In en, this message translates to:
  /// **'Screen Brightness'**
  String get screenBrightness;

  /// No description provided for @autoAdjustBrightness.
  ///
  /// In en, this message translates to:
  /// **'Auto-adjust while reading'**
  String get autoAdjustBrightness;

  /// No description provided for @keepScreenAwake.
  ///
  /// In en, this message translates to:
  /// **'Keep Screen Awake'**
  String get keepScreenAwake;

  /// No description provided for @preventScreenTimeout.
  ///
  /// In en, this message translates to:
  /// **'Prevent screen timeout while reading'**
  String get preventScreenTimeout;

  /// No description provided for @downloads.
  ///
  /// In en, this message translates to:
  /// **'Downloads'**
  String get downloads;

  /// No description provided for @autoDownload.
  ///
  /// In en, this message translates to:
  /// **'Auto-Download'**
  String get autoDownload;

  /// No description provided for @autoDownloadDesc.
  ///
  /// In en, this message translates to:
  /// **'Download purchased books automatically'**
  String get autoDownloadDesc;

  /// No description provided for @downloadQuality.
  ///
  /// In en, this message translates to:
  /// **'Download Quality'**
  String get downloadQuality;

  /// No description provided for @highQuality.
  ///
  /// In en, this message translates to:
  /// **'High Quality'**
  String get highQuality;

  /// No description provided for @storageLocation.
  ///
  /// In en, this message translates to:
  /// **'Storage Location'**
  String get storageLocation;

  /// No description provided for @internalStorage.
  ///
  /// In en, this message translates to:
  /// **'Internal Storage'**
  String get internalStorage;

  /// No description provided for @pushNotifications.
  ///
  /// In en, this message translates to:
  /// **'Push Notifications'**
  String get pushNotifications;

  /// No description provided for @receiveNotifications.
  ///
  /// In en, this message translates to:
  /// **'Receive app notifications'**
  String get receiveNotifications;

  /// No description provided for @notificationPreferences.
  ///
  /// In en, this message translates to:
  /// **'Notification Preferences'**
  String get notificationPreferences;

  /// No description provided for @dataUsage.
  ///
  /// In en, this message translates to:
  /// **'Data Usage'**
  String get dataUsage;

  /// No description provided for @dataSaverMode.
  ///
  /// In en, this message translates to:
  /// **'Data Saver Mode'**
  String get dataSaverMode;

  /// No description provided for @reduceDataUsage.
  ///
  /// In en, this message translates to:
  /// **'Reduce data usage'**
  String get reduceDataUsage;

  /// No description provided for @clearCache.
  ///
  /// In en, this message translates to:
  /// **'Clear Cache'**
  String get clearCache;

  /// No description provided for @noResults.
  ///
  /// In en, this message translates to:
  /// **'No Results'**
  String get noResults;

  /// No description provided for @tryAnotherSearch.
  ///
  /// In en, this message translates to:
  /// **'Try searching with different keywords'**
  String get tryAnotherSearch;

  /// No description provided for @noBooks.
  ///
  /// In en, this message translates to:
  /// **'No books found'**
  String get noBooks;

  /// No description provided for @notAvailable.
  ///
  /// In en, this message translates to:
  /// **'Not Available'**
  String get notAvailable;

  /// No description provided for @relevance.
  ///
  /// In en, this message translates to:
  /// **'Relevance'**
  String get relevance;

  /// No description provided for @popularity.
  ///
  /// In en, this message translates to:
  /// **'Popularity'**
  String get popularity;

  /// No description provided for @newest.
  ///
  /// In en, this message translates to:
  /// **'Newest'**
  String get newest;
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
