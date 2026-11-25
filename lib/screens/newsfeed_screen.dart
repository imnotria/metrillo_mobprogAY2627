import 'package:material_ui/material_ui.dart';
import '../widgets/newsfeed_card.dart';

/// Enhancement 1: every post is described by data (name, content, number of
/// likes, date, and whether it has an image placeholder or not).
class _PostData {
  const _PostData({
    required this.userName,
    required this.postContent,
    required this.numOfLikes,
    required this.date,
    required this.avatarPath,
    this.hasImage = false,
    this.imagePath,
  });

  final String userName;
  final String postContent;
  final int numOfLikes;
  final String date;
  final String avatarPath;
  final bool hasImage;
  final String? imagePath;
}

const String _donkey = 'assets/images/donkey.jpeg';
const String _monkey = 'assets/images/monkey.jpg';
const String _goat = 'assets/images/goat.png';
const String _ilocos = 'assets/images/ilocos.jpeg';

// General Enhancement: 10 posts (mix of with-image and text-only)
const List<_PostData> _posts = [
  _PostData(
    userName: 'Kyle Batumbakal',
    postContent: 'new SDG unlocked',
    numOfLikes: 100,
    date: 'November 29',
    avatarPath: _monkey,
  ),
  _PostData(
    userName: 'NeoKim Gonzalez',
    postContent: 'For Sale! Ilocos Longgansa',
    numOfLikes: 200,
    date: 'November 23',
    avatarPath: _goat,
    hasImage: true,
    imagePath: _ilocos,
  ),
  _PostData(
    userName: 'Maria Santos',
    postContent: 'Finals week survival mode: ON',
    numOfLikes: 58,
    date: 'November 22',
    avatarPath: _donkey,
  ),
  _PostData(
    userName: 'Juan Dela Cruz',
    postContent: 'Roadtrip to Ilocos with the barkada!',
    numOfLikes: 312,
    date: 'November 21',
    avatarPath: _monkey,
    hasImage: true,
    imagePath: _ilocos,
  ),
  _PostData(
    userName: 'Angela Reyes',
    postContent: 'Who else is stuck debugging Flutter at 2AM?',
    numOfLikes: 145,
    date: 'November 20',
    avatarPath: _goat,
  ),
  _PostData(
    userName: 'Paolo Mercado',
    postContent: 'Lab activity 2 done. Finally.',
    numOfLikes: 77,
    date: 'November 19',
    avatarPath: _donkey,
  ),
  _PostData(
    userName: 'Bea Villanueva',
    postContent: 'Sunset by the bay never gets old.',
    numOfLikes: 489,
    date: 'November 18',
    avatarPath: _monkey,
    hasImage: true, // no imagePath -> shows the placeholder
  ),
  _PostData(
    userName: 'Carlo Mendoza',
    postContent: 'Anyone have notes for Mobile Programming?',
    numOfLikes: 34,
    date: 'November 17',
    avatarPath: _goat,
  ),
  _PostData(
    userName: 'Trisha Navarro',
    postContent: 'Merienda time! Banana cue for everyone.',
    numOfLikes: 210,
    date: 'November 16',
    avatarPath: _donkey,
    hasImage: true, // no imagePath -> shows the placeholder
  ),
  _PostData(
    userName: 'Miguel Ramos',
    postContent: 'Group project meeting moved to Friday.',
    numOfLikes: 19,
    date: 'November 15',
    avatarPath: _monkey,
  ),
];

class NewsFeedScreen extends StatelessWidget {
  const NewsFeedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // ListView.builder only builds the cards that are on screen,
    // so adding more posts later doesn't slow the app down.
    return ListView.builder(
      itemCount: _posts.length + 1, // +1 for the header at index 0
      itemBuilder: (context, index) {
        if (index == 0) return const _StatusHeader();

        final _PostData post = _posts[index - 1];
        return NewsFeedCard(
          userName: post.userName,
          postContent: post.postContent,
          numOfLikes: post.numOfLikes,
          hasImage: post.hasImage,
          date: post.date,
          avatarPath: post.avatarPath,
          imagePath: post.imagePath,
        );
      },
    );
  }
}

/// Logged-in user's profile / status bar section
class _StatusHeader extends StatelessWidget {
  const _StatusHeader();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
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
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 10,
                  ),
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
      ],
    );
  }
}