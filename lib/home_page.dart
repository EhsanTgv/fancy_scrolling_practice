import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static const _bgImg =
      'https://cdn.pixabay.com/photo/2012/08/27/14/19/mountains-55067__340.png';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 165,
            centerTitle: true,
            pinned: true,
            floating: true,
            snap: true,
            title: Text(
              context.findAncestorWidgetOfExactType<MaterialApp>()!.title,
            ),
            flexibleSpace: FlexibleSpaceBar(
              background: SizedBox(
                width: double.infinity,
                child: Opacity(
                  opacity: 0.65,
                  child: Image.network(
                    _bgImg,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                final boxColor = Colors.orange[(index + 1) * 100];
                return Container(
                  height: 60,
                  width: double.infinity,
                  color: boxColor,
                  alignment: Alignment.center,
                  child: Text('This is element no. ${index + 1}'),
                );
              },
              childCount: 9,
            ),
          ),
          SliverGrid(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 2.6,
            ),
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                final boxColor = index < 7
                    ? Colors.cyan[(index + 1) * 100]
                    : Colors.cyan[(index - 6) * 100];
                
                return Container(
                  color: boxColor,
                  alignment: Alignment.center,
                  child: Text('This is element no. ${index + 1}'),
                );
              },
              childCount: 14,
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              height: 120,
              width: double.infinity,
              color: Colors.green[400],
              alignment: Alignment.center,
              child: const Text('This is a SliverToBoxAdapter'),
            ),
          ),
          const SliverFillRemaining(
            hasScrollBody: true,
            child: Padding(
              padding: EdgeInsets.only(bottom: 16),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Text('Made by EhsanTgv'),
              ),
            ),
          )
        ],
      ),
    );
  }
}
