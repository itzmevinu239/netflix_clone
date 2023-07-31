import 'package:flutter/material.dart';

ValueNotifier<int> indexchangeNotifier = ValueNotifier(0);

class BottomNavigationWidget extends StatelessWidget {
  const BottomNavigationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: indexchangeNotifier,
      builder: (context, int newIndex, _) {
        return BottomNavigationBar(
            currentIndex: newIndex,
            onTap: (index) {
              indexchangeNotifier.value = index;
            },
            type: BottomNavigationBarType.fixed,
            backgroundColor: Colors.black,
            selectedItemColor: Colors.white,
            unselectedItemColor: Colors.grey,
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.collections), label: 'New & Hot'),
                  BottomNavigationBarItem(
                  icon: Icon(Icons.emoji_emotions), label: 'FastLaugh'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.search), label: 'Search'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.download), label: 'Downloads'),
            ]);
      },
    );
  }
}
