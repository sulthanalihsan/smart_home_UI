import 'package:flutter/material.dart';
import 'package:smart_home_workshop_latihan/my_home_page.dart';

import 'common/colors.dart';
import 'common/sizes.dart';

class SwitchButton extends StatelessWidget {
  final Function changeColor;
  final Function changeBright;
  final Function changeSwitch;
  final ColorState colorState;
  final BrightState brightState;
  final bool switchOnOffState;

  SwitchButton(
      {this.changeColor,
      this.colorState,
      this.changeBright,
      this.brightState,
      this.changeSwitch,
      this.switchOnOffState});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 26.0, vertical: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          colorButton(context),
          brightsButton(context),
          onOffButton(context),
        ],
      ),
    );
  }

  Widget colorButton(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(
          'Color',
          style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.grey[300],
              fontSize: Sizes.dp20(context)),
        ),
        SizedBox(
          height: Sizes.height(context) / 50,
        ),
        GestureDetector(
          onTap: switchOnOffState ? changeColor : () {},
          child: Container(
            decoration: BoxDecoration(
                color: ColorPalette.white,
                shape: BoxShape.circle,
                border: Border.all(
                    color: ColorPalette.grey.withOpacity(0.15), width: 2.0)),
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: Container(
                height: Sizes.width(context) * 0.13,
                width: Sizes.width(context) * 0.13,
                child: Center(
                    child: Text(
                  colorState == ColorState.BLUE ? 'Blu' : 'Ylw',
                  style: TextStyle(color: Colors.white, shadows: [
                    Shadow(
                      color: ColorPalette.black.withOpacity(0.6),
                      blurRadius: 3.5,
                      offset: Offset(0.0, 3.0),
                    )
                  ]),
                )),
                decoration: BoxDecoration(
                    color: switchOnOffState
                        ? (colorState == ColorState.BLUE
                            ? ColorPalette.blueGradientBottom
                            : ColorPalette.yellowGradientBottom)
                        : ColorPalette.grey.withOpacity(0.2),
                    shape: BoxShape.circle),
              ),
            ),
          ),
        )
      ],
    );
  }

  Column brightsButton(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(
          'Brights',
          style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.grey[300],
              fontSize: Sizes.dp20(context)),
        ),
        SizedBox(
          height: Sizes.height(context) / 50,
        ),
        GestureDetector(
          onTap: switchOnOffState ? changeBright : () {},
          child: Container(
            decoration: BoxDecoration(
                color: ColorPalette.white,
                shape: BoxShape.circle,
                border: Border.all(
                    color: ColorPalette.grey.withOpacity(0.15), width: 2.0)),
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: Container(
                height: Sizes.width(context) * 0.13,
                width: Sizes.width(context) * 0.13,
                child: Center(
                    child: Text(
                  brightState == BrightState.B100 ? '100%' : '80%',
                  style: TextStyle(color: Colors.white, shadows: [
                    Shadow(
                      color: ColorPalette.black.withOpacity(0.6),
                      blurRadius: 3.5,
                      offset: Offset(0.0, 3.0),
                    )
                  ]),
                )),
                decoration: BoxDecoration(
                  color: brightState == BrightState.B100
                      ? ColorPalette.grey.withOpacity(0.5)
                      : ColorPalette.grey.withOpacity(0.2),
                  shape: BoxShape.circle,
                ),
              ),
            ),
          ),
        )
      ],
    );
  }

  Column onOffButton(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(
          'Switch',
          style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.grey[300],
              fontSize: Sizes.dp20(context)),
        ),
        SizedBox(
          height: Sizes.height(context) / 50,
        ),
        GestureDetector(
          onTap: changeSwitch,
          child: Container(
            decoration: BoxDecoration(
                color: ColorPalette.white,
                shape: BoxShape.circle,
                border: Border.all(
                    color: ColorPalette.grey.withOpacity(0.15), width: 2.0)),
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: Container(
                height: Sizes.width(context) * 0.13,
                width: Sizes.width(context) * 0.13,
                child: Center(
                    child: Text(
                  switchOnOffState ? 'ON' : 'OFF',
                  style: TextStyle(color: Colors.white, shadows: [
                    Shadow(
                      color: ColorPalette.black.withOpacity(0.6),
                      blurRadius: 3.5,
                      offset: Offset(0.0, 3.0),
                    )
                  ]),
                )),
                decoration: BoxDecoration(
                  color: switchOnOffState
                      ? ColorPalette.grey.withOpacity(0.5)
                      : ColorPalette.grey.withOpacity(0.2),
                  shape: BoxShape.circle,
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
