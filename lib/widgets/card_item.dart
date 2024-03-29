
import 'package:flutter/material.dart';
import 'package:flutterapp/widgets/style_text_rich.dart';

class CardItem extends StatelessWidget {
  StyleTextRich? text;
  IconData? icon;
  Color? colorIcon;
  Color? colorCard;

  CardItem(this.icon, this.colorIcon, {this.text, this.colorCard}){
    if(text == null)
      text = StyleTextRich(title: "none: ", subtitle: "none",);
  }

  @override
  Widget build(BuildContext context) {
    return Card(    
      color: colorCard,        
      child: Padding(
        padding: const EdgeInsets.only(left: 10, right: 12, top: 8, bottom: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Icon(
              icon,
              size: 50,
              color: colorIcon
              ),
            
            Flexible(    
              child: Padding(
                padding: const EdgeInsets.only(left: 50.0),
                child: Column(
                  children: [
                    text!
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      margin: EdgeInsets.all(10),            
      elevation: 10,
    );
  }

}