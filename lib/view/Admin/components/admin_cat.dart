import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sanskriti/view/Admin/admin_category.dart';
import 'package:sanskriti/view/categori_page.dart';

class AdminCategoryItem extends StatelessWidget {
  final String imageUrl;
  final String? name;

  const AdminCategoryItem({
    Key? key,
    required this.imageUrl,
    this.name,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(AdminCategoriesPage(categoriesName: name ?? ""));
      },
      child: Stack(
        children: [
          Container(
            height: 150,
            width: 150,
            margin: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
              image: DecorationImage(
                image: imageUrl.isNotEmpty
                    ? AssetImage(imageUrl)
                    : const AssetImage('images/Hampi_1.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            child: Container(
              height: 25,
              width: 150,

              padding: const EdgeInsets.only(
                bottom: 1,
                left: 35,
              ),
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(5),
                  bottomRight: Radius.circular(5),
                ),
                color: Colors.black.withOpacity(0.5),
              ),
              //color: Colors.black.withOpacity(0.5),
              child: Text(
                name ?? "",
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
