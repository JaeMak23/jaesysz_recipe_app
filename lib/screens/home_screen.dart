import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jaesysz_recipe_app/pages/pages.dart';
import 'package:jaesysz_recipe_app/theme.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  final ValueNotifier<int> pageIndex = ValueNotifier(0);
  final pages = const [
    HomePage(),
    FavoritesPage(),
    AddRecipePage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ValueListenableBuilder(
        valueListenable: pageIndex,
        builder: (BuildContext context, int value, _) {
          return pages[value];
        },
      ),
      bottomNavigationBar: _BottomNavigationBar(
        onItemSelected: (index) {
          pageIndex.value = index;
        },
      ),
    );
  }
}

class _NavigationBarItem extends StatelessWidget {
  const _NavigationBarItem({
    Key? key,
    required this.index,
    required this.label,
    required this.icon,
    this.isSelected = false,
    required this.onTap,
  }) : super(key: key);

  final ValueChanged<int> onTap;

  final int index;
  final String label;
  final IconData icon;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        onTap(index);
      },
      child: SizedBox(
        height: 70.0,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              size: 20,
              color: isSelected ? AppColors.secondary : null,
            ),
            const SizedBox(height: 8),
            Text(
              label,
              style: isSelected
                  ? const TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.bold,
                      color: AppColors.secondary,
                    )
                  : const TextStyle(fontSize: 11),
            ),
          ],
        ),
      ),
    );
  }
}

class _BottomNavigationBar extends StatefulWidget {
  const _BottomNavigationBar({Key? key, required this.onItemSelected})
      : super(key: key);

  final ValueChanged<int> onItemSelected;

  @override
  State<_BottomNavigationBar> createState() => _BottomNavigationBarState();
}

class _BottomNavigationBarState extends State<_BottomNavigationBar> {
  var selectedIndex = 0;

  void handleItemSelected(int index) {
    setState(() {
      selectedIndex = index;
    });
    widget.onItemSelected(index);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      bottom: true,
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
        _NavigationBarItem(
          index: 0,
          label: 'Home',
          icon: CupertinoIcons.house_fill,
          isSelected: (selectedIndex == 0),
          onTap: handleItemSelected,
        ),
        _NavigationBarItem(
          index: 1,
          label: 'Favorites',
          icon: CupertinoIcons.star_fill,
          isSelected: (selectedIndex == 1),
          onTap: handleItemSelected,
        ),
        _NavigationBarItem(
          index: 2,
          label: 'Add Recipe',
          icon: CupertinoIcons.add_circled_solid,
          isSelected: (selectedIndex == 2),
          onTap: handleItemSelected,
        ),
        _NavigationBarItem(
          index: 3,
          label: 'Profile',
          icon: CupertinoIcons.person_fill,
          isSelected: (selectedIndex == 3),
          onTap: handleItemSelected,
        ),
      ]),
    );
  }
}
