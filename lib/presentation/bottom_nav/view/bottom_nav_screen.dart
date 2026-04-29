// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';

// import '../../../features/connection_request/presentaion/screen/connection_list.dart';
// import '../../home/view/widget/add_new_lead.dart';
// import '../../home/view/home_screen.dart';
// import '../../../features/leadActivity/presentation/screen/lead_activity_screen.dart';
// import '../viewmodel/bottom_nav_provider.dart';

// class BottomNavScreen extends ConsumerWidget {
//   const BottomNavScreen({super.key});

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final currentIndex = ref.watch(bottomNavProvider);
//     final screens = [
//       HomeScreen(),
//       AddNewLead(),
//       LeadActivityScreen(),
//       ConnectionList(),
//     ];

//     return Scaffold(
//       extendBody: true,
//       body: screens[currentIndex],
//       bottomNavigationBar: Container(
//         margin: const EdgeInsets.all(16),
//         padding: const EdgeInsets.symmetric(vertical: 12),
//         decoration: BoxDecoration(
//           color: Colors.white,
//           borderRadius: BorderRadius.circular(25),
//         ),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceAround,
//           children: [
//             _navItem(
//               icon: "assets/images/home.png",
//               title: "Home",
//               index: 0,
//               currentIndex: currentIndex,
//               ref: ref,
//             ),
//             _navItem(
//               icon: "assets/images/lead.png",
//               title: "Lead",
//               index: 1,
//               currentIndex: currentIndex,
//               ref: ref,
//             ),
//             _navItem(
//               icon: "assets/images/activity1.png",
//               title: "Activity",
//               index: 2,
//               currentIndex: currentIndex,
//               ref: ref,
//             ),
//             _navItem(
//               icon: "assets/images/connection.png",
//               title: "Connection",
//               index: 3,
//               currentIndex: currentIndex,
//               ref: ref,
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _navItem({
//     required String icon,
//     required String title,
//     required int index,
//     required int currentIndex,
//     required WidgetRef ref,
//   }) {
//     final isSelected = currentIndex == index;

//     return GestureDetector(
//       onTap: () {
//         ref.read(bottomNavProvider.notifier).state = index;
//       },
//       child: SizedBox(
//         height: 70,
//         child: AnimatedContainer(
//           duration: const Duration(milliseconds: 300),
//           padding: const EdgeInsets.all(10),
//           decoration: BoxDecoration(
//             color: isSelected ? Color(0xff11BECF) : Colors.transparent,
//             borderRadius: BorderRadius.circular(15),
//           ),
//           child: Column(
//             children: [
//               Image.asset(
//                 icon,
//                 color: isSelected ? Colors.white : Colors.grey,
//                 height: 21,
//                 width: 30,
//               ),
//               Text(
//                 title,
//                 style: TextStyle(
//                   color: isSelected ? Colors.white : Colors.grey,
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core_copy/constansts/color_manger.dart';
import '../../activity/view/activity_screen.dart';
import '../../connection/view/connection_screen.dart';
import '../../home/view/home_screen.dart';
import '../../lead/view/lead_screen.dart';
import '../viewmodel/bottom_nav_provider.dart';

class BottomNavScreen extends ConsumerWidget {
  const BottomNavScreen({super.key});

  /// List of screens for bottom navigation
  static const List<Widget> _screens = [
    HomeScreen(),
    LeadScreen(),
    ActivityScreen(),
    ConnectionScreen(),
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentIndex = ref.watch(bottomNavIndexProvider);

    return Scaffold(
      extendBody: true,
      body: IndexedStack(index: currentIndex, children: _screens),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: ColorManager.whiteColor,
          boxShadow: [
            BoxShadow(
              color: ColorManager.shadowColor,
              blurRadius: 10,
              offset: const Offset(0, -2),
            ),
          ],
        ),
        child: SafeArea(
          child: SizedBox(
            height: 75,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildNavItem(
                  icon: "assets/images/home.png",
                  title: "Home",
                  index: 0,
                  currentIndex: currentIndex,
                  ref: ref,
                ),
                _buildNavItem(
                  icon: "assets/images/lead.png",
                  title: "Lead",
                  index: 1,
                  currentIndex: currentIndex,
                  ref: ref,
                ),
                _buildNavItem(
                  icon: "assets/images/activity1.png",
                  title: "Activity",
                  index: 2,
                  currentIndex: currentIndex,
                  ref: ref,
                ),
                _buildNavItem(
                  icon: "assets/images/connection.png",
                  title: "Connection",
                  index: 3,
                  currentIndex: currentIndex,
                  ref: ref,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem({
    required String icon,
    required String title,
    required int index,
    required int currentIndex,
    required WidgetRef ref,
  }) {
    final isSelected = currentIndex == index;
    final selectedColor = const Color(0xff11BECF);
    final unselectedColor = const Color(0xFF2B4C59);

    return GestureDetector(
      onTap: () {
        ref.read(bottomNavIndexProvider.notifier).setIndex(index);
      },
      behavior: HitTestBehavior.opaque,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 10),
        decoration: BoxDecoration(
          color: isSelected ? selectedColor : Colors.transparent,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              icon,
              color: isSelected ? Colors.white : unselectedColor,
              height: 24,
              width: 24,
            ),
            const SizedBox(height: 4),
            Text(
              title,
              style: TextStyle(
                color: isSelected ? Colors.white : unselectedColor,
                fontSize: 12,
                fontWeight: isSelected ? FontWeight.w500 : FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

