import 'package:flutter/material.dart';

class BookCard extends StatelessWidget {
  final String image;
  final String title;
  final VoidCallback onTap;

  const BookCard({
    super.key, // Add Key? key parameter
    required this.image,
    required this.title,
    required this.onTap,
  }); // Pass key to super constructor

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 350,
      //width: 300, // Adjust the height as needed
      child: Padding(
        padding: const EdgeInsets.only(
          bottom: 5,
        ),
        child: Card(
          elevation: 4,
          //margin: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: Image.network(image, fit: BoxFit.cover),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 5,
                  vertical: 2,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    ElevatedButton(
                      onPressed: onTap,
                      child: const Text("Read More.."),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: const Icon(Icons.favorite_border),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: const Icon(Icons.bookmark_border),
                    onPressed: () {
                      // Add your bookmark functionality here
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
