import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoYT extends StatefulWidget {
  final String? url;
  // final List? allVideosURL;
  final String? fromroute; //temp for deeplink todo
  const VideoYT(
      {Key? key,
      this.url,
      // this.allVideosURL,
      this.fromroute})
      : super(key: key);

  @override
  State<VideoYT> createState() => _VideoYTState();
}

class _VideoYTState extends State<VideoYT> {
  late YoutubePlayerController _controller;
  // final List<YoutubePlayerController?>? _controllerForNextVideos =
  //     widget.allVideosURL?.map<YoutubePlayerController>((videoURL) {
  //        final videoLink = YoutubePlayer.convertUrlToId(videoURL);
  //   YoutubePlayerController(
  //     initialVideoId: videoLink!,
  //     flags: const YoutubePlayerFlags(
  //       autoPlay: false,
  //     ),
  //   );
  // }).toList();

  @override
  void initState() {
    final videoID = YoutubePlayer.convertUrlToId(widget.url!);
    _controller = YoutubePlayerController(
        initialVideoId: videoID!,
        flags: const YoutubePlayerFlags(
          autoPlay: true,
          controlsVisibleAtStart: true,
        ));

    super.initState();
  }

  @override
  void dispose() {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          YoutubePlayer(
            controller: _controller,
            showVideoProgressIndicator: true,
            onReady: (() {
              setState(() {
                // _controller.toggleFullScreenMode();
                YoutubePlayerValue(
                  isControlsVisible: false,
                  isFullScreen: true,
                );
              });
            }),
            onEnded: ((metaData) {
              SystemChrome.setPreferredOrientations(
                  [DeviceOrientation.portraitUp]);
              Navigator.pop(context); //or until if deeplink
            }),
          ),

          //     ListView.separated(
          //   itemBuilder: (context, index) {
          //     return YoutubePlayer(
          //       key: ObjectKey(_controllerForNextVideos![index]),
          //       controller: _controllerForNextVideos![index]!,
          //       actionsPadding: const EdgeInsets.only(left: 16.0),
          //       bottomActions: [
          //         CurrentPosition(),
          //         const SizedBox(width: 10.0),
          //         ProgressBar(isExpanded: true),
          //         const SizedBox(width: 10.0),
          //         RemainingDuration(),
          //         FullScreenButton(),
          //       ],
          //     );
          //   },
          //   itemCount: _controllerForNextVideos!.length,
          //   separatorBuilder: (context, _) => const SizedBox(height: 10.0),
          // ),
        ],
      ),
    );
  }
}
