import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:sanskriti/controller/education_controller.dart';
import 'package:sanskriti/helper/book_card.dart';
import 'package:sanskriti/model/educationmodel.dart';

class EducationAdmin extends StatefulWidget {
  const EducationAdmin({Key? key}) : super(key: key);

  @override
  State<EducationAdmin> createState() => _EducationAdminState();
}

class _EducationAdminState extends State<EducationAdmin> {
  @override
  Widget build(BuildContext context) {
    EducationController educationController = Get.put(EducationController());
    return Scaffold(
        body: SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return _addEducationDialog(context);
                  },
                );
              },
              child: const Text(
                'Add Education Details',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Divider(),
            Text(
              "Total Education Data: ${educationController.totalEducationData}",
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Divider(),
            const Text(
              "All Education Data:",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Obx(
              () => educationController.educationList.isEmpty
                  ? const Center(child: CircularProgressIndicator())
                  : ListView.builder(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemCount: educationController.educationList.length,
                      itemBuilder: (context, index) {
                        return BookCard(
                          image:
                              educationController.educationList[index].image ??
                                  "",
                          title:
                              educationController.educationList[index].name ??
                                  "",
                          onTap: () {},
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    ));
  }

  Widget _addEducationDialog(BuildContext context) {
    EducationController educationController = Get.put(EducationController());
    TextEditingController nameController = TextEditingController();
    TextEditingController imageController = TextEditingController();
    TextEditingController linkController = TextEditingController();

    return AlertDialog(
      title: const Text(
        'Add Education Details',
        style: TextStyle(
          color: Colors.black,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      content: SizedBox(
        height: 200,
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: const InputDecoration(
                hintText: 'Enter Education Name',
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              controller: imageController,
              decoration: const InputDecoration(
                hintText: 'Enter Education Image URL',
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              controller: linkController,
              decoration: const InputDecoration(
                hintText: 'Enter Education Link URL',
              ),
            ),
          ],
        ),
      ),
      actions: [
        ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('Cancel'),
        ),
        ElevatedButton(
          onPressed: () {
            // Create an EducationCard object
            EducationCard newEducation = EducationCard(
              name: nameController.text,
              image: imageController.text,
              link: linkController.text,
            );

            // Add the new education section
            educationController.addEducationSection(newEducation);
            educationController.fetchEducationData();

            // Close the dialog
            Navigator.of(context).pop();
          },
          child: const Text('Add'),
        ),
      ],
    );
  }
}
