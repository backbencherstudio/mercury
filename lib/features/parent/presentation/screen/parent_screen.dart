import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../connection_request/presentaion/screen/connection_list.dart';
import '../../../home/presentaion/screen/add_new_lead.dart';
import '../../../home/presentaion/screen/home_screen.dart';
import '../../../leadActivity/presentation/screen/lead_activity_screen.dart';
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
      AddNewLead(),
      LeadActivityScreen(),
      ConnectionList(),
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
              icon: "assets/images/home.png",
              title: "Home",
              index: 0,
              currentIndex: currentIndex,
              ref: ref,
            ),
            _navItem(
              icon: "assets/images/lead.png",
              title: "Lead",
              index: 1,
              currentIndex: currentIndex,
              ref: ref,
            ),
            _navItem(
              icon: "assets/images/activity1.png",
              title: "Activity",
              index: 2,
              currentIndex: currentIndex,
              ref: ref,
            ),
            _navItem(
              icon: "assets/images/connection.png",
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
    required String icon,
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
              Image.asset(
                icon,
                color: isSelected ? Colors.white : Colors.grey,
                height: 21,
                width: 30,
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
