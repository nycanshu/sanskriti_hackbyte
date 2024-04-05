import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sanskriti/model/blogModel.dart';
// Import the Blog model

class BlogController extends GetxController {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Define an RxList to store the blogs
  RxList<Blog> blogs = <Blog>[].obs;

  @override
  void onInit() {
    // Call fetchBlogs() when the controller initializes
    fetchBlogs();
    super.onInit();
  }

  void fetchBlogs() async {
    try {
      // Get the blog collection from Firestore
      QuerySnapshot<Map<String, dynamic>> snapshot =
          await _firestore.collection('blogs').get();

      // Convert each document to a Blog object and store it in the blogs list
      blogs.assignAll(
          snapshot.docs.map((doc) => Blog.fromJson(doc.data())).toList());
    } catch (e) {
      // Handle any errors
      print("Error 🫡🫡 fetching blogs: $e");
    }
  }

  Future<void> addBlog(blog) async {
    try {
      // Convert the Blog object to a Map
      Map<String, dynamic> data = blog.toJson();

      // Add the data to the Firestore collection
      await _firestore.collection('blogs').add(data);

      // Update the local list of blogs
      blogs.add(blog);
    } catch (e) {
      // Handle any errors
      print("Error adding blog: $e");
    }
  }
}
