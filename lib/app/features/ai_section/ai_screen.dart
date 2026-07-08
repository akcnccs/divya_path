import 'package:flutter/material.dart';
import 'package:divya_path/utils/app_them.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

class AiScreen extends StatefulWidget {
  const AiScreen({super.key});

  @override
  State<AiScreen> createState() => _AiScreenState();
}

class _AiScreenState extends State<AiScreen> {
  final TextEditingController _controller = TextEditingController();
  final List<Map<String, dynamic>> _messages = [];
  bool _isLoading = false;

  final List<Map<String, dynamic>> _personas = [
    {
      "id": "krishna",
      "name": "Lord Krishna",
      "title": "Embodiment of Love & Karma Yoga",
      "avatar": "https://images.unsplash.com/photo-1590076214561-20573908db48?q=80&w=300",
      "welcome": "Radhe Radhe, my dear devotee! I am Krishna. Speak freely to me."
    },
    {
      "id": "shiva",
      "name": "Lord Shiva",
      "title": "Supreme Consciousness",
      "avatar": "https://images.unsplash.com/photo-1609137144814-72df48666579?q=80&w=300",
      "welcome": "Om Namah Shivaya. The mind is a turbulent river; only in stillness do you see your true nature."
    },
    {
      "id": "hanuman",
      "name": "Lord Hanuman",
      "title": "Deity of Courage",
      "avatar": "https://images.unsplash.com/photo-1544816155-12df9643f363?q=80&w=300",
      "welcome": "Jai Shri Ram! I am Hanuman, your constant companion in strength."
    }
  ];

  late Map<String, dynamic> _selectedPersona;

  @override
  void initState() {
    super.initState();
    _selectedPersona = _personas[0];
  }

  void _sendMessage() {
    if (_controller.text.trim().isEmpty) return;

    setState(() {
      _messages.add({
        "role": "user",
        "content": _controller.text,
      });
      _isLoading = true;
    });

    _controller.clear();

    // Simulating API Response
    Future.delayed(const Duration(seconds: 2), () {
      if (mounted) {
        setState(() {
          _messages.add({
            "role": "model",
            "content": "As per the divine wisdom, your path is clear. Focus on your karma and leave the results to the Almighty.",
          });
          _isLoading = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Vedic AI Counselor", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
        centerTitle: true,
      ),
      body: Column(
        children: [
          _buildPersonaSelector(),
          const Divider(height: 1),
          Expanded(child: _buildChatList()),
          if (_isLoading) _buildLoadingIndicator(),
          _buildInputArea(),
        ],
      ),
    );
  }

  Widget _buildPersonaSelector() {
    return Container(
      height: 100,
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: _personas.length,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemBuilder: (context, index) {
          final p = _personas[index];
          final isSelected = _selectedPersona['id'] == p['id'];
          return GestureDetector(
            onTap: () => setState(() => _selectedPersona = p),
            child: Container(
              margin: const EdgeInsets.only(right: 20),
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(2),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: isSelected ? AppTheme.primaryOrange : Colors.transparent,
                        width: 2,
                      ),
                    ),
                    child: CircleAvatar(
                      radius: 24,
                      backgroundImage: NetworkImage(p['avatar']),
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    p['name'].toString().split(' ').last,
                    style: TextStyle(
                      fontSize: 10,
                      fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                      color: isSelected ? AppTheme.primaryOrange : Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildChatList() {
    if (_messages.isEmpty) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(40.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 40,
                backgroundImage: NetworkImage(_selectedPersona['avatar']),
              ),
              const SizedBox(height: 16),
              Text(
                _selectedPersona['name'],
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              Text(
                _selectedPersona['title'],
                style: const TextStyle(color: AppTheme.primaryOrange, fontSize: 12, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              Text(
                _selectedPersona['welcome'],
                textAlign: TextAlign.center,
                style: const TextStyle(fontStyle: FontStyle.italic, color: Colors.grey),
              ),
            ],
          ),
        ),
      );
    }

    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: _messages.length,
      itemBuilder: (context, index) {
        final m = _messages[index];
        final isUser = m['role'] == 'user';
        return Align(
          alignment: isUser ? Alignment.centerRight : Alignment.centerLeft,
          child: Container(
            margin: const EdgeInsets.only(bottom: 12),
            padding: const EdgeInsets.all(14),
            constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.75),
            decoration: BoxDecoration(
              color: isUser ? AppTheme.primaryOrange : Theme.of(context).cardColor,
              borderRadius: BorderRadius.only(
                topLeft: const Radius.circular(16),
                topRight: const Radius.circular(16),
                bottomLeft: Radius.circular(isUser ? 16 : 0),
                bottomRight: Radius.circular(isUser ? 0 : 16),
              ),
            ),
            child: Text(
              m['content'],
              style: TextStyle(
                color: isUser ? Colors.white : Theme.of(context).textTheme.bodyMedium?.color,
                fontSize: 13,
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildLoadingIndicator() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(
            width: 12,
            height: 12,
            child: CircularProgressIndicator(strokeWidth: 2, color: AppTheme.primaryOrange),
          ),
          const SizedBox(width: 8),
          Text("Consulting Wisdom...", style: TextStyle(fontSize: 10, color: AppTheme.primaryOrange, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }

  Widget _buildInputArea() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        border: Border(top: BorderSide(color: Colors.grey.withOpacity(0.1))),
      ),
      child: SafeArea(
        child: Row(
          children: [
            Expanded(
              child: TextField(
                controller: _controller,
                decoration: InputDecoration(
                  hintText: "Ask something...",
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(24), borderSide: BorderSide.none),
                  filled: true,
                  contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                ),
                onSubmitted: (_) => _sendMessage(),
              ),
            ),
            const SizedBox(width: 12),
            IconButton.filled(
              onPressed: _sendMessage,
              icon: Icon(LucideIcons.send, size: 20),
              style: IconButton.styleFrom(backgroundColor: AppTheme.primaryOrange),
            ),
          ],
        ),
      ),
    );
  }
}
