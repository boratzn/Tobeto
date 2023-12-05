class Meal {
  final String id;
  final String categoryId;
  final String name;
  final String imageUrl;
  final List<String> ingreients;

  const Meal(
      {required this.id,
      required this.categoryId,
      required this.name,
      required this.imageUrl,
      required this.ingreients});
}
