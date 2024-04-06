import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../model/cannelmodel.dart';
// import '../model/channel_model.dart'; // Assuming model file name is corrected to 'channel_model.dart'

class ChannelController extends GetxController {
  final TextEditingController channelNameController = TextEditingController();
  final TextEditingController channelDescriptionController =
      TextEditingController();

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Observable lists to hold channels
  RxList<ChannelModel> userChannels = <ChannelModel>[].obs;
  RxList<ChannelModel> allChannels = <ChannelModel>[].obs;
  RxList<ChannelModel> selectedChannels = <ChannelModel>[].obs;

  String currentUserID = ''; // Current user's ID

  @override
  void onInit() {
    super.onInit();
    // Initialize controller
    initialize();
  }

  // Initialize controller
  void initialize() async {
    // Get the current user's ID
    currentUserID = FirebaseAuth.instance.currentUser?.uid ?? '';
    // Fetch user's channels and all channels
    await fetchUserChannels();
    await fetchAllChannels();
    // Initially select user's channels
    selectUserChannels();
  }

  // Function to create a channel
  void createChannel() async {
    try {
      String name = channelNameController.text.trim();
      String description = channelDescriptionController.text.trim();

      ChannelModel newChannel = ChannelModel(
        name: name,
        description: description,
        adminID: currentUserID, // Set admin ID to current user's ID
      );

      // Add the new channel to Firestore
      await _firestore.collection('channels').add(newChannel.toMap());

      // Clear text controllers after adding the channel
      channelNameController.clear();
      channelDescriptionController.clear();

      // Show success message
      Get.snackbar('Success', 'Channel created successfully');
    } catch (e) {
      // Handle errors
      print('Error creating channel: $e');
      Get.snackbar('Error', 'Failed to create channel');
    }
  }

  // Function to retrieve channels where the current user is admin
  Future<void> fetchUserChannels() async {
    try {
      // Get channels where admin_id matches the current user's ID
      QuerySnapshot querySnapshot = await _firestore
          .collection('channels')
          .where('admin_id', isEqualTo: currentUserID)
          .get();

      // Convert each document to ChannelModel and store in the userChannels list
      userChannels.assignAll(querySnapshot.docs.map(
          (doc) => ChannelModel.fromMap(doc.data() as Map<String, dynamic>)));

      // Show channels in the console
      userChannels.forEach((channel) {
        print('User Channel: ${channel.name}, ${channel.description}');
      });
    } catch (e) {
      // Handle errors
      print('Error getting user channels: $e');
      Get.snackbar('Error', 'Failed to get user channels');
    }
  }

  // Function to retrieve all channels
  Future<void> fetchAllChannels() async {
    try {
      // Get all channels
      QuerySnapshot querySnapshot =
          await _firestore.collection('channels').get();

      // Convert each document to ChannelModel and store in the allChannels list
      allChannels.assignAll(querySnapshot.docs.map(
          (doc) => ChannelModel.fromMap(doc.data() as Map<String, dynamic>)));

      // Show channels in the console
      // allChannels.forEach((channel) {
      //   print('All Channel: ${channel.name}, ${channel.description}');
      // });
    } catch (e) {
      // Handle errors
      print('Error getting all channels: $e');
      Get.snackbar('Error', 'Failed to get all channels');
    }
  }

  // Function to select user's channels
  void selectUserChannels() {
    selectedChannels.assignAll(userChannels);
  }

  // Function to select all channels
  void selectAllChannels() {
    selectedChannels.assignAll(allChannels);
  }
}
