// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get signIn => 'Sign In';

  @override
  String get signUp => 'Sign Up';

  @override
  String get welcomeBack => 'Welcome Back';

  @override
  String get createAccount => 'Create Account';

  @override
  String get signUpSubtitle =>
      'Create an account to start your reading journey';

  @override
  String get enterEmail => 'Enter your email';

  @override
  String get enterEmailOrPhone => 'Enter your email or phone number';

  @override
  String get enterPassword => 'Enter your password';

  @override
  String get enterName => 'Enter your name';

  @override
  String get emailOrPhoneLabel => 'Email or Phone';

  @override
  String fieldRequired(String field) {
    return '$field is required';
  }

  @override
  String fieldMinLength(String field, int min) {
    return '$field must be at least $min characters';
  }

  @override
  String fieldMaxLength(String field, int max) {
    return '$field must be less than $max characters';
  }

  @override
  String get invalidEmailAddress => 'Please enter a valid email address';

  @override
  String get invalidPhoneNumber => 'Please enter a valid phone number';

  @override
  String get invalidEmailOrPhone =>
      'Please enter a valid email or phone number';

  @override
  String get passwordRequired => 'Password is required';

  @override
  String get passwordsDoNotMatch => 'Passwords do not match';

  @override
  String get agreeToTermsError => 'You must agree to the terms and conditions';

  @override
  String get forgotPassword => 'Forgot Password?';

  @override
  String get forgotPasswordTitle => 'Forgot password';

  @override
  String get forgotPasswordSubtitle =>
      'Enter your email or phone and we\'ll send you a reset code.';

  @override
  String get sendResetCode => 'Send reset code';

  @override
  String get passwordResetCodeSent => 'Reset code sent';

  @override
  String get resetPasswordTitle => 'Reset password';

  @override
  String get resetPasswordSubtitle =>
      'Enter the reset code and choose a new password.';

  @override
  String get resetTokenLabel => 'Reset code';

  @override
  String get resetTokenHint => 'Enter your reset code';

  @override
  String get newPasswordLabel => 'New password';

  @override
  String get confirmPasswordLabel => 'Confirm password';

  @override
  String get confirmPasswordHint => 'Re-enter your password';

  @override
  String get resetPasswordAction => 'Set new password';

  @override
  String get passwordResetSuccess => 'Password updated successfully';

  @override
  String get dontHaveAccount => 'Don\'t have an account?';

  @override
  String get alreadyHaveAccount => 'Already have an account?';

  @override
  String get orContinueWith => 'Or continue with';

  @override
  String get google => 'Google';

  @override
  String get apple => 'Apple';

  @override
  String get emailLabel => 'Email';

  @override
  String get passwordLabel => 'Password';

  @override
  String get nameLabel => 'Full Name';

  @override
  String get phoneLabel => 'Phone Number';

  @override
  String get verifyPhone => 'Verify Phone';

  @override
  String get enterOtp => 'Enter the code we sent to';

  @override
  String get didntReceiveCode => 'Didn\'t receive code?';

  @override
  String get verifyYourAccount => 'Verify Your Account';

  @override
  String get enterSixDigitCode => 'Enter the 6-digit code sent to';

  @override
  String get verifyAndContinue => 'Verify & Continue';

  @override
  String get resend => 'Resend';

  @override
  String get verify => 'Verify';

  @override
  String get continueButton => 'Continue';

  @override
  String get signInSubtitle => 'Sign in to continue your reading journey';

  @override
  String get rememberMe => 'Remember me';

  @override
  String verificationCodeSent(String contact) {
    return 'Verification code sent to $contact';
  }

  @override
  String authTermsNotice(String terms, String privacy) {
    return 'By continuing, you agree to our $terms and $privacy.';
  }

  @override
  String get onboardingTitle1 => 'Discover African Literature';

  @override
  String get onboardingDesc1 =>
      'Explore thousands of books from African authors and publishers';

  @override
  String get onboardingTitle2 => 'Read Anywhere, Anytime';

  @override
  String get onboardingDesc2 =>
      'Download books and read offline on all your devices';

  @override
  String get onboardingTitle3 => 'Support African Authors';

  @override
  String get onboardingDesc3 =>
      'Your purchases directly support writers and the literary community';

  @override
  String get skip => 'Skip';

  @override
  String get next => 'Next';

  @override
  String get getStarted => 'Get Started';

  @override
  String get goodMorning => 'Good morning';

  @override
  String get goodAfternoon => 'Good afternoon';

  @override
  String get goodEvening => 'Good evening';

  @override
  String get goodNight => 'Good night';

  @override
  String get searchBooksAuthors => 'Search books, authors...';

  @override
  String get continueReading => 'Continue Reading';

  @override
  String get trendingNow => 'Trending Now';

  @override
  String get browseByGenre => 'Browse by Genre';

  @override
  String get newReleases => 'New Releases';

  @override
  String get newRelease => 'New Release';

  @override
  String get seeAll => 'See All';

  @override
  String get hot => 'HOT';

  @override
  String get digital => 'Digital';

  @override
  String booksCount(String count) {
    return '$count books';
  }

  @override
  String get recommendedForYou => 'Recommended For You';

  @override
  String get searchForBooks => 'Search for books...';

  @override
  String foundResults(int count, String query) {
    return 'Found $count results for \"$query\"';
  }

  @override
  String get all => 'All';

  @override
  String get books => 'Books';

  @override
  String get authors => 'Authors';

  @override
  String get publishers => 'Publishers';

  @override
  String get view => 'View';

  @override
  String reviews(String count) {
    return '$count reviews';
  }

  @override
  String get categories => 'Categories';

  @override
  String get fiction => 'Fiction';

  @override
  String get history => 'History';

  @override
  String get poetry => 'Poetry';

  @override
  String get children => 'Children';

  @override
  String get education => 'Education';

  @override
  String get selfHelp => 'Self-Help';

  @override
  String get business => 'Business';

  @override
  String get romance => 'Romance';

  @override
  String get popular => 'Popular';

  @override
  String get newFilter => 'New';

  @override
  String get bestsellers => 'Bestsellers';

  @override
  String get priceLow => 'Price: Low';

  @override
  String booksInCategory(int count, String category) {
    return '$count books in $category';
  }

  @override
  String get nigerianNovelist => 'Nigerian Novelist';

  @override
  String get readers => 'Readers';

  @override
  String get rating => 'Rating';

  @override
  String get followAuthor => 'Follow Author';

  @override
  String get about => 'About';

  @override
  String get popularBooks => 'Popular Books';

  @override
  String get publisher => 'Publisher';

  @override
  String get africanWritersSeries => 'African Writers Series';

  @override
  String get followPublisher => 'Follow Publisher';

  @override
  String get latestReleases => 'Latest Releases';

  @override
  String get trending => 'Trending';

  @override
  String topBooksThisWeek(String country) {
    return 'Top books in $country this week';
  }

  @override
  String get nigeria => 'Nigeria';

  @override
  String get kenya => 'Kenya';

  @override
  String get southAfrica => 'South Africa';

  @override
  String get ghana => 'Ghana';

  @override
  String fromLastWeek(String change) {
    return '$change from last week';
  }

  @override
  String get noChange => 'No change';

  @override
  String get featured => 'Featured';

  @override
  String get collection => 'Collection';

  @override
  String get aboutThisCollection => 'About This Collection';

  @override
  String get booksInCollection => 'Books in This Collection';

  @override
  String get avgRating => 'Avg Rating';

  @override
  String get add => 'Add';

  @override
  String get celebratingPowerfulVoices =>
      'Celebrating powerful voices from across the continent';

  @override
  String authorsCount(int count) {
    return '$count Authors';
  }

  @override
  String get library => 'Library';

  @override
  String get myBooks => 'My Books';

  @override
  String get favorites => 'Favorites';

  @override
  String get downloaded => 'Downloaded';

  @override
  String get profile => 'Profile';

  @override
  String get settings => 'Settings';

  @override
  String get notifications => 'Notifications';

  @override
  String get language => 'Language';

  @override
  String get theme => 'Theme';

  @override
  String get logout => 'Logout';

  @override
  String get home => 'Home';

  @override
  String get explore => 'Explore';

  @override
  String get cancel => 'Cancel';

  @override
  String get ok => 'OK';

  @override
  String get delete => 'Delete';

  @override
  String get edit => 'Edit';

  @override
  String get save => 'Save';

  @override
  String get close => 'Close';

  @override
  String get loading => 'Loading...';

  @override
  String get error => 'Error';

  @override
  String get retry => 'Retry';

  @override
  String get success => 'Success';

  @override
  String get aboutThisBook => 'About This Book';

  @override
  String get chooseFormat => 'Choose Format';

  @override
  String get digitalEdition => 'Digital Edition';

  @override
  String get readOnAnyDevice => 'Instant access • Read anywhere';

  @override
  String get hardcopy => 'Hardcopy';

  @override
  String get printedAndDelivered => 'Printed book • Home delivery';

  @override
  String buyNow(String price) {
    return 'Buy Now - $price';
  }

  @override
  String get readFreePreview => 'Read Free Preview';

  @override
  String get pages => 'Pages';

  @override
  String get genre => 'Genre';

  @override
  String get published => 'Published';

  @override
  String get previewMode => 'Preview Mode';

  @override
  String get limitedPages => 'Limited Pages';

  @override
  String get buyFullBook => 'Buy Full Book';

  @override
  String get preview => 'Preview';

  @override
  String get previewEndsHere => 'Preview Ends Here';

  @override
  String purchaseFullBook(int pages) {
    return 'Purchase the full book to continue reading all $pages pages';
  }

  @override
  String buyFor(String price) {
    return 'Buy for $price';
  }

  @override
  String get chapter => 'Chapter';

  @override
  String get contents => 'Contents';

  @override
  String get bookmark => 'Bookmark';

  @override
  String get highlight => 'Highlight';

  @override
  String get readingSettings => 'Reading Settings';

  @override
  String get fontSize => 'Font Size';

  @override
  String get readingTheme => 'Reading Theme';

  @override
  String get dark => 'Dark';

  @override
  String get light => 'Light';

  @override
  String get sepia => 'Sepia';

  @override
  String get fontFamily => 'Font Family';

  @override
  String get serif => 'Serif';

  @override
  String get sansSerif => 'Sans-Serif';

  @override
  String get lineSpacing => 'Line Spacing';

  @override
  String get compact => 'Compact';

  @override
  String get relaxed => 'Relaxed';

  @override
  String get autoScroll => 'Auto-Scroll';

  @override
  String get automaticallyScrollPages => 'Automatically scroll pages';

  @override
  String get tableOfContents => 'Table of Contents';

  @override
  String chapters(int count) {
    return '$count Chapters';
  }

  @override
  String get currentlyReading => 'Currently reading';

  @override
  String complete(int percent) {
    return '$percent% complete';
  }

  @override
  String pagesCount(int count) {
    return '$count pages';
  }

  @override
  String get highlightsAndNotes => 'Highlights & Notes';

  @override
  String items(int count) {
    return '$count items';
  }

  @override
  String get highlights => 'Highlights';

  @override
  String get notes => 'Notes';

  @override
  String get bookmarks => 'Bookmarks';

  @override
  String get share => 'Share';

  @override
  String get bookmarkedPage => 'Bookmarked Page';

  @override
  String get goToPage => 'Go to Page';

  @override
  String daysAgo(int count) {
    return '$count days ago';
  }

  @override
  String weeksAgo(int count) {
    return '$count weeks ago';
  }

  @override
  String get readingProgress => 'Reading Progress';

  @override
  String get pagesRead => 'Pages Read';

  @override
  String get pagesLeft => 'Pages Left';

  @override
  String get timeLeft => 'Time Left';

  @override
  String get thisWeek => 'This Week';

  @override
  String get readingTime => 'Reading Time';

  @override
  String get dayStreak => 'Day Streak';

  @override
  String get booksFinished => 'Books Finished';

  @override
  String get dailyActivity => 'Daily Activity';

  @override
  String get weeklyGoal => 'Weekly Goal';

  @override
  String hours(String count) {
    return '$count hours';
  }

  @override
  String minutes(String count) {
    return '$count minutes';
  }

  @override
  String get readingSessions => 'Reading Sessions';

  @override
  String get noReadingSessionsYet => 'No reading sessions yet';

  @override
  String hoursLeft(String count) {
    return '$count hours left to reach your goal';
  }

  @override
  String get offlineStorage => 'Offline Storage';

  @override
  String get storageUsed => 'Storage Used';

  @override
  String gbOf(String used, String total) {
    return '$used of $total';
  }

  @override
  String available(String size) {
    return '$size available';
  }

  @override
  String get manage => 'Manage';

  @override
  String get downloadedBooks => 'Downloaded Books';

  @override
  String booksLowercase(int count) {
    return '$count books';
  }

  @override
  String get downloadedStatus => 'Downloaded';

  @override
  String get yourReadingStats => 'Your Reading Stats';

  @override
  String readingChallenge(int year) {
    return '$year Reading Challenge';
  }

  @override
  String booksRead(int count) {
    return '$count Books';
  }

  @override
  String booksAheadOfGoal(int count) {
    return '$count books ahead of your goal';
  }

  @override
  String percentComplete(int percent) {
    return '$percent% complete';
  }

  @override
  String booksToGo(int count) {
    return '$count books to go';
  }

  @override
  String get thisMonth => 'This Month';

  @override
  String get pagesReadLabel => 'Pages Read';

  @override
  String get readingTimeLabel => 'Reading Time';

  @override
  String get favoriteGenres => 'Favorite Genres';

  @override
  String get recentlyFinished => 'Recently Finished';

  @override
  String finishedAgo(int days) {
    return 'Finished $days days ago';
  }

  @override
  String get offlineReading => 'Offline reading';

  @override
  String get syncAcrossDevices => 'Sync across devices';

  @override
  String get highlightsNotes => 'Highlights & notes';

  @override
  String get premiumPaperQuality => 'Premium paper quality';

  @override
  String get deliveryInDays => 'Delivery in 3-5 days';

  @override
  String get freeShipping => 'Free shipping';

  @override
  String get continueToCheckout => 'Continue to Checkout';

  @override
  String get checkout => 'Checkout';

  @override
  String get orderSummary => 'Order Summary';

  @override
  String get subtotal => 'Subtotal';

  @override
  String get processingFee => 'Processing Fee';

  @override
  String get total => 'Total';

  @override
  String get promoCode => 'Promo Code';

  @override
  String get enterCode => 'Enter code';

  @override
  String get apply => 'Apply';

  @override
  String get securePayment => 'Secure Payment';

  @override
  String get securePaymentDesc =>
      'Your payment information is encrypted and secure. We support all major mobile money providers.';

  @override
  String get proceedToPayment => 'Proceed to Payment';

  @override
  String get paymentMethod => 'Payment Method';

  @override
  String get mobileMoney => 'Mobile Money';

  @override
  String get mtnMobileMoney => 'MTN Mobile Money';

  @override
  String get fastSecurePayment => 'Fast & secure payment';

  @override
  String get orangeMoney => 'Orange Money';

  @override
  String get instantTransfer => 'Instant transfer';

  @override
  String get airtelMoney => 'Airtel Money';

  @override
  String get quickCheckout => 'Quick checkout';

  @override
  String get mPesa => 'M-Pesa';

  @override
  String get trustedPayment => 'Trusted payment';

  @override
  String get enterPhoneNumber => 'Enter Phone Number';

  @override
  String get phoneNumberPlaceholder => '+233 XX XXX XXXX';

  @override
  String get paymentPromptMessage =>
      'You\'ll receive a prompt to approve the payment';

  @override
  String get totalAmount => 'Total Amount';

  @override
  String get payNow => 'Pay Now';

  @override
  String get processingPayment => 'Processing Payment';

  @override
  String checkPhoneApprove(String provider) {
    return 'Please check your phone and approve the payment request from $provider';
  }

  @override
  String get amount => 'Amount';

  @override
  String get phoneNumber => 'Phone Number';

  @override
  String get reference => 'Reference';

  @override
  String get cancelPayment => 'Cancel Payment';

  @override
  String get paymentSuccessful => 'Payment Successful!';

  @override
  String get bookAddedToLibrary =>
      'Your book has been added to your library. Start reading now!';

  @override
  String get amountPaid => 'Amount Paid';

  @override
  String get transactionId => 'Transaction ID';

  @override
  String get date => 'Date';

  @override
  String get startReading => 'Start Reading';

  @override
  String get viewReceipt => 'View Receipt';

  @override
  String get myOrders => 'My Orders';

  @override
  String get filter => 'Filter';

  @override
  String get orderFilter => 'Order #';

  @override
  String get completed => 'Completed';

  @override
  String get readNow => 'Read Now';

  @override
  String get inTransit => 'In Transit';

  @override
  String get trackOrder => 'Track Order';

  @override
  String get contactSupport => 'Contact Support';

  @override
  String get delivered => 'Delivered';

  @override
  String get rateAndReview => 'Rate & Review';

  @override
  String get buyAgain => 'Buy Again';

  @override
  String get trackOrderTitle => 'Track Order';

  @override
  String placedOn(String date) {
    return 'Placed on $date';
  }

  @override
  String get estimatedDelivery => 'Estimated Delivery';

  @override
  String orderWillArriveIn(int days) {
    return 'Your order will arrive in $days days';
  }

  @override
  String get trackingHistory => 'Tracking History';

  @override
  String get outForDelivery => 'Out for Delivery';

  @override
  String get packageOnTheWay => 'Your package is on the way';

  @override
  String get inTransitStatus => 'In Transit';

  @override
  String get arrivedAtSortingFacility => 'Package arrived at sorting facility';

  @override
  String get shipped => 'Shipped';

  @override
  String get pickedUpByCourier => 'Package picked up by courier';

  @override
  String get processing => 'Processing';

  @override
  String get orderBeingPrepared => 'Your order is being prepared';

  @override
  String get orderConfirmed => 'Order Confirmed';

  @override
  String get paymentReceived => 'Payment received successfully';

  @override
  String get deliveryAddress => 'Delivery Address';

  @override
  String get editProfile => 'Edit Profile';

  @override
  String get fullName => 'Full Name';

  @override
  String get username => 'Username';

  @override
  String get bio => 'Bio';

  @override
  String get email => 'Email';

  @override
  String get location => 'Location';

  @override
  String get readingPreferences => 'Reading Preferences';

  @override
  String get followers => 'Followers';

  @override
  String get following => 'Following';

  @override
  String get activity => 'Activity';

  @override
  String get tellUsAboutYourself => 'Tell us about yourself...';

  @override
  String get biography => 'Biography';

  @override
  String get addNewPreference => '+ Add';

  @override
  String get saveChanges => 'Save Changes';

  @override
  String get savedQuotes => 'Saved Quotes';

  @override
  String get page => 'Page';

  @override
  String savedAgo(String time) {
    return 'Saved $time ago';
  }

  @override
  String get forYou => 'For You';

  @override
  String get bookClubs => 'Book Clubs';

  @override
  String likes(int count) {
    return '$count likes';
  }

  @override
  String comments(int count) {
    return '$count comments';
  }

  @override
  String get reply => 'Reply';

  @override
  String get attachBook => 'Attach Book';

  @override
  String get addPhotos => 'Add Photos';

  @override
  String get createPoll => 'Create Poll';

  @override
  String get tagBookClub => 'Tag Book Club';

  @override
  String get post => 'Post';

  @override
  String get whatsOnYourMind => 'What\'s on your mind?';

  @override
  String get postTooltip => 'Share a post';

  @override
  String get writeComment => 'Write a comment...';

  @override
  String get attachedBook => 'Attached Book';

  @override
  String get removeAttachment => 'Remove';

  @override
  String get markAllRead => 'Mark All as Read';

  @override
  String get mentions => 'Mentions';

  @override
  String get likesTab => 'Likes';

  @override
  String get commentsTab => 'Comments';

  @override
  String get noNotifications => 'No notifications';

  @override
  String get noNotificationsMessage => 'You\'re all caught up.';

  @override
  String get startedFollowing => 'started following you';

  @override
  String get likedYourPost => 'liked your post';

  @override
  String get commentedOnPost => 'commented on your post';

  @override
  String get repliedToComment => 'replied to your comment';

  @override
  String get mentionedYou => 'mentioned you in a post';

  @override
  String newBookAdded(String category) {
    return 'New book added to $category';
  }

  @override
  String newDiscussion(String clubName) {
    return 'New discussion in $clubName';
  }

  @override
  String achievementUnlocked(String achievement) {
    return 'Achievement unlocked: $achievement';
  }

  @override
  String flashSaleAlert(String bookTitle, int percent) {
    return '$bookTitle is $percent% off!';
  }

  @override
  String get just => 'Just now';

  @override
  String minutesAgo(int count) {
    return '${count}m ago';
  }

  @override
  String hoursAgo(int count) {
    return '${count}h ago';
  }

  @override
  String daysAgoShort(int count) {
    return '${count}d ago';
  }

  @override
  String weeksAgoShort(int count) {
    return '${count}w ago';
  }

  @override
  String get viewProfile => 'View Profile';

  @override
  String get account => 'Account';

  @override
  String get accountSettings => 'Account Settings';

  @override
  String get privacySecurity => 'Privacy & Security';

  @override
  String get app => 'App';

  @override
  String get appPreferences => 'App Preferences';

  @override
  String get storageDownloads => 'Storage & Downloads';

  @override
  String get languageRegion => 'Language & Region';

  @override
  String get support => 'Support';

  @override
  String get helpSupport => 'Help & Support';

  @override
  String get aboutLoni => 'About Loni';

  @override
  String get logOut => 'Log Out';

  @override
  String get personalInformation => 'Personal Information';

  @override
  String get dateOfBirth => 'Date of Birth';

  @override
  String get accountManagement => 'Account Management';

  @override
  String get changePassword => 'Change Password';

  @override
  String get connectedAccounts => 'Connected Accounts';

  @override
  String get paymentMethods => 'Payment Methods';

  @override
  String get subscription => 'Subscription';

  @override
  String get premium => 'Premium';

  @override
  String get dangerZone => 'Danger Zone';

  @override
  String get deactivateAccount => 'Deactivate Account';

  @override
  String get deleteAccount => 'Delete Account';

  @override
  String get security => 'Security';

  @override
  String get biometricAuth => 'Biometric Authentication';

  @override
  String get biometricAuthDesc => 'Use fingerprint or face ID to unlock';

  @override
  String get twoFactorAuth => 'Two-Factor Authentication';

  @override
  String get twoFactorAuthDesc => 'Add an extra layer of security';

  @override
  String get activeSessions => 'Active Sessions';

  @override
  String get loginHistory => 'Login History';

  @override
  String get privacy => 'Privacy';

  @override
  String get profileVisibility => 'Profile Visibility';

  @override
  String get publicVisibility => 'Public';

  @override
  String get readingActivity => 'Reading Activity';

  @override
  String get visibleToFollowers => 'Visible to followers';

  @override
  String get blockedUsers => 'Blocked Users';

  @override
  String get mutedConversations => 'Muted Conversations';

  @override
  String get dataPermissions => 'Data & Permissions';

  @override
  String get downloadYourData => 'Download Your Data';

  @override
  String get appPermissions => 'App Permissions';

  @override
  String get privacyPolicy => 'Privacy Policy';

  @override
  String get termsOfService => 'Terms of Service';

  @override
  String get authPreferences => 'Preferences';

  @override
  String get preferredGenres => 'Preferred Genres';

  @override
  String get preferredGenresHint => 'Comma-separated (e.g., fiction, romance)';

  @override
  String get preferredLanguages => 'Preferred Languages';

  @override
  String get preferredLanguagesHint => 'Comma-separated (e.g., en, fr)';

  @override
  String get allowEmailUpdates => 'Allow email updates';

  @override
  String get allowSmsUpdates => 'Allow SMS updates';

  @override
  String get allowPushNotifications => 'Allow push notifications';

  @override
  String get readingThemeSystem => 'System';

  @override
  String get readingThemeLight => 'Light';

  @override
  String get readingThemeDark => 'Dark';

  @override
  String get textScale => 'Text Size';

  @override
  String get textScaleSmall => 'Small';

  @override
  String get textScaleNormal => 'Normal';

  @override
  String get textScaleLarge => 'Large';

  @override
  String get dyslexicFont => 'Dyslexic-friendly font';

  @override
  String get highContrast => 'High contrast';

  @override
  String get authConsents => 'Consents';

  @override
  String get consentMarketingEmail => 'Marketing emails';

  @override
  String get consentMarketingSms => 'Marketing SMS';

  @override
  String get consentPersonalization => 'Personalization';

  @override
  String get parentalControls => 'Parental Controls';

  @override
  String get parentalControlsEnabled => 'Enable parental controls';

  @override
  String get parentalContentRating => 'Content rating';

  @override
  String get parentalPin => 'Parental PIN';

  @override
  String get parentalPinHint => 'Enter a new PIN (optional)';

  @override
  String get parentalClearPin => 'Clear existing PIN';

  @override
  String get parentalRatingKids => 'Kids';

  @override
  String get parentalRatingTeen => 'Teen';

  @override
  String get parentalRatingMature => 'Mature';

  @override
  String get devices => 'Devices';

  @override
  String get registerThisDevice => 'Register this device';

  @override
  String get noDevices => 'No devices';

  @override
  String get noDevicesDesc => 'No registered devices found.';

  @override
  String get purchaseHistory => 'Purchase History';

  @override
  String get noPurchases => 'No purchases';

  @override
  String get noPurchasesDesc => 'No purchases found.';

  @override
  String get refresh => 'Refresh';

  @override
  String get changesSaved => 'Changes saved';

  @override
  String get noActiveSessions => 'No active sessions';

  @override
  String get noActiveSessionsDesc => 'No active sessions found.';

  @override
  String get revoke => 'Revoke';

  @override
  String get revokeSessionTitle => 'Revoke session';

  @override
  String get revokeSessionMessage =>
      'This will sign that session out. Continue?';

  @override
  String get sessionRevoked => 'Session revoked';

  @override
  String get deleteDeviceTitle => 'Delete device';

  @override
  String get deleteDeviceMessage =>
      'This will remove the device from your account. Continue?';

  @override
  String get deviceDeleted => 'Device deleted';

  @override
  String get deviceRegistered => 'Device registered';

  @override
  String get privacyRequestsDesc =>
      'Request an export of your profile and metadata, or request account deletion.';

  @override
  String get requestAccountDeletion => 'Request account deletion';

  @override
  String get requestAccountDeletionTitle => 'Request account deletion';

  @override
  String get requestAccountDeletionMessage =>
      'This will start the account deletion process. Continue?';

  @override
  String get exportRequested => 'Export requested';

  @override
  String exportRequestedWithId(Object id) {
    return 'Export requested (ID: $id)';
  }

  @override
  String get deletionRequested => 'Deletion requested';

  @override
  String deletionRequestedWithId(Object id) {
    return 'Deletion requested (ID: $id)';
  }

  @override
  String get searchHelpArticles => 'Search Help Articles';

  @override
  String get findAnswers => 'Find answers to common questions';

  @override
  String get whatCanWeHelp => 'What can we help you with?';

  @override
  String get quickActions => 'Quick Actions';

  @override
  String get liveChat => 'Live Chat';

  @override
  String get emailUs => 'Email Us';

  @override
  String get callSupport => 'Call Support';

  @override
  String get userGuide => 'User Guide';

  @override
  String get popularTopics => 'Popular Topics';

  @override
  String get howToDownloadBooks => 'How to download books';

  @override
  String get paymentMethodsHelp => 'Payment methods';

  @override
  String get refundPolicy => 'Refund policy';

  @override
  String get premiumSubscription => 'Premium subscription';

  @override
  String get shippingDelivery => 'Shipping & delivery';

  @override
  String get contactInformation => 'Contact Information';

  @override
  String get supportEmail => 'support@loni.com';

  @override
  String get supportPhone => '+233 30 123 4567';

  @override
  String get supportHours => 'Mon-Fri: 8AM - 6PM GMT';

  @override
  String get version => 'Version';

  @override
  String get copyright => '© 2024 Loni LLC. All rights reserved.';

  @override
  String get ourMission => 'Our Mission';

  @override
  String get missionStatement =>
      'Loni is dedicated to promoting African literature and connecting readers with the rich tapestry of stories from across the continent. We believe in the power of books to educate, inspire, and transform lives.';

  @override
  String get appInformation => 'App Information';

  @override
  String get whatsNew => 'What\'s New';

  @override
  String get releaseNotes => 'Release Notes';

  @override
  String get licenses => 'Licenses';

  @override
  String get legal => 'Legal';

  @override
  String get cookiePolicy => 'Cookie Policy';

  @override
  String get followUs => 'Follow Us';

  @override
  String get rateLoniOnAppStore => 'Rate Loni on App Store';

  @override
  String get appearance => 'Appearance';

  @override
  String get darkMode => 'Dark Mode';

  @override
  String get lightMode => 'Light Mode';

  @override
  String get medium => 'Medium';

  @override
  String get displayLanguage => 'Display Language';

  @override
  String get english => 'English';

  @override
  String get reading => 'Reading';

  @override
  String get pageTurnAnimation => 'Page Turn Animation';

  @override
  String get slide => 'Slide';

  @override
  String get screenBrightness => 'Screen Brightness';

  @override
  String get autoAdjustBrightness => 'Auto-adjust while reading';

  @override
  String get keepScreenAwake => 'Keep Screen Awake';

  @override
  String get preventScreenTimeout => 'Prevent screen timeout while reading';

  @override
  String get downloads => 'Downloads';

  @override
  String get autoDownload => 'Auto-Download';

  @override
  String get autoDownloadDesc => 'Download purchased books automatically';

  @override
  String get downloadQuality => 'Download Quality';

  @override
  String get highQuality => 'High Quality';

  @override
  String get storageLocation => 'Storage Location';

  @override
  String get internalStorage => 'Internal Storage';

  @override
  String get pushNotifications => 'Push Notifications';

  @override
  String get receiveNotifications => 'Receive app notifications';

  @override
  String get notificationPreferences => 'Notification Preferences';

  @override
  String get dataUsage => 'Data Usage';

  @override
  String get dataSaverMode => 'Data Saver Mode';

  @override
  String get reduceDataUsage => 'Reduce data usage';

  @override
  String get clearCache => 'Clear Cache';

  @override
  String get noResults => 'No Results';

  @override
  String get tryAnotherSearch => 'Try searching with different keywords';

  @override
  String get noBooks => 'No books found';

  @override
  String get notAvailable => 'Not Available';

  @override
  String get relevance => 'Relevance';

  @override
  String get popularity => 'Popularity';

  @override
  String get newest => 'Newest';
}
