import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sanskriti/model/educationmodel.dart';

class EducationController extends GetxController {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  final RxList<EducationCard> educationList = <EducationCard>[].obs;

  int get totalEducationData => educationList.length;

  @override
  void onInit() {
    super.onInit();
    fetchData(); // Call a function to fetch and count data
  }

  Future<void> fetchData() async {
    await fetchEducationData();

    //print("Total Education Data: $totalEducationData");
  }

  Future<void> fetchEducationData() async {
    try {
      final QuerySnapshot querySnapshot =
          await _firestore.collection('education').get();
      final List<EducationCard> fetchedList = querySnapshot.docs.map((doc) {
        final Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
        return EducationCard.fromJson(data);
      }).toList();
      educationList.assignAll(fetchedList);
    } catch (e) {
      // Handle error
      print("Error fetching education data: $e");
    }
  }

  Future<int> countEducationData() async {
    try {
      final QuerySnapshot querySnapshot =
          await _firestore.collection('education').get();
      final int count = querySnapshot.size;
      return count;
    } catch (e) {
      print("Error counting education data: $e");
      return 0;
    }
  }

  Future<void> addEducationSection(EducationCard education) async {
    try {
      // Convert EducationCard object to Map
      final Map<String, dynamic> data = education.toJson();

      // Add data to Firestore
      await _firestore.collection('education').add(data);

      // Update local list
      educationList.add(education);
    } catch (e) {
      // Handle error
      print("Error adding education section😒😒: $e");
    }
  }
}
