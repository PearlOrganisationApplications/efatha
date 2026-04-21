class Portfolio {
  final int id;
  final String title;
  final String description;
  final String? imageUrl;
  final String link;

  Portfolio({
    required this.id,
    required this.title,
    required this.description,
    this.imageUrl,
    required this.link,
  });

  factory Portfolio.fromJson(Map<String, dynamic> json) {
    String? mediaUrl;
    if (json['_embedded'] != null &&
        json['_embedded']['wp:featuredmedia'] != null &&
        json['_embedded']['wp:featuredmedia'].isNotEmpty) {
      mediaUrl = json['_embedded']['wp:featuredmedia'][0]['source_url'];
    }

    return Portfolio(
      id: json['id'],
      title: json['title']['rendered'] ?? '',
      description: json['content']['rendered'] ?? '',
      imageUrl: mediaUrl,
      link: json['link'] ?? '',
    );
  }
}
