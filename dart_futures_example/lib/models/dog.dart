class Dog {
  late Uri imageUri;
  late String status;

  Dog({required String endpoint, required this.status}) {
    imageUri = Uri.parse(endpoint);
  }
}
