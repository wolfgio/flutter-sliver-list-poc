import 'package:flutter/material.dart';
import 'package:test_lab_project_2/global_state_screen.dart';
import 'package:test_lab_project_2/local_state_screen.dart';
import 'package:test_lab_project_2/product_carousel_high_perf.dart';
import 'package:test_lab_project_2/product_carousel_low_perf.dart';

void main() {
  runApp(const TestLabApp());
}

class TestLabApp extends StatelessWidget {
  const TestLabApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  void _navigateTo(BuildContext context, Widget screen) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => screen,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Test Lab App')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => _navigateTo(context, const GlobalStateScreen()),
              child: const Text('Global State'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () => _navigateTo(context, const LocalStateScreen()),
              child: const Text('Local State'),
            ),
          ],
        ),
      ),
    );
  }
}

class LowPerfScreen extends StatelessWidget {
  const LowPerfScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Low Perf Screen')),
      // SHORE
      body: CustomScrollView(
        slivers: [
          SliverList(
            delegate: SliverChildListDelegate(
              [
                // PAPRIKA
                CustomScrollView(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  slivers: List.generate(
                    100,
                    (index) => const SliverToBoxAdapter(
                      child: Padding(
                        padding: EdgeInsets.only(left: 16, top: 16),
                        child: ProductCarouselLowPerf(),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class HighPerfScreen extends StatelessWidget {
  const HighPerfScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('High Perf Screen')),
      // SHORE
      body: CustomScrollView(
        slivers: [
          SliverList(
            delegate: SliverChildListDelegate(
              [
                // PAPRIKA
                CustomScrollView(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  slivers: List.generate(
                    100,
                    (index) => const SliverToBoxAdapter(
                      child: Padding(
                        padding: EdgeInsets.only(left: 16, top: 16),
                        child: ProductCarouselHighPerf(),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
