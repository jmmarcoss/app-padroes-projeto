import 'package:app_padroes/controllers/book_controller.dart';
import 'package:app_padroes/models/book.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: CarouselSlider(
          items: [1, 2, 3, 4, 5].map((e) {
            return Container(
              width: MediaQuery.of(context).size.width / 3,
              margin: EdgeInsets.symmetric(horizontal: 5),
              decoration: BoxDecoration(
                color: Colors.amber,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text("oi"),
            );
          }).toList(),
          options: CarouselOptions(height: 200)),
    );
  }
}
