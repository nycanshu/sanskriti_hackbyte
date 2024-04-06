import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sanskriti/view/create_channel.dart';
import 'package:sanskriti/controller/channel_controller.dart';

class ChannelPage extends StatelessWidget {
  ChannelController channelController = Get.put(ChannelController());

  Future<void> _refreshChannels() async {
    // Call getChannels() when refreshing
    channelController.fetchUserChannels();
    channelController.fetchAllChannels();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Scaffold(
        body: RefreshIndicator(
          onRefresh: _refreshChannels,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(vertical: 6.5),
                height: 50,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const TextField(
                  decoration: InputDecoration(
                    hintText: 'Search all Channels',
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(horizontal: 20),
                    prefixIcon: Icon(Icons.search),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Text(
                    'Your Channels',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      // Display dropdown menu
                      showChannelsMenu(context);
                    },
                    icon: const Icon(Icons.arrow_drop_down),
                  ),
                  const Spacer(),
                  IconButton(
                    icon: const Icon(Icons.add),
                    onPressed: () {
                      Get.to(const CreateChannel());
                    },
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Expanded(
                child: Obx(() {
                  // Use Obx to update UI when channels list changes
                  if (channelController.selectedChannels.isEmpty) {
                    return const Center(child: CircularProgressIndicator());
                  } else {
                    return ListView.builder(
                      itemCount: channelController.selectedChannels.length,
                      itemBuilder: (context, index) {
                        final channel =
                            channelController.selectedChannels[index];
                        return InkWell(
                          onTap: () {},
                          child: ListTile(
                            title: Text(channel.name),
                            subtitle: Text(channel.description),
                            trailing: const Icon(Icons.arrow_forward_ios),
                          ),
                        );
                      },
                    );
                  }
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Function to display dropdown menu for selecting channels
  void showChannelsMenu(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              title: Text('Your Channels'),
              onTap: () {
                // Close modal and update selected channels
                Navigator.pop(context);
                channelController.selectUserChannels();
              },
            ),
            ListTile(
              title: Text('All Channels'),
              onTap: () {
                // Close modal and update selected channels
                Navigator.pop(context);
                channelController.selectAllChannels();
              },
            ),
          ],
        );
      },
    );
  }
}
