import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sanskriti/model/ebookmodel.dart';

class EbookController extends GetxController {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  final RxList<EbookData> ebookList = <EbookData>[].obs;
  int get ebookdatacount => ebookList.length;

  @override
  void onInit() {
    super.onInit();
    fetchEbookData();
  }

  Future<void> fetchEbookData() async {
    try {
      final QuerySnapshot querySnapshot =
          await _firestore.collection('ebook').get();
      final List<EbookData> fetchedList = querySnapshot.docs.map((doc) {
        final Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
        return EbookData.fromJson(data);
      }).toList();
      ebookList.assignAll(fetchedList);
    } catch (e) {
      // Handle error
      print("Error fetching 🤔🤔🤔 education data: $e");
    }
  }

  //function to add education data
  Future<void> addEbookData(EbookData ebookData) async {
    try {
      final Map<String, dynamic> data = ebookData.toJson();
      await _firestore.collection('ebook').add(data);
      ebookList.add(ebookData);
    } catch (e) {
      // Handle error
      print("Error adding education data: $e");
    }
  }
}
