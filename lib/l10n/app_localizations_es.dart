// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Spanish Castilian (`es`).
class AppLocalizationsEs extends AppLocalizations {
  AppLocalizationsEs([String locale = 'es']) : super(locale);

  @override
  String get signIn => 'Iniciar sesión';

  @override
  String get signUp => 'Registrarse';

  @override
  String get welcomeBack => 'Bienvenido de nuevo';

  @override
  String get createAccount => 'Crear cuenta';

  @override
  String get enterEmail => 'Ingresa tu correo';

  @override
  String get enterPassword => 'Ingresa tu contraseña';

  @override
  String get enterName => 'Ingresa tu nombre';

  @override
  String get forgotPassword => '¿Olvidaste tu contraseña?';

  @override
  String get dontHaveAccount => '¿No tienes una cuenta?';

  @override
  String get alreadyHaveAccount => '¿Ya tienes una cuenta?';

  @override
  String get orContinueWith => 'O continuar con';

  @override
  String get google => 'Google';

  @override
  String get apple => 'Apple';

  @override
  String get emailLabel => 'Correo electrónico';

  @override
  String get passwordLabel => 'Contraseña';

  @override
  String get nameLabel => 'Nombre completo';

  @override
  String get phoneLabel => 'Número de teléfono';

  @override
  String get verifyPhone => 'Verificar teléfono';

  @override
  String get enterOtp => 'Ingresa el código que enviamos a';

  @override
  String get didntReceiveCode => '¿No recibiste el código?';

  @override
  String get verifyYourAccount => 'Verifica tu cuenta';

  @override
  String get enterSixDigitCode => 'Ingresa el código de 6 dígitos enviado a';

  @override
  String get verifyAndContinue => 'Verificar y continuar';

  @override
  String get resend => 'Reenviar';

  @override
  String get verify => 'Verificar';

  @override
  String get continueButton => 'Continuar';

  @override
  String get onboardingTitle1 => 'Descubre la literatura africana';

  @override
  String get onboardingDesc1 =>
      'Explora miles de libros de autores y editoriales africanas';

  @override
  String get onboardingTitle2 => 'Lee en cualquier lugar, en cualquier momento';

  @override
  String get onboardingDesc2 =>
      'Descarga libros y lee sin conexión en todos tus dispositivos';

  @override
  String get onboardingTitle3 => 'Apoya a los autores africanos';

  @override
  String get onboardingDesc3 =>
      'Tus compras apoyan directamente a los escritores y la comunidad literaria';

  @override
  String get skip => 'Omitir';

  @override
  String get next => 'Siguiente';

  @override
  String get getStarted => 'Comenzar';

  @override
  String get goodMorning => 'Buenos días';

  @override
  String get goodAfternoon => 'Buenas tardes';

  @override
  String get goodEvening => 'Buenas tardes';

  @override
  String get goodNight => 'Buenas noches';

  @override
  String get searchBooksAuthors => 'Buscar libros, autores...';

  @override
  String get continueReading => 'Continuar leyendo';

  @override
  String get trendingNow => 'Tendencias actuales';

  @override
  String get browseByGenre => 'Explorar por género';

  @override
  String get newReleases => 'Novedades';

  @override
  String get seeAll => 'Ver todo';

  @override
  String get hot => 'POPULAR';

  @override
  String get digital => 'Digital';

  @override
  String booksCount(String count) {
    return '$count libros';
  }

  @override
  String get searchForBooks => 'Buscar libros...';

  @override
  String foundResults(int count, String query) {
    return '$count resultados encontrados para \"$query\"';
  }

  @override
  String get all => 'Todos';

  @override
  String get books => 'Libros';

  @override
  String get authors => 'Autores';

  @override
  String get publishers => 'Editoriales';

  @override
  String get view => 'Ver';

  @override
  String reviews(String count) {
    return '$count reseñas';
  }

  @override
  String get categories => 'Categorías';

  @override
  String get fiction => 'Ficción';

  @override
  String get history => 'Historia';

  @override
  String get poetry => 'Poesía';

  @override
  String get children => 'Infantil';

  @override
  String get education => 'Educación';

  @override
  String get selfHelp => 'Autoayuda';

  @override
  String get business => 'Negocios';

  @override
  String get romance => 'Romance';

  @override
  String get popular => 'Popular';

  @override
  String get newFilter => 'Nuevo';

  @override
  String get bestsellers => 'Más vendidos';

  @override
  String get priceLow => 'Precio: Bajo';

  @override
  String booksInCategory(int count, String category) {
    return '$count libros en $category';
  }

  @override
  String get nigerianNovelist => 'Novelista nigeriano';

  @override
  String get readers => 'Lectores';

  @override
  String get rating => 'Calificación';

  @override
  String get followAuthor => 'Seguir autor';

  @override
  String get about => 'Acerca de';

  @override
  String get popularBooks => 'Libros populares';

  @override
  String get publisher => 'Editorial';

  @override
  String get africanWritersSeries => 'Serie de escritores africanos';

  @override
  String get followPublisher => 'Seguir editorial';

  @override
  String get latestReleases => 'Últimos lanzamientos';

  @override
  String get trending => 'Tendencias';

  @override
  String topBooksThisWeek(String country) {
    return 'Mejores libros de esta semana en $country';
  }

  @override
  String get nigeria => 'Nigeria';

  @override
  String get kenya => 'Kenia';

  @override
  String get southAfrica => 'Sudáfrica';

  @override
  String get ghana => 'Ghana';

  @override
  String fromLastWeek(String change) {
    return '$change desde la semana pasada';
  }

  @override
  String get noChange => 'Sin cambios';

  @override
  String get featured => 'Destacado';

  @override
  String get collection => 'Colección';

  @override
  String get aboutThisCollection => 'Acerca de esta colección';

  @override
  String get booksInCollection => 'Libros en esta colección';

  @override
  String get avgRating => 'Calificación promedio';

  @override
  String get add => 'Agregar';

  @override
  String get celebratingPowerfulVoices =>
      'Celebrando voces poderosas de todo el continente';

  @override
  String authorsCount(int count) {
    return '$count Autores';
  }

  @override
  String get library => 'Biblioteca';

  @override
  String get myBooks => 'Mis libros';

  @override
  String get favorites => 'Favoritos';

  @override
  String get downloaded => 'Descargados';

  @override
  String get profile => 'Perfil';

  @override
  String get settings => 'Configuración';

  @override
  String get notifications => 'Notificaciones';

  @override
  String get language => 'Idioma';

  @override
  String get theme => 'Tema';

  @override
  String get logout => 'Cerrar sesión';

  @override
  String get home => 'Inicio';

  @override
  String get explore => 'Explorar';

  @override
  String get cancel => 'Cancelar';

  @override
  String get ok => 'Aceptar';

  @override
  String get delete => 'Eliminar';

  @override
  String get edit => 'Editar';

  @override
  String get save => 'Guardar';

  @override
  String get close => 'Cerrar';

  @override
  String get loading => 'Cargando...';

  @override
  String get error => 'Error';

  @override
  String get retry => 'Reintentar';

  @override
  String get success => 'Éxito';

  @override
  String get aboutThisBook => 'Sobre este libro';

  @override
  String get chooseFormat => 'Elegir formato';

  @override
  String get digitalEdition => 'Edición digital';

  @override
  String get readOnAnyDevice => 'Leer en cualquier dispositivo';

  @override
  String get hardcopy => 'Copia física';

  @override
  String get printedAndDelivered => 'Impreso y entregado';

  @override
  String buyNow(String price) {
    return 'Comprar ahora - $price';
  }

  @override
  String get readFreePreview => 'Leer vista previa gratis';

  @override
  String get pages => 'Páginas';

  @override
  String get genre => 'Género';

  @override
  String get published => 'Publicado';

  @override
  String get previewMode => 'Modo vista previa';

  @override
  String get limitedPages => 'Páginas limitadas';

  @override
  String get buyFullBook => 'Comprar libro completo';

  @override
  String get preview => 'Vista previa';

  @override
  String get previewEndsHere => 'La vista previa termina aquí';

  @override
  String purchaseFullBook(int pages) {
    return 'Compra el libro completo para continuar leyendo las $pages páginas';
  }

  @override
  String buyFor(String price) {
    return 'Comprar por $price';
  }

  @override
  String get chapter => 'Capítulo';

  @override
  String get contents => 'Contenidos';

  @override
  String get bookmark => 'Marcador';

  @override
  String get highlight => 'Resaltar';

  @override
  String get readingSettings => 'Configuración de lectura';

  @override
  String get fontSize => 'Tamaño de fuente';

  @override
  String get readingTheme => 'Tema de lectura';

  @override
  String get dark => 'Oscuro';

  @override
  String get light => 'Claro';

  @override
  String get sepia => 'Sepia';

  @override
  String get fontFamily => 'Familia de fuentes';

  @override
  String get serif => 'Serif';

  @override
  String get sansSerif => 'Sans-Serif';

  @override
  String get lineSpacing => 'Espaciado de línea';

  @override
  String get compact => 'Compacto';

  @override
  String get relaxed => 'Relajado';

  @override
  String get autoScroll => 'Desplazamiento automático';

  @override
  String get automaticallyScrollPages => 'Desplazar páginas automáticamente';

  @override
  String get tableOfContents => 'Tabla de contenidos';

  @override
  String chapters(int count) {
    return '$count Capítulos';
  }

  @override
  String get currentlyReading => 'Leyendo actualmente';

  @override
  String complete(int percent) {
    return '$percent% completo';
  }

  @override
  String pagesCount(int count) {
    return '$count páginas';
  }

  @override
  String get highlightsAndNotes => 'Resaltados y notas';

  @override
  String items(int count) {
    return '$count elementos';
  }

  @override
  String get highlights => 'Resaltados';

  @override
  String get notes => 'Notas';

  @override
  String get bookmarks => 'Marcadores';

  @override
  String get share => 'Compartir';

  @override
  String get bookmarkedPage => 'Página marcada';

  @override
  String get goToPage => 'Ir a la página';

  @override
  String daysAgo(int count) {
    return 'hace $count días';
  }

  @override
  String weeksAgo(int count) {
    return 'hace $count semanas';
  }

  @override
  String get readingProgress => 'Progreso de lectura';

  @override
  String get pagesRead => 'Páginas leídas';

  @override
  String get pagesLeft => 'Páginas restantes';

  @override
  String get timeLeft => 'Tiempo restante';

  @override
  String get thisWeek => 'Esta semana';

  @override
  String get readingTime => 'Tiempo de lectura';

  @override
  String get dayStreak => 'Racha de días';

  @override
  String get booksFinished => 'Libros terminados';

  @override
  String get dailyActivity => 'Actividad diaria';

  @override
  String get weeklyGoal => 'Meta semanal';

  @override
  String hours(String count) {
    return '$count horas';
  }

  @override
  String hoursLeft(String count) {
    return '$count horas restantes para alcanzar tu meta';
  }

  @override
  String get offlineStorage => 'Almacenamiento sin conexión';

  @override
  String get storageUsed => 'Almacenamiento usado';

  @override
  String gbOf(String used, String total) {
    return '$used de $total';
  }

  @override
  String available(String size) {
    return '$size disponible';
  }

  @override
  String get manage => 'Administrar';

  @override
  String get downloadedBooks => 'Libros descargados';

  @override
  String booksLowercase(int count) {
    return '$count libros';
  }

  @override
  String get downloadedStatus => 'Descargado';
}
