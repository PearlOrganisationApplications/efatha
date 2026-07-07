import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class AppBackButton extends StatelessWidget {
  final VoidCallback? onTap;
  final double size;

  const AppBackButton({super.key, this.onTap, this.size = 40});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap ?? () => Get.back(),
      child: Container(
        width: size,
        height: size,
        // decoration: BoxDecoration(
        //   color: Colors.white,
        //   shape: BoxShape.circle,
        //   boxShadow: [
        //     BoxShadow(
        //       color: Colors.black12,
        //       blurRadius: 8,
        //       offset: Offset(0, 2),
        //     ),
        //   ],
        // ),
        child: const Icon(CupertinoIcons.back, size: 22),
      ),
    );
  }
}
