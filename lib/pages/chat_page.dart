import 'package:flutter/material.dart';
import 'package:perplexity_ai_clone/widgets/answer_section.dart';
import 'package:perplexity_ai_clone/widgets/side_nav_bar.dart';
import 'package:perplexity_ai_clone/widgets/source_section.dart';

class ChatPage extends StatelessWidget {
  final String quest;
  const ChatPage({super.key, required this.quest});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          SideNavBar(),
          SizedBox(width: 100),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.75,
                      child: Text(
                        quest,
                        style: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    const SizedBox(height: 25),
                    SourceSection(),
                    const SizedBox(height: 25),
                    AnswerSection(),
                  ],
                ),
              ),
            ),
          ),
          Placeholder(color: Colors.transparent),
        ],
      ),
    );
  }
}
