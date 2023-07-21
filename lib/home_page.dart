import 'package:flutter/material.dart';

import 'dot_indicator.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final PageController _controller = PageController(
    viewportFraction: 0.8,
  );
  int activeIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const SizedBox(height: 20),
            SizedBox(
              height: 180,
              child: Stack(
                children: [
                  PageView(
                    controller: _controller,
                    onPageChanged: (value) {
                      setState(
                        () {
                          activeIndex = value;
                          print(value);
                        },
                      );
                    },
                    children: [
                      PageItem(
                        color: Colors.green.shade800,
                      ),
                      const PageItem(
                        color: Colors.lime,
                      ),
                      const PageItem(
                        color: Colors.blue,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 28,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Colors.white,
                              Colors.white.withOpacity(0.5),
                              Colors.white.withOpacity(0.2),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        width: 28,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Colors.white.withOpacity(0.2),
                              Colors.white.withOpacity(0.5),
                              Colors.white,
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: DotIndicator(
                numberOfDots: 3,
                activeDotIndex: activeIndex,
                dotSize: 15,
                color: Colors.green.shade800,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PageItem extends StatelessWidget {
  const PageItem({
    Key? key,
    this.color,
  }) : super(key: key);
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(12),
        ),
        height: 155,
        width: 246,
      ),
    );
  }
}
