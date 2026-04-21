class Product {
  final int id;
  final String title;
  final String description;
  final String? price;
  final String? imageUrl;
  final String link;

  Product({
    required this.id,
    required this.title,
    required this.description,
    this.price,
    this.imageUrl,
    required this.link,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    String? mediaUrl;
    if (json['_embedded'] != null &&
        json['_embedded']['wp:featuredmedia'] != null &&
        json['_embedded']['wp:featuredmedia'].isNotEmpty) {
      mediaUrl = json['_embedded']['wp:featuredmedia'][0]['source_url'];
    }

    return Product(
      id: json['id'],
      title: json['title']['rendered'] ?? '',
      description: json['content']['rendered'] ?? '',
      imageUrl: mediaUrl,
      link: json['link'] ?? '',
    );
  }
}
