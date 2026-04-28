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
import '../../../features/connection_request/presentaion/screen/connection_list.dart';
import '../../../features/leadActivity/presentation/screen/lead_activity_screen.dart';
import '../../home/view/home_screen.dart';
import '../../lead/view/lead_screen.dart';
import '../viewmodel/bottom_nav_provider.dart';

class BottomNavScreen extends ConsumerWidget {
  const BottomNavScreen({super.key});

  /// List of screens for bottom navigation
  static const List<Widget> _screens = [
    HomeScreen(),
    LeadScreen(),
    LeadActivityScreen(),
    ConnectionList(),
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentIndex = ref.watch(bottomNavIndexProvider);

    final navItems = [
      BottomNavigationBarItem(
        icon: const Icon(Icons.home_outlined),
        activeIcon: const Icon(Icons.home),
        label: "Home",
      ),
      BottomNavigationBarItem(
        icon: const Icon(Icons.search_outlined),
        activeIcon: const Icon(Icons.search),
        label: "Lead",
      ),
      BottomNavigationBarItem(
        icon: const Icon(Icons.favorite_outline),
        activeIcon: const Icon(Icons.favorite),
        label: 'Activity',
      ),
      BottomNavigationBarItem(
        icon: const Icon(Icons.person_outline),
        activeIcon: const Icon(Icons.person),
        label: 'Connection',
      ),
    ];

    return Scaffold(
      body: IndexedStack(index: currentIndex, children: _screens),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: ColorManager.shadowColor,
              blurRadius: 10,
              offset: const Offset(0, -2),
            ),
          ],
        ),
        child: BottomNavigationBar(
          currentIndex: currentIndex,
          onTap: (index) {
            ref.read(bottomNavIndexProvider.notifier).setIndex(index);
          },
          type: BottomNavigationBarType.fixed,
          backgroundColor: ColorManager.whiteColor,
          selectedItemColor: ColorManager.primary,
          unselectedItemColor: ColorManager.textSecondary,
          selectedLabelStyle: const TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 12,
          ),
          unselectedLabelStyle: const TextStyle(
            fontWeight: FontWeight.normal,
            fontSize: 12,
          ),
          elevation: 0,
          items: navItems,
        ),
      ),
    );
  }
}
