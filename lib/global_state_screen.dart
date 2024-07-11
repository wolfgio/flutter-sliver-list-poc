import 'package:flutter/material.dart';

class GlobalStateScreen extends StatefulWidget {
  const GlobalStateScreen({super.key});

  @override
  State<GlobalStateScreen> createState() => _GlobalStateScreenState();
}

class _GlobalStateScreenState extends State<GlobalStateScreen> {
  bool _isLoading = true;
  final Map<String, dynamic> _apiResp = {
    'offers': List.generate(
      100,
      (index) => {'name': 'Oferta ${index + 1}'},
    ).asMap(),
  };

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Future.delayed(
        const Duration(seconds: 3),
        () => setState(() {
          _isLoading = false;
        }),
      );
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Global State Screen')),
      body: _isLoading
          ? Column(
              children: List.generate(
              10,
              (index) => const Card(child: ListTile(title: Text('LOADING...'))),
            ))
          : CustomScrollView(
              slivers: [
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) => OfferListItem(
                      title: _apiResp['offers'][index]['name'],
                    ),
                    childCount: 100,
                  ),
                ),
              ],
            ),
    );
  }
}

class OfferListItem extends StatelessWidget {
  final String title;

  const OfferListItem({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(title),
      ),
    );
  }
}
