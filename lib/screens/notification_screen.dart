import '../widgets/notification.dart' as notif;

import 'package:material_ui/material_ui.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// General Enhancement: 20 notifications (name, post, description)
const List<(String, String, String)> _notifications = [
  ('Kyle Batumbakal', 'new SDG unlocked', 'liked your post'),
  ('NeoKim Gonzalez', 'Ilocos Longgansa', 'commented on your post'),
  ('Maria Santos', 'Finals week', 'shared your post'),
  ('Juan Dela Cruz', 'Roadtrip', 'tagged you in a post'),
  ('Angela Reyes', 'Flutter 2AM', 'liked your comment'),
  ('Paolo Mercado', 'Lab activity 2', 'commented on your post'),
  ('Bea Villanueva', 'Sunset by the bay', 'liked your photo'),
  ('Carlo Mendoza', 'Mobprog notes', 'replied to your comment'),
  ('Trisha Navarro', 'Banana cue', 'liked your post'),
  ('Miguel Ramos', 'Group meeting', 'mentioned you in a comment'),
  ('Sofia Lim', 'Study group', 'invited you to an event'),
  ('Rafael Cruz', 'Basketball night', 'liked your post'),
  ('Isabel Tan', 'Coffee run', 'shared your post'),
  ('Gabriel Ong', 'New phone', 'commented on your photo'),
  ('Camille Diaz', 'Beach trip', 'tagged you in a photo'),
  ('Enzo Aquino', 'Thesis defense', 'liked your comment'),
  ('Nina Flores', 'Weekend plans', 'replied to your comment'),
  ('Luis Garcia', 'Gaming session', 'liked your post'),
  ('Hannah Bautista', 'Art showcase', 'shared your post'),
  ('Marco Castillo', 'Hackathon', 'mentioned you in a comment'),
];

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      width: ScreenUtil().screenWidth,
      // Scrollable list; separated adds the Divider between each item
      child: ListView.separated(
        itemCount: _notifications.length,
        separatorBuilder: (context, index) => const Divider(height: 1),
        itemBuilder: (context, index) {
          final (name, post, description) = _notifications[index];
          return notif.NotificationWidget(
            name: name,
            post: post,
            description: description,
          );
        },
      ),
    );
  }
}