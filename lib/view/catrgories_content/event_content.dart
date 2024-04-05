import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:sanskriti/controller/helper_controller.dart';
import 'package:sanskriti/helper/ongoing_event.dart';
import 'package:sanskriti/helper/upcoming_event.dart';

Widget eventContent() {
  HelperController helperController = Get.put(HelperController());
  return SingleChildScrollView(
    child: Padding(
      padding: const EdgeInsets.only(
        left: 10,
        right: 10,
        top: 10,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Ongoing Events :',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.8,
                crossAxisSpacing: 0.8,
                mainAxisSpacing: 10),
            itemBuilder: ((context, index) => OngoingEvent(
                  image: helperController.ongoingEvent[index]['image'],
                  name: helperController.ongoingEvent[index]['name'],
                  location: helperController.ongoingEvent[index]['location'],
                  ontap: () async {
                    helperController.launchURL(
                        helperController.ongoingEvent[index]['link']);
                  },
                  date: helperController.ongoingEvent[index]['date'],
                )),
            itemCount: helperController.ongoingEvent.length,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
          ),
          const SizedBox(
            height: 10,
          ),
          const Text(
            'Upcoming Events :',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          ListView.builder(
            itemBuilder: ((context, index) => UpcomingEvent(
                  ontap: () async {
                    helperController.launchURL(
                        helperController.upcomingEvent[index]['link']);
                  },
                  image: helperController.upcomingEvent[index]['image'],
                  name: helperController.upcomingEvent[index]['name'],
                  location: helperController.upcomingEvent[index]['location'],
                  date: helperController.upcomingEvent[index]['date'],
                )),
            itemCount: helperController.upcomingEvent.length,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
          ),
        ],
      ),
    ),
  );
}
