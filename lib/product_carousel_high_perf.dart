import 'package:flutter/material.dart';
import 'package:test_lab_project_2/product_card.dart';

class ProductCarouselHighPerf extends StatelessWidget {
  const ProductCarouselHighPerf({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 212,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        itemExtent: 168, // 153 width + 16 padding
        itemBuilder: (context, index) => const Padding(
          padding: EdgeInsets.only(right: 16),
          child: ProductCard(
            imageUrl:
                'https://images.unsplash.com/photo-1542291026-7eec264c27ff?q=80&w=3540&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
          ),
        ),
      ),
    );
  }
}
