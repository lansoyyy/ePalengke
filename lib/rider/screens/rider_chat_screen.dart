import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_text_styles.dart';
import '../../core/models/chat_models.dart';
import '../../widgets/chat/chat_widgets.dart';

/// Rider chat screen for communicating with customers
class RiderChatScreen extends StatefulWidget {
  final String? customerName;
  final String? customerAvatar;
  final String? orderId;
  final double? rating;
  final int? deliveries;

  const RiderChatScreen({
    super.key,
    this.customerName = 'Juan Dela Cruz',
    this.customerAvatar = '👨‍💼',
    this.orderId,
    this.rating,
    this.deliveries,
  });

  @override
  State<RiderChatScreen> createState() => _RiderChatScreenState();
}

class _RiderChatScreenState extends State<RiderChatScreen> {
  final TextEditingController _messageController = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  final List<ChatMessage> _messages = [];
  bool _isTyping = false;
  bool _isSending = false;

  // Sample messages
  final List<ChatMessage> _sampleMessages = [
    ChatMessage(
      id: '1',
      text: 'Good morning! I\'m on my way to the market.',
      isSentByMe: true,
      timestamp: DateTime.now().subtract(const Duration(minutes: 30)),
      status: MessageStatus.read,
    ),
    ChatMessage(
      id: '2',
      text: 'Hi! Thanks for accepting my order.',
      isSentByMe: false,
      timestamp: DateTime.now().subtract(const Duration(minutes: 28)),
      status: MessageStatus.sent,
    ),
    ChatMessage(
      id: '3',
      text:
          'You\'re welcome! I\'ve already picked up the chicken and pork. Just getting the vegetables now.',
      isSentByMe: true,
      timestamp: DateTime.now().subtract(const Duration(minutes: 25)),
      status: MessageStatus.read,
    ),
    ChatMessage(
      id: '4',
      text: 'Great! Can you also check if they have fresh tomatoes?',
      isSentByMe: false,
      timestamp: DateTime.now().subtract(const Duration(minutes: 20)),
      status: MessageStatus.sent,
    ),
    ChatMessage(
      id: '5',
      text: 'Sure! Let me check with the vendor.',
      isSentByMe: true,
      timestamp: DateTime.now().subtract(const Duration(minutes: 18)),
      status: MessageStatus.read,
    ),
    ChatMessage(
      id: '6',
      text:
          'Yes, they have fresh tomatoes! ₱80 per kilo. Would you like me to add some?',
      isSentByMe: true,
      timestamp: DateTime.now().subtract(const Duration(minutes: 15)),
      status: MessageStatus.read,
    ),
    ChatMessage(
      id: '7',
      text: 'Yes please! Add 1 kilo.',
      isSentByMe: false,
      timestamp: DateTime.now().subtract(const Duration(minutes: 12)),
      status: MessageStatus.sent,
    ),
    ChatMessage(
      id: '8',
      text:
          'Got it! 1 kilo of tomatoes added. I\'m heading to your location now. ETA is about 15 minutes.',
      isSentByMe: true,
      timestamp: DateTime.now().subtract(const Duration(minutes: 10)),
      status: MessageStatus.read,
    ),
  ];

  @override
  void initState() {
    super.initState();
    _messages.addAll(_sampleMessages);
    _scrollToBottom();
  }

  @override
  void dispose() {
    _messageController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollToBottom() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }

  void _sendMessage() {
    final text = _messageController.text.trim();
    if (text.isEmpty) return;

    setState(() {
      _isSending = true;
      _messages.add(
        ChatMessage(
          id: DateTime.now().millisecondsSinceEpoch.toString(),
          text: text,
          isSentByMe: true,
          timestamp: DateTime.now(),
          status: MessageStatus.sending,
        ),
      );
      _messageController.clear();
    });

    _scrollToBottom();

    // Simulate sending
    Future.delayed(const Duration(milliseconds: 500), () {
      setState(() {
        _messages.last = _messages.last.copyWith(status: MessageStatus.sent);
      });
    });

    // Simulate delivery
    Future.delayed(const Duration(milliseconds: 1500), () {
      setState(() {
        _messages.last = _messages.last.copyWith(
          status: MessageStatus.delivered,
        );
      });
    });

    // Simulate read
    Future.delayed(const Duration(milliseconds: 2500), () {
      setState(() {
        _messages.last = _messages.last.copyWith(status: MessageStatus.read);
      });
    });

    // Simulate typing and response
    Future.delayed(const Duration(milliseconds: 3000), () {
      if (mounted) {
        setState(() {
          _isTyping = true;
        });
      }
    });

    Future.delayed(const Duration(milliseconds: 5000), () {
      if (mounted) {
        setState(() {
          _isTyping = false;
          _isSending = false;
          _messages.add(
            ChatMessage(
              id: DateTime.now().millisecondsSinceEpoch.toString(),
              text: 'Thanks! I\'ll be waiting for you.',
              isSentByMe: false,
              timestamp: DateTime.now(),
              status: MessageStatus.sent,
            ),
          );
        });
        _scrollToBottom();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.gray50,
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
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(widget.customerName!, style: AppTextStyles.titleMedium),
            if (widget.rating != null && widget.deliveries != null)
              Row(
                children: [
                  const Icon(
                    Icons.star_rounded,
                    size: 12,
                    color: Color(0xFFFBBF24),
                  ),
                  const SizedBox(width: 2),
                  Text(
                    '${widget.rating} (${widget.deliveries} deliveries)',
                    style: AppTextStyles.labelSmall.copyWith(
                      color: AppColors.textSecondary,
                    ),
                  ),
                ],
              ),
          ],
        ),
        actions: [
          Container(
            width: 36,
            height: 36,
            margin: const EdgeInsets.only(right: 8),
            decoration: BoxDecoration(
              color: AppColors.gray100,
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.phone_outlined,
              size: 20,
              color: AppColors.textPrimary,
            ),
          ),
          Container(
            width: 36,
            height: 36,
            margin: const EdgeInsets.only(right: 16),
            decoration: BoxDecoration(
              color: AppColors.gray100,
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.more_vert,
              size: 20,
              color: AppColors.textPrimary,
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          // Order info banner
          if (widget.orderId != null)
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              decoration: BoxDecoration(
                color: AppColors.primary.withValues(alpha: 0.1),
                border: Border(
                  bottom: BorderSide(
                    color: AppColors.primary.withValues(alpha: 0.2),
                    width: 1,
                  ),
                ),
              ),
              child: Row(
                children: [
                  Container(
                    width: 32,
                    height: 32,
                    decoration: BoxDecoration(
                      color: AppColors.primary.withValues(alpha: 0.2),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Icon(
                      Icons.receipt_long,
                      size: 16,
                      color: AppColors.primary,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Order #${widget.orderId}',
                          style: AppTextStyles.titleSmall.copyWith(
                            color: AppColors.primary,
                          ),
                        ),
                        Text(
                          'In Progress • Delivering',
                          style: AppTextStyles.labelSmall.copyWith(
                            color: AppColors.textSecondary,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.primary,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Text(
                      'View',
                      style: AppTextStyles.labelSmall.copyWith(
                        color: AppColors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          // Quick action buttons
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              color: AppColors.white,
              border: Border(
                bottom: BorderSide(color: AppColors.gray200, width: 1),
              ),
            ),
            child: Row(
              children: [
                _QuickActionButton(
                  icon: Icons.location_on_outlined,
                  label: 'Location',
                  onTap: () {},
                ),
                const SizedBox(width: 8),
                _QuickActionButton(
                  icon: Icons.call_outlined,
                  label: 'Call',
                  onTap: () {},
                ),
                const SizedBox(width: 8),
                _QuickActionButton(
                  icon: Icons.photo_camera_outlined,
                  label: 'Photo',
                  onTap: () {},
                ),
              ],
            ),
          ),
          // Messages list
          Expanded(
            child: ListView.builder(
              controller: _scrollController,
              padding: const EdgeInsets.symmetric(vertical: 16),
              itemCount: _messages.length + (_isTyping ? 1 : 0),
              itemBuilder: (context, index) {
                if (index < _messages.length) {
                  return MessageBubble(message: _messages[index]);
                } else {
                  return const TypingIndicator();
                }
              },
            ),
          ),
          // Chat input
          ChatInput(
            controller: _messageController,
            onSend: _sendMessage,
            isLoading: _isSending,
            hintText: 'Type a message to ${widget.customerName}...',
          ),
        ],
      ),
    );
  }
}

class _QuickActionButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;

  const _QuickActionButton({
    required this.icon,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 10),
          decoration: BoxDecoration(
            color: AppColors.gray100,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 18, color: AppColors.primary),
              const SizedBox(width: 6),
              Text(
                label,
                style: AppTextStyles.labelSmall.copyWith(
                  color: AppColors.primary,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
