import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/common_text.dart';
import '../../../../core/config/routes/app_pages.dart';
import '../../../../core/service/servicelocator.dart';
import '../../../../core/text_styles.dart';
import '../../home/service/selectedgrade.dart';
import '../../home/view/home_screen.dart';

class SelectGrade extends StatefulWidget {
  const SelectGrade({super.key});

  @override
  State<SelectGrade> createState() => _SelectGradeState();
}

class _SelectGradeState extends State<SelectGrade> {
  static GradeSelected get grade => ServiceLocator.get<GradeSelected>();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initFunction();
  }

  initFunction() async {
    Future.delayed(Duration(seconds: 1)).then((value) {
      if (grade.selectedGrade != null) {
        Get.off(() => HomeScreen());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              AppTexts.selectAge,
              style: textColor15w500Dyna,
            ),
            const SizedBox(
              width: 15,
            ),
            PopupMenuButton<dynamic>(
              //better be dropdown
              position: PopupMenuPosition.over,
              onSelected: (value) => onSelectedGrade(context, value),
              itemBuilder: (context) => const [
                PopupMenuItem<String>(
                  padding: EdgeInsets.only(left: 16.0),
                  value: "0", //todo change
                  child: Text('${AppTexts.grade} LKG'),
                ),
                PopupMenuItem<String>(
                  padding: EdgeInsets.only(left: 16.0),
                  value: "1",
                  child: Text('${AppTexts.grade} 1'),
                ),
                PopupMenuDivider(),
                PopupMenuItem<String>(
                  padding: EdgeInsets.only(left: 16.0),
                  value: "2",
                  child: Text('${AppTexts.grade} 2'),
                ),
                PopupMenuDivider(),
                PopupMenuItem<String>(
                  padding: EdgeInsets.only(left: 16.0),
                  value: "3",
                  child: Text('${AppTexts.grade} 3'),
                ),
                PopupMenuDivider(),
                PopupMenuItem<String>(
                  padding: EdgeInsets.only(left: 16.0),
                  value: "4",
                  child: Text('${AppTexts.grade} 4'),
                ),
                PopupMenuDivider(),
                PopupMenuItem<String>(
                  padding: EdgeInsets.only(left: 16.0),
                  value: "5",
                  child: Text('${AppTexts.grade} 5'),
                ),
                PopupMenuDivider(),
                PopupMenuItem<String>(
                  padding: EdgeInsets.only(left: 16.0),
                  value: "6",
                  child: Text('${AppTexts.grade} 6'),
                ),
                PopupMenuDivider(),
                PopupMenuItem<String>(
                  padding: EdgeInsets.only(left: 16.0),
                  value: "7",
                  child: Text('${AppTexts.grade} 7'),
                ),
                PopupMenuDivider(),
                PopupMenuItem<String>(
                  padding: EdgeInsets.only(left: 16.0),
                  value: "8",
                  child: Text('${AppTexts.grade} 8'),
                ),
                // PopupMenuDivider(),
              ], //as you wish you can add more but first check 0th then do accordingly

              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              offset: const Offset(0, 40),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: Image.asset(
                'assets/img/age-group.png',
                height: 30,
              ),
            ),
          ],
        ).paddingSymmetric(horizontal: 16),
      ),
    );
  }

  onSelectedGrade(BuildContext context, value) async {
    grade.saveGrade(value.toString());
    Get.off(() => HomeScreen());
  }
}
