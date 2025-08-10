import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:web_socket_client/web_socket_client.dart';

class ChatWebServices {
  WebSocket? _webSocket;
  void connect() async {
    final url = dotenv.env['API_ENDPOINT'] ?? '';
    if (url.isEmpty) {
      throw Exception('URL not found');
    }
    _webSocket = WebSocket(Uri.parse(url));

    _webSocket!.messages.listen((message) {
      final data = json.decode(message);
      print(data['type']);
    });
  }

  void chat(String query) {
    _webSocket!.send({'query': query});
  }
}
