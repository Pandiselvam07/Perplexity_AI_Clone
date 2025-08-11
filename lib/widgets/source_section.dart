import 'package:flutter/material.dart';
import 'package:perplexity_ai_clone/widgets/shimmer_widget_implemenation.dart';

import '../sevices/chat_web_services.dart';
import '../theme/colors.dart';

class SourceSection extends StatefulWidget {
  const SourceSection({super.key});

  @override
  State<SourceSection> createState() => _SourceSectionState();
}

class _SourceSectionState extends State<SourceSection> {
  List sources = [];
  @override
  void initState() {
    super.initState();
    ChatWebServices().searchResultStream.listen((data) {
      setState(() {
        sources = data['data'];
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Icon(Icons.source, color: AppColors.whiteColor),
            SizedBox(width: 6),
            Text(
              'Source',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        SizedBox(height: 16),

        sources.isEmpty
            ? SourceShimmer()
            : Wrap(
                spacing: 16,
                runSpacing: 16,
                children: sources.map((res) {
                  return Container(
                    padding: EdgeInsets.all(16),
                    width: 150,
                    height: 110,
                    decoration: BoxDecoration(
                      color: AppColors.cardColor,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Column(
                      children: [
                        Text(
                          res['title'],
                          style: TextStyle(fontWeight: FontWeight.w500),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 8),
                        Text(
                          res['url'],
                          style: TextStyle(color: AppColors.textGrey),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  );
                }).toList(),
              ),
      ],
    );
  }
}
