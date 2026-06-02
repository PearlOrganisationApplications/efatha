import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:vimeo_video_player/vimeo_video_player.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoPlayerScreen extends StatefulWidget {
  final String videoUrl;
  const VideoPlayerScreen({super.key, required this.videoUrl});

  @override
  State<VideoPlayerScreen> createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  YoutubePlayerController? _youtubeController;
  bool _isYouTube = false;
  String _videoId = "";

  @override
  void initState() {
    super.initState();

    // Strict Portrait enforcement
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    _initializeVideo();
  }

  // Safe manual extraction to handle embeds, shorts, and standard URLs cleanly
  String? _extractYoutubeId(String url) {
    if (url.length == 11) return url; // Already an ID

    final regExp = RegExp(
      r'^.*(?:(?:youtu\.be\/|v\/|vi\/|u\/\w\/|embed\/|shorts\/)|(?:(?:watch)?\?v(?:i)?=|\&v(?:i)?=))([^#\&\?]*).*',
      caseSensitive: false,
    );

    final match = regExp.firstMatch(url);
    return (match != null && match.group(1)?.length == 11)
        ? match.group(1)
        : null;
  }

  void _initializeVideo() {
    _videoId = widget.videoUrl;

    // Detect if YouTube configuration applies
    if (_videoId.contains("youtu.be") ||
        _videoId.contains("youtube.com") ||
        _videoId.contains("embed")) {
      _isYouTube = true;

      String? extractedId = _extractYoutubeId(_videoId);

      if (extractedId != null) {
        // v10.0.1 precise initialization syntax
        _youtubeController = YoutubePlayerController.fromVideoId(
          videoId: extractedId,
          autoPlay: true,
          params: const YoutubePlayerParams(
            showControls: true,
            showFullscreenButton: false, // Prevents rotating to landscape
            mute: false,
          ),
        );
      }
    }
  }

  @override
  void dispose() {
    // Revert orientations gracefully when returning back to your list view
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Stack(
          children: [
            // 1. Unified Player Framework
            Center(child: _buildVideoPlayer()),

            // 2. Translucent Circular Back Button
            Positioned(
              top: 16,
              left: 16,
              child: ClipOval(
                child: Material(
                  color: Colors.black45,
                  child: InkWell(
                    onTap: () => Get.back(),
                    child: const Padding(
                      padding: EdgeInsets.all(12.0),
                      child: Icon(
                        Icons.arrow_back_ios_new,
                        color: Colors.white,
                        size: 20,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildVideoPlayer() {
    if (_videoId.isEmpty) {
      return const Text(
        "No video content provided",
        style: TextStyle(color: Colors.white, fontSize: 16),
      );
    }

    if (_isYouTube) {
      if (_youtubeController == null) {
        return const Text(
          "Invalid YouTube URL",
          style: TextStyle(color: Colors.white, fontSize: 16),
        );
      }
      return YoutubePlayer(
        controller: _youtubeController!,
        aspectRatio: 16 / 9,
      );
    } else {
      // Plays your plain numerical strings safely inside Vimeo engine
      return VimeoVideoPlayer(
        videoId: _videoId,
        showControls: true,
        isAutoPlay: true,
        portrait: true,
      );
    }
  }
}
