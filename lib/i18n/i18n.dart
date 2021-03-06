import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class I18n implements WidgetsLocalizations {
  const I18n();

  static I18n current;

  static const GeneratedLocalizationsDelegate delegate =
      GeneratedLocalizationsDelegate();

  static I18n of(BuildContext context) => Localizations.of<I18n>(context, I18n);

  @override
  TextDirection get textDirection => TextDirection.ltr;

  String get home => "Home";

  String get share => "Share";

  String get about => "About";

  String get rate => "Rate Us";

  String get update => "Update Application";

  String get notification => "Notification";

  String get languages => "Languages";

  String get appLang => "App Language";

  String get descLang => "Select your preferred languages";

  String get whoops => "Whoops!";

  String get noInternet => "No internet connection";

  String get tryAgain => "Try Again";

  String get closeApp => "Close APP";

  String get sureCloseApp => "Are you sure want to quit this application ?";

  String get ok => "OK";

  String get cancel => "CANCEL";

  String get changeTheme => "Change Theme";

  String get customizeYourOwnWay => "Customize your own way";

  String get descriptionCustomize =>
      "FlyWeb give you the power of better UI  customization experience, It's easy to choose your own theme style and aply to your project. Bassed on your UI recruitment choose Toolbar style, left-rigth button action, app Theme, loader style.After that go back home to see the changes.";

  String get navigationBarStyle => "Navigation bar style";

  String get headerType => "Header type";

  String get leftButtonOption => "Left Button Option";

  String get rightButtonOption => "Right Button Option";

  String get colorGradient => "Color Gradient";

  String get colorSolid => "Color Solid";

  String get loadingAnimation => "Loading Animation";

  String get backToHomePage => "Back to HomePage";

  String get darkMode => "Dark mode";

  String get lightMode => "Light mode";


  String social(String type) {
    return type;
  }
}

class $es extends I18n {
  const $es();

  @override
  TextDirection get textDirection => TextDirection.ltr;

  @override
  String get home => "Hogar";

  @override
  String get share => "Compartir";

  @override
  String get about => "Acerca de";

  @override
  String get rate => "Nos califica";

  @override
  String get update => "Aplicaci??n de actualizaci??n";

  @override
  String get notification => "Notificaci??n";

  @override
  String get languages => "Idiomas";

  @override
  String get appLang => "Idioma de la aplicaci??n";

  @override
  String get descLang => "Selecciona tus idiomas preferidos";

  @override
  String get whoops => "Whoops!";

  @override
  String get noInternet => "Sin conexi??n a Internet";

  @override
  String get tryAgain => "Int??ntalo de nuevo";

  @override
  String get closeApp => "Cerrar app";

  @override
  String get sureCloseApp => "Seguro que quieres salir de esta aplicaci??n?";

  @override
  String get ok => "Okay";

  @override
  String get cancel => "Cancelar";

  @override
  String get changeTheme => "Cambiar de tema";

  @override
  String get customizeYourOwnWay => "Customize your own way";

  @override
  String get descriptionCustomize =>
      "FlyWeb give you the power of better UI  customization experience, It's easy to choose your own theme style and aply to your project. Bassed on your UI recruitment choose Toolbar style, left-rigth button action, app Theme, loader style.After that go back home to see the changes.";

  @override
  String get navigationBarStyle => "Navigation bar style";

  @override
  String get headerType => "Header type";

  @override
  String get leftButtonOption => "Left Button Option";

  @override
  String get rightButtonOption => "Right Button Option";

  @override
  String get colorGradient => "Color Gradient";

  @override
  String get colorSolid => "Color Solid";

  @override
  String get loadingAnimation => "Loading Animation";

  @override
  String get backToHomePage => "Back to HomePage";

  @override
  String get darkMode => "Modo oscuro";

  @override
  String get lightMode => "Modo de luz";
}

class $fr extends I18n {
  const $fr();

  @override
  TextDirection get textDirection => TextDirection.ltr;

  @override
  String get home => "Accueil";

  @override
  String get share => "Partager";

  @override
  String get about => "?? propos";

  @override
  String get rate => "??valuez nous";

  @override
  String get update => "Mettre ?? jour l'application";

  @override
  String get notification => "Notification";

  @override
  String get languages => "Les Langues";

  @override
  String get appLang => "Langue de l'application";

  @override
  String get descLang => "S??lectionnez vos langues pr??f??r??es";

  @override
  String get whoops => "Oups!";

  @override
  String get noInternet => "Pas de connexion Internet";

  @override
  String get tryAgain => "R??essayer";

  @override
  String get closeApp => "Fermer l'application";

  @override
  String get sureCloseApp => "Voulez-vous vraiment quitter cette application?";

  @override
  String get ok => "D'accord";

  @override
  String get cancel => "Annuler";

  @override
  String get changeTheme => "Change le th??me";

  @override
  String get customizeYourOwnWay => "Personnalisez ?? votre guise";

  @override
  String get descriptionCustomize =>
      "FlyWeb vous offre la puissance d'une meilleure exp??rience de personnalisation de l'interface utilisateur.Il est facile de choisir votre propre style de th??me et de r??pondre ?? votre projet. En fonction de votre recrutement dans l'interface utilisateur, choisissez le style de la barre d'outils, l'action du bouton de gauche, le th??me de l'application, le style du chargeur. Ensuite, revenez ?? la maison pour voir les changements.";

  @override
  String get navigationBarStyle => "Style de barre de navigation";

  @override
  String get headerType => "Type d'en-t??te";

  @override
  String get leftButtonOption => "Option bouton gauche";

  @override
  String get rightButtonOption => "Option bouton droit";

  @override
  String get colorGradient => "D??grad?? de couleur";

  @override
  String get colorSolid => "Couleur solide";

  @override
  String get loadingAnimation => "Chargement de l'animation";

  @override
  String get backToHomePage => "Retour ?? la page d'accueil";

  @override
  String get darkMode => "Mode sombre";

  @override
  String get lightMode => "Mode claire";
}

class $pt extends I18n {
  const $pt();

  @override
  TextDirection get textDirection => TextDirection.ltr;

  @override
  String get home => "Casa";

  @override
  String get share => "Compartilhar";

  @override
  String get about => "Sobre";

  @override
  String get rate => "Nos avalie";

  @override
  String get update => "Atualizar aplicativo";

  @override
  String get notification => "Notifica????o";

  @override
  String get languages => "L??nguas";

  @override
  String get appLang => "Idioma da aplica????o";

  @override
  String get descLang => "Selecione seus idiomas preferidos";

  @override
  String get whoops => "Opa!";

  @override
  String get noInternet => "Sem conex??o ?? Internet";

  @override
  String get tryAgain => "Repetir";

  @override
  String get closeApp => "Feche a aplica????o";

  @override
  String get sureCloseApp => "Tem certeza de que deseja sair deste aplicativo?";

  @override
  String get ok => "OK";

  @override
  String get cancel => "Cancelar";

  @override
  String get changeTheme => "Mudar tema";

  @override
  String get customizeYourOwnWay => "Personalize o seu pr??prio caminho";

  @override
  String get descriptionCustomize =>
      "O FlyWeb oferece a voc?? o poder de uma melhor experi??ncia de personaliza????o da interface do usu??rio. ?? f??cil escolher seu pr??prio estilo de tema e aplicar ao seu projeto. Com base no recrutamento da interface do usu??rio, escolha Estilo da barra de ferramentas, a????o do bot??o esquerdo, Tema do aplicativo, estilo do carregador. Depois disso, volte para casa para ver as altera????es.";

  @override
  String get navigationBarStyle => "Estilo da barra de navega????o";

  @override
  String get headerType => "Tipo de cabe??alho";

  @override
  String get leftButtonOption => "Op????o Bot??o Esquerdo";

  @override
  String get rightButtonOption => "Op????o Bot??o Direito";

  @override
  String get colorGradient => "Gradiente de cor";

  @override
  String get colorSolid => "Cor S??lida";

  @override
  String get loadingAnimation => "Carregando Anima????o";

  @override
  String get backToHomePage => "Voltar ?? p??gina inicial";

  @override
  String get darkMode => "Modo escuro";

  @override
  String get lightMode => "Coloque a luz";
}

class $ar extends I18n {
  const $ar();

  @override
  TextDirection get textDirection => TextDirection.rtl;

  @override
  String get home => "???????????? ????????????????";

  @override
  String get share => "???????????? ??????????????";

  @override
  String get about => "?????????????? ??????";

  @override
  String get rate => "??????????";

  @override
  String get update => "?????????? ??????????????";

  @override
  String get notification => "??????????????";

  @override
  String get languages => "?????????? ??????????";

  @override
  String get appLang => "?????? ??????????????";

  @override
  String get descLang => "???????? ???????? ??????????????";

  @override
  String get whoops => "??????????!";

  @override
  String get noInternet => "???? ???????? ?????????? ??????????????????";

  @override
  String get tryAgain => "???????? ??????????";

  @override
  String get closeApp => "???????? ??????????????";

  @override
  String get sureCloseApp => "???? ???????? ???????????????? ?????????? ?????? ????????????????";

  @override
  String get ok => "????????";

  @override
  String get cancel => "??????????";

  @override
  String get changeTheme => "?????? ??????????????";

  @override
  String get customizeYourOwnWay => "?????????? ???????????? ????????????";

  @override
  String get descriptionCustomize =>
      "?????????? FlyWeb ?????? ?????????? ?????????? ???????? ???????????? ???????????????? ?? ???? ?????????? ???????????? ?????? ?????????? ?????????? ???? ?????????? ?????????? ??????????????. ???????? ?????? ?????????? ?????????? ???????????????? ???????????? ???? ?? ???????? ?????? ???????? ?????????????? ?? ???????????? ???????? ???????????? ?? ???????????? ?????????????? ?? ???????? ???????????? ?? ???????? ?????? ???? ?????? ???????????? ?????????? ??????????????????.";

  @override
  String get navigationBarStyle => "?????? ???????? ????????????";

  @override
  String get headerType => "???????? ??????????";

  @override
  String get leftButtonOption => "???????? ???????? ????????????";

  @override
  String get rightButtonOption => "???????? ???????? ????????????";

  @override
  String get colorGradient => "???????????? ??????????";

  @override
  String get colorSolid => "?????? ????????";

  @override
  String get loadingAnimation => "????????????";

  @override
  String get backToHomePage => "???????????? ?????? ???????????? ????????????????";

  @override
  String get darkMode => "?????????? ????????????";

  @override
  String get lightMode => "?????????? ????????????";

  @override
  String social(String type) {
    switch (type) {
      case "Facebook":
        return "????????????";
      case "Youtube":
        return "????????????";
      case "Skype":
        return "??????????";
      case "Twitter":
        return "??????????";
      case "WhatsApp":
        return "????????????";
      case "???????? ??????":
        return "";
      case "Messanger":
        return "???????????? ????????????";
      case "Instagram":
        return "????????????????";
      default:
        return type;
    }
  }
}

class $hi extends I18n {
  const $hi();

  @override
  TextDirection get textDirection => TextDirection.ltr;

  @override
  String get home => "??????";

  @override
  String get share => "????????????";

  @override
  String get about => "?????? ???????????? ?????????";

  @override
  String get rate => "???????????? ?????????????????? ?????????";

  @override
  String get update => "??????????????????????????? ??????????????? ????????????";

  @override
  String get notification => "????????????????????????";

  @override
  String get languages => "????????????";

  @override
  String get appLang => "??????????????????????????? ????????????";

  @override
  String get descLang => "???????????? ????????????????????? ?????????????????? ?????? ????????? ????????????";

  @override
  String get whoops => "?????????!";

  @override
  String get noInternet => "????????? ????????????????????? ????????????????????? ????????????";

  @override
  String get tryAgain => "?????????: ?????????????????? ????????????";

  @override
  String get closeApp => "??????????????????????????? ?????? ????????? ????????????";

  @override
  String get sureCloseApp => "???????????? ?????? ???????????? ?????? ?????? ?????? ?????????????????? ??????????????? ??????????";

  @override
  String get ok => "????????? ??????";

  @override
  String get cancel => "???????????? ???????????? ?????? ?????????";

  @override
  String get changeTheme => "????????? ???????????????";

  @override
  String get customizeYourOwnWay => "???????????? ??????????????? ?????? ???????????????????????? ????????????";

  @override
  String get descriptionCustomize =>
      "FlyWeb ???????????? ??????????????? UI ????????????????????? ??????????????? ?????? ??????????????? ?????????????????? ???????????? ??????, ???????????? ????????? ?????? ????????? ???????????? ?????? ???????????? ???????????????????????? ?????? ????????? ???????????? ??????????????? ???????????? ????????? ???????????? UI ????????????????????????????????? ?????? ?????????????????? ?????????????????? ??????????????????, ???????????????-????????? ????????? ???????????????, ?????? ?????????, ???????????? ?????????????????? ?????????????????? ???????????? ????????? ?????????????????????????????? ?????? ??????????????? ?????? ????????? ?????? ???????????? ???????????????";

  @override
  String get navigationBarStyle => "???????????????????????? ????????? ????????????";

  @override
  String get headerType => "???????????? ??????????????????";

  @override
  String get leftButtonOption => "??????????????? ????????? ??????????????????";

  @override
  String get rightButtonOption => "???????????? ????????? ??????????????????";

  @override
  String get colorGradient => "????????? ???????????????";

  @override
  String get colorSolid => "????????? ?????????";

  @override
  String get loadingAnimation => "????????? ?????? ????????? ?????? ?????????????????????";

  @override
  String get backToHomePage => "???????????? ??????????????? ??????????????? ??????";

  @override
  String get darkMode => "??????????????? ?????????";

  @override
  String get lightMode => "?????????????????? ?????????";
}

class $de extends I18n {
  const $de();

  @override
  TextDirection get textDirection => TextDirection.ltr;

  @override
  String get home => "Zuhause";

  @override
  String get share => "Aktie";

  @override
  String get about => "??ber";

  @override
  String get rate => "Bewerten Sie uns";

  @override
  String get update => "Anwendung aktualisieren";

  @override
  String get notification => "Benachrichtigung";

  @override
  String get languages => "Sprachen";

  @override
  String get appLang => "Anwendungssprache";

  @override
  String get descLang => "W??hlen Sie Ihre bevorzugten Sprachen";

  @override
  String get whoops => "Hoppla!";

  @override
  String get noInternet => "Keine Internetverbindung";

  @override
  String get tryAgain => "Wiederholen";

  @override
  String get closeApp => "Schlie??en Sie die Anwendung";

  @override
  String get sureCloseApp =>
      "Sind Sie sicher, dass Sie diese App beenden m??chten?";

  @override
  String get ok => "In Ordnung";

  @override
  String get cancel => "Abbrechen";

  @override
  String get changeTheme => "Thema ??ndern";

  @override
  String get customizeYourOwnWay => "Passen Sie Ihren eigenen Weg an";

  @override
  String get descriptionCustomize =>
      "FlyWeb bietet Ihnen die M??glichkeit einer besseren Anpassung der Benutzeroberfl??che. Sie k??nnen ganz einfach Ihren eigenen Themenstil ausw??hlen und sich auf Ihr Projekt einstellen. W??hlen Sie bei der Einstellung Ihrer Benutzeroberfl??che den Symbolleistenstil, die Aktion mit der linken Maustaste, das App-Thema und den Laderstil aus. Danach kehren Sie nach Hause zur??ck, um die ??nderungen anzuzeigen.";

  @override
  String get navigationBarStyle => "Stil der Navigationsleiste";

  @override
  String get headerType => "Headertyp";

  @override
  String get leftButtonOption => "Option f??r linke Taste";

  @override
  String get rightButtonOption => "Option mit der rechten Taste";

  @override
  String get colorGradient => "Farbverlauf";

  @override
  String get colorSolid => "Farbe fest";

  @override
  String get loadingAnimation => "Animation laden";

  @override
  String get backToHomePage => "Zur??ck zur Startseite";

  @override
  String get darkMode => "Dunkler Modus";

  @override
  String get lightMode => "Lichtmodus";
}

class $it extends I18n {
  const $it();

  @override
  TextDirection get textDirection => TextDirection.ltr;

  @override
  String get home => "Accoglienza";

  @override
  String get share => "Suddividere";

  @override
  String get about => "Di";

  @override
  String get rate => "Valutaci";

  @override
  String get update => "Aggiorna applicazione";

  @override
  String get notification => "Notifica";

  @override
  String get languages => "Le lingue";

  @override
  String get appLang => "Lingua dell'applicazione";

  @override
  String get descLang => "Seleziona le tue lingue preferite";

  @override
  String get whoops => "Spiacenti!";

  @override
  String get noInternet => "Nessuna connessione internet";

  @override
  String get tryAgain => "Riprova";

  @override
  String get closeApp => "Chiudi l'applicazione";

  @override
  String get sureCloseApp => "Sei sicuro di voler uscire da questa app?";

  @override
  String get ok => "Va bene";

  @override
  String get cancel => "Per cancellare";

  @override
  String get changeTheme => "Cambia tema";

  @override
  String get customizeYourOwnWay => "Personalizza a modo tuo";

  @override
  String get descriptionCustomize =>
      "FlyWeb ti d?? la potenza di una migliore esperienza di personalizzazione dell'interfaccia utente, ?? facile scegliere il tuo stile del tema e applicare al tuo progetto. Scegli la tua barra degli strumenti come stile della barra degli strumenti, azione del pulsante a destra, tema dell'app, stile del caricatore e poi torna a casa per vedere le modifiche.";

  @override
  String get navigationBarStyle => "Stile della barra di navigazione";

  @override
  String get headerType => "Tipo di intestazione";

  @override
  String get leftButtonOption => "Opzione pulsante sinistro";

  @override
  String get rightButtonOption => "Opzione pulsante destro";

  @override
  String get colorGradient => "Sfumatura di colore";

  @override
  String get colorSolid => "Colore solido";

  @override
  String get loadingAnimation => "Caricamento animazione";

  @override
  String get backToHomePage => "Torna alla HomePage";

  @override
  String get darkMode => "Modalit?? scura";

  @override
  String get lightMode => "Modalit?? luce";
}

class $tr extends I18n {
  const $tr();

  @override
  TextDirection get textDirection => TextDirection.ltr;

  @override
  String get home => "Ev";

  @override
  String get share => "Payla??";

  @override
  String get about => "Hakk??nda";

  @override
  String get rate => "Bizi de??erlendirin";

  @override
  String get update => "Programmany t??zel????";

  @override
  String get notification => "Bildirim";

  @override
  String get languages => "Diller";

  @override
  String get appLang => "Uygulama dili";

  @override
  String get descLang => "Tercih etti??iniz dilleri se??in";

  @override
  String get whoops => "Hata!";

  @override
  String get noInternet => "??nternet ba??lant??s?? yok";

  @override
  String get tryAgain => "Yeniden Dene";

  @override
  String get closeApp => "Uygulamay?? kapat??n";

  @override
  String get sureCloseApp =>
      "Bu uygulamadan ????kmak istedi??inizden emin misiniz?";

  @override
  String get ok => "Tamam";

  @override
  String get cancel => "??ptal etmek";

  @override
  String get changeTheme => "Temay?? de??i??tir";

  @override
  String get customizeYourOwnWay => "Kendi tarz??n??z?? ??zelle??tirin";

  @override
  String get descriptionCustomize =>
      "FlyWeb size daha iyi UI ??zelle??tirme deneyiminin g??c??n?? verir, Kendi tema stilinizi se??mek ve projenize uymak kolayd??r. Kullan??c?? aray??z?? i??e al??m??n??za dayanarak, Ara?? ??ubu??u stilini, soldaki d????me eylemini, uygulama Temas??n??, y??kleyici stilini se??in.Daha sonra de??i??iklikleri g??rmek i??in eve d??n??n.";

  @override
  String get navigationBarStyle => "Gezinme ??ubu??u stili";

  @override
  String get headerType => "??stbilgi t??r??";

  @override
  String get leftButtonOption => "Sol D????me Se??ene??i";

  @override
  String get rightButtonOption => "Sa?? D????me Se??ene??i";

  @override
  String get colorGradient => "Renk gradyan??";

  @override
  String get colorSolid => "Renk D??z";

  @override
  String get loadingAnimation => "Animasyon Y??kleniyor";

  @override
  String get backToHomePage => "Ana sayfaya geri d??n";

  @override
  String get darkMode => "karanl??k mod";

  @override
  String get lightMode => "??????k modu";
}

class $ru extends I18n {
  const $ru();

  @override
  TextDirection get textDirection => TextDirection.ltr;

  @override
  String get home => "??????????????";

  @override
  String get share => "????????????????????";

  @override
  String get about => "?? ????????????????????";

  @override
  String get rate => "?????????????? ??????";

  @override
  String get update => "???????????????? ????????????????????";

  @override
  String get notification => "??????????????????????";

  @override
  String get languages => "??????????";

  @override
  String get appLang => "???????? ????????????????????";

  @override
  String get descLang => "???????????????? ???????????????????????????? ????????";

  @override
  String get whoops => "??????!";

  @override
  String get noInternet => "?????? ???????????????????? ?? ????????????????????";

  @override
  String get tryAgain => "???????????????????? ??????????";

  @override
  String get closeApp => "?????????????? ????????????????????";

  @override
  String get sureCloseApp =>
      "???? ??????????????, ?????? ???????????? ?????????? ???? ?????????? ?????????????????????";

  @override
  String get ok => "OK";

  @override
  String get cancel => "????????????";

  @override
  String get changeTheme => "?????????????? ????????";

  @override
  String get customizeYourOwnWay => "?????????????????? ???? ???????????? ??????????";

  @override
  String get descriptionCustomize =>
      "FlyWeb ?????????????????????????? ?????? ???????????? ???????????????????? ?????? ?????????????????? ?????????????????????????????????? ????????????????????. ???? ???????????? ?????????? ?????????????????? ???????? ?????????????????????? ?????????? ???????? ?? ?????????? ?? ?????????????????? ?????????????????? ?????? ?? ???????????? ??????????????. ?? ?????????????????????? ???? ???????????? ???????????? ?????????????????????????????????? ???????????????????? ???????????????? ?????????? ???????????? ????????????????????????, ???????????????? ?????????? ????????????, ???????? ????????????????????, ?????????? ???????????????? ????????????????????. ??????????, ?????????????????? ???? ??????????????, ?????????? ?????????????? ??????????????????.";

  @override
  String get navigationBarStyle => "?????????? ???????????? ??????????????????";

  @override
  String get headerType => "?????? ??????????????????";

  @override
  String get leftButtonOption => "?????????????????? ?????????? ????????????";

  @override
  String get rightButtonOption => "?????????????????? ???????????? ????????????";

  @override
  String get colorGradient => "????????????????";

  @override
  String get colorSolid => "????????";

  @override
  String get loadingAnimation => "???????????????? ????????????????";

  @override
  String get backToHomePage => "?????????????????? ???? ??????????????";

  @override
  String get darkMode => "???????????? ??????????";

  @override
  String get lightMode => "???????????????? ??????????";
}

class $en extends I18n {
  const $en();
}

class GeneratedLocalizationsDelegate extends LocalizationsDelegate<I18n> {
  const GeneratedLocalizationsDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale("en", ""),
      Locale("es", ""),
      Locale("fr", ""),
      Locale("ar", ""),
      Locale("pt", ""),
      Locale("hi", ""),
      Locale("de", ""),
      Locale("it", ""),
      Locale("tr", ""),
      Locale("ru", ""),
    ];
  }

  LocaleListResolutionCallback listResolution(
      {Locale fallback, bool withCountry = true}) {
    return (List<Locale> locales, Iterable<Locale> supported) {
      if (locales == null || locales.isEmpty) {
        return fallback ?? supported.first;
      } else {
        return _resolve(locales.first, fallback, supported, withCountry);
      }
    };
  }

  LocaleResolutionCallback resolution(
      {Locale fallback, bool withCountry = true}) {
    return (Locale locale, Iterable<Locale> supported) {
      return _resolve(locale, fallback, supported, withCountry);
    };
  }

  @override
  Future<I18n> load(Locale locale) {
    final String lang = getLang(locale);
    if (lang != null) {
      switch (lang) {
        case "en":
          I18n.current = const $en();
          return SynchronousFuture<I18n>(I18n.current);
        case "es":
          I18n.current = const $es();
          return SynchronousFuture<I18n>(I18n.current);
        case "fr":
          I18n.current = const $fr();
          return SynchronousFuture<I18n>(I18n.current);
        case "pt":
          I18n.current = const $pt();
          return SynchronousFuture<I18n>(I18n.current);
        case "ar":
          I18n.current = const $ar();
          return SynchronousFuture<I18n>(I18n.current);
        case "hi":
          I18n.current = const $hi();
          return SynchronousFuture<I18n>(I18n.current);
        case "de":
          I18n.current = const $de();
          return SynchronousFuture<I18n>(I18n.current);
        case "it":
          I18n.current = const $it();
          return SynchronousFuture<I18n>(I18n.current);
        case "tr":
          I18n.current = const $tr();
          return SynchronousFuture<I18n>(I18n.current);
        case "ru":
          I18n.current = const $ru();
          return SynchronousFuture<I18n>(I18n.current);
        default:
        // NO-OP.
      }
    }
    I18n.current = const I18n();
    return SynchronousFuture<I18n>(I18n.current);
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale, true);

  @override
  bool shouldReload(GeneratedLocalizationsDelegate old) => false;

  ///
  /// Internal method to resolve a locale from a list of locales.
  ///
  Locale _resolve(Locale locale, Locale fallback, Iterable<Locale> supported,
      bool withCountry) {
    if (locale == null || !_isSupported(locale, withCountry)) {
      return fallback ?? supported.first;
    }

    final Locale languageLocale = Locale(locale.languageCode, "");
    if (supported.contains(locale)) {
      return locale;
    } else if (supported.contains(languageLocale)) {
      return languageLocale;
    } else {
      final Locale fallbackLocale = fallback ?? supported.first;
      return fallbackLocale;
    }
  }

  ///
  /// Returns true if the specified locale is supported, false otherwise.
  ///
  bool _isSupported(Locale locale, bool withCountry) {
    if (locale != null) {
      for (Locale supportedLocale in supportedLocales) {
        // Language must always match both locales.
        if (supportedLocale.languageCode != locale.languageCode) {
          continue;
        }

        // If country code matches, return this locale.
        if (supportedLocale.countryCode == locale.countryCode) {
          return true;
        }

        // If no country requirement is requested, check if this locale has no country.
        if (true != withCountry &&
            (supportedLocale.countryCode == null ||
                supportedLocale.countryCode.isEmpty)) {
          return true;
        }
      }
    }
    return false;
  }
}

String getLang(Locale l) => l == null
    ? null
    : l.countryCode != null && l.countryCode.isEmpty
        ? l.languageCode
        : l.toString();
