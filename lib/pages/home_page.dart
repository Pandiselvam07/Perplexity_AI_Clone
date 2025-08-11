import 'package:flutter/material.dart';
import 'package:perplexity_ai_clone/sevices/chat_web_services.dart';
import 'package:perplexity_ai_clone/widgets/footer_section.dart';
import 'package:perplexity_ai_clone/widgets/search_section.dart';
import 'package:perplexity_ai_clone/widgets/side_nav_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    ChatWebServices().connect();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          SideNavBar(),
          Expanded(
            child: Column(
              children: [
                Expanded(child: SearchSection()),

                FooterSection(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
