class TDummyDataBrand {
  String name;
  String? items;
  String thumbnail;

  TDummyDataBrand({
    required this.name,
    this.items,
    required this.thumbnail,
  });
}

List<TDummyDataBrand> brandList = [
  TDummyDataBrand(
    name: 'Suzuki',
    items: '3345',
    thumbnail:
        'https://cache3.pakwheels.com/system/car_manufacturers/manufacturers/000/000/041/resized/Suzuki.png',
  ),
  TDummyDataBrand(
    name: 'MG',
    items: '1445',
    thumbnail:
        'https://cache1.pakwheels.com/system/car_manufacturers/manufacturers/000/000/060/resized/580b57fcd9996e24bc43c498.png',
  ),
  TDummyDataBrand(
    name: 'Hyundi',
    items: '345',
    thumbnail:
        'https://cache3.pakwheels.com/system/car_manufacturers/manufacturers/000/000/016/resized/hyundai.png',
  ),
  TDummyDataBrand(
    name: 'Toyota',
    items: '2345',
    thumbnail:
        'https://cache4.pakwheels.com/system/car_manufacturers/manufacturers/000/000/042/resized/Tyota.png',
  ),
  TDummyDataBrand(
    name: 'Honda',
    items: '345',
    thumbnail:
        'https://cache2.pakwheels.com/system/car_manufacturers/manufacturers/000/000/014/resized/Honda.png',
  ),
  TDummyDataBrand(
    name: 'Kia',
    items: '1345',
    thumbnail:
        'https://cache3.pakwheels.com/system/car_manufacturers/manufacturers/000/000/021/resized/kia.png',
  ),
];
