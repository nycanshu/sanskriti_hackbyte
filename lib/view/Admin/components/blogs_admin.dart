import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sanskriti/controller/blog_controller.dart';
import 'package:sanskriti/helper/blogContainer.dart';
import 'package:sanskriti/model/blogmodel.dart';

class BlogAdmin extends StatelessWidget {
  const BlogAdmin({super.key});

  @override
  Widget build(BuildContext context) {
    BlogController blogController = Get.put(BlogController());
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
                'Add A Blog Details',
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
              "Total Education Data: 10",
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
              () => blogController.blogs.isEmpty
                  ? const Center(child: CircularProgressIndicator())
                  : ListView.builder(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemCount: blogController.blogs.length,
                      itemBuilder: (context, index) {
                        return BlogSectionWidget(
                          blog: blogController.blogs[index],
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
    BlogController blogController = Get.put(BlogController());
    TextEditingController titleController = TextEditingController();
    TextEditingController subtitleController = TextEditingController();

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
              controller: titleController,
              decoration: const InputDecoration(
                hintText: 'Enter Blog Title',
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              controller: subtitleController,
              decoration: const InputDecoration(
                hintText: 'Enter Blog Subtitle',
              ),
            ),
            const SizedBox(
              height: 10,
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
            Blog blog = Blog(
              title: titleController.text,
              subtitle: subtitleController.text,
            );

            // Add the new education section
            blogController.addBlog(blog);
            blogController.fetchBlogs();
            // Close the dialog
            Navigator.of(context).pop();
          },
          child: const Text('Add'),
        ),
      ],
    );
  }
}
