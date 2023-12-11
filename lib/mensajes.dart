import 'package:flutter/material.dart';

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
  final List<Conversation> _conversations = [
    Conversation(
      avatar: 'assets/avatar1.jpg',
      messages: [
        Message(
            text:
                'Hola, estoy pensando en comprar algo de la panadería. ¿Tienes alguna recomendación?',
            isMe: false),
        Message(
            text: '¡Hola! Te recomiendo probar las empanadas, son deliciosas.',
            isMe: true),
        Message(text: '¿Tienen servicio de entrega a domicilio?', isMe: false),
        Message(
            text:
                'Sí, hacemos entregas. ¿A dónde te gustaría que te envíemos los productos?',
            isMe: true),
      ],
    ),
    Conversation(
      avatar: 'assets/avatar2.jpg',
      messages: [
        Message(
            text: 'Hola, ¿cuáles son los productos especiales de hoy?',
            isMe: false),
        Message(
            text:
                'Hoy tenemos una oferta especial en pasteles y panes integrales.',
            isMe: true),
        Message(
            text:
                'Genial, ¿puedo hacer un pedido para la entrega mañana por la mañana?',
            isMe: false),
        Message(text: 'Claro, ¿a qué hora te gustaría recibirlo?', isMe: true),
      ],
    ),
    Conversation(
      avatar: 'assets/avatar3.jpg',
      messages: [
        Message(
            text:
                'Hola, he escuchado que sus pasteles son increíbles. ¿Es cierto?',
            isMe: false),
        Message(
            text:
                '¡Sí, nuestros pasteles son famosos! ¿Tienes alguna preferencia en sabor?',
            isMe: true),
        Message(
            text:
                'Me encantan los pasteles de chocolate. ¿Puedo hacer un pedido para hoy por la tarde?',
            isMe: false),
        Message(
            text: 'Por supuesto, ¿a qué hora te gustaría recibirlo?',
            isMe: true),
      ],
    ),
  ];

  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chats'),
        backgroundColor: Colors.green,
      ),
      body: ListView.builder(
        controller: _scrollController,
        itemCount: _conversations.length,
        itemBuilder: (context, index) {
          return _buildChat(_conversations[index]);
        },
      ),
    );
  }

  Widget _buildChat(Conversation conversation) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ChatDetailsScreen(conversation: conversation),
          ),
        );
      },
      child: Container(
        padding: EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: Colors.grey)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CircleAvatar(
              backgroundImage: AssetImage(conversation.avatar),
            ),
            SizedBox(width: 8.0),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Usuario',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  Text(conversation.messages.last.text),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Conversation {
  final String avatar;
  final List<Message> messages;

  Conversation({required this.avatar, required this.messages});
}

class Message {
  final String text;
  final bool isMe;

  Message({required this.text, required this.isMe});
}

class ChatDetailsScreen extends StatefulWidget {
  final Conversation conversation;

  const ChatDetailsScreen({Key? key, required this.conversation})
      : super(key: key);

  @override
  _ChatDetailsScreenState createState() => _ChatDetailsScreenState();
}

class _ChatDetailsScreenState extends State<ChatDetailsScreen> {
  final TextEditingController _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            CircleAvatar(
              backgroundImage: AssetImage(widget.conversation.avatar),
            ),
            SizedBox(width: 8.0),
            Text('Usuario'),
          ],
        ),
        backgroundColor: Colors.green,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: widget.conversation.messages.length,
              itemBuilder: (context, index) {
                return _buildMessage(widget.conversation.messages[index]);
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
            ),
          ),
          IconButton(
            icon: Icon(
              Icons.send,
              color: Colors.blue,
            ),
            onPressed: () {
              _sendMessage(_textController.text, true);
            },
          ),
        ],
      ),
    );
  }

  void _sendMessage(String text, bool isMe) {
    if (text.isNotEmpty) {
      setState(() {
        widget.conversation.messages.add(Message(text: text, isMe: isMe));
        _textController.clear();
      });
    }
  }
}
