import 'package:material_ui/material_ui.dart';
import '../widgets/newsfeed_card.dart';

class NewsFeedScreen extends StatelessWidget {
  const NewsFeedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        // Logged-in user's profile / status bar section
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            children: [
              const CircleAvatar(
                radius: 20,
                backgroundImage: AssetImage('assets/images/donkey.jpeg'),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey.shade400),
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: const Text(
                    "What's on your mind?",
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
              ),
            ],
          ),
        ),
        const Divider(thickness: 4),

        // Existing News Feed Posts
        const NewsFeedCard(
          userName: 'Kyle Batumbakal',
          postContent: 'new SDG unlocked',
          numOfLikes: 100,
          date: 'November 29',
          avatarPath: 'assets/images/monkey.jpg', // profile photo
        ),
        const NewsFeedCard(
          userName: 'NeoKim Gonzalez',
          postContent: 'For Sale! Ilocos Longgansa',
          numOfLikes: 200,
          hasImage: true,
          date: 'November 23',
          avatarPath: 'assets/images/goat.png', // profile photo
          imagePath: 'assets/images/ilocos.jpeg', // post photo
        ),
      ],
    );
  }
}