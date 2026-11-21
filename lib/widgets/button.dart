import 'package:material_ui/material_ui.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../constants.dart';
import 'custom_text.dart';

/// Reusable widget for Like / Comment / Share buttons.
class ActionButton extends StatelessWidget {
  const ActionButton({
    super.key,
    required this.icon,
    required this.label,
    required this.onPressed,
    this.color = FB_DARK_PRIMARY,
  });

  final IconData icon;
  final String label;
  final VoidCallback onPressed;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      onPressed: onPressed,
      icon: Icon(icon, color: color),
      label: CustomText(
        text: label,
        fontSize: ScreenUtil().setSp(12),
        color: color,
      ),
    );
  }
}

/// Widget-based like button: toggles and updates the count.
class LikeButton extends StatefulWidget {
  const LikeButton({super.key, required this.initialLikes});

  final int initialLikes;

  @override
  State<LikeButton> createState() => _LikeButtonState();
}

class _LikeButtonState extends State<LikeButton> {
  late int _likes = widget.initialLikes;
  bool _isLiked = false;

  void _toggleLike() {
    setState(() {
      _isLiked = !_isLiked;
      _likes += _isLiked ? 1 : -1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ActionButton(
      icon: _isLiked ? Icons.thumb_up : Icons.thumb_up_outlined,
      label: _likes.toString(),
      color: _isLiked ? FB_PRIMARY : FB_DARK_PRIMARY,
      onPressed: _toggleLike,
    );
  }
}