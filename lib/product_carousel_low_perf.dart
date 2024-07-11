import 'package:flutter/material.dart';
import 'package:test_lab_project_2/product_card.dart';

class ProductCarouselLowPerf extends StatelessWidget {
  const ProductCarouselLowPerf({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: List.generate(
          10,
          (index) => const Padding(
            padding: EdgeInsets.only(right: 16),
            child: ProductCard(
              imageUrl:
                  'https://images.unsplash.com/photo-1505740420928-5e560c06d30e?q=80&w=3540&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
            ),
          ),
        ),
      ),
    );
  }
}
