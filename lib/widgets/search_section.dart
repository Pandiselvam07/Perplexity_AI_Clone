import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:perplexity_ai_clone/pages/chat_page.dart';
import 'package:perplexity_ai_clone/sevices/chat_web_services.dart';
import 'package:perplexity_ai_clone/theme/colors.dart';
import 'package:perplexity_ai_clone/widgets/search_bar_button.dart';

class SearchSection extends StatefulWidget {
  const SearchSection({super.key});

  @override
  State<SearchSection> createState() => _SearchSectionState();
}

class _SearchSectionState extends State<SearchSection> {
  final TextEditingController _chatController = TextEditingController();
  @override
  void dispose() {
    _chatController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'What do you want to learn today?',
          style: GoogleFonts.ibmPlexMono(
            fontSize: 35,
            fontWeight: FontWeight.w400,
            height: 1.2,
            letterSpacing: -1,
          ),
        ),
        SizedBox(height: 30),
        Container(
          width: 700,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: AppColors.searchBarBorder, width: 1.5),
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16),
                child: TextField(
                  controller: _chatController,
                  decoration: InputDecoration(
                    isDense: true,
                    contentPadding: EdgeInsets.zero,
                    hintText: 'Search anything....',
                    hintStyle: TextStyle(
                      color: AppColors.textGrey,
                      fontSize: 16,
                    ),
                    border: InputBorder.none,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                  children: [
                    SearchBarButton(
                      title: 'Focus',
                      icon: Icons.auto_awesome_outlined,
                    ),
                    SizedBox(width: 15),
                    SearchBarButton(
                      title: 'Attach',
                      icon: Icons.add_circle_outline_rounded,
                    ),
                    Spacer(),
                    GestureDetector(
                      onTap: () {
                        if (_chatController.text.trim().isNotEmpty) {
                          ChatWebServices().chat(_chatController.text.trim());
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  ChatPage(quest: _chatController.text),
                            ),
                          );
                        }
                      },
                      child: Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: AppColors.submitButton,
                          borderRadius: BorderRadius.circular(40),
                        ),
                        child: Icon(
                          Icons.arrow_forward,
                          color: AppColors.background,
                          size: 15,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
