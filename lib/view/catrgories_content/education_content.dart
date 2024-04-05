import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sanskriti/controller/education_controller.dart';
import 'package:sanskriti/controller/helper_controller.dart';
import 'package:sanskriti/helper/book_card.dart';

import 'package:youtube_player_flutter/youtube_player_flutter.dart';

Widget educationContent() {
  HelperController helperController = Get.put(HelperController());
  EducationController educationController = Get.put(EducationController());

  String videoId;
  videoId = YoutubePlayer.convertUrlToId(
      "https://www.youtube.com/watch?v=_fVad1jjsKc&pp=ygUaa25vdyB5b3VyIGluZGlhbiBteXRob2xvZ3k%3D")!;
  // BBAyRBTfsOU
  late YoutubePlayerController controller;
  controller = YoutubePlayerController(
    initialVideoId: videoId,
    flags: const YoutubePlayerFlags(
      autoPlay: false,
      loop: true,
      mute: false,
    ),
  );

  return SingleChildScrollView(
    child: Padding(
      padding: const EdgeInsets.only(
        top: 20,
        left: 15,
        right: 15,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Text(
            'Must Watch Videos :',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
          ),
          Container(
            margin: const EdgeInsets.only(right: 15, top: 20),
            child: Stack(
              children: [
                YoutubePlayer(
                  controller: controller,
                  showVideoProgressIndicator: true,
                  progressIndicatorColor: Colors.blueAccent,
                  progressColors: const ProgressBarColors(
                    playedColor: Colors.red,
                    handleColor: Colors.red,
                  ),
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.play_arrow),
                        onPressed: () {
                          controller.play();
                        },
                      ),
                      IconButton(
                        icon: const Icon(Icons.pause),
                        onPressed: () {
                          controller.pause();
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          const Row(
            children: [
              Text(
                "Recommended for you :",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Obx(
            () => educationController.educationList.isEmpty
                ? const Center(child: CircularProgressIndicator())
                : ListView.builder(
                    shrinkWrap: true,
                    itemCount: educationController.educationList.length,
                    itemBuilder: (context, index) {
                      return BookCard(
                        image: educationController.educationList[index].image ??
                            "",
                        title:
                            educationController.educationList[index].name ?? "",
                        onTap: () {
                          helperController.launchURL(
                              educationController.educationList[index].name ??
                                  "");
                        },
                      );
                    },
                  ),
          ),
        ],
      ),
    ),
  );
}
