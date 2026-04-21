class WpPodcast {
  final int id;
  final String title;
  final String excerpt;
  final String audioUrl;
  final String imageUrl;
  final String duration;
  final String date;

  WpPodcast({
    required this.id,
    required this.title,
    required this.excerpt,
    required this.audioUrl,
    required this.imageUrl,
    required this.duration,
    required this.date,
  });

  factory WpPodcast.fromJson(Map<String, dynamic> json) {
    final meta = json['meta'] ?? {};
    return WpPodcast(
      id: json['id'],
      title: json['title']['rendered'] ?? '',
      excerpt: json['excerpt']['rendered'] ?? '',
      audioUrl: meta['audio_file'] ?? '',
      imageUrl: meta['cover_image'] ?? '',
      duration: meta['duration'] ?? '',
      date: json['date'] ?? '',
    );
  }
}
