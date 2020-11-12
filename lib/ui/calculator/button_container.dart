import 'package:flutter/material.dart';
import 'package:akramcalculator/ui/widgets/constant/colors.dart';
import 'package:akramcalculator/ui/widgets/constant/dimensions.dart';

import 'widgets/calculator_button.dart';

import 'package:admob_flutter/admob_flutter.dart';
import 'package:akramcalculator/ad_manager.dart';

class ButtonContainer extends StatefulWidget {
  @override
  _ButtonContainerState createState() => _ButtonContainerState();
}

class _ButtonContainerState extends State<ButtonContainer> {
  bool is_ad = true;
  Widget adv ;
  @override
  void initState() {
    super.initState();
    try{
      Admob.initialize(AdManager.appId);
      adv = AdmobBanner(
          adUnitId: AdManager.bannerAdUnitId,
          adSize: AdmobBannerSize.FULL_BANNER,
          listener: (AdmobAdEvent event, Map<String, dynamic> args) {
            if(event == AdmobAdEvent.loaded){
              setState(() {
                is_ad = true;
              });
              print('AAAAAAAAAAAAAAAAAAAAAAAAAAAAA');
            }else{
              setState(() {
                is_ad = false;
              });
              print('BBBBBBBBBBBBBBBBBBBBBBBBBBB');
            }
          }
      );
    }catch(e){
      setState(() {
        is_ad = false;
      });
    }

  }
  @override
  Widget build(BuildContext context) {
    Color _danger = AppColors.danger;
    Color _primaryText = Colors.white;//Theme.of(context).textTheme.headline1.color;
    final _theme = Theme.of(context);

    return Column(
      children: <Widget>[
        ButtonRow(
          children: [
            CalculatorButton(text: '7', color: _primaryText),
            CalculatorButton(text: '8', color: _primaryText),
            CalculatorButton(text: '9', color: _primaryText),
            CalculatorButton(text: 'Del', color: _danger),
            CalculatorButton(text: 'AC', color: _danger),
          ],
        ),
        ButtonRow(
          children: [
            CalculatorButton(text: '4', color: _primaryText),
            CalculatorButton(text: '5', color: _primaryText),
            CalculatorButton(text: '6', color: _primaryText),
            CalculatorButton(
              text: '×',
              color: _theme.accentColor,
              fontSize: sizeHeadline5,
            ),
            CalculatorButton(
              text: '÷',
              color: _theme.accentColor,
              fontSize: sizeHeadline5,
            ),
          ],
        ),
        ButtonRow(
          children: [
            CalculatorButton(text: '1', color: _primaryText),
            CalculatorButton(text: '2', color: _primaryText),
            CalculatorButton(text: '3', color: _primaryText),
            CalculatorButton(
              text: '+',
              color: _theme.accentColor,
              fontSize: sizeHeadline5,
            ),
            CalculatorButton(
              text: '-',
              color: _theme.accentColor,
              fontSize: sizeHeadline5,
            ),
          ],
        ),
        ButtonRow(
          children: [
            CalculatorButton(text: '0', color: _primaryText),
            CalculatorButton(
              text: '(',
              color: _theme.accentColor,
              fontSize: sizeHeadline6,
            ),
            CalculatorButton(
              text: ')',
              color: _theme.accentColor,
              fontSize: sizeHeadline6,
            ),
            CalculatorButton(
              text: '.',
              color: _theme.accentColor,
              fontSize: sizeHeadline5,
            ),
            CalculatorButton(
              text: '=',
              color: _theme.accentColor,
              fontSize: sizeHeadline5,
            ),
          ],
        ),
        //SizedBox(height: 30.0,),
        is_ad
          ? adv
          : SizedBox(height: 0.0,),
      ],
    );
  }
}

void handleEvent(
    AdmobAdEvent event, Map<String, dynamic> args, String adType) {
  switch (event) {
    case AdmobAdEvent.loaded:
      break;
    case AdmobAdEvent.opened:
      break;
    case AdmobAdEvent.closed:
      break;
    case AdmobAdEvent.failedToLoad:
      break;
    case AdmobAdEvent.rewarded:
      break;
    default:
  }
}


class ButtonRow extends StatelessWidget {
  final children;

  ButtonRow({this.children});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: children,
      ),
    );
  }
}
