
import 'package:flutter/material.dart';
import 'package:frontend/utils/colors.dart';
import 'package:frontend/widgets/small_text.dart';

import '../../utils/dimensions.dart';

class NewsText extends StatefulWidget {

  final String text;

  const NewsText({Key? key,
    required this.text

  }) : super(key: key);

  @override
  State<NewsText> createState() => _NewsTextState();
}

class _NewsTextState extends State<NewsText> {

  late String firstHalf;
  late String secondHalf;
  bool hiddenText = true;
  double textHeight = Dimensions.screenHeight / 2;

  @override
  void initState() {
    super.initState();
    if (widget.text.length > textHeight) {
      firstHalf = widget.text.substring(0, textHeight.toInt());
      secondHalf = widget.text.substring(textHeight.toInt() + 1, widget.text.length);
    } else {
      firstHalf = widget.text;
      secondHalf = "";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: secondHalf.isEmpty?SmallText(text: firstHalf):Column(
        children: [
          SmallText(text: hiddenText?(firstHalf + "..."):(firstHalf + secondHalf), height: 1.3,),
          InkWell(
            onTap: (){
              setState(() {
                hiddenText =! hiddenText;
              });
            },
            child: Row(
              children: [
                SmallText(text: hiddenText?"Alles anzeigen":"Weniger anzeigen", color: AppColors.secondaryColor,),
                Icon(hiddenText?Icons.arrow_drop_down:Icons.arrow_drop_up,
                  color: AppColors.secondaryColor, )
              ],
            ),
          )
        ],
      ),
    );
  }
}
