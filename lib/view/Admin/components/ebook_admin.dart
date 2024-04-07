import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sanskriti/controller/ebook_controller.dart';
import 'package:sanskriti/controller/helper_controller.dart';
import 'package:sanskriti/helper/ebookcard.dart';

import '../../../model/ebookmodel.dart';

class EbookAdmin extends StatelessWidget {
  const EbookAdmin({super.key});

  @override
  Widget build(BuildContext context) {
    EbookController ebookController = Get.put(EbookController());
    HelperController helperController = Get.put(HelperController());
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
              'Add new Ebook Details',
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
              "Total Ebooks: ${ebookController.ebookdatacount}",
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
            "All Ebooks :",
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
              () => ebookController.ebookList.isEmpty
                  ? const Center(child: CircularProgressIndicator())
                  : ListView.builder(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemCount: ebookController.ebookList.length,
                      itemBuilder: (context, index) {
                        return EbookCard(
                          image: ebookController.ebookList[index].image ?? "",
                          name: ebookController.ebookList[index].name ?? "",
                          link: ebookController.ebookList[index].link ?? "",
                          onTap: () {
                            // Open the link
                            helperController.launchURL(
                              ebookController.ebookList[index].link ?? "",
                            );
                          },
                        );
                      },
                    ),
            ),
          ),
        ],
      ),
    ));
  }

  Widget _addEducationDialog(BuildContext context) {
    EbookController ebookController = Get.put(EbookController());
    TextEditingController nameController = TextEditingController();
    TextEditingController imageController = TextEditingController();
    TextEditingController linkController = TextEditingController();

    return AlertDialog(
      title: const Text(
        'Add Ebook Details',
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
                hintText: 'Enter Ebook Name',
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              controller: imageController,
              decoration: const InputDecoration(
                hintText: 'Enter Ebook Image URL',
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              controller: linkController,
              decoration: const InputDecoration(
                hintText: 'Enter Ebook Link URL',
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
            EbookData newEbook = EbookData(
              name: nameController.text,
              image: imageController.text,
              link: linkController.text,
            );

            // Add the new education section
            ebookController.addEbookData(newEbook);
            ebookController.fetchEbookData();
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
