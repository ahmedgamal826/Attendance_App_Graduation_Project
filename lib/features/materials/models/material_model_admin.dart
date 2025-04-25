class MaterialFile {
  final String name;
  final String size;
  final String? url;

  MaterialFile({
    required this.name,
    required this.size,
    this.url,
  });
}
