import 'package:due/test/addProduct_content.dart';
import 'package:due/test/AddClient_content.dart';
import 'package:flutter/material.dart';


class OnboardContent extends StatefulWidget {
  const OnboardContent({super.key});

  @override
  State<OnboardContent> createState() => _OnboardContentState();
}

class _OnboardContentState extends State<OnboardContent> {
  late PageController _pageController;
  // double _progress;
  @override
  void initState() {
    _pageController = PageController()
      ..addListener(() {
        setState(() {});
      });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final double progress =
        _pageController.hasClients ? (_pageController.page ?? 0) : 0;

    return SizedBox(
      height: 230 + progress * 70,
      width: double.maxFinite,
      child: Stack(
        children: [
          Column(
            children: [
              const SizedBox(height: 16),
              Expanded(
                child: PageView(
                  controller: _pageController,
                  children: const [
                    AddClient_content(),
                    Addproduct_content(),
                  ],
                ),
              ),
            ],
          ),
          
        ],
      ),
    );
  }
}