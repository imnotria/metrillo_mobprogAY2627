import 'package:material_ui/material_ui.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'button.dart';
import 'custom_text.dart';

class NewsFeedCard extends StatelessWidget {
  final String userName;
  final String postContent;
  final String date;
  final int numOfLikes;
  final bool hasImage;
  final String? imagePath;
  final String? avatarPath;
  // Profile photo of the Facebook account owner (the one writing comments)
  final String ownerAvatarPath;

  const NewsFeedCard({
    super.key,
    required this.userName,
    required this.postContent,
    required this.date,
    this.numOfLikes = 0,
    this.hasImage = false,
    this.imagePath,
    this.avatarPath,
    this.ownerAvatarPath = 'assets/images/donkey.jpeg',
  });

  Widget _buildAvatar(String? path) {
    return CircleAvatar(
      radius: ScreenUtil().setWidth(18),
      backgroundColor: Colors.grey[300],
      backgroundImage: path != null ? AssetImage(path) : null,
      onBackgroundImageError: path != null
          ? (exception, stackTrace) {
              debugPrint('Failed to load avatar ($path): $exception');
            }
          : null,
      child: path == null
          ? const Icon(Icons.person, color: Colors.black54)
          : null,
    );
  }

  Widget _buildPostImage() {
    if (!hasImage) return const SizedBox.shrink();

    final double height = ScreenUtil().setHeight(250);

    if (imagePath == null) {
      return SizedBox(
        height: height,
        width: double.infinity,
        child: const Placeholder(),
      );
    }

    return ClipRRect(
      borderRadius: BorderRadius.circular(ScreenUtil().setSp(8)),
      child: Image.asset(
        imagePath!,
        width: double.infinity,
        height: height,
        fit: BoxFit.cover,
        errorBuilder: (context, error, stackTrace) => SizedBox(
          height: height,
          width: double.infinity,
          child: const Placeholder(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(ScreenUtil().setSp(10)),
      child: Padding(
        padding: EdgeInsets.all(ScreenUtil().setSp(10)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Post author header (keeps monkey.jpg from avatarPath)
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                _buildAvatar(avatarPath),
                SizedBox(width: ScreenUtil().setWidth(10)),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      text: userName,
                      fontSize: ScreenUtil().setSp(15),
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                    Row(
                      children: [
                        CustomText(
                          text: date,
                          fontSize: ScreenUtil().setSp(12),
                          color: Colors.grey,
                        ),
                        SizedBox(width: ScreenUtil().setWidth(3)),
                        Icon(
                          Icons.public,
                          color: Colors.grey,
                          size: ScreenUtil().setSp(15),
                        ),
                      ],
                    ),
                  ],
                ),
                const Spacer(),
                const Icon(Icons.more_horiz),
              ],
            ),

            SizedBox(height: ScreenUtil().setHeight(5)),

            // Post content
            CustomText(
              text: postContent,
              fontSize: ScreenUtil().setSp(12),
              color: Colors.black,
            ),

            SizedBox(height: ScreenUtil().setHeight(5)),

            _buildPostImage(),

            // Action buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                LikeButton(initialLikes: numOfLikes),
                ActionButton(
                  icon: Icons.comment,
                  label: 'Comment',
                  onPressed: () {},
                ),
                ActionButton(
                  icon: Icons.redo,
                  label: 'Share',
                  onPressed: () {},
                ),
              ],
            ),

            // Write a comment (uses ownerAvatarPath -> donkey.jpeg)
            Row(
              children: [
                _buildAvatar(ownerAvatarPath),
                SizedBox(width: ScreenUtil().setWidth(10)),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.only(left: ScreenUtil().setSp(10)),
                    alignment: Alignment.centerLeft,
                    height: ScreenUtil().setHeight(25),
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius:
                          BorderRadius.circular(ScreenUtil().setSp(10)),
                    ),
                    child: CustomText(
                      text: 'Write a comment...',
                      fontSize: ScreenUtil().setSp(11),
                      color: Colors.grey,
                    ),
                  ),
                ),
              ],
            ),

            SizedBox(height: ScreenUtil().setHeight(10)),

            CustomText(
              text: 'View comments',
              fontSize: ScreenUtil().setSp(12),
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ],
        ),
      ),
    );
  }
}