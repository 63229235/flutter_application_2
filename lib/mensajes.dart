import 'package:flutter/material.dart';
import 'package:flutter_application_2/opci.dart';
import 'package:flutter_application_2/opciones.dart';

class Msjs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyChatScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyChatScreen extends StatefulWidget {
  @override
  _MyChatScreenState createState() => _MyChatScreenState();
}

class _MyChatScreenState extends State<MyChatScreen> {
  final List<Message> _messages = [];
  final TextEditingController _textController = TextEditingController();
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mensajes'),
        backgroundColor: Colors.black,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => Mydasa()));
          },
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              controller: _scrollController,
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                return _buildMessage(_messages[index]);
              },
            ),
          ),
          _buildInputField(),
        ],
      ),
    );
  }

  Widget _buildMessage(Message message) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Align(
        alignment: message.isMe ? Alignment.topRight : Alignment.topLeft,
        child: Container(
          decoration: BoxDecoration(
            color: message.isMe ? Colors.blue : Colors.white,
            borderRadius: BorderRadius.circular(8.0),
          ),
          padding: EdgeInsets.all(8.0),
          child: Text(
            message.text,
            style: TextStyle(
              color: message.isMe ? Colors.white : Colors.black,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildInputField() {
    return Container(
      padding: EdgeInsets.all(8.0),
      color: Colors.grey[200],
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _textController,
              decoration: InputDecoration(
                hintText: 'Escribe un mensaje...',
              ),
              onSubmitted: (text) {
                _sendMessage(text, true);
                _simulateResponse();
              },
            ),
          ),
          IconButton(
            icon: Icon(
              Icons.send,
              color: Colors.blue,
            ),
            onPressed: () {
              _sendMessage(_textController.text, true);
              _simulateResponse();
            },
          ),
        ],
      ),
    );
  }

  void _sendMessage(String text, bool isMe) {
    setState(() {
      _messages.add(Message(text: text, isMe: isMe));
      _textController.clear(); // Limpiar el campo de entrada
    });

    // Desplazar hacia abajo automáticamente cuando se agrega un nuevo mensaje
    _scrollController.animateTo(
      _scrollController.position.maxScrollExtent,
      duration: Duration(milliseconds: 300),
      curve: Curves.easeOut,
    );
  }

  void _simulateResponse() {
    // Simular respuesta después de un breve retraso
    Future.delayed(Duration(milliseconds: 500), () {
      setState(() {
        _messages.add(Message(text: 'No atendemos', isMe: false));
      });

      // Desplazar hacia abajo automáticamente cuando se agrega una respuesta
      _scrollController.animateTo(
        _scrollController.position.maxScrollExtent,
        duration: Duration(milliseconds: 300),
        curve: Curves.easeOut,
      );
    });
  }
}

class Message {
  final String text;
  final bool isMe;

  Message({required this.text, required this.isMe});
}


