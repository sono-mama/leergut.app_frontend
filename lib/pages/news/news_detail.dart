import 'package:flutter/material.dart';
import 'package:frontend/pages/news/news_text.dart';
import 'package:frontend/utils/colors.dart';
import 'package:frontend/utils/dimensions.dart';
import 'package:frontend/widgets/app_icon.dart';

import '../../widgets/big_text.dart';
import '../../widgets/small_text.dart';

class NewsDetailPage extends StatelessWidget {
  const NewsDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
              left: 0,
              right: 0,
              child: Container(
                width: double.maxFinite,
                height: Dimensions.newsDetailImageHeight,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(
                      "assets/images/Rewe_logo.png"
                    )
                  )
                )


          )),
          Positioned(
              top: Dimensions.newsDetailIconHeightMargin,
              left: Dimensions.widthMargin,
              right: Dimensions.widthMargin,
              child: Row(
                children: const [
                  AppIcon(icon: Icons.arrow_back_ios_new)
                ],
              )),
          Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              top: Dimensions.newsDetailImageHeight - 30,
              child: Container(
                padding: EdgeInsets.only(left: Dimensions.widthMargin20,
                    right: Dimensions.widthMargin20, top: Dimensions.heightMargin20),
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(topLeft: Radius.circular(20),
                      topRight: Radius.circular(20)),
                  color: AppColors.textBackgroundColor
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SmallText(text: "News", color: const Color(0x903C3C3C),),
                    SizedBox(height: Dimensions.newsImageTextBoxSizedBoxHeight),
                    BigText(text: "Jetzt deutschlandweit in allen Rewe-Märken"
                        " mit der leergut.app dein Pfand abgeben und mit Guthaben bezahlen",
                      overflow: TextOverflow.fade, maxLines: 10,
                      size: 15, fontWeight: FontWeight.bold,),
                    SizedBox(height: Dimensions.newsImageTextBoxSizedBoxHeight * 1.5),
                    Expanded(
                      child: SingleChildScrollView(
                        child: NewsText(text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Qua tu etiam inprudens utebare non numquam. Ita redarguitur ipse a sese, convincunturque scripta eius probitate ipsius ac moribus. Qui-vere falsone, quaerere mittimus-dicitur oculis se privasse; Transfer idem ad modestiam vel temperantiam, quae est moderatio cupiditatum rationi oboediens. Duo Reges: constructio interrete. Qua tu etiam inprudens utebare non numquam."
                            "Itaque et manendi in vita et migrandi ratio omnis iis rebus, quas supra dixi, metienda. Ex rebus enim timiditas, non ex vocabulis nascitur. Atqui reperies, inquit, in hoc quidem pertinacem; Non autem hoc: igitur ne illud quidem. Illum mallem levares, quo optimum atque humanissimum virum, Cn. Restinguet citius, si ardentem acceperit."
                          "Itaque et manendi in vita et migrandi ratio omnis iis rebus, quas supra dixi, metienda. Ex rebus enim timiditas, non ex vocabulis nascitur. Atqui reperies, inquit, in hoc quidem pertinacem; Non autem hoc: igitur ne illud quidem. Illum mallem levares, quo optimum atque humanissimum virum, Cn. Restinguet citius, si ardentem acceperit."
                            "Itaque et manendi in vita et migrandi ratio omnis iis rebus, quas supra dixi, metienda. Ex rebus enim timiditas, non ex vocabulis nascitur. Atqui reperies, inquit, in hoc quidem pertinacem; Non autem hoc: igitur ne illud quidem. Illum mallem levares, quo optimum atque humanissimum virum, Cn. Restinguet citius, si ardentem acceperit."
                          "Itaque et manendi in vita et migrandi ratio omnis iis rebus, quas supra dixi, metienda. Ex rebus enim timiditas, non ex vocabulis nascitur. Atqui reperies, inquit, in hoc quidem pertinacem; Non autem hoc: igitur ne illud quidem. Illum mallem levares, quo optimum atque humanissimum virum, Cn. Restinguet citius, si ardentem acceperit."
                        "Itaque et manendi in vita et migrandi ratio omnis iis rebus, quas supra dixi, metienda. Ex rebus enim timiditas, non ex vocabulis nascitur. Atqui reperies, inquit, in hoc quidem pertinacem; Non autem hoc: igitur ne illud quidem. Illum mallem levares, quo optimum atque humanissimum virum, Cn. Restinguet citius, si ardentem acceperit."),
                    ),
                    )
                  ],
                ),
              )


              )
        ],
      ),
    );
  }
}
