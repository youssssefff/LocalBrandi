class Product {
  final int id;
  final String image;
  final List<String> images;
  final String title;
  final int price;
  final String description;
  final bool published;
  final String gender;
  final bool newArrival;
  final bool bestSeller;
  final String category;
  final String subCategory;
  final String color;
  final String style;
   int  quantityInBag;
  // Constructor
  Product({
    required this.id,
    required this.image,
    required this.images,
    required this.title,
    required this.price,
    required this.description,
    required this.published,
    required this.gender,
    required this.newArrival,
    required this.bestSeller,
    required this.category,
    required this.subCategory,
    required this.color,
    required this.style,
    this.quantityInBag =0
  });

  // Named constructor to create a Product instance from a JSON object
  factory Product.fromJson(Map<String, dynamic> json) {
    List<dynamic> imagesData = json['images'] ?? [];
    List<String> imageUrls = imagesData
        .map((image) => image['url'].toString())
        .toList();
    return Product(
      id: json['id'],
      image: json['mainImage'],
      images: imageUrls,
      title: json['title'],
      price: json['price'],
      description: json['description'],
      published: json['published'],
      gender: json['gender'],
      newArrival: json['newArrival'],
      bestSeller: json['bestSeller'],
      category: json['category'],
      subCategory: json['subCategory'],
      color: json['color'],
      style: json['style']
    );
  }
  // CopyWith method to create a new instance with updated values
  Product copyWith({
    int? id,
    String? image,
    List<String>? images,
    String? title,
    int? price,
    String? description,
    bool? published,
    String? gender,
    bool? newArrival,
    bool? bestSeller,
    String? category,
    String? subCategory,
    int? quantityInBag,
  }) {
    return Product(
      id: id ?? this.id,
      image: image ?? this.image,
      images: images ?? this.images,
      title: title ?? this.title,
      price: price ?? this.price,
      description: description ?? this.description,
      published: published ?? this.published,
      gender: gender ?? this.gender,
      newArrival: newArrival ?? this.newArrival,
      bestSeller: bestSeller ?? this.bestSeller,
      category: category ?? this.category,
      subCategory: subCategory ?? this.subCategory,
      quantityInBag: quantityInBag ?? this.quantityInBag,
      color: color ?? this.color,
      style: style ?? this.style,
    );
  }

  // Optional: Override toString method for better readability
  @override
  String toString() {
    return 'Product{id: $id, title: $title, price: $price}';
  }
}