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
}
