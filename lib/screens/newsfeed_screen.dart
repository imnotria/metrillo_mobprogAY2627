import 'package:material_ui/material_ui.dart';
import '../widgets/newsfeed_card.dart';

class NewsFeedScreen extends StatelessWidget {
  const NewsFeedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const [
        NewsFeedCard(
          userName: 'Kyle Batumbakal',
          postContent: 'new SDG unlocked',
          numOfLikes: 100,
          date: 'November 29',
          avatarPath: 'assets/images/monkey.jpg', // profile photo
        ),
        NewsFeedCard(
          userName: 'NeoKim Gonzalez',
          postContent: 'For Sale! Ilocos Longgansa',
          numOfLikes: 200,
          hasImage: true,
          date: 'November 23',
          avatarPath: 'assets/images/monkey.jpg', // profile photo
          imagePath: 'assets/images/ilocos.jpeg', // post photo
        ),
      ],
    );
  }
}