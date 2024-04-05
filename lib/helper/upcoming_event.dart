import 'package:flutter/material.dart';

class UpcomingEvent extends StatelessWidget {
  final String image;
  final String name;
  final String date;

  final String location;
  final VoidCallback ontap;

  const UpcomingEvent({
    super.key,
    required this.ontap,
    required this.image,
    required this.name,
    required this.location,
    required this.date,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: GestureDetector(
        onTap: ontap,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 150,
              width: 180,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(5),
                  //topRight: Radius.circular(5),
                  bottomLeft: Radius.circular(5),
                  //bottomRight: Radius.circular(5),
                ),
                image: DecorationImage(
                  image: Image.asset(image).image,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                right: 5,
                left: 5,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                //margin: const EdgeInsets.only(left: 10, top: 10),
                children: [
                  Text(
                    name,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    location,
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.grey[600],
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Icon(Icons.calendar_month),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        date,
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.grey[600],
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                  ElevatedButton(
                    onPressed: ontap,
                    child: const Text('Tap to view more'),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
