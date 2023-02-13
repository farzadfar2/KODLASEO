
class Product {
  Product({
    required this.name,
    required this.imageProvider,
    List<ModulList>? items,
  }) : items = items ?? [];

  final String name;
  final String imageProvider;
  final List<ModulList> items;

  String get ModulImage {
    final imageprovider =
    items.fold<String>('', (prev, item) => item.resim.toString());
    return imageprovider;
  }

  int get formattedTotalItemheih {
    final TotalItemheih = items.fold<int>(0, (prev, item) => item.yukseklik);
    return TotalItemheih;
  }
}
