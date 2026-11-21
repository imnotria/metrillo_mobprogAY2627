import 'package:material_ui/material_ui.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../constants.dart';
import 'custom_font.dart';

class NewsFeedCard extends StatelessWidget {
  final String userName;
  final String postContent;
  final String date;
  final String numOfLikes;
  final bool hasImage;
  const NewsFeedCard({
    super.key,
    required this.userName,
    required this.postContent,
    this.numOfLikes = '0',
    this.hasImage = false,
    required this.date,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(ScreenUtil().setSp(10)),
      child: padding(
        padding: EdgeInsets.all(ScreenUtil().setSp(10)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icons(Icons.person),
                SizedBox(
                  width: ScreenUtil().setSp(10),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomFont(
                      text: userName,
                      fontSize: ScreenUtil().setSp(15),
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                    SizedBox(
                      width: ScreenUtil().setWidth(3),
                    ),
                    Icon(
                      Icons.public,
                      color: Colors.grey,
                      size: ScreenUtil().setSp(15),
                    ),
                  ],
                ),
              ],
            ),
            Spacer(),
            Icon(icons.more_horiz),
          ],
        ),
        
        SizedBox(height: ScreenUtil().setHeight(5)),

        CustomFont(
          text: postContent,
          fontSize: ScreenUtil().setSp(12),
          color: Colors.black,
        ),
        SizedBox(height: ScreenUtil().setHeight(5)),
        hasImage == true
        ? const Placeholder()
        : SizedBox(
          height: ScreenUtil().setHeight(1),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Textbutton.icon(
              onPressed: () {
                print('Liked");
                },
                icon: const Icon(
                Icons.thumb_up,
                color: FB_DARK_PRIMARY,
                ),
                label: CustomFont(
                text: numOfLikes.toString(),
                fontSize: ScreenUtil().serSp(12),
                color: FB_DARK_PRIMARY,
                ),
            ),
            TextButton.icon(
            onPressed: () {},
            icon: const Icon(
            Icons.comment,
            color: FB_DARK_PRIMARY,
            ),
            label: CustomFont(
            text: 'Comment',
            fontSize: Screenutil().setSp(12),
            color: FB_DARK_PRIMARY,
            ),
          ),
          TextButton.icon(
          onPressed: () {},
          icon: const Icon(
          Icons.redo,
          color: FB_DARK_PRIMARY,
          ),
          label: CustomFont(
          text: 'share',
          fontSize: ScreenUtil().setSp(12),
          color: FB_DARK_PRIMARY,
          ),
          ),
          ],
          ),
          
