import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flyweb/src/helpers/HexColor.dart';

class Loader extends StatefulWidget {
  String type;
  Color color;

  Loader({Key key, this.type = "", this.color = Colors.white}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return new _Loader();
  }
}

class _Loader extends State<Loader> {
  @override
  Widget build(BuildContext context) {
    String type = widget.type;
    Color color = widget.color;

    Widget loader;
    switch (type) {
      case "RotatingPlain":
        loader = SpinKitRotatingPlain(
          color: color,
          size: 100.0,
        );
        break;

      case "FadingFour":
        loader = SpinKitFadingFour(
          color: color,
          size: 100.0,
        );
        break;

      case "FadingCube":
        loader = SpinKitFadingCube(
          color: color,
          size: 100.0,
        );
        break;
      case "Pulse":
        loader = SpinKitPulse(
          color: color,
          size: 100.0,
        );
        break;
      case "ChasingDots":
        loader = SpinKitChasingDots(
          color: color,
          size: 100.0,
        );
        break;
      case "ThreeBounce":
        loader = SpinKitThreeBounce(
          color: color,
          size: 100.0,
        );
        break;
      case "Circle":
        loader = SpinKitCircle(
          color: color,
          size: 100.0,
        );
        break;
      case "CubeGrid":
        loader = SpinKitCubeGrid(
          color: color,
          size: 100.0,
        );
        break;
      case "FadingCircle":
        loader = SpinKitFadingCircle(
          color: color,
          size: 100.0,
        );
        break;
      case "FoldingCube":
        loader = SpinKitFoldingCube(
          color: color,
          size: 100.0,
        );
        break;
      case "PumpingHeart":
        loader = SpinKitPumpingHeart(
          color: color,
          size: 100.0,
        );
        break;
      case "DualRing":
        loader = SpinKitDualRing(
          color: color,
          size: 100.0,
        );
        break;
      case "HourGlass":
        loader = SpinKitHourGlass(
          color: color,
          size: 100.0,
        );
        break;
      case "FadingGrid":
        loader = SpinKitFadingGrid(
          color: color,
          size: 100.0,
        );
        break;
      case "Ring":
        loader = SpinKitRing(
          color: color,
          size: 100.0,
        );
        break;
      case "Ripple":
        loader = SpinKitRipple(
          color: color,
          size: 100.0,
        );
        break;
      case "SpinningCircle":
        loader = SpinKitSpinningCircle(
          color: color,
          size: 100.0,
        );
        break;
      case "SquareCircle":
        loader = SpinKitSquareCircle(
          color: color,
          size: 100.0,
        );
        break;
      case "WanderingCubes":
        loader = SpinKitWanderingCubes(
          color: color,
          size: 100.0,
        );
        break;
      case "Wave":
        loader = SpinKitWave(
          color: color,
          size: 100.0,
        );
        break;
      case "DoubleBounce":
        loader = SpinKitDoubleBounce(
          color: color,
          size: 100.0,
        );
        break;
      case "empty":
        loader = Container();
        break;
      default:
        loader = Container();
        break;
    }

    return loader;
  }
}
