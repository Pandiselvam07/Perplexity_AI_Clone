import 'package:flutter/material.dart';

import '../theme/colors.dart';

class SideNavBarButton extends StatelessWidget {
  final bool isCollapsed;
  final String title;
  final IconData icon;

  const SideNavBarButton({
    super.key,
    required this.isCollapsed,
    required this.title,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          margin: EdgeInsets.symmetric(vertical: 14, horizontal: 10),
          child: Icon(icon, color: AppColors.iconGrey, size: 22),
        ),
        isCollapsed
            ? SizedBox()
            : Text(
                title,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
      ],
    );
  }
}
