import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:https_search_muz_li/constants.dart';
import 'package:https_search_muz_li/data_change_notifier.dart';
import 'package:https_search_muz_li/main.dart';
import 'package:provider/provider.dart';

// typedef void StringCallback(String val);

class FunctioningCircleButtons extends StatefulWidget {
  // final StringCallback callback;

  // FunctioningCircleButtons({this.callback});

  @override
  _FunctioningCircleButtonsState createState() =>
      _FunctioningCircleButtonsState();

  static _FunctioningCircleButtonsState of(BuildContext context) =>
      context.findAncestorStateOfType<_FunctioningCircleButtonsState>();
}

class _FunctioningCircleButtonsState extends State<FunctioningCircleButtons> {
  Color color;
  bool _plusSelected = false,
      _minusSelected = false,
      _timesSelected = false,
      _divideSelected = false;

  @override
  Widget build(BuildContext context) {
    var screenSizeHeight = MediaQuery.of(context).size.height;
    var screenSizeWidth = MediaQuery.of(context).size.width;

    if (Provider.of<DataChangeNotifier>(context, listen: true)
            .resetAllSelectedButtons ==
        true) {
      setState(() {
        _plusSelected = false;
        _minusSelected = false;
        _timesSelected = false;
        _divideSelected = false;
        Provider.of<DataChangeNotifier>(context, listen: false)
            .updateAllSelectedButtons(false);
      });
    }
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          // height: 100,
          height: (screenSizeHeight * 12.5) / 100,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              // width: 35,
              width: (screenSizeWidth * 8.2) / 100,
            ),
            buildClipOval(FontAwesomeIcons.plus, context, _plusSelected),
          ],
        ),
        SizedBox(
          // height: 20,
          height: (screenSizeHeight * 2.5) / 100,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              // width: 45,
              width: (screenSizeWidth * 10.6) / 100,
            ),
            buildClipOval(FontAwesomeIcons.minus, context, _minusSelected),
          ],
        ),
        SizedBox(
          // height: 20,
          height: (screenSizeHeight * 2.5) / 100,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              // width: 15,
              width: (screenSizeWidth * 3.5) / 100,
            ),
            buildClipOval(FontAwesomeIcons.times, context, _timesSelected),
          ],
        ),
        SizedBox(
          // height: 10,
          height: (screenSizeHeight * 1.25) / 100,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              // width: 150,
              width: (screenSizeWidth * 35.4) / 100,
            ),
            buildClipOval(FontAwesomeIcons.divide, context, _divideSelected),
          ],
        ),
        SizedBox(
          // height: 30,
          height: (screenSizeHeight * 3.7) / 100,
        ),
      ],
    );
  }

  ClipOval buildClipOval(IconData icon, BuildContext context, bool isSelected) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;
    return ClipOval(
      child: Material(
        color: !isSelected
            ? Constants.deactiveFunctionColor
            : Constants.activeFunctionColor,
        child: InkWell(
          splashColor: Colors.red,
          onTap: () {
            setState(
              () {
                if (icon == FontAwesomeIcons.plus) {
                  MyHomePage.of(context).signString = "+";
                  MyHomePage.of(context).isSecondNumber = true;
                  MyHomePage.of(context).isPlusLineSelected = true;
                  MyHomePage.of(context).isMinusLineSelected = false;
                  MyHomePage.of(context).isTimesLineSelected = false;
                  MyHomePage.of(context).isDivideLineSelected = false;
                  _plusSelected = true;
                  _minusSelected = false;
                  _timesSelected = false;
                  _divideSelected = false;
                } else if (icon == FontAwesomeIcons.minus) {
                  MyHomePage.of(context).signString = "-";
                  MyHomePage.of(context).isSecondNumber = true;
                  MyHomePage.of(context).isPlusLineSelected = false;
                  MyHomePage.of(context).isMinusLineSelected = true;
                  MyHomePage.of(context).isTimesLineSelected = false;
                  MyHomePage.of(context).isDivideLineSelected = false;
                  _plusSelected = false;
                  _minusSelected = true;
                  _timesSelected = false;
                  _divideSelected = false;
                } else if (icon == FontAwesomeIcons.times) {
                  MyHomePage.of(context).signString =
                      String.fromCharCode(0x00D7);
                  MyHomePage.of(context).isSecondNumber = true;
                  MyHomePage.of(context).isPlusLineSelected = false;
                  MyHomePage.of(context).isMinusLineSelected = false;
                  MyHomePage.of(context).isTimesLineSelected = true;
                  MyHomePage.of(context).isDivideLineSelected = false;
                  _plusSelected = false;
                  _minusSelected = false;
                  _timesSelected = true;
                  _divideSelected = false;
                } else if (icon == FontAwesomeIcons.divide) {
                  MyHomePage.of(context).signString =
                      String.fromCharCode(0x00F7);
                  MyHomePage.of(context).isSecondNumber = true;
                  MyHomePage.of(context).isPlusLineSelected = false;
                  MyHomePage.of(context).isMinusLineSelected = false;
                  MyHomePage.of(context).isTimesLineSelected = false;
                  MyHomePage.of(context).isDivideLineSelected = true;
                  _plusSelected = false;
                  _minusSelected = false;
                  _timesSelected = false;
                  _divideSelected = true;
                }
              },
            );
          },
          child: SizedBox(
            // width: 56,
            // height: 56,
            width: (screenWidth * 13.2) / 100,
            height: (screenHeight * 7) / 100,
            child: Center(
              child: FaIcon(
                icon,
                color: Colors.white,
                // size: 20,
                size: (screenWidth * 4.7) / 100,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
