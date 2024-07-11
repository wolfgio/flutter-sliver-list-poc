import 'package:flutter/material.dart';

class ProductCard extends StatefulWidget {
  final String imageUrl;

  const ProductCard({super.key, required this.imageUrl});

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  bool _loading = true;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      Future.delayed(
        const Duration(seconds: 4),
        () => setState(() {
          _loading = false;
        }),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_loading) {
      return Column(
        children: const [
          Center(
            child: CircularProgressIndicator(),
          )
        ],
      );
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ProductCardImage(imageUrl: widget.imageUrl),
        const Text("Titulo de um produto"),
        const Text("R\$ 199,99"),
        const Text("Subtitulo"),
      ],
    );
  }
}

class ProductCardImage extends StatelessWidget {
  final String imageUrl;

  const ProductCardImage({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Image.network(
      imageUrl,
      width: 152,
      height: 152,
    );
  }
}
