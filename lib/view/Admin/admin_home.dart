import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:sanskriti/controller/admin_controller.dart';
import 'package:sanskriti/utils/app_colors.dart';

import 'components/admin_cat.dart';

class AdminHomePage extends StatelessWidget {
  const AdminHomePage({Key? key});

  @override
  Widget build(BuildContext context) {
    AdminController adminController = Get.put(AdminController());
    return Scaffold(
      drawer: Drawer(),
      appBar: AppBar(
        title: const Text('Admin Home Page'),
        centerTitle: true,
        backgroundColor: AppColors.lightblueshade,
        actions: [
          IconButton(
            onPressed: () {
              adminController.adminLogout();
            },
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 50,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: AppColors.lightblueshade,
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Current Users: ",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  Text(
                    "21",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                ],
              ),
            ),
            const Divider(),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: GridView.builder(
                // physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemCount: adminController.sections.length,
                itemBuilder: (context, index) {
                  return AdminCategoryItem(
                    imageUrl: adminController.sections[index]["image"],
                    name: adminController.sections[index]["title"],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
