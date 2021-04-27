import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:math' as math;

import 'package:firebase_admob/firebase_admob.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flyweb/i18n/i18n.dart';
import 'package:flyweb/src/elements/DrawerListTitle.dart';
import 'package:flyweb/src/elements/Loader.dart';
import 'package:flyweb/src/elements/RaisedGradientButton.dart';
import 'package:flyweb/src/enum/connectivity_status.dart';
import 'package:flyweb/src/helpers/HexColor.dart';
import 'package:flyweb/src/helpers/SharedPref.dart';
import 'package:flyweb/src/models/menu.dart';
import 'package:flyweb/src/models/navigationIcon.dart';
import 'package:flyweb/src/models/settings.dart';
import 'package:flyweb/src/models/social.dart';
import 'package:flyweb/src/pages/LanguageScreen.dart';
import 'package:flyweb/src/position/PositionOptions.dart';
import 'package:flyweb/src/position/PositionResponse.dart';
import 'package:flyweb/src/themes/UIImages.dart';
import 'package:geolocator/geolocator.dart';
import 'package:launch_review/launch_review.dart';
import 'package:location/location.dart' hide LocationAccuracy;
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:package_info/package_info.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:share/share.dart';
import 'package:store_redirect/store_redirect.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:webview_flutter/webview_flutter.dart' hide WebView;

import 'AboutScreen.dart';

export 'package:webview_flutter/webview_flutter.dart' hide WebView;

import 'package:flyweb/src/services/theme_manager.dart';

class HomeScreen extends StatefulWidget {
  final String url;

  const HomeScreen(this.url);

  @override
  State<StatefulWidget> createState() {
    return new _HomeScreen();
  }
}

class _HomeScreen extends State<HomeScreen> {
  SharedPref sharedPref = SharedPref();
  Settings settings = Settings();
  BannerAd _bannerAd;
  InterstitialAd _interstitialAd;
  static GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  InAppWebViewController _webViewController;

  List<StreamSubscription<Position>> webViewGPSPositionStreams = [];
  bool isLoading;

  final Set<Factory<OneSequenceGestureRecognizer>> _gSet = [
    Factory<VerticalDragGestureRecognizer>(
        () => VerticalDragGestureRecognizer()),
    Factory<ScaleGestureRecognizer>(() => ScaleGestureRecognizer()),
    Factory<PanGestureRecognizer>(() => PanGestureRecognizer()),
  ].toSet();

  PackageInfo _packageInfo = PackageInfo(
    appName: 'Unknown',
    packageName: 'Unknown',
    version: 'Unknown',
    buildNumber: 'Unknown',
  );

  @override
  void initState() {
    isLoading = true;
    loadSharedPrefs();
    super.initState();
    _initPackageInfo();
  }

  @override
  void dispose() {
    _bannerAd?.dispose();
    _interstitialAd?.dispose();
    _bannerAd = null;
    _interstitialAd = null;
    webViewGPSPositionStreams.forEach(
        (StreamSubscription<Position> _flutterGeolocationStream) =>
            _flutterGeolocationStream.cancel());
    super.dispose();
  }

  Future<void> _initPackageInfo() async {
    final PackageInfo info = await PackageInfo.fromPlatform();
    setState(() {
      _packageInfo = info;
    });
  }

  Future loadSharedPrefs() async {
    try {
      Settings _settings = Settings.fromJson(await sharedPref.read("settings"));
      setState(() {
        settings = _settings;
      });

      FirebaseAdMob.instance.initialize(
          appId: Platform.isAndroid
              ? _settings.admobId
              : _settings.admobIdIos); //FirebaseAdMob.testAppId

      if (_settings.adBanner == "1") {
        _bannerAd = createBannerAd()..load();
      } else {
        _bannerAd?.dispose();
      }

      if (_settings.adInterstitial == "1") {
        Timer.periodic(new Duration(seconds: int.parse(_settings.admobDealy)),
            (timer) {
          _interstitialAd?.dispose();
          _interstitialAd = createInterstitialAd()..load();
          _interstitialAd?.show();
        });
      } else {
        _interstitialAd?.dispose();
      }
    } catch (Excepetion) {}
  }

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    var bottomPadding = mediaQueryData.padding.bottom;
    var connectionStatus = Provider.of<ConnectivityStatus>(context);

    var themeProvider = Provider.of<ThemeNotifier>(context);

    if (connectionStatus == ConnectivityStatus.Offline)
      return _offline(bottomPadding);
    return WillPopScope(
      onWillPop: () async {
        return _onBackPressed(context);
      },
      child: Container(
          decoration: BoxDecoration(color: HexColor("#f5f4f4")),
          padding: EdgeInsets.only(bottom: bottomPadding),
          child: Scaffold(
            key: _scaffoldKey,
            appBar: _renderAppBar(context, settings),
            drawer: Drawer(
              child: ListView(
                padding: const EdgeInsets.all(0.0),
                children: <Widget>[
                  DrawerHeader(
                      decoration: BoxDecoration(
                          gradient: LinearGradient(colors: <Color>[
                        themeProvider.isLightTheme
                            ? HexColor(settings.firstColor)
                            : themeProvider.darkTheme.primaryColor,
                        themeProvider.isLightTheme
                            ? HexColor(settings.secondColor)
                            : themeProvider.darkTheme.primaryColor,
                      ])),
                      child: Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              width: 70.0,
                              height: 70.0,
                              child: Image.network(
                                settings.logoUrl,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 5),
                              child: Text(settings.title,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 16)),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 5),
                              child: Text(settings.subTitle,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 14)),
                            )
                          ],
                        ),
                      )),
                  DrawerListTitle(
                      icon: Icons.home,
                      text: I18n.current.home,
                      onTap: () {
                        _webViewController.loadUrl(url: settings.url);
                        Navigator.pop(context);
                      }),
                  _renderMenuDrawer(settings.menus, context),
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
                    child: Divider(height: 1, color: Colors.grey[400]),
                  ),
                  DrawerListTitle(
                      icon: Icons.share,
                      text: I18n.current.share,
                      onTap: () {
                        shareApp(context, settings.title, settings.share);
                      }),
                  DrawerListTitle(
                      icon: Icons.info,
                      text: I18n.current.about,
                      onTap: () {
                        Navigator.pop(context);
                        Navigator.push(
                            context,
                            PageTransition(
                                type: PageTransitionType.rightToLeft,
                                child: AboutScreen()));
                      }),
                  DrawerListTitle(
                      icon: Icons.star,
                      text: I18n.current.rate,
                      onTap: () => LaunchReview.launch(
                          androidAppId: settings.androidId,
                          iOSAppId: settings.iosId)),
                  DrawerListTitle(
                      icon: Icons.translate,
                      text: I18n.current.languages,
                      onTap: () {
                        Navigator.push(
                            context,
                            PageTransition(
                                type: PageTransitionType.rightToLeft,
                                child: LanguageScreen()));
                      }),
                  DrawerListTitle(
                      icon: Icons.brightness_medium,
                      text: themeProvider.isLightTheme
                          ? I18n.current.darkMode
                          : I18n.current.lightMode,
                      onTap: () {
                        if (themeProvider.isLightTheme) {
                          themeProvider.setDarkMode();
                        } else {
                          themeProvider.setLightMode();
                        }
                      }),
                  settings.socials.length != 0
                      ? Padding(
                          padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
                          child: Divider(height: 1, color: Colors.grey[400]),
                        )
                      : Container(),
                  _renderSocialDrawer(settings.socials, context),
                  (_packageInfo.version !=
                          (Platform.isAndroid
                              ? settings.versionAndroid
                              : settings.versionIos))
                      ? new Column(children: [
                          Padding(
                            padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
                            child: Divider(height: 1, color: Colors.grey[400]),
                          ),
                          DrawerListTitle(
                              icon: Icons.system_update,
                              text: I18n.current.update,
                              onTap: () => LaunchReview.launch(
                                  androidAppId: settings.androidId,
                                  iOSAppId: settings.iosId))
                        ])
                      : Container()
                ],
              ),
            ),
            body: ModalProgressHUD(
                progressIndicator: Loader(
                    type: settings.loader,
                    color: themeProvider.isLightTheme
                        ? HexColor(settings.secondColor)
                        : themeProvider.darkTheme.primaryColor),
                child: InAppWebView(
                  // contextMenu: contextMenu,
                  initialUrl: settings.url,
                  gestureRecognizers: _gSet,
                  initialHeaders: {},
                  initialOptions: InAppWebViewGroupOptions(
                      crossPlatform: InAppWebViewOptions(
                          useShouldOverrideUrlLoading: true,
                          useOnDownloadStart: true),
                      android: AndroidInAppWebViewOptions()),
                  onWebViewCreated: (InAppWebViewController controller) {
                    controller.addJavaScriptHandler(
                        handlerName: '_flutterGeolocation',
                        callback: (args) {
                          dynamic geolocationData;

                          // try to decode json
                          try {
                            geolocationData = json.decode(args[0]);
                            //geolocationData = json.decode(args[0].message);

                          } catch (e) {
                            // empty or what ever
                            return;
                          }

                          // Get action from JSON
                          final String action = geolocationData['action'] ?? "";

                          switch (action) {
                            case "clearWatch":
                              _geolocationClearWatch(parseInt(
                                  geolocationData['flutterGeolocationIndex'] ??
                                      0));
                              break;

                            case "getCurrentPosition":
                              _geolocationGetCurrentPosition(
                                  parseInt(geolocationData[
                                          'flutterGeolocationIndex'] ??
                                      0),
                                  PositionOptions()
                                      .from(geolocationData['option'] ?? null));
                              break;

                            case "watchPosition":
                              _geolocationWatchPosition(
                                  parseInt(geolocationData[
                                          'flutterGeolocationIndex'] ??
                                      0),
                                  PositionOptions()
                                      .from(geolocationData['option'] ?? null));
                              break;

                            default:
                          }
                        });
                    _webViewController = controller;
                  },

                  androidOnPermissionRequest:
                      (InAppWebViewController controller, String origin,
                          List<String> resources) async {
                    return PermissionRequestResponse(
                        resources: resources,
                        action: PermissionRequestResponseAction.GRANT);
                  },

                  onLoadStart: (InAppWebViewController controller, String url) {
                    setState(() {
                      isLoading = true;
                    });
                  },
                  shouldOverrideUrlLoading:
                      (controller, shouldOverrideUrlLoadingRequest) async {
                    var url = shouldOverrideUrlLoadingRequest.url;
                    var uri = Uri.parse(url);
                    print("uri.scheme");
                    print(url);
                    if (Platform.isAndroid && uri.scheme.contains("intent")) {
                      String id = url.substring(
                          url.indexOf('id%3D') + 5, url.indexOf('#Intent'));
                      await StoreRedirect.redirect(androidAppId: id);
                      return ShouldOverrideUrlLoadingAction.CANCEL;
                    } else if (![
                      "http",
                      "https",
                      "chrome",
                      "data",
                      "javascript",
                      "about"
                    ].contains(uri.scheme)) {
                      if (await canLaunch(url)) {
                        // Launch the App
                        await launch(
                          url,
                        );
                        // and cancel the request
                        return ShouldOverrideUrlLoadingAction.CANCEL;
                      }
                    }

                    return ShouldOverrideUrlLoadingAction.ALLOW;
                  },
                  onLoadStop:
                      (InAppWebViewController controller, String url) async {
                    Future.delayed(const Duration(milliseconds: 500), () {
                      _geolocationAlertFix();
                    });

                    this.setState(() {
                      isLoading = false;
                    });
                  },
                  onDownloadStart: (controller, url) async {
                    print("onDownloadStart $url");
                    await launch(
                      url,
                    );
                  },
                  onProgressChanged:
                      (InAppWebViewController controller, int progress) {
                    setState(() {
                      //this.progress = progress / 100;
                    });
                  },
                  onUpdateVisitedHistory: (InAppWebViewController controller,
                      String url, bool androidIsReload) {
                    print("onUpdateVisitedHistory $url");
                    setState(() {
                      //this.url = url;
                    });
                  },
                  onConsoleMessage: (controller, consoleMessage) {
                    print(consoleMessage);
                  },
                ),
                inAsyncCall: isLoading && settings.loader != "empty"),
            bottomNavigationBar: Container(
                height: settings.adBanner == "1"
                    ? Platform.isAndroid ? 50 : 80
                    : 0),
          )),
    );
  }

  BannerAd createBannerAd() {
    String testAdUnitId = Platform.isAndroid
        ? settings.admobKeyAdBanner
        : settings.admobKeyAdBannerIos;

    return BannerAd(
        adUnitId: testAdUnitId, //BannerAd.testAdUnitId,
        size: AdSize.banner,
        listener: (MobileAdEvent event) {
          if (event == MobileAdEvent.loaded) {
            _bannerAd..show();
          }
        });
  }

  Widget _offline(bottomPadding) {
    return WillPopScope(
      onWillPop: () async {
        return _onBackPressed(context);
      },
      child: Container(
          decoration: BoxDecoration(color: HexColor("#f5f4f4")),
          padding: EdgeInsets.only(bottom: bottomPadding),
          child: Scaffold(
            key: _scaffoldKey,
            body: Column(
              children: <Widget>[
                Container(
                  height: 130,
                ),
                Expanded(
                    child: new Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                      Container(
                          width: 100.0,
                          height: 100.0,
                          child: Image.asset(
                            UIImages.imageDir + "/wifi.png",
                            color: Colors.black26,
                            fit: BoxFit.contain,
                          )),
                      SizedBox(height: 40),
                      Text(
                        I18n.current.whoops,
                        style: TextStyle(
                            color: Colors.black45,
                            fontSize: 40.0,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 20),
                      Text(
                        I18n.current.noInternet,
                        style: TextStyle(color: Colors.black87, fontSize: 15.0),
                      ),
                      SizedBox(height: 5),
                      SizedBox(height: 60),
                      RaisedGradientButton(
                          child: Text(
                            I18n.current.tryAgain,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold),
                          ),
                          width: 250,
                          gradient: LinearGradient(
                            colors: <Color>[
                              HexColor(settings.secondColor),
                              HexColor(settings.firstColor)
                            ],
                          ),
                          onPressed: () {}),
                    ])),
                Container(
                  height: 100,
                ),
              ],
            ),
          )),
    );
  }

  InterstitialAd createInterstitialAd() {
    return InterstitialAd(
      adUnitId: Platform.isAndroid
          ? settings.admobKeyAdInterstitial
          : settings.admobKeyAdInterstitialIos, //InterstitialAd.testAdUnitId
      listener: (MobileAdEvent event) {},
    );
  }

  int parseInt(dynamic value) {
    if (value == null) return null;
    if (value is int) return value;

    return int.tryParse(value) ?? null;
  }

  Future<PositionResponse> getCurrentPosition(
      PositionOptions positionOptions) async {
    PositionResponse positionResponse = PositionResponse();

    int timeout = 30000;
    if (positionOptions.timeout > 0) timeout = positionOptions.timeout;

    try {
      Geolocator geolocator = Geolocator()..forceAndroidLocationManager = true;
      GeolocationStatus geolocationStatus =
          await geolocator.checkGeolocationPermissionStatus();

      if (geolocationStatus == GeolocationStatus.denied ||
          geolocationStatus == GeolocationStatus.granted ||
          geolocationStatus == GeolocationStatus.restricted ||
          geolocationStatus == GeolocationStatus.unknown) {
        positionResponse.position = await Future.any([
          geolocator.getCurrentPosition(
              desiredAccuracy: (positionOptions.enableHighAccuracy
                  ? LocationAccuracy.best
                  : LocationAccuracy.medium)),
          Future.delayed(Duration(milliseconds: timeout), () {
            if (positionOptions.timeout > 0) positionResponse.timedOut = true;
            return;
          })
        ]);
      } else {
        Location location = new Location();
        bool _serviceEnabled;

        _serviceEnabled = await location.serviceEnabled();
        if (!_serviceEnabled) {
          _serviceEnabled = await location.requestService();
          if (!_serviceEnabled) {}
        }
      }
    } catch (e) {
      Location location = new Location();
      bool _serviceEnabled;

      _serviceEnabled = await location.serviceEnabled();
      if (!_serviceEnabled) {
        _serviceEnabled = await location.requestService();
        if (!_serviceEnabled) {}
      }
    }

    return positionResponse;
  }

  void _geolocationAlertFix() {
    String javascript = '''
      var _flutterGeolocationIndex = 0;
      var _flutterGeolocationSuccess = [];
      var _flutterGeolocationError = [];

      function _flutterGeolocationAlertFix() {
      
        navigator.geolocation = {};
        navigator.geolocation.clearWatch = function(watchId) {
          _flutterGeolocation.postMessage(JSON.stringify({ action: 'clearWatch', flutterGeolocationIndex: watchId, option: {}}));
        };
        navigator.geolocation.getCurrentPosition = function(geolocationSuccess,geolocationError = null, geolocationOptionen = null) {
          _flutterGeolocationIndex++;
          _flutterGeolocationSuccess[_flutterGeolocationIndex] = geolocationSuccess;
          _flutterGeolocationError[_flutterGeolocationIndex] = geolocationError;
          _flutterGeolocation.postMessage(JSON.stringify({ action: 'getCurrentPosition', flutterGeolocationIndex: _flutterGeolocationIndex, option: geolocationOptionen}));
        };
        navigator.geolocation.watchPosition = function(geolocationSuccess,geolocationError = null, geolocationOptionen = {}) {
          _flutterGeolocationIndex++;
          _flutterGeolocationSuccess[_flutterGeolocationIndex] = geolocationSuccess;
          _flutterGeolocationError[_flutterGeolocationIndex] = geolocationError;
          _flutterGeolocation.postMessage(JSON.stringify({ action: 'watchPosition', flutterGeolocationIndex: _flutterGeolocationIndex, option: geolocationOptionen}));
          return _flutterGeolocationIndex;
        };
        return true;
      };
      setTimeout(function(){ _flutterGeolocationAlertFix(); }, 100);
    ''';

    _webViewController.evaluateJavascript(source: javascript);

    _webViewController.evaluateJavascript(source: """
    
      function _flutterGeolocationAlertFix() {
      
        navigator.geolocation = {};
        navigator.geolocation.clearWatch = function(watchId) {
  
  window.flutter_inappwebview.callHandler('_flutterGeolocation',      JSON.stringify({ action: 'clearWatch', flutterGeolocationIndex: watchId, option: {}})      ).then(function(result) {
      //alert(result);
    }); 
    
        };
        
        
        navigator.geolocation.getCurrentPosition = function(geolocationSuccess,geolocationError = null, geolocationOptionen = null) {
  
     _flutterGeolocationIndex++;
          _flutterGeolocationSuccess[_flutterGeolocationIndex] = geolocationSuccess;
          _flutterGeolocationError[_flutterGeolocationIndex] = geolocationError;
         
       
  
  window.flutter_inappwebview.callHandler('_flutterGeolocation',       JSON.stringify({ action: 'getCurrentPosition', flutterGeolocationIndex: _flutterGeolocationIndex, option: geolocationOptionen})      ).then(function(result) {
     });       
    
    
     };
        navigator.geolocation.watchPosition = function(geolocationSuccess,geolocationError = null, geolocationOptionen = {}) {
        
         _flutterGeolocationIndex++;
          _flutterGeolocationSuccess[_flutterGeolocationIndex] = geolocationSuccess;
          _flutterGeolocationError[_flutterGeolocationIndex] = geolocationError;
          
  window.flutter_inappwebview.callHandler('_flutterGeolocation',      JSON.stringify({ action: 'watchPosition', flutterGeolocationIndex: _flutterGeolocationIndex, option: geolocationOptionen})      ).then(function(result) {
     });    
        
          return _flutterGeolocationIndex;
          
        };
        return true;
      
  
    }
          setTimeout(function(){ _flutterGeolocationAlertFix(); }, 100);

  """);
  }

  void _geolocationClearWatch(int flutterGeolocationIndex) {
    // Stop gps position stream
    webViewGPSPositionStreams[flutterGeolocationIndex]?.cancel();

    // remove watcher from list
    webViewGPSPositionStreams.remove(flutterGeolocationIndex);

    // Remove functions from array
    String javascript = '''
      function _flutterGeolocationResponse() {
        _flutterGeolocationSuccess[''' +
        flutterGeolocationIndex.toString() +
        '''] = null;
        _flutterGeolocationError[''' +
        flutterGeolocationIndex.toString() +
        '''] = null;
        return true;
      };
      _flutterGeolocationResponse();
    ''';

    _webViewController.evaluateJavascript(source: javascript);
  }

  void _geolocationGetCurrentPosition(
      int flutterGeolocationIndex, PositionOptions positionOptions) async {
    PositionResponse positionResponse =
        await getCurrentPosition(positionOptions);

    _geolocationResponse(
        flutterGeolocationIndex, positionOptions, positionResponse, false);
  }

  void _geolocationResponse(
      int flutterGeolocationIndex,
      PositionOptions positionOptions,
      PositionResponse positionResponse,
      bool watcher) {
    if (positionResponse.position != null) {
      String javascript = '''
        function _flutterGeolocationResponse() {
          _flutterGeolocationSuccess[''' +
          flutterGeolocationIndex.toString() +
          ''']({
            coords: { 
              accuracy: ''' +
          positionResponse.position.accuracy.toString() +
          ''', 
              altitude: ''' +
          positionResponse.position.altitude.toString() +
          ''', 
              altitudeAccuracy: null, 
              heading: null, 
              latitude: ''' +
          positionResponse.position.latitude.toString() +
          ''', 
              longitude: ''' +
          positionResponse.position.longitude.toString() +
          ''', 
              speed: ''' +
          positionResponse.position.speed.toString() +
          ''' 
            }, 
            timestamp: ''' +
          positionResponse.position.timestamp.millisecondsSinceEpoch
              .toString() +
          '''
          });''' +
          (!watcher
              ? "  _flutterGeolocationSuccess[" +
                  flutterGeolocationIndex.toString() +
                  "] = null; "
              : "") +
          (!watcher
              ? "  _flutterGeolocationError[" +
                  flutterGeolocationIndex.toString() +
                  "] = null; "
              : "") +
          '''
          return true;
        };
        _flutterGeolocationResponse();
      ''';

      _webViewController.evaluateJavascript(source: javascript);
    } else {
      // TODO: Return correct error code
      String javascript = '''
        function _flutterGeolocationResponse() {
          if (_flutterGeolocationError[''' +
          flutterGeolocationIndex.toString() +
          '''] != null) {''' +
          (positionResponse.timedOut
              ? "_flutterGeolocationError[" +
                  flutterGeolocationIndex.toString() +
                  "]({code: 3, message: 'Request timed out', PERMISSION_DENIED: 1, POSITION_UNAVAILABLE: 2, TIMEOUT: 3}); "
              : "_flutterGeolocationError[" +
                  flutterGeolocationIndex.toString() +
                  "]({code: 1, message: 'User denied Geolocationg', PERMISSION_DENIED: 1, POSITION_UNAVAILABLE: 2, TIMEOUT: 3}); ") +
          "}" +
          (!watcher
              ? "  _flutterGeolocationSuccess[" +
                  flutterGeolocationIndex.toString() +
                  "] = null; "
              : "") +
          (!watcher
              ? "  _flutterGeolocationError[" +
                  flutterGeolocationIndex.toString() +
                  "] = null; "
              : "") +
          '''
          return true;
        };
        _flutterGeolocationResponse();
      ''';

      _webViewController.evaluateJavascript(source: javascript);
    }
  }

  void _geolocationWatchPosition(
      int flutterGeolocationIndex, PositionOptions positionOptions) {
    // init new strem
    var geolocator = Geolocator();
    var locationOptions = LocationOptions(
        accuracy: (positionOptions.enableHighAccuracy
            ? LocationAccuracy.best
            : LocationAccuracy.medium),
        distanceFilter: 10);

    webViewGPSPositionStreams[flutterGeolocationIndex] = geolocator
        .getPositionStream(locationOptions)
        .listen((Position position) {
      // Send data to each warcher
      PositionResponse positionResponse = PositionResponse()
        ..position = position;
      _geolocationResponse(
          flutterGeolocationIndex, positionOptions, positionResponse, true);
    });
  }

  JavascriptChannel _flutterJavascriptChannel() {
    return JavascriptChannel(
        name: '_flutterGeolocation',
        onMessageReceived: (JavascriptMessage message) {
          dynamic geolocationData;

          // try to decode json
          try {
            geolocationData = json.decode(message.message);
          } catch (e) {
            // empty or what ever
            return;
          }

          // Get action from| JSON
          final String action = geolocationData['action'] ?? "";

          switch (action) {
            case "clearWatch":
              _geolocationClearWatch(
                  parseInt(geolocationData['flutterGeolocationIndex'] ?? 0));
              break;

            case "getCurrentPosition":
              _geolocationGetCurrentPosition(
                  parseInt(geolocationData['flutterGeolocationIndex'] ?? 0),
                  PositionOptions().from(geolocationData['option'] ?? null));
              break;

            case "watchPosition":
              _geolocationWatchPosition(
                  parseInt(geolocationData['flutterGeolocationIndex'] ?? 0),
                  PositionOptions().from(geolocationData['option'] ?? null));
              break;

            default:
          }
        });
  }

  Widget _renderMenuDrawer(List<Menu> menus, context) {
    return new Column(
      children: menus
          .map(
            (Menu menu) => DrawerListTitle(
                icon_url: menu.iconUrl,
                text: menu.title,
                onTap: () {
                  _webViewController.loadUrl(url: menu.url);
                  Navigator.pop(context);
                }),
          )
          .toList(),
    );
  }

  Widget _renderSocialDrawer(List<Social> socials, context) {
    return new Column(
      children: socials
          .map(
            (Social social) => DrawerListTitle(
                icon_url: social.iconUrl,
                text: I18n.current.social(social.title),
                onTap: () async {
                  if (await canLaunch(
                      social.linkUrl.replaceAll("id_app", social.idApp))) {
                    await launch(
                        social.linkUrl.replaceAll("id_app", social.idApp));
                  } else {
                    launch(social.url.replaceAll("id_app", social.idApp));
                  }
                }),
          )
          .toList(),
    );
  }

  Widget _renderAppBar(context, Settings settings) {
    var themeProvider = Provider.of<ThemeNotifier>(context);
    return settings.navigatinBarStyle != "empty"
        ? AppBar(
            title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  _renderMenuIcon(
                      context,
                      settings.leftNavigationIcon,
                      settings.rightNavigationIcon,
                      settings.navigatinBarStyle,
                      settings,
                      "left"),
                  _renderTitle(settings.navigatinBarStyle, settings),
                  _renderMenuIcon(
                      context,
                      settings.rightNavigationIcon,
                      settings.leftNavigationIcon,
                      settings.navigatinBarStyle,
                      settings,
                      "right"),
                ]),
            automaticallyImplyLeading: false,
            flexibleSpace: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: <Color>[
                    themeProvider.isLightTheme
                        ? HexColor(settings.firstColor)
                        : themeProvider.darkTheme.primaryColor,
                    themeProvider.isLightTheme
                        ? HexColor(settings.secondColor)
                        : themeProvider.darkTheme.primaryColor,
                  ],
                ),
              ),
            ))
        : PreferredSize(
            preferredSize: Size(0.0, 0.0),
            child: Container(
              color: HexColor(settings.secondColor),
            ));
  }

  Widget _renderTitle(String type, Settings settings) {
    var direction = MainAxisAlignment.start;

    switch (type) {
      case "left":
        direction = MainAxisAlignment.start;
        break;
      case "right":
        direction = MainAxisAlignment.end;
        break;
      case "center":
        direction = MainAxisAlignment.center;
        break;
      default:
        direction = MainAxisAlignment.center;
    }

    return Expanded(
      child: Row(
        mainAxisAlignment: direction,
        children: [
          Flexible(
            child: Container(
              child: settings.typeHeader == "text"
                  ? Text(
                      settings.title,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 22.0,
                          fontWeight: FontWeight.bold),
                    )
                  : settings.typeHeader == "image"
                      ? Image.network(settings.logoHeaderUrl, height: 40)
                      : Container(),
            ),
          )
        ],
      ),
    );
  }

  Widget _renderMenuIcon(
      BuildContext context,
      NavigationIcon navigationIcon,
      NavigationIcon navigationOtherIcon,
      String navigatinBarStyle,
      Settings settings,
      String direction) {
    return navigationIcon.value != "icon_empty"
        ? Container(
            padding: direction == "right"
                ? new EdgeInsets.only(left: 0)
                : new EdgeInsets.only(right: 0),
            child: navigationIcon.value != "icon_back_forward"
                ? Row(children: <Widget>[
                    IconButton(
                      color: Colors.red,
                      padding: const EdgeInsets.all(0.0),
                      icon: Transform(
                          alignment: Alignment.center,
                          transform: Matrix4.rotationY(math.pi *
                              (I18n.current.textDirection == TextDirection.ltr
                                  ? 2
                                  : 1)),
                          child: Image.asset(
                              UIImages.imageDir +
                                  "/" +
                                  navigationIcon.value +
                                  ".png",
                              height: 25,
                              width: 25,
                              color: Colors.white)),
                      onPressed: () {
                        actionButtonMenu(navigationIcon, settings, context);
                      },
                    ),
                    Container(
                      width: (navigatinBarStyle == "center" &&
                              navigationOtherIcon.value == "icon_back_forward")
                          ? 50
                          : 0,
                    )
                  ])
                : Row(
                    children: <Widget>[
                      IconButton(
                        color: Colors.red,
                        padding: const EdgeInsets.all(0.0),
                        icon: Transform(
                            alignment: Alignment.center,
                            transform: Matrix4.rotationY(math.pi *
                                (I18n.current.textDirection == TextDirection.ltr
                                    ? 2
                                    : 1)),
                            child: Image.asset(
                                UIImages.imageDir + "/icon_back.png",
                                height: 25,
                                width: 25,
                                color: Colors.white)),
                        onPressed: () {
                          _webViewController.goBack();
                        },
                      ),
                      IconButton(
                        padding: const EdgeInsets.all(0.0),
                        icon: Transform(
                            alignment: Alignment.center,
                            transform: Matrix4.rotationY(math.pi *
                                (I18n.current.textDirection == TextDirection.ltr
                                    ? 2
                                    : 1)),
                            child: Image.asset(
                                UIImages.imageDir + "/icon_forward.png",
                                height: 25,
                                width: 25,
                                color: Colors.white)),
                        onPressed: () {
                          _webViewController.goForward();
                        },
                      ),
                    ],
                  ),
          )
        : Container(
            width: navigatinBarStyle == "center" ? 50 : 0,
          );
  }

  Future<bool> _onBackPressed(context) async {
    try {
      if (_webViewController != null) {
        if (await _webViewController.canGoBack()) {
          _webViewController.goBack();
          return false;
        } else {
          _showDialog(context);
        }
      }
    } catch (e) {
      _showDialog(context);
    }
  }

  _showDialog(context) {
    return showDialog(
      context: context,
      builder: (context) => new AlertDialog(
        title: new Text(I18n.current.closeApp),
        content: new Text(I18n.current.sureCloseApp),
        actions: <Widget>[
          new FlatButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: new Text(I18n.current.cancel),
          ),
          SizedBox(height: 16),
          new FlatButton(
            onPressed: () => exit(0),
            child: new Text(I18n.current.ok),
          ),
        ],
      ),
    );
  }

  actionButtonMenu(
      NavigationIcon navigationIcon, Settings settings, BuildContext context) {
    if (navigationIcon.type == "url") {
      _webViewController.loadUrl(url: navigationIcon.url);
    } else {
      switch (navigationIcon.value) {
        case "icon_menu":
          _HomeScreen._scaffoldKey.currentState.openDrawer();
          break;
        case "icon_home":
          _webViewController.loadUrl(url: settings.url);
          break;
        case "icon_reload":
          _webViewController.reload();
          break;
        case "icon_share":
          shareApp(context, settings.title, settings.share);
          break;
        case "icon_back":
          _webViewController.goBack();
          break;
        case "icon_forward":
          _webViewController.goForward();
          break;
        case "icon_exit":
          _showDialog(context);
          break;
        default:
          () {};
          break;
      }
    }
  }

  shareApp(BuildContext context, String text, String share) {
    final RenderBox box = context.findRenderObject();
    Share.share(share,
        subject: text,
        sharePositionOrigin: box.localToGlobal(Offset.zero) & box.size);
  }
}
