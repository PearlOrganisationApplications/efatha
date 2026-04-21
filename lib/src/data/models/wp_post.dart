class WpPost {
  final int id;
  final String title;
  final String content;
  final String excerpt;
  final String date;
  final String link;
  final String guid;
  final String? featuredMediaUrl;

  WpPost({
    required this.id,
    required this.title,
    required this.content,
    required this.excerpt,
    required this.date,
    required this.link,
    required this.guid,
    this.featuredMediaUrl,
  });

  factory WpPost.fromJson(Map<String, dynamic> json) {
    String? mediaUrl;
    if (json['_embedded'] != null &&
        json['_embedded']['wp:featuredmedia'] != null &&
        json['_embedded']['wp:featuredmedia'].isNotEmpty) {
      mediaUrl = json['_embedded']['wp:featuredmedia'][0]['source_url'];
    }

    return WpPost(
      id: json['id'],
      guid: json['guid']?['rendered'] ?? '',
      title: json['title']['rendered'] ?? '',
      content: json['content']['rendered'] ?? '',
      excerpt: json['excerpt']['rendered'] ?? '',
      date: json['date'] ?? '',
      link: json['link'] ?? '',
      featuredMediaUrl: mediaUrl,
    );
  }
}

