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
          Obx(
            () => Text(
              "Total Blogs: ${blogController.blogsLength}",
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
            "All Blogs:",
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
          ),
        ],
      ),
    ));
  }

  Widget _addEducationDialog(BuildContext context) {
    BlogController blogController = Get.put(BlogController());
    TextEditingController titleController = TextEditingController();
    TextEditingController subtitleController = TextEditingController();

    return AlertDialog(
      title: const Text(
        'Add Blog Details',
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
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('Cancel'),
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
