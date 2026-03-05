import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_text_styles.dart';
import '../../core/models/chat_models.dart';
import 'rider_chat_screen.dart';

/// Rider chat list screen showing all conversations with customers
class RiderChatListScreen extends StatefulWidget {
  const RiderChatListScreen({super.key});

  @override
  State<RiderChatListScreen> createState() => _RiderChatListScreenState();
}

class _RiderChatListScreenState extends State<RiderChatListScreen> {
  // Sample conversations
  final List<ChatConversation> _conversations = [
    ChatConversation(
      id: '1',
      participantName: 'Juan Dela Cruz',
      participantAvatar: '👨‍💼',
      lastMessage: 'Thanks! I\'ll be waiting for you.',
      lastMessageTime: DateTime.now().subtract(const Duration(minutes: 5)),
      unreadCount: 0,
      isOnline: true,
    ),
    ChatConversation(
      id: '2',
      participantName: 'Maria Santos',
      participantAvatar: '👩',
      lastMessage: 'Please call me when you arrive.',
      lastMessageTime: DateTime.now().subtract(const Duration(hours: 1)),
      unreadCount: 1,
      isOnline: false,
    ),
    ChatConversation(
      id: '3',
      participantName: 'Ricardo Gomez',
      participantAvatar: '👨‍🦱',
      lastMessage: 'Where are you now?',
      lastMessageTime: DateTime.now().subtract(const Duration(hours: 3)),
      unreadCount: 2,
      isOnline: false,
    ),
    ChatConversation(
      id: '4',
      participantName: 'Ana Reyes',
      participantAvatar: '👩‍🦰',
      lastMessage: 'Thank you for the fast delivery!',
      lastMessageTime: DateTime.now().subtract(const Duration(days: 1)),
      unreadCount: 0,
      isOnline: false,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: AppColors.textPrimary,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text('Messages', style: AppTextStyles.headlineSmall),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.search_outlined,
              color: AppColors.textPrimary,
            ),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.more_vert, color: AppColors.textPrimary),
            onPressed: () {},
          ),
        ],
      ),
      body: _conversations.isEmpty
          ? _buildEmptyState()
          : ListView.separated(
              padding: const EdgeInsets.symmetric(vertical: 8),
              itemCount: _conversations.length,
              separatorBuilder: (_, __) => Divider(
                height: 1,
                thickness: 1,
                color: AppColors.gray200,
                indent: 76,
              ),
              itemBuilder: (context, index) {
                return _ConversationTile(
                  conversation: _conversations[index],
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (_) => RiderChatScreen(
                          customerName: _conversations[index].participantName,
                          customerAvatar:
                              _conversations[index].participantAvatar,
                          orderId: 'ORD-${_conversations[index].id}',
                          rating: 4.8,
                          deliveries: 56,
                        ),
                      ),
                    );
                  },
                );
              },
            ),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              color: AppColors.gray100,
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.chat_bubble_outline,
              size: 40,
              color: AppColors.gray400,
            ),
          ),
          const SizedBox(height: 20),
          Text('No Messages Yet', style: AppTextStyles.headlineSmall),
          const SizedBox(height: 8),
          Text(
            'Your conversations with customers\nwill appear here',
            textAlign: TextAlign.center,
            style: AppTextStyles.bodyMedium.copyWith(
              color: AppColors.textSecondary,
            ),
          ),
        ],
      ),
    );
  }
}

class _ConversationTile extends StatelessWidget {
  final ChatConversation conversation;
  final VoidCallback onTap;

  const _ConversationTile({required this.conversation, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Row(
          children: [
            // Avatar
            Stack(
              children: [
                Container(
                  width: 56,
                  height: 56,
                  decoration: BoxDecoration(
                    color: AppColors.gray100,
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Text(
                      conversation.participantAvatar,
                      style: const TextStyle(fontSize: 28),
                    ),
                  ),
                ),
                if (conversation.isOnline)
                  Positioned(
                    right: 0,
                    bottom: 2,
                    child: Container(
                      width: 14,
                      height: 14,
                      decoration: BoxDecoration(
                        color: AppColors.success,
                        shape: BoxShape.circle,
                        border: Border.all(color: AppColors.white, width: 2),
                      ),
                    ),
                  ),
              ],
            ),
            const SizedBox(width: 12),
            // Content
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        conversation.participantName,
                        style: AppTextStyles.titleMedium,
                      ),
                      if (conversation.lastMessageTime != null) ...[
                        const Spacer(),
                        Text(
                          _formatTime(conversation.lastMessageTime!),
                          style: AppTextStyles.labelSmall.copyWith(
                            color: AppColors.textTertiary,
                          ),
                        ),
                      ],
                    ],
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          conversation.lastMessage ?? 'No messages yet',
                          style: AppTextStyles.bodyMedium.copyWith(
                            color: AppColors.textSecondary,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      if (conversation.unreadCount > 0) ...[
                        const SizedBox(width: 8),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 4,
                          ),
                          decoration: BoxDecoration(
                            color: AppColors.primary,
                            shape: BoxShape.circle,
                          ),
                          child: Text(
                            conversation.unreadCount > 9
                                ? '9+'
                                : '${conversation.unreadCount}',
                            style: AppTextStyles.labelSmall.copyWith(
                              color: AppColors.white,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ],
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _formatTime(DateTime dateTime) {
    final now = DateTime.now();
    final difference = now.difference(dateTime);

    if (difference.inMinutes < 1) {
      return 'Now';
    } else if (difference.inHours < 1) {
      return '${difference.inMinutes}m';
    } else if (difference.inDays < 1) {
      return '${difference.inHours}h';
    } else if (difference.inDays == 1) {
      return 'Yesterday';
    } else if (difference.inDays < 7) {
      return '${dateTime.day}/${dateTime.month}';
    } else {
      return '${dateTime.day}/${dateTime.month}/${dateTime.year}';
    }
  }
}
