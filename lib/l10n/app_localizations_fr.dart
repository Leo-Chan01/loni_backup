// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for French (`fr`).
class AppLocalizationsFr extends AppLocalizations {
  AppLocalizationsFr([String locale = 'fr']) : super(locale);

  @override
  String get signIn => 'Se connecter';

  @override
  String get signUp => 'S\'inscrire';

  @override
  String get welcomeBack => 'Bon retour';

  @override
  String get createAccount => 'Créer un compte';

  @override
  String get enterEmail => 'Entrez votre email';

  @override
  String get enterPassword => 'Entrez votre mot de passe';

  @override
  String get enterName => 'Entrez votre nom';

  @override
  String get forgotPassword => 'Mot de passe oublié?';

  @override
  String get dontHaveAccount => 'Vous n\'avez pas de compte?';

  @override
  String get alreadyHaveAccount => 'Vous avez déjà un compte?';

  @override
  String get orContinueWith => 'Ou continuer avec';

  @override
  String get google => 'Google';

  @override
  String get apple => 'Apple';

  @override
  String get emailLabel => 'Email';

  @override
  String get passwordLabel => 'Mot de passe';

  @override
  String get nameLabel => 'Nom complet';

  @override
  String get phoneLabel => 'Numéro de téléphone';

  @override
  String get verifyPhone => 'Vérifier le téléphone';

  @override
  String get enterOtp => 'Entrez le code que nous avons envoyé à';

  @override
  String get didntReceiveCode => 'Vous n\'avez pas reçu le code?';

  @override
  String get verifyYourAccount => 'Vérifiez votre compte';

  @override
  String get enterSixDigitCode => 'Entrez le code à 6 chiffres envoyé à';

  @override
  String get verifyAndContinue => 'Vérifier et continuer';

  @override
  String get resend => 'Renvoyer';

  @override
  String get verify => 'Vérifier';

  @override
  String get continueButton => 'Continuer';

  @override
  String get onboardingTitle1 => 'Découvrez la littérature africaine';

  @override
  String get onboardingDesc1 =>
      'Explorez des milliers de livres d\'auteurs et d\'éditeurs africains';

  @override
  String get onboardingTitle2 => 'Lisez partout, à tout moment';

  @override
  String get onboardingDesc2 =>
      'Téléchargez des livres et lisez hors ligne sur tous vos appareils';

  @override
  String get onboardingTitle3 => 'Soutenez les auteurs africains';

  @override
  String get onboardingDesc3 =>
      'Vos achats soutiennent directement les écrivains et la communauté littéraire';

  @override
  String get skip => 'Passer';

  @override
  String get next => 'Suivant';

  @override
  String get getStarted => 'Commencer';

  @override
  String get goodMorning => 'Bonjour';

  @override
  String get goodAfternoon => 'Bon après-midi';

  @override
  String get goodEvening => 'Bonsoir';

  @override
  String get goodNight => 'Bonne nuit';

  @override
  String get searchBooksAuthors => 'Rechercher des livres, des auteurs...';

  @override
  String get continueReading => 'Continuer la lecture';

  @override
  String get trendingNow => 'Tendances actuelles';

  @override
  String get browseByGenre => 'Parcourir par genre';

  @override
  String get newReleases => 'Nouvelles sorties';

  @override
  String get seeAll => 'Voir tout';

  @override
  String get hot => 'POPULAIRE';

  @override
  String get digital => 'Numérique';

  @override
  String booksCount(String count) {
    return '$count livres';
  }

  @override
  String get searchForBooks => 'Rechercher des livres...';

  @override
  String foundResults(int count, String query) {
    return '$count résultats trouvés pour \"$query\"';
  }

  @override
  String get all => 'Tous';

  @override
  String get books => 'Livres';

  @override
  String get authors => 'Auteurs';

  @override
  String get publishers => 'Éditeurs';

  @override
  String get view => 'Voir';

  @override
  String reviews(String count) {
    return '$count avis';
  }

  @override
  String get categories => 'Catégories';

  @override
  String get fiction => 'Fiction';

  @override
  String get history => 'Histoire';

  @override
  String get poetry => 'Poésie';

  @override
  String get children => 'Enfants';

  @override
  String get education => 'Éducation';

  @override
  String get selfHelp => 'Développement personnel';

  @override
  String get business => 'Affaires';

  @override
  String get romance => 'Romance';

  @override
  String get popular => 'Populaire';

  @override
  String get newFilter => 'Nouveau';

  @override
  String get bestsellers => 'Meilleures ventes';

  @override
  String get priceLow => 'Prix: Bas';

  @override
  String booksInCategory(int count, String category) {
    return '$count livres dans $category';
  }

  @override
  String get nigerianNovelist => 'Romancier nigérian';

  @override
  String get readers => 'Lecteurs';

  @override
  String get rating => 'Note';

  @override
  String get followAuthor => 'Suivre l\'auteur';

  @override
  String get about => 'À propos';

  @override
  String get popularBooks => 'Livres populaires';

  @override
  String get publisher => 'Éditeur';

  @override
  String get africanWritersSeries => 'Série des écrivains africains';

  @override
  String get followPublisher => 'Suivre l\'éditeur';

  @override
  String get latestReleases => 'Dernières sorties';

  @override
  String get trending => 'Tendances';

  @override
  String topBooksThisWeek(String country) {
    return 'Meilleurs livres de cette semaine en $country';
  }

  @override
  String get nigeria => 'Nigeria';

  @override
  String get kenya => 'Kenya';

  @override
  String get southAfrica => 'Afrique du Sud';

  @override
  String get ghana => 'Ghana';

  @override
  String fromLastWeek(String change) {
    return '$change depuis la semaine dernière';
  }

  @override
  String get noChange => 'Aucun changement';

  @override
  String get featured => 'En vedette';

  @override
  String get collection => 'Collection';

  @override
  String get aboutThisCollection => 'À propos de cette collection';

  @override
  String get booksInCollection => 'Livres dans cette collection';

  @override
  String get avgRating => 'Note moyenne';

  @override
  String get add => 'Ajouter';

  @override
  String get celebratingPowerfulVoices =>
      'Célébrer des voix puissantes de tout le continent';

  @override
  String authorsCount(int count) {
    return '$count Auteurs';
  }

  @override
  String get library => 'Bibliothèque';

  @override
  String get myBooks => 'Mes livres';

  @override
  String get favorites => 'Favoris';

  @override
  String get downloaded => 'Téléchargés';

  @override
  String get profile => 'Profil';

  @override
  String get settings => 'Paramètres';

  @override
  String get notifications => 'Notifications';

  @override
  String get language => 'Langue';

  @override
  String get theme => 'Thème';

  @override
  String get logout => 'Déconnexion';

  @override
  String get home => 'Accueil';

  @override
  String get explore => 'Explorer';

  @override
  String get cancel => 'Annuler';

  @override
  String get ok => 'OK';

  @override
  String get delete => 'Supprimer';

  @override
  String get edit => 'Modifier';

  @override
  String get save => 'Enregistrer';

  @override
  String get close => 'Fermer';

  @override
  String get loading => 'Chargement...';

  @override
  String get error => 'Erreur';

  @override
  String get retry => 'Réessayer';

  @override
  String get success => 'Succès';

  @override
  String get aboutThisBook => 'À propos de ce livre';

  @override
  String get chooseFormat => 'Choisir le format';

  @override
  String get digitalEdition => 'Édition numérique';

  @override
  String get readOnAnyDevice => 'Accès instantané • Lisez partout';

  @override
  String get hardcopy => 'Copie papier';

  @override
  String get printedAndDelivered => 'Livre imprimé • Livraison à domicile';

  @override
  String buyNow(String price) {
    return 'Acheter maintenant - $price';
  }

  @override
  String get readFreePreview => 'Lire l\'aperçu gratuit';

  @override
  String get pages => 'Pages';

  @override
  String get genre => 'Genre';

  @override
  String get published => 'Publié';

  @override
  String get previewMode => 'Mode aperçu';

  @override
  String get limitedPages => 'Pages limitées';

  @override
  String get buyFullBook => 'Acheter le livre complet';

  @override
  String get preview => 'Aperçu';

  @override
  String get previewEndsHere => 'L\'aperçu se termine ici';

  @override
  String purchaseFullBook(int pages) {
    return 'Achetez le livre complet pour continuer à lire les $pages pages';
  }

  @override
  String buyFor(String price) {
    return 'Acheter pour $price';
  }

  @override
  String get chapter => 'Chapitre';

  @override
  String get contents => 'Sommaire';

  @override
  String get bookmark => 'Marque-page';

  @override
  String get highlight => 'Surligner';

  @override
  String get readingSettings => 'Paramètres de lecture';

  @override
  String get fontSize => 'Taille de police';

  @override
  String get readingTheme => 'Thème de lecture';

  @override
  String get dark => 'Sombre';

  @override
  String get light => 'Clair';

  @override
  String get sepia => 'Sépia';

  @override
  String get fontFamily => 'Famille de polices';

  @override
  String get serif => 'Serif';

  @override
  String get sansSerif => 'Sans-Serif';

  @override
  String get lineSpacing => 'Interligne';

  @override
  String get compact => 'Compact';

  @override
  String get relaxed => 'Détendu';

  @override
  String get autoScroll => 'Défilement auto';

  @override
  String get automaticallyScrollPages =>
      'Faire défiler automatiquement les pages';

  @override
  String get tableOfContents => 'Table des matières';

  @override
  String chapters(int count) {
    return '$count Chapitres';
  }

  @override
  String get currentlyReading => 'En cours de lecture';

  @override
  String complete(int percent) {
    return '$percent% terminé';
  }

  @override
  String pagesCount(int count) {
    return '$count pages';
  }

  @override
  String get highlightsAndNotes => 'Surlignages et notes';

  @override
  String items(int count) {
    return '$count éléments';
  }

  @override
  String get highlights => 'Surlignages';

  @override
  String get notes => 'Notes';

  @override
  String get bookmarks => 'Marque-pages';

  @override
  String get share => 'Partager';

  @override
  String get bookmarkedPage => 'Page marquée';

  @override
  String get goToPage => 'Aller à la page';

  @override
  String daysAgo(int count) {
    return 'il y a $count jours';
  }

  @override
  String weeksAgo(int count) {
    return 'il y a $count semaines';
  }

  @override
  String get readingProgress => 'Progrès de lecture';

  @override
  String get pagesRead => 'Pages lues';

  @override
  String get pagesLeft => 'Pages restantes';

  @override
  String get timeLeft => 'Temps restant';

  @override
  String get thisWeek => 'Cette semaine';

  @override
  String get readingTime => 'Temps de lecture';

  @override
  String get dayStreak => 'Jours consécutifs';

  @override
  String get booksFinished => 'Livres terminés';

  @override
  String get dailyActivity => 'Activité quotidienne';

  @override
  String get weeklyGoal => 'Objectif hebdomadaire';

  @override
  String hours(String count) {
    return '$count heures';
  }

  @override
  String hoursLeft(String count) {
    return '$count heures restantes pour atteindre votre objectif';
  }

  @override
  String get offlineStorage => 'Stockage hors ligne';

  @override
  String get storageUsed => 'Stockage utilisé';

  @override
  String gbOf(String used, String total) {
    return '$used sur $total';
  }

  @override
  String available(String size) {
    return '$size disponible';
  }

  @override
  String get manage => 'Gérer';

  @override
  String get downloadedBooks => 'Livres téléchargés';

  @override
  String booksLowercase(int count) {
    return '$count livres';
  }

  @override
  String get downloadedStatus => 'Téléchargé';

  @override
  String get yourReadingStats => 'Vos statistiques de lecture';

  @override
  String readingChallenge(int year) {
    return 'Défi de lecture $year';
  }

  @override
  String booksRead(int count) {
    return '$count livres';
  }

  @override
  String booksAheadOfGoal(int count) {
    return '$count livres en avance sur votre objectif';
  }

  @override
  String percentComplete(int percent) {
    return '$percent% terminé';
  }

  @override
  String booksToGo(int count) {
    return '$count livres restants';
  }

  @override
  String get thisMonth => 'Ce mois-ci';

  @override
  String get pagesReadLabel => 'Pages lues';

  @override
  String get readingTimeLabel => 'Temps de lecture';

  @override
  String get favoriteGenres => 'Genres préférés';

  @override
  String get recentlyFinished => 'Terminés récemment';

  @override
  String finishedAgo(int days) {
    return 'Terminé il y a $days jours';
  }

  @override
  String get offlineReading => 'Lecture hors ligne';

  @override
  String get syncAcrossDevices => 'Synchronisation sur tous les appareils';

  @override
  String get highlightsNotes => 'Surlignages et notes';

  @override
  String get premiumPaperQuality => 'Papier de qualité premium';

  @override
  String get deliveryInDays => 'Livraison en 3-5 jours';

  @override
  String get freeShipping => 'Livraison gratuite';

  @override
  String get continueToCheckout => 'Continuer vers le paiement';

  @override
  String get checkout => 'Paiement';

  @override
  String get orderSummary => 'Récapitulatif de la commande';

  @override
  String get subtotal => 'Sous-total';

  @override
  String get processingFee => 'Frais de traitement';

  @override
  String get total => 'Total';

  @override
  String get promoCode => 'Code promo';

  @override
  String get enterCode => 'Entrez le code';

  @override
  String get apply => 'Appliquer';

  @override
  String get securePayment => 'Paiement sécurisé';

  @override
  String get securePaymentDesc =>
      'Vos informations de paiement sont cryptées et sécurisées. Nous prenons en charge tous les principaux fournisseurs de paiement mobile.';

  @override
  String get proceedToPayment => 'Procéder au paiement';

  @override
  String get paymentMethod => 'Méthode de paiement';

  @override
  String get mobileMoney => 'Argent mobile';

  @override
  String get mtnMobileMoney => 'MTN Mobile Money';

  @override
  String get fastSecurePayment => 'Paiement rapide et sécurisé';

  @override
  String get orangeMoney => 'Orange Money';

  @override
  String get instantTransfer => 'Transfert instantané';

  @override
  String get airtelMoney => 'Airtel Money';

  @override
  String get quickCheckout => 'Paiement rapide';

  @override
  String get mPesa => 'M-Pesa';

  @override
  String get trustedPayment => 'Paiement de confiance';

  @override
  String get enterPhoneNumber => 'Entrez le numéro de téléphone';

  @override
  String get phoneNumberPlaceholder => '+233 XX XXX XXXX';

  @override
  String get paymentPromptMessage =>
      'Vous recevrez une invite pour approuver le paiement';

  @override
  String get totalAmount => 'Montant total';

  @override
  String get payNow => 'Payer maintenant';

  @override
  String get processingPayment => 'Traitement du paiement';

  @override
  String checkPhoneApprove(String provider) {
    return 'Veuillez vérifier votre téléphone et approuver la demande de paiement de $provider';
  }

  @override
  String get amount => 'Montant';

  @override
  String get phoneNumber => 'Numéro de téléphone';

  @override
  String get reference => 'Référence';

  @override
  String get cancelPayment => 'Annuler le paiement';

  @override
  String get paymentSuccessful => 'Paiement réussi!';

  @override
  String get bookAddedToLibrary =>
      'Votre livre a été ajouté à votre bibliothèque. Commencez à lire maintenant!';

  @override
  String get amountPaid => 'Montant payé';

  @override
  String get transactionId => 'ID de transaction';

  @override
  String get date => 'Date';

  @override
  String get startReading => 'Commencer à lire';

  @override
  String get viewReceipt => 'Voir le reçu';

  @override
  String get myOrders => 'Mes commandes';

  @override
  String get filter => 'Filtrer';

  @override
  String get orderFilter => 'Commande #';

  @override
  String get completed => 'Terminé';

  @override
  String get readNow => 'Lire maintenant';

  @override
  String get inTransit => 'En transit';

  @override
  String get trackOrder => 'Suivre la commande';

  @override
  String get contactSupport => 'Contacter le support';

  @override
  String get delivered => 'Livré';

  @override
  String get rateAndReview => 'Noter et commenter';

  @override
  String get buyAgain => 'Acheter à nouveau';

  @override
  String get trackOrderTitle => 'Suivre la commande';

  @override
  String placedOn(String date) {
    return 'Passée le $date';
  }

  @override
  String get estimatedDelivery => 'Livraison estimée';

  @override
  String orderWillArriveIn(int days) {
    return 'Votre commande arrivera dans $days jours';
  }

  @override
  String get trackingHistory => 'Historique de suivi';

  @override
  String get outForDelivery => 'En cours de livraison';

  @override
  String get packageOnTheWay => 'Votre colis est en route';

  @override
  String get inTransitStatus => 'En transit';

  @override
  String get arrivedAtSortingFacility => 'Colis arrivé au centre de tri';

  @override
  String get shipped => 'Expédié';

  @override
  String get pickedUpByCourier => 'Colis récupéré par le coursier';

  @override
  String get processing => 'En traitement';

  @override
  String get orderBeingPrepared => 'Votre commande est en préparation';

  @override
  String get orderConfirmed => 'Commande confirmée';

  @override
  String get paymentReceived => 'Paiement reçu avec succès';

  @override
  String get deliveryAddress => 'Adresse de livraison';
}
