import 'package:flutter/material.dart';
import 'package:sanskriti/utils/app_colors.dart';
import 'package:sanskriti/view/catrgories_content/blogs_content.dart';
import 'package:sanskriti/view/catrgories_content/culture_content.dart';
import 'package:sanskriti/view/catrgories_content/ebook_content.dart';
import 'package:sanskriti/view/catrgories_content/event_content.dart';
import 'package:sanskriti/view/catrgories_content/feedback_content.dart';
import 'catrgories_content/education_content.dart';

class CategoriesPage extends StatelessWidget {
  final String categoriesName;
  const CategoriesPage({
    super.key,
    required this.categoriesName,
  });

  @override
  Widget build(BuildContext context) {
    Widget bodyContent;

    // Define different body content based on categoriesName
    switch (categoriesName) {
      case 'Education':
        bodyContent = educationContent();
        break;
      case 'E-books':
        bodyContent = ebookContent();
        break;
      case 'Events':
        bodyContent = eventContent();
        break;
      case 'Cultures':
        bodyContent = cultureContent();
        break;
      case 'Blogs':
        bodyContent = blogsContent();
        break;
      case 'Feedback':
        bodyContent = feedbackContent();
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
