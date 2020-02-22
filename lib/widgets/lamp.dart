import 'package:flutter/material.dart';
import 'package:smart_home_workshop_latihan/screens/home_page.dart';
import '../common/colors.dart';
import '../common/sizes.dart';

class Lamp extends StatelessWidget {
  final BrightState brightState;
  final ColorState colorState;
  final bool switchOnOffState;

  Lamp({this.brightState, this.colorState, this.switchOnOffState});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          CableBulb(),
          FittingBulb(),
          Bulb(
            brightState: brightState,
            colorState: colorState,
            switchOnOffState: switchOnOffState,
          )
        ],
      ),
    );
  }
}

class Bulb extends StatelessWidget {
  final BrightState brightState;
  final ColorState colorState;
  final bool switchOnOffState;

  Bulb({this.brightState, this.colorState, this.switchOnOffState});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 500),
      height: Sizes.width(context) * 0.3,
      width: Sizes.width(context) * 0.3,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: colorState == ColorState.BLUE
                ? [
                    ColorPalette.blueGradientTop,
                    ColorPalette.blueGradientBottom,
                  ]
                : [
                    ColorPalette.yellowGradientTop,
                    ColorPalette.yellowGradientBottom,
                  ]),
        boxShadow: switchOnOffState
            ? [
                BoxShadow(
                    color: colorState == ColorState.BLUE
                        ? ColorPalette.blueGradientBottom.withOpacity(0.5)
                        : ColorPalette.yellowGradientBottom.withOpacity(0.5),
                    blurRadius: 30.0,
                    offset: Offset(0, 0),
                    spreadRadius: brightState == BrightState.B100 ? 35.0 : 25.0)
              ]
            : [],
      ),
    );
  }
}

class FittingBulb extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: Sizes.height(context) * 0.014,
      width: 12,
      decoration: BoxDecoration(
          color: ColorPalette.black,
          borderRadius: BorderRadius.vertical(top: Radius.circular(5.0))),
    );
  }
}

class CableBulb extends StatelessWidget {
  const CableBulb({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Sizes.height(context) * 0.3,
      width: 3,
      color: ColorPalette.black,
    );
  }
}
