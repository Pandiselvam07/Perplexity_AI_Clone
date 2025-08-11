import 'dart:async';
import 'dart:convert';
import 'package:perplexity_ai_clone/core/constants.dart';
import 'package:web_socket_client/web_socket_client.dart';

class ChatWebServices {
  static final _instance = ChatWebServices._internal();
  factory ChatWebServices() => _instance;
  ChatWebServices._internal();

  WebSocket? _webSocket;
  final _searchResultController = StreamController<Map<String, dynamic>>();
  final _contentController = StreamController<Map<String, dynamic>>();
  Stream<Map<String, dynamic>> get searchResultStream =>
      _searchResultController.stream;
  Stream<Map<String, dynamic>> get contentStream => _contentController.stream;

  void connect() async {
    _webSocket = WebSocket(Uri.parse("${ServerConstants.serverURL}/ws/chat"));
    _webSocket!.messages.listen((message) {
      final data = json.decode(message);
      if (data['type'] == 'search_results') {
        _searchResultController.add(data);
      } else if (data['type'] == 'content') {
        _contentController.add(data);
      }
    });
  }

  void chat(String query) {
    _webSocket!.send(json.encode({'query': query}));
  }
}
