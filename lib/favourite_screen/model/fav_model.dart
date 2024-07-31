class Favorite {
  final String productId;
  final String name;
  final String imageUrl;
  final String location;

  Favorite({required this.productId, required this.name, required this.location,required this.imageUrl});

  Map<String, dynamic> toMap() {
    return {
      'productId': productId,
      'name': name,
      'imageUrl': imageUrl,
      'location':location
    };
  }

  factory Favorite.fromMap(Map<String, dynamic> map) {
    return Favorite(
      productId: map['productId'] ?? '',
      name: map['name'] ?? '',
      imageUrl: map['imageUrl'] ?? '',
      location: map['location'] ?? '',
    );
  }
}
