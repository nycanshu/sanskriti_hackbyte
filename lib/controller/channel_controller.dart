import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/cannelmodel.dart';

class ChannelController extends GetxController {
  final TextEditingController channelNameController = TextEditingController();
  final TextEditingController channelDescriptionController =
      TextEditingController();

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Observable list to hold channels
  RxList<ChannelModel> channels = <ChannelModel>[].obs;

  void onInit() {
    super.onInit();
    // Call getChannels() when the controller is initialized
    getChannels();
  }

  // Function to create a channel
  void createChannel() async {
    try {
      String name = channelNameController.text.trim();
      String description = channelDescriptionController.text.trim();

      ChannelModel newChannel =
          ChannelModel(name: name, description: description);

      // Add the new channel to Firestore
      await _firestore.collection('channels').add(newChannel.toMap());

      // Clear text controllers after adding the channel
      channelNameController.clear();
      channelDescriptionController.clear();

      // Show success message or navigate to another screen
      Get.snackbar('Success', 'Channel created successfully');
    } catch (e) {
      // Handle errors
      print('Error creating channel: $e');
      Get.snackbar('Error', 'Failed to create channel');
    }
  }

  // Function to retrieve all channels
  void getChannels() async {
    try {
      // Get all channels from Firestore
      QuerySnapshot querySnapshot =
          await _firestore.collection('channels').get();

      // Convert each document to ChannelModel and store in the channels list
      channels.assignAll(querySnapshot.docs.map(
          (doc) => ChannelModel.fromMap(doc.data() as Map<String, dynamic>)));

      // Show channels in the console
      channels.forEach((channel) {
        print('Channel: ${channel.name}, ${channel.description}');
      });
    } catch (e) {
      // Handle errors
      print('Error getting channels: $e');
      Get.snackbar('Error', 'Failed to get channels');
    }
  }
}
