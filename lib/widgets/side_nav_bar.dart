import 'package:flutter/material.dart';
import 'package:perplexity_ai_clone/theme/colors.dart';
import 'package:perplexity_ai_clone/widgets/side_nav_bar_button.dart';

class SideNavBar extends StatefulWidget {
  const SideNavBar({super.key});

  @override
  State<SideNavBar> createState() => _SideNavBarState();
}

class _SideNavBarState extends State<SideNavBar> {
  bool isCollapsed = true;
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 200),
      width: isCollapsed ? 60 : 125,
      color: AppColors.sideNav,
      child: Column(
        children: [
          SizedBox(height: 15),
          Icon(
            Icons.auto_awesome_mosaic,
            color: AppColors.whiteColor,
            size: isCollapsed ? 30 : 55,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: isCollapsed
                  ? CrossAxisAlignment.center
                  : CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20),
                SideNavBarButton(
                  isCollapsed: isCollapsed,
                  title: 'Add',
                  icon: Icons.add,
                ),
                SideNavBarButton(
                  isCollapsed: isCollapsed,
                  title: 'Search',
                  icon: Icons.search,
                ),
                SideNavBarButton(
                  isCollapsed: isCollapsed,
                  title: 'Spaces',
                  icon: Icons.language,
                ),
                SideNavBarButton(
                  isCollapsed: isCollapsed,
                  title: 'Discover',
                  icon: Icons.auto_awesome,
                ),
                SideNavBarButton(
                  isCollapsed: isCollapsed,
                  title: 'Library',
                  icon: Icons.cloud_outlined,
                ),
                Spacer(),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                isCollapsed = !isCollapsed;
              });
            },
            child: AnimatedContainer(
              duration: Duration(milliseconds: 200),
              margin: EdgeInsets.symmetric(vertical: 14, horizontal: 10),
              child: Icon(
                isCollapsed
                    ? Icons.keyboard_arrow_right
                    : Icons.keyboard_arrow_left,

                color: AppColors.iconGrey,
                size: 22,
              ),
            ),
          ),
          SizedBox(height: 15),
        ],
      ),
    );
  }
}
