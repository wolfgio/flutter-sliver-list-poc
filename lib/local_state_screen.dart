import 'package:flutter/material.dart';

class LocalStateScreen extends StatelessWidget {
  const LocalStateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Local State Screen'),
      ),
      body: CustomScrollView(
        slivers: [
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) => KeepAlive(
                keepAlive: true,
                child: OfferListItem(index: index),
              ),
              childCount: 20,
              addAutomaticKeepAlives: false,
              addRepaintBoundaries: false,
              addSemanticIndexes: false,
            ),
          ),
        ],
      ),
    );
  }
}

class OfferListItem extends StatefulWidget {
  final int index;

  const OfferListItem({super.key, required this.index});

  @override
  State<OfferListItem> createState() => _OfferListItemState();
}

class _OfferListItemState extends State<OfferListItem> {
  bool _isLoading = true;
  final Map<String, dynamic> _apiResp = {
    'offers': List.generate(
      100,
      (index) => {'name': 'Oferta ${index + 1}'},
    ).asMap(),
  };

  @override
  void initState() {
    print('Printou STATE');
    WidgetsBinding.instance.addPostFrameCallback(
      (_) => Future.delayed(
        const Duration(seconds: 3),
        () {
          if (mounted) {
            setState(() {
              _isLoading = false;
            });
          }
        },
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return _isLoading
        ? const Card(
            child: ListTile(
              title: Text('LOADING....'),
            ),
          )
        : Card(
            child: ListTile(
              title: Text(_apiResp['offers'][widget.index]['name']),
            ),
          );
  }
}
