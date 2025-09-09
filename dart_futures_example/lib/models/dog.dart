class Dog {
  late Uri imageUri;
  late String status;

  Dog({required String endpoint, required this.status}) {
    imageUri = Uri.parse(endpoint);
  }

  factory Dog.fromJson(dynamic json) {
    return Dog(endpoint: json['message'], status: json['status']);
  }

  @override
  String toString() {
    return imageUri.toString();
  }
}
