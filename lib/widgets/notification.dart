import 'package:material_ui/material_ui.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'custom_text.dart';

class NotificationWidget extends StatelessWidget {
  const NotificationWidget({
    super.key,
    required this.name,
    required this.post,
    required this.description,
  });

  final String name;
  final String post;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(ScreenUtil().setSp(15)),
      child: Row(
        children: [
          Icon(Icons.person, size: ScreenUtil().setSp(40)),
          SizedBox(width: ScreenUtil().setWidth(10)),
          // Expanded keeps long text from overflowing next to the "more" icon
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                  text: name,
                  fontSize: ScreenUtil().setSp(20),
                  color: Colors.black,
                  fontWeight: FontWeight.w800,
                ),
                CustomText(
                  text: 'Posted: $post',
                  fontSize: ScreenUtil().setSp(13),
                  color: Colors.black,
                ),
                CustomText(
                  text: description,
                  fontSize: ScreenUtil().setSp(12),
                  color: Colors.black,
                  fontStyle: FontStyle.italic,
                ),
              ],
            ),
          ),
          const Icon(Icons.more_horiz),
        ],
      ),
    );
  }
}