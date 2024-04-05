import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sanskriti/controller/blog_controller.dart'; // Import the BlogController
import 'package:sanskriti/controller/helper_controller.dart';
import 'package:sanskriti/helper/blogContainer.dart';

Widget blogsContent() {
  HelperController helperController = Get.put(HelperController());
  BlogController blogController =
      Get.put(BlogController()); // Use BlogController

  return Stack(
    children: [
      Obx(() {
        // Observe changes in blog data
        if (blogController.blogs.isEmpty) {
          return const Center(child: CircularProgressIndicator());
        } else {
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(
                  top: 15,
                  left: 15,
                  bottom:
                      80), // Adjust bottom padding to leave space for the FloatingActionButton
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Recent Blogs:',
                    style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, index) => BlogSectionWidget(
                      blog: blogController.blogs[index],
                    ),
                    itemCount: blogController.blogs.length,
                  ),

                  // Add your widgets here
                ],
              ),
            ),
          );
        }
      }),
      Positioned(
        bottom: 20, // Adjust the bottom value as needed
        right: 20, // Adjust the right value as needed
        child: Container(
          //margin: EdgeInsets.all(10), // Adjust margin as needed
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), // Apply border radius
          ),
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(
                  horizontal: 20, vertical: 10), // Adjust padding as needed
            ),
            child: const Text(
              'Write a Blog',
              style: TextStyle(
                fontSize: 20,
                color: Colors.black,
              ),
            ),
          ),
        ),
      ),
      Positioned(
        bottom: 20, // Adjust the bottom value as needed
        left: 20, // Adjust the right value as needed
        child: Container(
          //margin: EdgeInsets.all(10), // Adjust margin as needed
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), // Apply border radius
          ),
          child: ElevatedButton(
            onPressed: () {
              helperController
                  .launchURL('https://nycanshu.github.io/blogy-master/');
            },
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(
                  horizontal: 20, vertical: 10), // Adjust padding as needed
            ),
            child: const Text(
              'Read More Blogs',
              style: TextStyle(
                fontSize: 20,
                color: Colors.black,
              ),
            ),
          ),
        ),
      ),
    ],
  );
}
