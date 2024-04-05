import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class ImageCarousel extends StatefulWidget {
  final List<Map<String, dynamic>> imageList;
  final double height;
  final bool autoPlay;
  final VoidCallback onTap;

  const ImageCarousel({
    Key? key,
    required this.imageList,
    this.height = 300,
    this.autoPlay = true,
    required this.onTap,
  }) : super(key: key);

  @override
  _ImageCarouselState createState() => _ImageCarouselState();
}

class _ImageCarouselState extends State<ImageCarousel> {
  // Add any state variables needed here

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        height: widget.height,
        autoPlay: widget.autoPlay,
      ),
      items: widget.imageList.map((item) => _buildCarouselItem(item)).toList(),
    );
  }

  Widget _buildCarouselItem(Map<String, dynamic> item) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 10,
      ),
      child: GestureDetector(
        onTap: widget.onTap,
        child: Container(
          margin: const EdgeInsets.all(10.0),
          child: Stack(
            children: <Widget>[
              ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(8.0)),
                child: Image.asset(
                  item["image"],
                  fit: BoxFit.fill,
                  width: 800,
                  height: 400,
                ),
              ),
              Stack(children: [
                Positioned(
                  bottom: 0.0,
                  left: 0.0,
                  child: Container(
                    decoration: const BoxDecoration(
                        color: Colors.black54,
                        borderRadius: BorderRadius.all(
                          Radius.circular(5),
                        )),
                    padding: const EdgeInsets.all(10.0),
                    // Semi-transparent background
                    child: Text(
                      item["name"],
                      style:
                          const TextStyle(color: Colors.white, fontSize: 16.0),
                    ),
                  ),
                ),
              ]),
            ],
          ),
        ),
      ),
    );
  }
}
