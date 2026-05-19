import 'package:get/get.dart';
import 'package:media_kit/media_kit.dart';
import 'package:media_kit_video/media_kit_video.dart';

class MediaController extends GetxController {
  final Player player = Player();

  VideoController? controller;

  final String streamUrl =
      'https://player.castr.com/d_ad1609f0374111f0a0869d26a7445c29';
  @override
  void onInit() {
    super.onInit();

    controller = VideoController(player);

    player.open(Media(streamUrl));
  }

  @override
  void onClose() {
    player.dispose();

    super.onClose();
  }
}
