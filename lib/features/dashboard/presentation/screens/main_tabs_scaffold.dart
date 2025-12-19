import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hugeicons/hugeicons.dart';

class MainTabsScaffold extends StatelessWidget {
  const MainTabsScaffold({super.key, required this.navigationShell});

  final StatefulNavigationShell navigationShell;

  void _onTap(int index) {
    // Preserve state on re-tap; switch to initialLocation on first visit
    navigationShell.goBranch(
      index,
      initialLocation: index != navigationShell.currentIndex,
    );
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: NavigationBar(
        selectedIndex: navigationShell.currentIndex,
        onDestinationSelected: _onTap,
        indicatorColor: colorScheme.primary.withValues(alpha: 0.12),
        destinations: const [
          NavigationDestination(
            icon: HugeIcon(icon: HugeIcons.strokeRoundedHome01, size: 22),
            selectedIcon: HugeIcon(
              icon: HugeIcons.strokeRoundedHome01,
              size: 22,
            ),
            label: 'Home',
          ),
          NavigationDestination(
            icon: HugeIcon(icon: HugeIcons.strokeRoundedSearch01, size: 22),
            selectedIcon: HugeIcon(
              icon: HugeIcons.strokeRoundedSearch01,
              size: 22,
            ),
            label: 'Explore',
          ),
          NavigationDestination(
            icon: HugeIcon(icon: HugeIcons.strokeRoundedBook01, size: 22),
            selectedIcon: HugeIcon(
              icon: HugeIcons.strokeRoundedBook01,
              size: 22,
            ),
            label: 'Library',
          ),
          NavigationDestination(
            icon: HugeIcon(icon: HugeIcons.strokeRoundedUser, size: 22),
            selectedIcon: HugeIcon(icon: HugeIcons.strokeRoundedUser, size: 22),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
