import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class PodcastPlayerCard extends StatefulWidget {
  const PodcastPlayerCard({super.key});

  @override
  State<PodcastPlayerCard> createState() => _PodcastPlayerCardState();
}

class _PodcastPlayerCardState extends State<PodcastPlayerCard> {
  late AudioPlayer _player;
  bool _isPlaying = false;
  Duration _position = Duration.zero;
  Duration _duration = Duration.zero;
  double _speed = 1.0;

  // Free sample audio from archive.org
  static const _audioUrl =
      'https://www.soundhelix.com/examples/mp3/SoundHelix-Song-1.mp3';

  @override
  void initState() {
    super.initState();
    _player = AudioPlayer();
    _initAudio();
  }

  Future<void> _initAudio() async {
    try {
      await _player.setUrl(_audioUrl);
      _player.durationStream.listen((d) {
        if (d != null && mounted) setState(() => _duration = d);
      });
      _player.positionStream.listen((p) {
        if (mounted) setState(() => _position = p);
      });
      _player.playerStateStream.listen((state) {
        if (mounted) {
          setState(() => _isPlaying = state.playing);
        }
      });
    } catch (_) {}
  }

  @override
  void dispose() {
    _player.dispose();
    super.dispose();
  }

  String _formatDuration(Duration d) {
    final minutes = d.inMinutes.remainder(60).toString().padLeft(2, '0');
    final seconds = d.inSeconds.remainder(60).toString().padLeft(2, '0');
    return '$minutes:$seconds';
  }

  void _togglePlay() async {
    if (_isPlaying) {
      await _player.pause();
    } else {
      await _player.play();
    }
  }

  void _rewind10() async {
    final newPos = _position - const Duration(seconds: 10);
    await _player.seek(newPos < Duration.zero ? Duration.zero : newPos);
  }

  void _forward10() async {
    final newPos = _position + const Duration(seconds: 10);
    await _player.seek(newPos > _duration ? _duration : newPos);
  }

  void _cycleSpeed() async {
    const speeds = [1.0, 1.25, 1.5, 2.0];
    final nextIndex = (speeds.indexOf(_speed) + 1) % speeds.length;
    setState(() => _speed = speeds[nextIndex]);
    await _player.setSpeed(_speed);
  }

  @override
  Widget build(BuildContext context) {
    final progress = _duration.inMilliseconds > 0
        ? _position.inMilliseconds / _duration.inMilliseconds
        : 0.0;

    return Card(
      margin: EdgeInsets.all(8),
      elevation: 2,
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ── Podcast thumbnail ──
            ClipRRect(
              borderRadius: BorderRadius.circular(6),
              child: Image.network(
                'https://images.unsplash.com/photo-1478737270239-2f02b77fc618?w=120&h=120&fit=crop',
                width: 90,
                height: 90,
                fit: BoxFit.cover,
                errorBuilder: (_, __, ___) => Container(
                  width: 90,
                  height: 90,
                  color: Colors.black87,
                  child: const Icon(Icons.mic, color: Colors.white, size: 36),
                ),
              ),
            ),

            const SizedBox(width: 12),

            // ── Right side ──
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Title + subtitle
                  const Text(
                    'Efatha books',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF1A1A1A),
                    ),
                  ),
                  const SizedBox(height: 4),
                  const Text(
                    'Demo Product',
                    style: TextStyle(fontSize: 13, color: Color(0xFF666666)),
                  ),

                  const SizedBox(height: 10),

                  // ── Play button + progress bar row ──
                  Row(
                    children: [
                      // Play/pause button
                      GestureDetector(
                        onTap: _togglePlay,
                        child: Container(
                          width: 36,
                          height: 36,
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                color: Color(0x22000000),
                                blurRadius: 6,
                                offset: Offset(0, 2),
                              ),
                            ],
                          ),
                          child: Icon(
                            _isPlaying ? Icons.pause : Icons.play_arrow,
                            color: Colors.red,
                            size: 22,
                          ),
                        ),
                      ),

                      const SizedBox(width: 8),

                      // Progress slider
                      Expanded(
                        child: Column(
                          children: [
                            SliderTheme(
                              data: SliderTheme.of(context).copyWith(
                                trackHeight: 2,
                                thumbShape: const RoundSliderThumbShape(
                                  enabledThumbRadius: 5,
                                ),
                                overlayShape: const RoundSliderOverlayShape(
                                  overlayRadius: 10,
                                ),
                                activeTrackColor: Colors.grey.shade700,
                                inactiveTrackColor: Colors.grey.shade300,
                                thumbColor: Colors.grey.shade700,
                                overlayColor: Colors.grey.shade200,
                              ),
                              child: Slider(
                                value: progress.clamp(0.0, 1.0),
                                onChanged: (val) {
                                  final seekTo = Duration(
                                    milliseconds:
                                        (val * _duration.inMilliseconds)
                                            .toInt(),
                                  );
                                  _player.seek(seekTo);
                                },
                              ),
                            ),
                            // Time display
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 4,
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text(
                                    '${_formatDuration(_position)} / ${_formatDuration(_duration)}',
                                    style: const TextStyle(
                                      fontSize: 11,
                                      color: Color(0xFF888888),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 6),

                  // ── Controls row: volume, rewind, speed, forward ──
                  Row(
                    children: [
                      // Volume icon
                      const Icon(
                        Icons.volume_up_outlined,
                        size: 20,
                        color: Color(0xFF555555),
                      ),

                      const SizedBox(width: 14),

                      // Rewind 10s
                      GestureDetector(
                        onTap: _rewind10,
                        child: const Icon(
                          Icons.replay_10_outlined,
                          size: 22,
                          color: Color(0xFF555555),
                        ),
                      ),

                      const SizedBox(width: 14),

                      // Speed toggle
                      GestureDetector(
                        onTap: _cycleSpeed,
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 6,
                            vertical: 2,
                          ),
                          decoration: BoxDecoration(
                            border: Border.all(color: const Color(0xFF888888)),
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Text(
                            _speed == _speed.truncateToDouble()
                                ? '${_speed.toInt()}x'
                                : '${_speed}x',
                            style: const TextStyle(
                              fontSize: 11,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFF555555),
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(width: 14),

                      // Forward 10s
                      GestureDetector(
                        onTap: _forward10,
                        child: const Icon(
                          Icons.forward_10_outlined,
                          size: 22,
                          color: Color(0xFF555555),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
