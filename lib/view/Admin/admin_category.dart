import 'package:flutter/material.dart';
import 'package:sanskriti/utils/app_colors.dart';
import 'package:sanskriti/view/Admin/components/blogs_admin.dart';
import 'package:sanskriti/view/Admin/components/culture_admin.dart';
import 'package:sanskriti/view/Admin/components/ebook_admin.dart';
import 'package:sanskriti/view/Admin/components/education_admin.dart';
import 'package:sanskriti/view/Admin/components/event_admin.dart';
import 'package:sanskriti/view/Admin/components/feedback_admin.dart';

import 'components/admin_feedback.dart';

class AdminCategoriesPage extends StatelessWidget {
  final String categoriesName;
  const AdminCategoriesPage({
    super.key,
    required this.categoriesName,
  });

  @override
  Widget build(BuildContext context) {
    Widget bodyContent;

    // Define different body content based on categoriesName
    switch (categoriesName) {
      case 'Education':
        bodyContent = EducationAdmin();
        break;
      case 'E-books':
        bodyContent = EbookAdmin();
        break;
      case 'Events':
        bodyContent = EventAdmin();
        break;
      case 'Cultures':
        bodyContent = CultureAdmin();
        break;
      case 'Blogs':
        bodyContent = BlogAdmin();
        break;
      case 'Feedback':
        bodyContent = AdminFeedbackContainer();
        break;
      // Add more cases for other categories if needed
      default:
        bodyContent = const Center(
          child: Text('No content available for this category'),
        );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(categoriesName),
        centerTitle: true,
        elevation: 0,
        backgroundColor: AppColors.lightsky,
      ),
      body: bodyContent,
    );
  }
}
