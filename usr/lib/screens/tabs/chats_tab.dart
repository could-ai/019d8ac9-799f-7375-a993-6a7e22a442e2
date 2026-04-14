import 'package:flutter/material.dart';
import 'package:couldai_user_app/models/user_profile.dart';
import 'package:couldai_user_app/screens/chat_screen.dart';

class ChatsTab extends StatelessWidget {
  const ChatsTab({super.key});

  @override
  Widget build(BuildContext context) {
    // Mock mutual connections
    final mutualConnects = mockProfiles.sublist(1, 3);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Chats'),
      ),
      body: mutualConnects.isEmpty
          ? Center(
              child: Text(
                'No chats yet. Keep connecting!',
                style: TextStyle(color: Theme.of(context).colorScheme.onSurface.withOpacity(0.6)),
              ),
            )
          : ListView.separated(
              itemCount: mutualConnects.length,
              separatorBuilder: (context, index) => const Divider(height: 1),
              itemBuilder: (context, index) {
                final profile = mutualConnects[index];
                return ListTile(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  leading: CircleAvatar(
                    radius: 28,
                    backgroundImage: NetworkImage(profile.photos.first),
                  ),
                  title: Text(
                    profile.name,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(
                    'Hey, how are you?', // Mock last message
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(color: Theme.of(context).colorScheme.onSurface.withOpacity(0.6)),
                  ),
                  trailing: Text(
                    '2h ago', // Mock time
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.onSurface.withOpacity(0.4),
                      fontSize: 12,
                    ),
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ChatScreen(profile: profile),
                      ),
                    );
                  },
                );
              },
            ),
    );
  }
}
