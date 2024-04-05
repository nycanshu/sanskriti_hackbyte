import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sanskriti/controller/helper_controller.dart';
import 'package:sanskriti/helper/explore_container.dart';

class ExplorePage extends StatelessWidget {
  const ExplorePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    HelperController helperController = Get.put(HelperController());
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Explore AR and VR contents',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ), // TextStyle
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              height: 50,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(10),
              ),
              child: const TextField(
                decoration: InputDecoration(
                  hintText: 'Search for AR and VR contents',
                  hintStyle: TextStyle(
                    color: Colors.grey,
                  ), // TextStyle
                  prefixIcon: Icon(Icons.search),
                  border: InputBorder.none,
                ), // InputDecoration
              ), // TextField
            ),
            ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: helperController.exploreData
                  .length, // Set the itemCount according to your data
              itemBuilder: (context, index) {
                return ExploreContainer(
                  ontap: () => helperController.launchURL(
                      "https://nycanshu.github.io/Augmented-Reality-for-Tourism-main/"),
                  heading: helperController.exploreData[index]['heading'] ?? "",
                  subheading:
                      helperController.exploreData[index]['subheding'] ?? "",
                  image: helperController.exploreData[index]['image'] ?? "",
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
