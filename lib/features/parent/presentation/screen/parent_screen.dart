import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../home/presentaion/screen/home_screen.dart';
import '../../../login/presentation/screen/login_screen.dart';
import '../../../onboarding_screen/presentation/screen/onboarding_screen.dart';
import '../riverpod/parent_screen_provider.dart';

class ParentScreen extends ConsumerWidget {
  const ParentScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentIndex = ref.watch(bottomNavProvider);
    final screens = [
      HomeScreen(),
      LoginScreen(),
      LoginScreen(),
      LoginScreen(),
    ];

    return Scaffold(
      extendBody: true,
      body: screens[currentIndex],
      bottomNavigationBar: Container(
        margin: const EdgeInsets.all(16),
        padding: const EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(25),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _navItem(
              icon: Icons.home,
              title: "Home",
              index: 0,
              currentIndex: currentIndex,
              ref: ref,
            ),
            _navItem(
              icon: Icons.login,
              title: "Lead",
              index: 1,
              currentIndex: currentIndex,
              ref: ref,
            ),
            _navItem(
              icon: Icons.person,
              title: "Activity",
              index: 2,
              currentIndex: currentIndex,
              ref: ref,
            ),
            _navItem(
              icon: Icons.person,
              title: "Connection",
              index: 3,
              currentIndex: currentIndex,
              ref: ref,
            ),
          ],
        ),
      ),
    );
  }

  Widget _navItem({
    required IconData icon,
    required String title,
    required int index,
    required int currentIndex,
    required WidgetRef ref,
  }) {
    final isSelected = currentIndex == index;

    return GestureDetector(
      onTap: () {
        ref.read(bottomNavProvider.notifier).state = index;
      },
      child: SizedBox(
        height: 70,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: isSelected ? Color(0xff11BECF) : Colors.transparent,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Column(
            children: [
              Icon(
                icon,
                color: isSelected ? Colors.white : Colors.grey,
                size: 28,
              ),
              Text(
                title,
                style: TextStyle(
                  color: isSelected ? Colors.white : Colors.grey,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
