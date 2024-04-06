import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sanskriti/controller/channel_controller.dart';
// import 'package:sanskriti/model/cannelmodel.dart';
import 'package:sanskriti/utils/app_colors.dart';

class CreateChannel extends StatelessWidget {
  const CreateChannel({super.key});

  @override
  Widget build(BuildContext context) {
    ChannelController channelController = Get.put(ChannelController());
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create a new Channel'),
        backgroundColor: AppColors.lightsky,
      ),
      body: Column(
        children: [
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                TextField(
                  controller: channelController.channelNameController,
                  decoration: const InputDecoration(
                    hintText: 'Channel Name',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 20),
                TextField(
                  controller: channelController.channelDescriptionController,
                  decoration: const InputDecoration(
                    hintText: 'Channel Description',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    channelController.createChannel();
                  },
                  child: const Text('Create Channel'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
