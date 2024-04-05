import 'package:flutter/material.dart';

class OngoingEvent extends StatelessWidget {
  final String image;
  final String name;
  final String date;
  final VoidCallback ontap;
  final String location;

  const OngoingEvent({
    super.key,
    required this.image,
    required this.name,
    required this.ontap,
    required this.location,
    required this.date,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: GestureDetector(
        onTap: () {},
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 135,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(5),
                  topRight: Radius.circular(5),
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
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    location,
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.grey[600],
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Icon(
                        Icons.calendar_month,
                        size: 20,
                      ),
                      Text(
                        date,
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.grey[600],
                          // fontWeight: FontWeight.w400,
                        ),
                      ),
                      GestureDetector(
                        onTap: ontap,
                        child: const Icon(Icons.link),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
