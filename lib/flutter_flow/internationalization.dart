import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['en', 'es'];

  static late SharedPreferences _prefs;
  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();
  static Future storeLocale(String locale) =>
      _prefs.setString(_kLocaleStorageKey, locale);
  static Locale? getStoredLocale() {
    final locale = _prefs.getString(_kLocaleStorageKey);
    return locale != null && locale.isNotEmpty ? createLocale(locale) : null;
  }

  String get languageCode => locale.toString();
  String? get languageShortCode =>
      _languagesWithShortCode.contains(locale.toString())
          ? '${locale.toString()}_short'
          : null;
  int get languageIndex => languages().contains(languageCode)
      ? languages().indexOf(languageCode)
      : 0;

  String getText(String key) =>
      (kTranslationsMap[key] ?? {})[locale.toString()] ?? '';

  String getVariableText({
    String? enText = '',
    String? esText = '',
  }) =>
      [enText, esText][languageIndex] ?? '';

  static const Set<String> _languagesWithShortCode = {
    'ar',
    'az',
    'ca',
    'cs',
    'da',
    'de',
    'dv',
    'en',
    'es',
    'et',
    'fi',
    'fr',
    'gr',
    'he',
    'hi',
    'hu',
    'it',
    'km',
    'ku',
    'mn',
    'ms',
    'no',
    'pt',
    'ro',
    'ru',
    'rw',
    'sv',
    'th',
    'uk',
    'vi',
  };
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    final language = locale.toString();
    return FFLocalizations.languages().contains(
      language.endsWith('_')
          ? language.substring(0, language.length - 1)
          : language,
    );
  }

  @override
  Future<FFLocalizations> load(Locale locale) =>
      SynchronousFuture<FFLocalizations>(FFLocalizations(locale));

  @override
  bool shouldReload(FFLocalizationsDelegate old) => false;
}

Locale createLocale(String language) => language.contains('_')
    ? Locale.fromSubtags(
        languageCode: language.split('_').first,
        scriptCode: language.split('_').last,
      )
    : Locale(language);

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // Home
  {
    '58qr13g1': {
      'en': 'Add my Logo',
      'es': 'Añadir mi Logo',
    },
    'g98vkdh5': {
      'en': 'Invoices',
      'es': 'Facturas',
    },
    'wqgxt4qb': {
      'en': 'Easy Invoice',
      'es': '',
    },
    'ftabe1pg': {
      'en': 'Update Logo',
      'es': 'Actualizar Logo',
    },
    'i8v6sr2q': {
      'en': 'Log Out',
      'es': 'Cerrar Sesión',
    },
    '2ma5beam': {
      'en': 'Home',
      'es': 'Inicio',
    },
  },
  // NewInvoiceModal
  {
    'uegu266r': {
      'en': 'Who are you billing to ?',
      'es': '¿A quién le estás facturando?',
    },
    'edzfkpwm': {
      'en': 'YOUR CLIENTS',
      'es': 'TUS CLIENTES',
    },
    'r82tun2p': {
      'en': 'What did you sell?',
      'es': '¿Qué vendiste?',
    },
    'vy9ld112': {
      'en': 'ITEMS',
      'es': 'ELEMENTOS',
    },
    'o8s7pz2t': {
      'en': 'Edit',
      'es': 'Editar',
    },
    'o18dfo79': {
      'en': 'Done',
      'es': 'Hecho',
    },
    '7t4qo3c7': {
      'en': 'Add Item',
      'es': 'Añadir artículo',
    },
    '7e27o2ly': {
      'en': 'TOTAL',
      'es': 'TOTAL',
    },
    '0upoylei': {
      'en': 'Taxes',
      'es': 'Impuestos',
    },
    '4bn8fusi': {
      'en': 'Subtotal',
      'es': 'Subtotal',
    },
    'x8o6gijl': {
      'en': 'Total',
      'es': 'Total',
    },
    '6r050eec': {
      'en': 'Final Step !',
      'es': 'Último paso !',
    },
    '8h8s2li0': {
      'en': 'Invoice number',
      'es': 'Número de factura',
    },
    'yav0nume': {
      'en': 'Payment Method',
      'es': 'Método de pago',
    },
    'zxuf8hws': {
      'en': '30 Days',
      'es': '30 dias',
    },
    'a0q4ys65': {
      'en': '15 Days',
      'es': '15 días',
    },
    '4to4qbpx': {
      'en': '5 Days',
      'es': '5 dias',
    },
    'jt4vfzhm': {
      'en': '0 Days',
      'es': '0 días',
    },
    'nhwuk3x2': {
      'en': '90 Days',
      'es': '90 dias',
    },
    'on9rzmwk': {
      'en': 'Payment Due',
      'es': 'Fecha de pago',
    },
    '81ty85b2': {
      'en': 'Search for an item...',
      'es': 'Buscar un artículo...',
    },
    'fs33lu46': {
      'en': 'Greeting',
      'es': 'Saludo',
    },
    'wdp9y85s': {
      'en': 'Greeting',
      'es': 'Saludo',
    },
    '9f46cs6q': {
      'en': 'Crear Invoice',
      'es': 'Crear factura',
    },
    'vhg72ngx': {
      'en': 'New Invoice',
      'es': 'Nueva factura',
    },
    '3yd23hze': {
      'en': 'Home',
      'es': 'Inicio',
    },
  },
  // NewCustomer
  {
    'ku60o23f': {
      'en': 'Customer Name',
      'es': 'Nombre del cliente',
    },
    '2gzfvutc': {
      'en': 'Address',
      'es': 'DIRECCIÓN',
    },
    '4vxmdcdc': {
      'en': 'Phone',
      'es': 'Teléfono',
    },
    'epv7a4es': {
      'en': 'Save customer',
      'es': 'Guardar cliente',
    },
    'jxb6glri': {
      'en': 'New Customer',
      'es': 'Nuevo cliente',
    },
    '77qc9hz4': {
      'en': 'Home',
      'es': 'Inicio',
    },
  },
  // AuthSection
  {
    'q8otxh85': {
      'en': 'Easy Invoice',
      'es': 'Factura Fácil',
    },
    'tq674vep': {
      'en': 'Sign Up',
      'es': 'Inscribirse',
    },
    '9kgeuo5n': {
      'en': 'Create Account',
      'es': 'Crear una cuenta',
    },
    'ruhk8kgq': {
      'en': 'Let\'s get started by filling out the form below.',
      'es': 'Comencemos completando el formulario a continuación.',
    },
    '1q5if6j7': {
      'en': 'Email',
      'es': 'Correo electrónico',
    },
    '9y6phjx5': {
      'en': 'Password',
      'es': 'Contraseña',
    },
    'i3szct14': {
      'en': 'Confirm Password',
      'es': 'confirmar Contraseña',
    },
    'ddzk4x7r': {
      'en': 'Get Started',
      'es': 'Empezar',
    },
    'ppejtfvj': {
      'en': 'Forgot Password?',
      'es': '¿Has olvidado tu contraseña?',
    },
    '7iasorqc': {
      'en': 'Sign In',
      'es': 'Iniciar sesión',
    },
    '372rcnhe': {
      'en': 'Welcome Back',
      'es': 'Bienvenido de nuevo',
    },
    'hhprbdwk': {
      'en': 'Fill out the information below in order to access your account.',
      'es': 'Complete la información a continuación para acceder a su cuenta.',
    },
    'u61xv2r4': {
      'en': 'Email',
      'es': 'Correo electrónico',
    },
    'jo93dsxr': {
      'en': 'a@a.com',
      'es': '',
    },
    'l7w6u8o7': {
      'en': 'Password',
      'es': 'Contraseña',
    },
    'cyt8ihil': {
      'en': '123456',
      'es': '',
    },
    'qdtf6cf9': {
      'en': 'Log in',
      'es': 'Acceso',
    },
    'tcuxb8xx': {
      'en': 'Home',
      'es': 'Inicio',
    },
  },
  // ForgotPassword
  {
    '39mwcgme': {
      'en': 'Back',
      'es': 'Atrás',
    },
    '4awk2cbx': {
      'en': 'Forgot Password',
      'es': 'Has olvidado tu contraseña',
    },
    'wiekeyyq': {
      'en':
          'We will send you an email with a link to reset your password, please enter the email associated with your account below.',
      'es':
          'Le enviaremos un correo electrónico con un enlace para restablecer su contraseña; ingrese el correo electrónico asociado con su cuenta a continuación.',
    },
    '3tzb2xv6': {
      'en': 'Your email address...',
      'es': 'Su dirección de correo electrónico...',
    },
    'e5ljl83a': {
      'en': 'Enter your email...',
      'es': 'Introduce tu correo electrónico...',
    },
    '5pllgpoe': {
      'en': 'Send Link',
      'es': 'Enviar enlace',
    },
    'rgt0s78m': {
      'en': 'Back',
      'es': 'Atrás',
    },
    'bpjrb8h8': {
      'en': 'Home',
      'es': 'Inicio',
    },
  },
  // NewItem
  {
    'p1stmxhq': {
      'en': 'Add Item',
      'es': 'Añadir artículo',
    },
    'h3vrcyv8': {
      'en': 'Item name',
      'es': 'Nombre del árticulo',
    },
    '8hfd945m': {
      'en': 'Item description',
      'es': 'Descripción del Artículo',
    },
    'kidb5f9z': {
      'en': 'Quantity',
      'es': 'Cantidad',
    },
    '761lbof2': {
      'en': 'Price per unity (\$)',
      'es': 'Precio por unidad (\$)',
    },
    '8ln67od4': {
      'en': 'Subtotal',
      'es': 'Total parcial',
    },
    'uc2b0qup': {
      'en': 'Total',
      'es': 'Total',
    },
    '2nrnzfua': {
      'en': 'Add Item',
      'es': 'Añadir artículo',
    },
  },
  // AddTax
  {
    '2iu8n9iu': {
      'en': 'Add Tax %',
      'es': 'Agregar % de impuesto',
    },
    'p5x48q0t': {
      'en': 'Field is required',
      'es': 'Se requiere campo',
    },
    'df4rahi4': {
      'en': 'Please choose an option from the dropdown',
      'es': 'Por favor elija una opción del menú desplegable',
    },
    'qwvfo54q': {
      'en': 'Guardar',
      'es': 'guardar',
    },
    '88e07ps5': {
      'en': 'Cancelar',
      'es': 'Cancelar',
    },
  },
  // OptionSheet
  {
    'hf60xz4v': {
      'en': 'Editar',
      'es': 'Editar',
    },
    'mhhs7qyo': {
      'en': 'Eliminar',
      'es': 'Eliminar',
    },
    '1nymwqwh': {
      'en': 'Cancelar',
      'es': 'Cancelar',
    },
  },
  // UploadLogo
  {
    'v8vjnlxp': {
      'en': 'Upload your Logo',
      'es': 'Sube tu Logo',
    },
    '94rcbbh9': {
      'en': 'Upload Image',
      'es': 'Subir Imagen',
    },
    'i7w7bdv9': {
      'en': 'Save Photo',
      'es': '',
    },
  },
  // Miscellaneous
  {
    'gf2fy7td': {
      'en': '',
      'es': '',
    },
    'u7w7elcq': {
      'en': '',
      'es': '',
    },
    'u9mg5uq2': {
      'en': '',
      'es': '',
    },
    'z329d1wc': {
      'en': '',
      'es': '',
    },
    'sp7dlu4z': {
      'en': '',
      'es': '',
    },
    'z167hngy': {
      'en': '',
      'es': '',
    },
    'zu0cv5lv': {
      'en': '',
      'es': '',
    },
    'assqqkvm': {
      'en': '',
      'es': '',
    },
    '83s0uul0': {
      'en': '',
      'es': '',
    },
    'opwqu0ww': {
      'en': '',
      'es': '',
    },
    '966omhif': {
      'en': '',
      'es': '',
    },
    '41q2xdv8': {
      'en': '',
      'es': '',
    },
    '33alh8h4': {
      'en': '',
      'es': '',
    },
    'i8wgmn69': {
      'en': '',
      'es': '',
    },
    'o0ztlb0d': {
      'en': '',
      'es': '',
    },
    't7yasgi8': {
      'en': '',
      'es': '',
    },
    'wuxp4no6': {
      'en': '',
      'es': '',
    },
    'ipdiywex': {
      'en': '',
      'es': '',
    },
    '32978tgm': {
      'en': '',
      'es': '',
    },
    'a7bgigwa': {
      'en': '',
      'es': '',
    },
    '0m77qdtz': {
      'en': '',
      'es': '',
    },
    'ao6ol4zn': {
      'en': '',
      'es': '',
    },
    '582qd4m3': {
      'en': '',
      'es': '',
    },
  },
].reduce((a, b) => a..addAll(b));
