import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutterfire_ui/firestore.dart';
import 'package:get/get.dart';

import '../../../../core/colors.dart';
import '../../videoplay/view/yt_video.dart';
import '../model/videopost_model.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class ExploreVideos extends StatefulWidget {
  String? categoryName;
  ExploreVideos({this.categoryName, super.key});

  @override
  State<ExploreVideos> createState() => _ExploreVideosState();
}

class _ExploreVideosState extends State<ExploreVideos> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
    final queryPost = FirebaseFirestore.instance
        .collection(widget.categoryName.toString())
        .orderBy('indx')
        .withConverter<Post>(
          fromFirestore: ((snapshot, options) =>
              Post.fromJson(snapshot.data()!)),
          toFirestore: (video, _) => video.toJson(),
        );

    return Scaffold(
      body: FirestoreListView<Post>(
          shrinkWrap: true,
          query: queryPost,
          itemBuilder: (context, snapshot) {
            final post = snapshot.data();
            final videoId = YoutubePlayer.convertUrlToId(
                post.videoUrl!); //post.videoUrl.;//todo
            return GestureDetector(
              onTap: () {
                Get.to(VideoYT(
                  url: post.videoUrl,
                ));
              },
              child: Container(
                height: 250,

                width: double.infinity,
                decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(20),

                    ///Thumbnail Configuration
                    image: DecorationImage(
                        image: NetworkImage(post.imageUrl ??
                            'https://i3.ytimg.com/vi/$videoId/sddefault.jpg'),
                        fit: BoxFit.cover)),

                // child: YoutubePlayer(
                //   controller: _controller,
                //   showVideoProgressIndicator: true,

                //   // videoProgressIndicatorColor: Colors.amber,
                //   // progressColors: ProgressColors(
                //   //     playedColor: Colors.amber,
                //   //     handleColor: Colors.amberAccent,
                //   // ),
                //   // onReady () {
                //   //     _controller.addListener(listener);
                //   // },
                // ),
              ),
            );
          }),
    );
  }
}
