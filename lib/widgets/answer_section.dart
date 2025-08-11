import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:perplexity_ai_clone/sevices/chat_web_services.dart';
import 'package:perplexity_ai_clone/theme/colors.dart';
import 'package:perplexity_ai_clone/widgets/shimmer_widget_implemenation.dart';

class AnswerSection extends StatefulWidget {
  const AnswerSection({super.key});

  @override
  State<AnswerSection> createState() => _AnswerSectionState();
}

class _AnswerSectionState extends State<AnswerSection> {
  String fullResponse = '';
  @override
  void initState() {
    ChatWebServices().contentStream.listen((data) {
      setState(() {
        fullResponse += data['data'];
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'RAG APP',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        fullResponse.isEmpty
            ? AnswerShimmer()
            : Markdown(
                data: fullResponse,
                shrinkWrap: true,
                styleSheet: MarkdownStyleSheet.fromTheme(Theme.of(context))
                    .copyWith(
                      codeblockDecoration: BoxDecoration(
                        color: AppColors.cardColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      code: const TextStyle(fontSize: 16),
                    ),
              ),
      ],
    );
  }
}
