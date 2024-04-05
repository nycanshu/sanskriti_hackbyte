import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sanskriti/controller/helper_controller.dart';
import 'package:sanskriti/helper/culture_card.dart';
import 'package:sanskriti/view/CulturePage.dart';

Widget cultureContent() {
  HelperController helperController = Get.put(HelperController());
  return ListView.builder(
    itemCount: helperController.cultureData.length,
    itemBuilder: (context, index) {
      return CultureCard(
        ontap: () => Get.to(
          CulturePage(
            appbarTitle: helperController.cultureData[index]['heading'] ?? "",
          ),
        ),
        image: AssetImage(helperController.cultureData[index]['image'] ?? ""),
        heading: helperController.cultureData[index]['heading'] ?? "",
        subheading: helperController.cultureData[index]['subheading'] ?? "",
      );
    },
  );
}
