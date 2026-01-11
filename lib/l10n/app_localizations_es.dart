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
  String get signUpSubtitle =>
      'Create an account to start your reading journey';

  @override
  String get enterEmail => 'Ingresa tu correo';

  @override
  String get enterEmailOrPhone => 'Introduce tu correo o número de teléfono';

  @override
  String get enterPassword => 'Ingresa tu contraseña';

  @override
  String get enterName => 'Ingresa tu nombre';

  @override
  String get emailOrPhoneLabel => 'Correo o teléfono';

  @override
  String fieldRequired(String field) {
    return '$field es obligatorio';
  }

  @override
  String fieldMinLength(String field, int min) {
    return '$field debe tener al menos $min caracteres';
  }

  @override
  String fieldMaxLength(String field, int max) {
    return '$field debe tener menos de $max caracteres';
  }

  @override
  String get invalidEmailAddress =>
      'Por favor, introduce un correo electrónico válido';

  @override
  String get invalidPhoneNumber =>
      'Por favor, introduce un número de teléfono válido';

  @override
  String get invalidEmailOrPhone =>
      'Por favor, introduce un correo o teléfono válido';

  @override
  String get passwordRequired => 'Password is required';

  @override
  String get passwordsDoNotMatch => 'Passwords do not match';

  @override
  String get agreeToTermsError => 'You must agree to the terms and conditions';

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
  String get signInSubtitle =>
      'Inicia sesión para continuar tu viaje de lectura';

  @override
  String get rememberMe => 'Recuérdame';

  @override
  String verificationCodeSent(String contact) {
    return 'Código de verificación enviado a $contact';
  }

  @override
  String authTermsNotice(String terms, String privacy) {
    return 'Al continuar, aceptas nuestros $terms y $privacy.';
  }

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
  String get newRelease => 'New Release';

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
  String get recommendedForYou => 'Recommended For You';

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
  String get readOnAnyDevice => 'Acceso instantáneo • Lee en cualquier lugar';

  @override
  String get hardcopy => 'Copia física';

  @override
  String get printedAndDelivered => 'Libro impreso • Entrega a domicilio';

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
  String get dayStreak => 'Días seguidos';

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

  @override
  String get yourReadingStats => 'Tus estadísticas de lectura';

  @override
  String readingChallenge(int year) {
    return 'Desafío de lectura $year';
  }

  @override
  String booksRead(int count) {
    return '$count libros';
  }

  @override
  String booksAheadOfGoal(int count) {
    return '$count libros por delante de tu objetivo';
  }

  @override
  String percentComplete(int percent) {
    return '$percent% completado';
  }

  @override
  String booksToGo(int count) {
    return '$count libros por leer';
  }

  @override
  String get thisMonth => 'Este mes';

  @override
  String get pagesReadLabel => 'Páginas leídas';

  @override
  String get readingTimeLabel => 'Tiempo de lectura';

  @override
  String get favoriteGenres => 'Géneros favoritos';

  @override
  String get recentlyFinished => 'Terminados recientemente';

  @override
  String finishedAgo(int days) {
    return 'Terminado hace $days días';
  }

  @override
  String get offlineReading => 'Lectura sin conexión';

  @override
  String get syncAcrossDevices => 'Sincronizar en todos los dispositivos';

  @override
  String get highlightsNotes => 'Resaltados y notas';

  @override
  String get premiumPaperQuality => 'Papel de calidad premium';

  @override
  String get deliveryInDays => 'Entrega en 3-5 días';

  @override
  String get freeShipping => 'Envío gratuito';

  @override
  String get continueToCheckout => 'Continuar al pago';

  @override
  String get checkout => 'Pago';

  @override
  String get orderSummary => 'Resumen del pedido';

  @override
  String get subtotal => 'Subtotal';

  @override
  String get processingFee => 'Tarifa de procesamiento';

  @override
  String get total => 'Total';

  @override
  String get promoCode => 'Código promocional';

  @override
  String get enterCode => 'Ingresa el código';

  @override
  String get apply => 'Aplicar';

  @override
  String get securePayment => 'Pago seguro';

  @override
  String get securePaymentDesc =>
      'Tu información de pago está encriptada y segura. Aceptamos todos los principales proveedores de dinero móvil.';

  @override
  String get proceedToPayment => 'Proceder al pago';

  @override
  String get paymentMethod => 'Método de pago';

  @override
  String get mobileMoney => 'Dinero móvil';

  @override
  String get mtnMobileMoney => 'MTN Mobile Money';

  @override
  String get fastSecurePayment => 'Pago rápido y seguro';

  @override
  String get orangeMoney => 'Orange Money';

  @override
  String get instantTransfer => 'Transferencia instantánea';

  @override
  String get airtelMoney => 'Airtel Money';

  @override
  String get quickCheckout => 'Pago rápido';

  @override
  String get mPesa => 'M-Pesa';

  @override
  String get trustedPayment => 'Pago confiable';

  @override
  String get enterPhoneNumber => 'Ingresa el número de teléfono';

  @override
  String get phoneNumberPlaceholder => '+233 XX XXX XXXX';

  @override
  String get paymentPromptMessage =>
      'Recibirás una solicitud para aprobar el pago';

  @override
  String get totalAmount => 'Monto total';

  @override
  String get payNow => 'Pagar ahora';

  @override
  String get processingPayment => 'Procesando pago';

  @override
  String checkPhoneApprove(String provider) {
    return 'Por favor revisa tu teléfono y aprueba la solicitud de pago de $provider';
  }

  @override
  String get amount => 'Monto';

  @override
  String get phoneNumber => 'Número de teléfono';

  @override
  String get reference => 'Referencia';

  @override
  String get cancelPayment => 'Cancelar pago';

  @override
  String get paymentSuccessful => '¡Pago exitoso!';

  @override
  String get bookAddedToLibrary =>
      'Tu libro ha sido agregado a tu biblioteca. ¡Comienza a leer ahora!';

  @override
  String get amountPaid => 'Monto pagado';

  @override
  String get transactionId => 'ID de transacción';

  @override
  String get date => 'Fecha';

  @override
  String get startReading => 'Comenzar a leer';

  @override
  String get viewReceipt => 'Ver recibo';

  @override
  String get myOrders => 'Mis pedidos';

  @override
  String get filter => 'Filtrar';

  @override
  String get orderFilter => 'Pedido #';

  @override
  String get completed => 'Completado';

  @override
  String get readNow => 'Leer ahora';

  @override
  String get inTransit => 'En tránsito';

  @override
  String get trackOrder => 'Rastrear pedido';

  @override
  String get contactSupport => 'Contactar soporte';

  @override
  String get delivered => 'Entregado';

  @override
  String get rateAndReview => 'Calificar y reseñar';

  @override
  String get buyAgain => 'Comprar de nuevo';

  @override
  String get trackOrderTitle => 'Rastrear pedido';

  @override
  String placedOn(String date) {
    return 'Realizado el $date';
  }

  @override
  String get estimatedDelivery => 'Entrega estimada';

  @override
  String orderWillArriveIn(int days) {
    return 'Tu pedido llegará en $days días';
  }

  @override
  String get trackingHistory => 'Historial de rastreo';

  @override
  String get outForDelivery => 'En camino para entrega';

  @override
  String get packageOnTheWay => 'Tu paquete está en camino';

  @override
  String get inTransitStatus => 'En tránsito';

  @override
  String get arrivedAtSortingFacility =>
      'Paquete llegó al centro de clasificación';

  @override
  String get shipped => 'Enviado';

  @override
  String get pickedUpByCourier => 'Paquete recogido por mensajero';

  @override
  String get processing => 'Procesando';

  @override
  String get orderBeingPrepared => 'Tu pedido se está preparando';

  @override
  String get orderConfirmed => 'Pedido confirmado';

  @override
  String get paymentReceived => 'Pago recibido exitosamente';

  @override
  String get deliveryAddress => 'Dirección de entrega';

  @override
  String get editProfile => 'Editar perfil';

  @override
  String get fullName => 'Nombre completo';

  @override
  String get username => 'Nombre de usuario';

  @override
  String get bio => 'Biografía';

  @override
  String get email => 'Correo electrónico';

  @override
  String get location => 'Ubicación';

  @override
  String get readingPreferences => 'Preferencias de lectura';

  @override
  String get followers => 'Seguidores';

  @override
  String get following => 'Siguiendo';

  @override
  String get activity => 'Actividad';

  @override
  String get tellUsAboutYourself => 'Cuéntanos sobre ti...';

  @override
  String get biography => 'Biografía';

  @override
  String get addNewPreference => '+ Agregar';

  @override
  String get saveChanges => 'Guardar cambios';

  @override
  String get savedQuotes => 'Citas guardadas';

  @override
  String get page => 'Página';

  @override
  String savedAgo(String time) {
    return 'Guardado hace $time';
  }

  @override
  String get forYou => 'Para ti';

  @override
  String get bookClubs => 'Clubes de libros';

  @override
  String likes(int count) {
    return '$count me gusta';
  }

  @override
  String comments(int count) {
    return '$count comentarios';
  }

  @override
  String get reply => 'Responder';

  @override
  String get attachBook => 'Adjuntar libro';

  @override
  String get addPhotos => 'Agregar fotos';

  @override
  String get createPoll => 'Crear encuesta';

  @override
  String get tagBookClub => 'Etiquetar club de lectura';

  @override
  String get post => 'Publicar';

  @override
  String get whatsOnYourMind => '¿Qué estás pensando?';

  @override
  String get postTooltip => 'Compartir una publicación';

  @override
  String get writeComment => 'Escribe un comentario...';

  @override
  String get attachedBook => 'Libro adjunto';

  @override
  String get removeAttachment => 'Eliminar';

  @override
  String get markAllRead => 'Marcar todo como leído';

  @override
  String get mentions => 'Menciones';

  @override
  String get startedFollowing => 'comenzó a seguirte';

  @override
  String get likedYourPost => 'le gustó tu publicación';

  @override
  String get commentedOnPost => 'comentó en tu publicación';

  @override
  String get repliedToComment => 'respondió a tu comentario';

  @override
  String get mentionedYou => 'te mencionó en una publicación';

  @override
  String newBookAdded(String category) {
    return 'Nuevo libro agregado a $category';
  }

  @override
  String newDiscussion(String clubName) {
    return 'Nueva discusión en $clubName';
  }

  @override
  String achievementUnlocked(String achievement) {
    return 'Logro desbloqueado: $achievement';
  }

  @override
  String flashSaleAlert(String bookTitle, int percent) {
    return '¡$bookTitle tiene $percent% de descuento!';
  }

  @override
  String get just => 'Justo ahora';

  @override
  String minutesAgo(int count) {
    return 'hace ${count}m';
  }

  @override
  String hoursAgo(int count) {
    return 'hace ${count}h';
  }

  @override
  String daysAgoShort(int count) {
    return 'hace ${count}d';
  }

  @override
  String weeksAgoShort(int count) {
    return 'hace ${count}s';
  }

  @override
  String get viewProfile => 'Ver perfil';

  @override
  String get account => 'Cuenta';

  @override
  String get accountSettings => 'Configuración de cuenta';

  @override
  String get privacySecurity => 'Privacidad y seguridad';

  @override
  String get app => 'Aplicación';

  @override
  String get appPreferences => 'Preferencias de la aplicación';

  @override
  String get storageDownloads => 'Almacenamiento y descargas';

  @override
  String get languageRegion => 'Idioma y región';

  @override
  String get support => 'Soporte';

  @override
  String get helpSupport => 'Ayuda y soporte';

  @override
  String get aboutLoni => 'Acerca de Loni';

  @override
  String get logOut => 'Cerrar sesión';

  @override
  String get personalInformation => 'Información personal';

  @override
  String get dateOfBirth => 'Fecha de nacimiento';

  @override
  String get accountManagement => 'Gestión de cuenta';

  @override
  String get changePassword => 'Cambiar contraseña';

  @override
  String get connectedAccounts => 'Cuentas conectadas';

  @override
  String get paymentMethods => 'Métodos de pago';

  @override
  String get subscription => 'Suscripción';

  @override
  String get premium => 'Premium';

  @override
  String get dangerZone => 'Zona peligrosa';

  @override
  String get deactivateAccount => 'Desactivar cuenta';

  @override
  String get deleteAccount => 'Eliminar cuenta';

  @override
  String get security => 'Seguridad';

  @override
  String get biometricAuth => 'Autenticación biométrica';

  @override
  String get biometricAuthDesc =>
      'Usar huella digital o Face ID para desbloquear';

  @override
  String get twoFactorAuth => 'Autenticación de dos factores';

  @override
  String get twoFactorAuthDesc => 'Agregar una capa adicional de seguridad';

  @override
  String get activeSessions => 'Sesiones activas';

  @override
  String get loginHistory => 'Historial de inicio de sesión';

  @override
  String get privacy => 'Privacidad';

  @override
  String get profileVisibility => 'Visibilidad del perfil';

  @override
  String get publicVisibility => 'Público';

  @override
  String get readingActivity => 'Actividad de lectura';

  @override
  String get visibleToFollowers => 'Visible para seguidores';

  @override
  String get blockedUsers => 'Usuarios bloqueados';

  @override
  String get mutedConversations => 'Conversaciones silenciadas';

  @override
  String get dataPermissions => 'Datos y permisos';

  @override
  String get downloadYourData => 'Descargar tus datos';

  @override
  String get appPermissions => 'Permisos de la aplicación';

  @override
  String get privacyPolicy => 'Política de privacidad';

  @override
  String get termsOfService => 'Términos de servicio';

  @override
  String get searchHelpArticles => 'Buscar artículos de ayuda';

  @override
  String get findAnswers => 'Encuentra respuestas a preguntas comunes';

  @override
  String get whatCanWeHelp => '¿En qué podemos ayudarte?';

  @override
  String get quickActions => 'Acciones rápidas';

  @override
  String get liveChat => 'Chat en vivo';

  @override
  String get emailUs => 'Envíanos un correo';

  @override
  String get callSupport => 'Llamar a soporte';

  @override
  String get userGuide => 'Guía del usuario';

  @override
  String get popularTopics => 'Temas populares';

  @override
  String get howToDownloadBooks => 'Cómo descargar libros';

  @override
  String get paymentMethodsHelp => 'Métodos de pago';

  @override
  String get refundPolicy => 'Política de reembolso';

  @override
  String get premiumSubscription => 'Suscripción premium';

  @override
  String get shippingDelivery => 'Envío y entrega';

  @override
  String get contactInformation => 'Información de contacto';

  @override
  String get supportEmail => 'support@loni.com';

  @override
  String get supportPhone => '+233 30 123 4567';

  @override
  String get supportHours => 'Lun-Vie: 8AM - 6PM GMT';

  @override
  String get version => 'Versión';

  @override
  String get copyright => '© 2024 Loni LLC. Todos los derechos reservados.';

  @override
  String get ourMission => 'Nuestra misión';

  @override
  String get missionStatement =>
      'Loni se dedica a promover la literatura africana y conectar a los lectores con el rico tapiz de historias de todo el continente. Creemos en el poder de los libros para educar, inspirar y transformar vidas.';

  @override
  String get appInformation => 'Información de la aplicación';

  @override
  String get whatsNew => 'Novedades';

  @override
  String get releaseNotes => 'Notas de la versión';

  @override
  String get licenses => 'Licencias';

  @override
  String get legal => 'Legal';

  @override
  String get cookiePolicy => 'Política de cookies';

  @override
  String get followUs => 'Síguenos';

  @override
  String get rateLoniOnAppStore => 'Califica Loni en App Store';

  @override
  String get appearance => 'Apariencia';

  @override
  String get darkMode => 'Modo oscuro';

  @override
  String get lightMode => 'Modo claro';

  @override
  String get medium => 'Medio';

  @override
  String get displayLanguage => 'Idioma de visualización';

  @override
  String get english => 'Inglés';

  @override
  String get reading => 'Lectura';

  @override
  String get pageTurnAnimation => 'Animación de paso de página';

  @override
  String get slide => 'Deslizar';

  @override
  String get screenBrightness => 'Brillo de pantalla';

  @override
  String get autoAdjustBrightness => 'Ajuste automático al leer';

  @override
  String get keepScreenAwake => 'Mantener pantalla activa';

  @override
  String get preventScreenTimeout =>
      'Evitar tiempo de espera de pantalla al leer';

  @override
  String get downloads => 'Descargas';

  @override
  String get autoDownload => 'Descarga automática';

  @override
  String get autoDownloadDesc => 'Descargar libros comprados automáticamente';

  @override
  String get downloadQuality => 'Calidad de descarga';

  @override
  String get highQuality => 'Alta calidad';

  @override
  String get storageLocation => 'Ubicación de almacenamiento';

  @override
  String get internalStorage => 'Almacenamiento interno';

  @override
  String get pushNotifications => 'Notificaciones push';

  @override
  String get receiveNotifications => 'Recibir notificaciones de la aplicación';

  @override
  String get notificationPreferences => 'Preferencias de notificaciones';

  @override
  String get dataUsage => 'Uso de datos';

  @override
  String get dataSaverMode => 'Modo de ahorro de datos';

  @override
  String get reduceDataUsage => 'Reducir uso de datos';

  @override
  String get clearCache => 'Borrar caché';

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
