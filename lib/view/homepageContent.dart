import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sanskriti/controller/helper_controller.dart';
import 'package:sanskriti/helper/categories_card.dart';

import '../helper/custom_carosel.dart';

class HomePageContent extends StatelessWidget {
  const HomePageContent({super.key});

  @override
  Widget build(BuildContext context) {
    HelperController helperController = Get.put(HelperController());
    return Scaffold(
      body: ListView(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(
                  left: 15,
                  top: 15,
                ),
                child: Text(
                  "Top Picks :",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              ImageCarousel(
                onTap: () async {
                  helperController.launchURL(helperController.image[0]["url"]);
                },
                imageList: helperController.image,
                height: 250,
                autoPlay: true,
              ),
              const SizedBox(
                height: 20,
              ),
              const Padding(
                padding: EdgeInsets.only(
                  left: 15,
                  right: 15,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Categories',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      'See all..',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GridView.builder(
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisSpacing: 8.0,
                crossAxisSpacing: 8.0,
              ),
              itemCount: helperController.categories.length,
              itemBuilder: (context, index) {
                return CategoryItem(
                  imageUrl: helperController.categories[index]["image"],
                  name: helperController.categories[index]["name"],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
