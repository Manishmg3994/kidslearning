library home_view;

import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutterfire_ui/firestore.dart';
import 'package:get/get.dart';

import '../../../../core/colors.dart';
import '../../../../core/common_text.dart';
import '../../../../core/config/theme/helper/themeviewmodel.dart';
import '../../../../core/config/translation/provider/locale_provider.dart';
import '../../../../core/service/servicelocator.dart';
import '../../../../core/text_styles.dart';
import '../../explore/view/explorevideos_view.dart';
import '../model/category_model.dart';
import '../service/selectedgrade.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isDark = Get.isDarkMode;
  // String selectedGrade = "1";
  String? selectedCategoryName;
  static GradeSelected get grade => ServiceLocator.get<GradeSelected>();

  int selectedService = -1; //TODO Grade
  Query<Service>? queryPost = FirebaseFirestore.instance
      .collection('category')
      .orderBy('indx')
      .where("grade",
          arrayContainsAny: ["${grade.selectedGrade}"]).withConverter<Service>(
    fromFirestore: ((snapshot, options) => Service.fromJson(snapshot.data()!)),
    toFirestore: (category, _) => category.toJson(),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: isDark ? AppColorsDark.bgColor : AppColors.bgColor,
      appBar: AppBar(
        toolbarHeight: 80,
        backgroundColor:
            isDark ? AppColorsDark.transparent : AppColors.transparent,
        elevation: 0.0,
        title: Text(AppTexts.kidsLearning,
            style: isDark
                ? textColor22w600DynadarkMode.copyWith(fontSize: 28)
                : textColor22w600Dyna.copyWith(fontSize: 28),
            textAlign: TextAlign.left),
        actions: [
          Row(
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
        ],
      ),
      // drawer: Drawer(),
      floatingActionButton: selectedService >= 0
          ? FloatingActionButton(
              onPressed: () {
                Get.to(ExploreVideos(
                  categoryName: selectedCategoryName,
                ));
                //selectedCategoryName
              },
              child: Icon(
                Icons.arrow_forward_ios,
                size: 20,
              ),
              backgroundColor: Colors.green,
            )
          : null,
      body: FirestoreQueryBuilder<Service>(
        query: queryPost!,
        builder: (context, snapshot, child) {
          if (snapshot.isFetching) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text("Something Went Wrong !! ${snapshot.error}"),
            );
          } else {
            return GridView.builder(
                itemCount: snapshot.docs.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                itemBuilder: ((context, index) {
                  final hasEndReached = snapshot.hasMore &&
                      index + 1 == snapshot.docs.length &&
                      !snapshot.isFetchingMore;
                  if (hasEndReached) {
                    snapshot.fetchMore();
                  }
                  final post = snapshot.docs[index].data();
                  return serviceContainer(
                      image: post.imageURL!,
                      name: post.name,
                      index: index); //TODO
                }));
          }
        },
      ),
    );
  }

  serviceContainer(
      {required String image, required String name, required int index}) {
    return GestureDetector(
      onTap: () {
        setState(() {
          if (selectedService == index)
            selectedService = -1;
          else
            selectedService = index;
          selectedCategoryName = name;
        });
      },
      child: AnimatedContainer(
        duration: Duration(milliseconds: 100),
        padding: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: selectedService == index
              ? Colors.blue.shade50
              : Colors.grey.shade100,
          border: Border.all(
            color: selectedService == index
                ? Colors.green
                : Colors.green.withOpacity(0),
            width: 2.0,
          ),
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CachedNetworkImage(
                  imageUrl: image,
                  height: 80,
                  placeholder: (context, url) =>
                      Center(child: CircularProgressIndicator()),
                  errorWidget: (context, url, error) => Image.asset(
                      'assets/img/age-group.png', //TODO PATH TO LOGO IMAGE
                      height: 80)), //todo
              SizedBox(
                height: 20,
              ),
              Text(
                name,
                style: TextStyle(fontSize: 20),
              )
            ]),
      ),
    );
  }

  void onSelectedGrade(BuildContext context, dynamic item) {
    grade.saveGrade(item.toString());
    setState(() {
      //NOT CHECKED
      build(context);
      queryPost = FirebaseFirestore.instance
          .collection('category')
          .orderBy('indx')
          .where("grade",
              arrayContainsAny: ["${item.toString()}"]).withConverter<Service>(
        fromFirestore: ((snapshot, options) =>
            Service.fromJson(snapshot.data()!)),
        toFirestore: (category, _) => category.toJson(),
      );
    });
  }
}
