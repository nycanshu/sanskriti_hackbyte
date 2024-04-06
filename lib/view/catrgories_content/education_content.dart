import 'dart:math';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sanskriti/controller/education_controller.dart';
import 'package:sanskriti/controller/helper_controller.dart';
import 'package:sanskriti/helper/book_card.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

Widget educationContent() {
  HelperController helperController = Get.put(HelperController());
  EducationController educationController = Get.put(EducationController());

  // Define your collection of YouTube video URLs
  List<String> videoUrls = [
    "https://www.youtube.com/watch?v=_fVad1jjsKc&pp=ygUaa25vdyB5b3VyIGluZGlhbiBteXRob2xvZ3k%3D",
    "https://youtu.be/jJGhqXFx_WE?si=E20PI0fK-HSumRbP",
    "https://youtu.be/VkG5dZua_qM?si=1o0g5zThcjOWUvz_",
    "https://youtu.be/6ZqxXeFvS2E?si=0pKI08NbtZ6Vp2A9",
    "https://youtu.be/e2rqHaEBa4U?si=XxWhwkQuRSpyl7pN",
    "https://youtu.be/axTtbbnT88w?si=dnx_3kfS5XtsMvp_",
    "https://youtu.be/mJOnRtcU6sE?si=BDBPCfUwfP1QWbhI",
    "https://youtu.be/ILY3Q5AxPbc?si=hrp5u8OBceCrTKXL",
    "https://youtu.be/brHgEYofjpc?si=kdC5N4iXbyEzPBek",
    "https://youtu.be/82OxkkMNJPY?si=sTReaF5iZCSbPwpW",
    // Add more video URLs as needed
  ];

  // Function to select a random video URL
  String selectRandomVideoUrl() {
    Random random = Random();
    return videoUrls[random.nextInt(videoUrls.length)];
  }

  // Get a random video URL
  String randomVideoUrl = selectRandomVideoUrl();

  // Convert the URL to video ID
  String? videoId = YoutubePlayer.convertUrlToId(randomVideoUrl);

  late YoutubePlayerController controller;
  if (videoId != null) {
    controller = YoutubePlayerController(
      initialVideoId: videoId,
      flags: const YoutubePlayerFlags(
        autoPlay: false,
        loop: true,
        mute: false,
      ),
    );
  } else {
    // Handle invalid video URL
    // You may want to show an error message or fallback behavior here
    controller = YoutubePlayerController(
      initialVideoId: '', // Or provide a default video ID
      flags: const YoutubePlayerFlags(
        autoPlay: false,
        loop: false,
        mute: false,
      ),
    );
  }

  return Padding(
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
        Expanded(
          child: Obx(
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
        ),
      ],
    ),
  );
}
