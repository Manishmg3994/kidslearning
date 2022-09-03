part of "app_pages.dart";

abstract class Routes {
  static const selectGrade = _Path.selectGrade;
  static const exploreVideos = _Path.exploreVideos;
  static const home = _Path.home;
  static const videoView = _Path.videoView;

}

abstract class _Path {
  static const selectGrade =
      "/selectgrade/"; //never forget to add / before thenamed routes unless it will not work
  static const exploreVideos = "/explorevideos/";
  static const home = "/home/";
  static const videoView = "/video/";
}
