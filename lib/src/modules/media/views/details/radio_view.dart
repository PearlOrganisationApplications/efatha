import 'dart:async';

import 'package:efatha_tv/src/modules/contact/views/contact_view.dart';
import 'package:efatha_tv/src/modules/giving/views/donate_view.dart';
import 'package:efatha_tv/src/modules/giving/views/giving_hub_view.dart';
import 'package:efatha_tv/src/modules/giving/views/global_giving_view.dart';
import 'package:efatha_tv/src/modules/giving/views/mobile_payment_view.dart';
import 'package:efatha_tv/src/modules/giving/views/wire_transfer_view.dart';
import 'package:efatha_tv/src/modules/index/controllers/index_controller.dart';
import 'package:efatha_tv/src/modules/partners/views/international_partner_view.dart';
import 'package:efatha_tv/src/modules/partners/views/local_partner_view.dart';
import 'package:efatha_tv/src/modules/partners/views/partners_view.dart';
import 'package:efatha_tv/src/modules/prayer/views/prayer_hub_view.dart';
import 'package:efatha_tv/src/modules/prayer/views/prayer_request_view.dart';
import 'package:efatha_tv/src/modules/prayer/views/prayer_wall_view.dart';
import 'package:efatha_tv/src/modules/prayer/views/salvation_view.dart';
import 'package:efatha_tv/src/shared/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:just_audio/just_audio.dart';

/// Radio Mirchi 98.3 FM live stream URLs.
/// Primary stream (Shoutcast/Icecast via FastCast4u):
const String _kRadioStreamUrl =
    'https://eu8.fastcast4u.com/proxy/clyedupq?mp=/1';

/// Backup stream – uncomment if primary fails:
// const String _kRadioStreamUrl =
//     'https://stream.radiomirchi.com/radiomirchi';
//
// Swap in your own Efatha Radio URL when ready.

class RadioView extends StatefulWidget {
  const RadioView({super.key});

  @override
  State<RadioView> createState() => _RadioViewState();
}

class _RadioViewState extends State<RadioView> {
  // ── GetX controller ──────────────────────────────────────────────────────

  // ── Audio ─────────────────────────────────────────────────────────────────
  final AudioPlayer _player = AudioPlayer();
  bool _isPlaying = false;
  bool _isMuted = false;
  bool _isLoading = false;

  // ── 15-second promo dialog timer ─────────────────────────────────────────
  Timer? _promoTimer;
  bool _promoShown = false; // show only once per session

  @override
  void initState() {
    super.initState();
    _initPlayer();
  }

  Future<void> _initPlayer() async {
    try {
      await _player.setUrl(_kRadioStreamUrl);
    } catch (e) {
      debugPrint('AudioPlayer init error: $e');
    }

    // Keep UI in sync with player state changes
    _player.playerStateStream.listen((state) {
      if (mounted) {
        setState(() {
          _isPlaying = state.playing;
          _isLoading =
              state.processingState == ProcessingState.loading ||
              state.processingState == ProcessingState.buffering;
        });
      }
    });
  }

  // ── Playback controls ─────────────────────────────────────────────────────

  Future<void> _togglePlay() async {
    if (_isPlaying) {
      await _player.stop();
      _cancelPromoTimer();
    } else {
      setState(() => _isLoading = true);
      try {
        await _player.play();
        _startPromoTimer();
      } catch (e) {
        if (mounted) {
          Get.snackbar('Playback Error', 'Could not start stream: $e');
        }
      }
    }
  }

  Future<void> _toggleMute() async {
    _isMuted = !_isMuted;
    await _player.setVolume(_isMuted ? 0.0 : 1.0);
    setState(() {});
  }

  // ── Promo / subscribe dialog after 15 s of playback ──────────────────────

  void _startPromoTimer() {
    if (_promoShown) return;
    _promoTimer?.cancel();
    _promoTimer = Timer(const Duration(seconds: 15), _showPromoDialog);
  }

  void _cancelPromoTimer() {
    _promoTimer?.cancel();
    _promoTimer = null;
  }

  void _showPromoDialog() {
    if (!mounted || _promoShown) return;
    _promoShown = true;
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        backgroundColor: const Color(0xFF025774),
        title: Text(
          '🎶 Enjoying the broadcast?',
          style: GoogleFonts.outfit(
            color: Colors.white,
            fontWeight: FontWeight.w700,
            fontSize: 18,
          ),
        ),
        content: Text(
          'Support Efatha Radio and stay connected with our ministry.\n\nWould you like to become a partner or give today?',
          style: GoogleFonts.outfit(color: Colors.white70, fontSize: 14),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text(
              'Maybe Later',
              style: GoogleFonts.outfit(color: Colors.white54),
            ),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF04A3DA),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            onPressed: () {
              Navigator.of(context).pop();
              Get.to(() => GivingHubView());
            },
            child: Text(
              'Give Now',
              style: GoogleFonts.outfit(
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ── Dispose ───────────────────────────────────────────────────────────────

  @override
  void dispose() {
    _cancelPromoTimer();
    _player.dispose();
    super.dispose();
  }

  // ── Build ─────────────────────────────────────────────────────────────────

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(115),
        child: Obx(
          () => CustomAppBar(
            userName: '',

            onTranslateTap: () =>
                Get.snackbar('Language', 'Language selection coming soon'),
            onSearchTap: () =>
                Get.snackbar('Search', 'Search feature coming soon'),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // ── Header ──────────────────────────────────────────────────
              RichText(
                text: TextSpan(
                  style: GoogleFonts.outfit(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                  children: [
                    const TextSpan(text: 'Listen to Online '),
                    TextSpan(
                      text: 'Live',
                      style: GoogleFonts.outfit(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue,
                      ),
                    ),
                    const TextSpan(text: ' Radio'),
                  ],
                ),
              ),
              const SizedBox(height: 40),

              // ── Player card ─────────────────────────────────────────────
              _buildPlayerCard(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPlayerCard() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(32),
        gradient: const LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [Color(0xFF04A3DA), Color(0xFF025774)],
          stops: [0.2834, 0.6162],
        ),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF025774).withOpacity(0.4),
            blurRadius: 24,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      padding: const EdgeInsets.symmetric(vertical: 28, horizontal: 24),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Station logo
          Image.asset('assets/radio.png', height: 100),
          const SizedBox(height: 12),

          // Station name + live indicator
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: 'Efatha Radio ',
                  style: GoogleFonts.outfit(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                TextSpan(
                  text: '●',
                  style: GoogleFonts.outfit(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: _isPlaying ? Colors.redAccent : Colors.white38,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 6),

          // Status label
          Text(
            _isLoading
                ? 'Buffering…'
                : _isPlaying
                ? 'ON AIR'
                : 'Tap ▶ to listen',
            style: GoogleFonts.outfit(
              color: Colors.white70,
              fontSize: 13,
              letterSpacing: 1.2,
            ),
          ),
          const SizedBox(height: 24),

          // Controls row
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // ── Play / Stop button ──────────────────────────────────────
              _ControlButton(
                icon: _isLoading
                    ? null // show spinner
                    : (_isPlaying
                          ? Icons.stop_rounded
                          : Icons.play_arrow_rounded),
                isLoading: _isLoading,
                backgroundColor: Colors.white,
                iconColor: Colors.black87,
                size: 56,
                onPressed: _isLoading ? null : _togglePlay,
                tooltip: _isPlaying ? 'Stop' : 'Play',
              ),
              const SizedBox(width: 20),

              // ── Mute / Unmute button ────────────────────────────────────
              _ControlButton(
                icon: _isMuted
                    ? Icons.volume_off_rounded
                    : Icons.volume_up_rounded,
                backgroundColor: Colors.white.withOpacity(0.15),
                iconColor: Colors.white,
                size: 48,
                onPressed: _toggleMute,
                tooltip: _isMuted ? 'Unmute' : 'Mute',
              ),
            ],
          ),
        ],
      ),
    );
  }

  // ── Category navigation (unchanged) ──────────────────────────────────────

  void _handleCategoryNavigation(String category) {
    switch (category) {
      case 'Giving':
        Get.to(() => GivingHubView());
        break;
      case 'Donate':
        Get.to(() => DonateView());
        break;
      case 'Mobile Payment':
        Get.to(() => MobilePaymentView());
        break;
      case 'Global Giving':
        Get.to(() => GlobalGivingView());
        break;
      case 'Wire Transfer':
        Get.to(() => WireTransferView());
        break;
      case 'Prayer':
        Get.to(() => PrayerHubView());
        break;
      case 'Prayer Request':
        Get.to(() => PrayerRequestView());
        break;
      case 'Prayer Wall':
        Get.to(() => const PrayerWallView());
        break;
      case 'Salvation':
        Get.to(() => SalvationView());
        break;
      case 'Partners':
        Get.to(() => PartnersHubView());
        break;
      case 'Local Partner':
        Get.to(() => const LocalPartnerView());
        break;
      case 'International Partner':
        Get.to(() => const InternationalPartnerView());
        break;
      case 'Contact':
        Get.to(() => const ContactView());
        break;
    }
  }
}

// ── Reusable control button ───────────────────────────────────────────────────

class _ControlButton extends StatelessWidget {
  const _ControlButton({
    required this.backgroundColor,
    required this.iconColor,
    required this.size,
    required this.onPressed,
    required this.tooltip,
    this.icon,
    this.isLoading = false,
  });

  final IconData? icon;
  final bool isLoading;
  final Color backgroundColor;
  final Color iconColor;
  final double size;
  final VoidCallback? onPressed;
  final String tooltip;

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: tooltip,
      child: Material(
        color: backgroundColor,
        shape: const CircleBorder(),
        child: InkWell(
          customBorder: const CircleBorder(),
          onTap: onPressed,
          child: SizedBox(
            width: size,
            height: size,
            child: Center(
              child: isLoading
                  ? SizedBox(
                      width: size * 0.45,
                      height: size * 0.45,
                      child: CircularProgressIndicator(
                        strokeWidth: 2.5,
                        color: iconColor,
                      ),
                    )
                  : Icon(icon, color: iconColor, size: size * 0.52),
            ),
          ),
        ),
      ),
    );
  }
}
