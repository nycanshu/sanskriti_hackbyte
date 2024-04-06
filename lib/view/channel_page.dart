import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sanskriti/view/create_channel.dart';
import 'package:sanskriti/controller/channel_controller.dart';

class ChannelPage extends StatelessWidget {
  final ChannelController channelController = Get.put(ChannelController());

  Future<void> _refreshChannels() async {
    // Call getChannels() when refreshing
    channelController.getChannels();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Scaffold(
        body: RefreshIndicator(
          onRefresh: _refreshChannels,
          child: Column(
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
                    hintText: 'Search Channels',
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(horizontal: 20),
                    prefixIcon: Icon(Icons.search),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  const Text(
                    "Channels",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const Spacer(),
                  IconButton(
                    onPressed: () {
                      Get.to(const CreateChannel());
                    },
                    icon: const Icon(
                      Icons.add_circle_outline_rounded,
                      weight: 5,
                    ),
                  )
                ],
              ),
              const SizedBox(height: 20),
              Expanded(
                child: Obx(() {
                  // Use Obx to update UI when channels list changes
                  if (channelController.channels.isEmpty) {
                    return const Center(child: CircularProgressIndicator());
                  } else {
                    return ListView.builder(
                      itemCount: channelController.channels.length,
                      itemBuilder: (context, index) {
                        final channel = channelController.channels[index];
                        return ListTile(
                          title: Text(channel.name),
                          subtitle: Text(channel.description),
                          trailing: const Icon(Icons.arrow_forward_ios),
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
}
