import 'package:flutter/material.dart';

Widget ExploreContainer({
  required VoidCallback ontap,
  required String heading,
  required String subheading,
  required String image,
}) {
  return Padding(
    padding: const EdgeInsets.only(
      top: 20,
    ),
    child: Container(
      height: 200,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    heading,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Flexible(
                    child: Text(
                      subheading,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 10,
                      style: const TextStyle(
                        fontSize: 15,
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: ontap,
                    child: const Text('View in AR/VR'),
                  ),
                ],
              ),
            ),
            const SizedBox(
              width: 20,
            ),
            Container(
              height: 180,
              width: 150,
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  image: AssetImage(image),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
