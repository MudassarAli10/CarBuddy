class Category {
  final String image;
  final String name;

  Category({required this.image, required this.name});
}

List<Category> categoriesList = [
  Category(
      image:
          'https://wsa2.pakwheels.com/assets/browse-more/car-ctg-1300cc-cars-98fe0baa7b3171f120ab5c0fa8a8cdc1.svg',
      name: "New Cars"),
  Category(
      image:
          'https://wsa4.pakwheels.com/assets/browse-more/car-ctg-1000cc-cars-c024e94ac3fb686ea9d6c75fa23510e3.svg',
      name: "Used Cars"),
  Category(
      image:
          'https://wsa4.pakwheels.com/assets/browse-more/car-ctg-cheap-819817fc19912941f195e6bbbf52f401.svg',
      name: "Cheap Cars"),
  Category(
      image: 'https://cache3.pakwheels.com/assets/brands/resized/missing.png',
      name: "Auto Parts"),
];
