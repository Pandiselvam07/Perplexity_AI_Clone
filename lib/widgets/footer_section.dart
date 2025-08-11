import 'package:flutter/material.dart';

import '../theme/colors.dart';

class FooterSection extends StatelessWidget {
  const FooterSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 16),
      child: Wrap(
        alignment: WrapAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 12),
            child: Text(
              'Pro',
              style: TextStyle(fontSize: 14, color: AppColors.footerGrey),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 12),
            child: Text(
              'Enterprise',
              style: TextStyle(fontSize: 14, color: AppColors.footerGrey),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 12),
            child: Text(
              'Blog',
              style: TextStyle(fontSize: 14, color: AppColors.footerGrey),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 12),
            child: Text(
              'Store',
              style: TextStyle(fontSize: 14, color: AppColors.footerGrey),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 12),
            child: Text(
              'English(IN)',
              style: TextStyle(fontSize: 14, color: AppColors.footerGrey),
            ),
          ),
        ],
      ),
    );
  }
}
