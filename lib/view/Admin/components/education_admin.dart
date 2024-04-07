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
        body: Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ElevatedButton(
            style: ButtonStyle(
              fixedSize: MaterialStateProperty.all<Size>(const Size(350, 50)),
              backgroundColor:
                  MaterialStateProperty.all(Color.fromARGB(255, 133, 190, 237)),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),
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
          Obx(
            () => Text(
              "Total Education Data: ${educationController.totalEducationData}",
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
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
          Expanded(
            child: Obx(
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
          )
        ],
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
          style: ButtonStyle(
            fixedSize: MaterialStateProperty.all<Size>(const Size(100, 50)),
            backgroundColor: MaterialStateProperty.all<Color>(
              Color.fromARGB(255, 230, 233, 235),
            ),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
          ),
          child: const Text(
            'Cancel',
            style: TextStyle(
              color: Colors.black,
              fontSize: 15,
              //fontWeight: FontWeight.bold,
            ),
          ),
        ),
        ElevatedButton(
          style: ButtonStyle(
            fixedSize: MaterialStateProperty.all<Size>(const Size(100, 50)),
            backgroundColor: MaterialStateProperty.all<Color>(
              Color.fromARGB(255, 129, 193, 235),
            ),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
          ),
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
          child: const Text(
            'Add',
            style: TextStyle(
              color: Colors.black,
              fontSize: 15,
              //fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
