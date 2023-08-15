import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';

class CardSwipePackage extends StatelessWidget {
  CardSwipePackage({super.key});

  List<String> imageUrls = [
    'https://images.unsplash.com/photo-1623584973952-182bcb43b8ad?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1170&q=80',
    'https://images.unsplash.com/photo-1544377712-f7a323240581?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=686&q=80',
    'https://images.unsplash.com/photo-1628148061873-13b9340f763b?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=764&q=80',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Card Swipe exercise'),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: Column(
        children: [
          Expanded(
            child: Swiper(
              itemBuilder: (BuildContext context, int index) {
                return Image.network(
                  imageUrls[index],
                  fit: BoxFit.cover,
                );
              },
              itemCount: imageUrls.length,
              pagination: SwiperPagination(),
              control: SwiperControl(),
            ),
          ),
        ],
      ),
    );
  }
}
