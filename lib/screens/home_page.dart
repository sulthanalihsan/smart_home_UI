import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:smart_home_workshop_latihan/common/colors.dart';
import 'package:smart_home_workshop_latihan/common/sizes.dart';
import 'package:smart_home_workshop_latihan/widgets/lamp.dart';
import 'package:smart_home_workshop_latihan/widgets/switch_button.dart';




enum ColorState { YELLOW, BLUE }
enum BrightState { B100, B80 }

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var color = ColorState.YELLOW;
  var bright = BrightState.B100;
  bool switchOnOff = true;

  void changeColor() {
    if (color == ColorState.YELLOW) {
      setState(() {
        color = ColorState.BLUE;
      });
    } else {
      setState(() {
        color = ColorState.YELLOW;
      });
    }
  }

  void changeBright() {
    if (bright == BrightState.B100) {
      setState(() {
        bright = BrightState.B80;
      });
    } else {
      setState(() {
        bright = BrightState.B100;
      });
    }
  }

  void changeSwitch() {
    setState(() {
      switchOnOff = !switchOnOff;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          bulbBackground(context),
          titleText(),
          SwitchButton(
            changeColor: changeColor,
            colorState: color,
            changeBright: changeBright,
            brightState: bright,
            changeSwitch: changeSwitch,
            switchOnOffState: switchOnOff,
          )
        ],
      ),
    );
  }

  Widget bulbBackground(BuildContext context) {
    return Stack(
          children: <Widget>[
            AnimatedContainer(
              duration: Duration(milliseconds: 500),
              height: Sizes.height(context) * 0.6,
              decoration: BoxDecoration(
                  color: color == ColorState.BLUE
                      ? ColorPalette.blueGradientBottom.withOpacity(0.4)
                      : ColorPalette.yellowGradientBottom.withOpacity(0.5),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(Sizes.width(context)),
                    bottomRight: Radius.circular(Sizes.width(context)),
                  )),
            ),
            Lamp(
              brightState: bright,
              colorState: color,
              switchOnOffState: switchOnOff,
            )
          ],
        );
  }

  Widget titleText() => Padding(
        padding: const EdgeInsets.all(26.0),
        child: Text(
          'Round Lanterns \nLamp',
          style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: Sizes.dp25(context),
              color: Colors.grey[800]),
        ),
      );
}
