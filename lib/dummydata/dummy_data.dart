class TDummyData {
  String price;
  String name;
  String brand;
  String location;
  String model;
  String fueltype;
  String mileage;
  String factor;
  String register;
  String exterior;
  String assembly;
  String engine;
  String body;
  DateTime? lastupdate;
  String description;
  String thumbnail;
  List<String> images;

  TDummyData({
    required this.price,
    required this.name,
    required this.brand,
    required this.location,
    required this.model,
    required this.fueltype,
    required this.mileage,
    required this.factor,
    required this.register,
    required this.exterior,
    required this.assembly,
    required this.engine,
    required this.body,
    this.lastupdate,
    required this.description,
    required this.thumbnail,
    required this.images,
  });
}

List<TDummyData> newCarList = [
  TDummyData(
    name: 'Honda City ',
    price: '47.5',
    location: 'Karachi',
    model: '2024',
    images: [
      'https://cache4.pakwheels.com/system/car_generation_pictures/6533/original/Engine-bay_11zon.jpg?1659358941',
      'https://cache4.pakwheels.com/system/car_generation_pictures/5538/original/6cb96dce-f633-469b-8a4d-2792206b5d48.jfif?1628242360',
      'https://cache1.pakwheels.com/system/car_generation_pictures/6527/original/Rim_11zon.jpg?1659358938',
      'https://cache3.pakwheels.com/system/car_generation_pictures/6524/original/cockpit.jpg?1659357865'
    ],
    thumbnail:
        'https://cache1.pakwheels.com/system/car_generation_pictures/7389/original/Front-Side.jpg?1677579932',
    description:
        'The price of Honda City 2024 in Pakistan ranges from PKR 4,649,000 for the base variant 1.2L M/T to PKR 5,849,000 for the top of the line 1.5L ASPIRE CVT variant. These prices of Honda City in Pakistan are ex-factory.',
    fueltype: 'Petrol',
    mileage: '16',
    factor: 'Automatic',
    register: 'Punjab',
    exterior: 'white',
    assembly: 'Imported',
    engine: '1200',
    body: 'Honda',
    brand: 'Honda',
  ),
  TDummyData(
    name: 'Toyota Corolla',
    price: '57.5',
    location: 'Karachi',
    model: '2024',
    images: [
      'https://cache3.pakwheels.com/system/car_generation_pictures/7274/original/10.jpg?1672214130',
      'https://cache4.pakwheels.com/system/car_generation_pictures/7266/original/2.jpg?1672214127',
      'https://cache1.pakwheels.com/system/car_generation_pictures/7270/resized/6.jpg?1672214129',
      'https://cache4.pakwheels.com/system/car_generation_pictures/7278/original/14.jpg?1672214132'
    ],
    thumbnail:
        'https://cache1.pakwheels.com/system/car_generation_pictures/5361/original/Corolla-X-Cars-Cropped-Pictures-for-Website.jpg?1606903674',
    description:
        'The price of Honda City 2024 in Pakistan ranges from PKR 4,649,000 for the base variant 1.2L M/T to PKR 5,849,000 for the top of the line 1.5L ASPIRE CVT variant. These prices of Honda City in Pakistan are ex-factory.',
    fueltype: 'Petrol',
    mileage: '16',
    factor: 'Automatic',
    register: 'Punjab',
    exterior: 'white',
    assembly: 'Imported',
    engine: '1200',
    body: 'Honda',
    brand: 'Honda',
  ),
  TDummyData(
    name: 'KIA Sportage',
    price: '97.5',
    location: 'Karachi',
    model: '2024',
    images: [
      'https://cache2.pakwheels.com/system/car_generation_pictures/7434/original/Front-Side.jpg?1677672521',
      'https://cache2.pakwheels.com/system/car_generation_pictures/6664/original/Engine.jpg?1661325718',
      'https://cache3.pakwheels.com/system/car_generation_pictures/7436/resized/Rear-Side.jpg?1677672522',
      'https://cache3.pakwheels.com/system/car_generation_pictures/6665/original/Cockpit.jpg?1661325718'
    ],
    thumbnail:
        'https://cache1.pakwheels.com/system/car_generation_pictures/7698/original/Kia-LE-White.jpg?1710401607',
    description:
        'The price of Honda City 2024 in Pakistan ranges from PKR 4,649,000 for the base variant 1.2L M/T to PKR 5,849,000 for the top of the line 1.5L ASPIRE CVT variant. These prices of Honda City in Pakistan are ex-factory.',
    fueltype: 'Petrol',
    mileage: '16',
    factor: 'Automatic',
    register: 'Punjab',
    exterior: 'white',
    assembly: 'Imported',
    engine: '2000',
    body: 'KIA',
    brand: 'KIA',
  ),
  TDummyData(
    name: 'Suzuki Alto',
    price: '30.5',
    location: 'Karachi',
    model: '2024',
    images: [
      'https://cache1.pakwheels.com/system/car_generation_pictures/7295/original/Front.jpg?1677135197',
      'https://cache2.pakwheels.com/system/car_generation_pictures/7296/original/Side.jpg?1677135197',
      'https://cache4.pakwheels.com/system/car_generation_pictures/7297/original/Rear-Side.jpg?1677135198',
      'https://cache1.pakwheels.com/system/car_generation_pictures/7298/original/Rear.jpg?1677135198'
    ],
    thumbnail:
        'https://cache4.pakwheels.com/system/car_generation_pictures/6013/original/Suzuki_Alto_-_PNG.png?1635945100',
    description:
        'The price of Suzuki Alto 2024 in Pakistan ranges from PKR 2,331,000 for the base variant VX to PKR 3,045,000 for the top of the line VXL AGS variant. These prices of Suzuki Alto in Pakistan are ex-factory.',
    fueltype: 'Petrol',
    mileage: '68',
    factor: 'Automatic',
    register: 'Punjab',
    exterior: 'white',
    assembly: 'Imported',
    engine: '658',
    body: 'Suzuki Alto',
    brand: 'Suzuki',
  ),
  TDummyData(
    name: 'Suzuki Cultus ',
    price: '38.6',
    location: 'punjab',
    model: '2024',
    images: [
      'https://cache2.pakwheels.com/system/car_generation_pictures/7302/original/Front.jpg?1677135945',
      'https://cache1.pakwheels.com/system/car_generation_pictures/7303/original/Front-Side.jpg?1677135946',
      'https://cache2.pakwheels.com/system/car_generation_pictures/7304/original/Rear.jpg?1677135946',
      'https://cache2.pakwheels.com/system/car_generation_pictures/6563/original/SideProfile.jpg?1659512774'
    ],
    thumbnail:
        'https://cache4.pakwheels.com/system/car_generation_pictures/6014/original/Suzuki_Cultus_-_PNG.png?1635945515',
    description:
        'The price of Suzuki Alto 2024 in Pakistan ranges from PKR 2,331,000 for the base variant VX to PKR 3,045,000 for the top of the line VXL AGS variant. These prices of Suzuki Alto in Pakistan are ex-factory.',
    fueltype: 'Petrol',
    mileage: '68',
    factor: 'Automatic',
    register: 'Punjab',
    exterior: 'white',
    assembly: 'Imported',
    engine: '658',
    body: 'Suzuki Alto',
    brand: 'Suzuki',
  ),
  TDummyData(
    name: 'Suzuki Wagon R',
    price: '32.6',
    location: 'punjab',
    model: '2024',
    images: [
      'https://cache3.pakwheels.com/system/car_generation_pictures/7307/original/Front.jpg?1677136694',
      'https://cache3.pakwheels.com/system/car_generation_pictures/7308/resized/Front-Side.jpg?1677136695',
      'https://cache4.pakwheels.com/system/car_generation_pictures/6556/original/SideProfile.jpg?1659442412',
      'https://cache2.pakwheels.com/system/car_generation_pictures/7309/resized/Rear.jpg?1677136695'
    ],
    thumbnail:
        'https://cache4.pakwheels.com/system/car_generation_pictures/7314/original/Wagon-R.jpg?1677147187',
    description:
        'The price of Suzuki Alto 2024 in Pakistan ranges from PKR 2,331,000 for the base variant VX to PKR 3,045,000 for the top of the line VXL AGS variant. These prices of Suzuki Alto in Pakistan are ex-factory.',
    fueltype: 'Petrol',
    mileage: '68',
    factor: 'Automatic',
    register: 'Punjab',
    exterior: 'white',
    assembly: 'Imported',
    engine: '658',
    body: 'Suzuki Alto',
    brand: 'Suzuki',
  ),
  TDummyData(
    name: 'Toyota Yaris',
    price: '42.6',
    location: 'punjab',
    model: '2024',
    images: [
      'https://cache3.pakwheels.com/system/car_generation_pictures/7315/resized/Front.jpg?1677151521',
      'https://cache3.pakwheels.com/system/car_generation_pictures/7316/resized/Front-Side.jpg?1677151522',
      'https://cache3.pakwheels.com/system/car_generation_pictures/5135/original/WhatsApp_Image_2020-03-20_at_1.01.11_AM.jpeg?1584691090',
      'https://cache3.pakwheels.com/system/car_generation_pictures/6497/resized/Rims.jpg?1659002396'
    ],
    thumbnail:
        'https://cache2.pakwheels.com/system/car_generation_pictures/6392/original/Toyota_Yaris_Front_Right_Angled.jpg?1650541837',
    description:
        'The price of Toyota Yaris 2024 in Pakistan ranges from PKR 4,326,000 for the base variant GLI MT 1.3 to PKR 5,849,000 for the top of the line AERO CVT 1.5 variant. These prices of Toyota Yaris in Pakistan are ex-factory.',
    fueltype: 'Petrol',
    mileage: '16',
    factor: 'Automatic',
    register: 'Punjab',
    exterior: 'white',
    assembly: 'Imported',
    engine: '1400',
    body: 'Toyota Yaris',
    brand: 'Toyota',
  ),
  TDummyData(
    name: 'Suzuki Swift ',
    price: '43.6',
    location: 'punjab',
    model: '2024',
    images: [
      'https://cache4.pakwheels.com/system/car_generation_pictures/7311/original/White-Base-PS.jpg?1677147105',
      'https://cache2.pakwheels.com/system/car_generation_pictures/6572/original/Engine.jpg?1659521773',
      'https://cache4.pakwheels.com/system/car_generation_pictures/6578/original/Steering.jpg?1659521776',
      'https://cache2.pakwheels.com/system/car_generation_pictures/6573/original/White-Base-PS.jpg?1659521773',
    ],
    thumbnail:
        'https://cache1.pakwheels.com/system/car_generation_pictures/7441/original/SWIFT.jpg?1677750438',
    description:
        'The price of Suzuki Alto 2024 in Pakistan ranges from PKR 2,331,000 for the base variant VX to PKR 3,045,000 for the top of the line VXL AGS variant. These prices of Suzuki Alto in Pakistan are ex-factory.',
    fueltype: 'Petrol',
    mileage: '68',
    factor: 'Automatic',
    register: 'Punjab',
    exterior: 'white',
    assembly: 'Imported',
    engine: '658',
    body: 'Suzuki Swift',
    brand: 'Suzuki',
  ),
];

List<TDummyData> usedCarList = [
  TDummyData(
    name: 'Honda City ',
    price: '47.5',
    location: 'Karachi',
    model: '2024',
    images: [
      'https://cache4.pakwheels.com/system/car_generation_pictures/6533/original/Engine-bay_11zon.jpg?1659358941',
      'https://cache4.pakwheels.com/system/car_generation_pictures/5538/original/6cb96dce-f633-469b-8a4d-2792206b5d48.jfif?1628242360',
      'https://cache1.pakwheels.com/system/car_generation_pictures/6527/original/Rim_11zon.jpg?1659358938',
      'https://cache3.pakwheels.com/system/car_generation_pictures/6524/original/cockpit.jpg?1659357865'
    ],
    thumbnail:
        'https://cache1.pakwheels.com/system/car_generation_pictures/7389/original/Front-Side.jpg?1677579932',
    description:
        'The price of Honda City 2024 in Pakistan ranges from PKR 4,649,000 for the base variant 1.2L M/T to PKR 5,849,000 for the top of the line 1.5L ASPIRE CVT variant. These prices of Honda City in Pakistan are ex-factory.',
    fueltype: 'Petrol',
    mileage: '16',
    factor: 'Automatic',
    register: 'Punjab',
    exterior: 'white',
    assembly: 'Imported',
    engine: '1200',
    body: 'Honda',
    brand: 'Honda',
  ),
  TDummyData(
    name: 'Toyota Corolla',
    price: '57.5',
    location: 'Karachi',
    model: '2024',
    images: [
      'https://cache3.pakwheels.com/system/car_generation_pictures/7274/original/10.jpg?1672214130',
      'https://cache4.pakwheels.com/system/car_generation_pictures/7266/original/2.jpg?1672214127',
      'https://cache1.pakwheels.com/system/car_generation_pictures/7270/resized/6.jpg?1672214129',
      'https://cache4.pakwheels.com/system/car_generation_pictures/7278/original/14.jpg?1672214132'
    ],
    thumbnail:
        'https://cache1.pakwheels.com/system/car_generation_pictures/5361/original/Corolla-X-Cars-Cropped-Pictures-for-Website.jpg?1606903674',
    description:
        'The price of Honda City 2024 in Pakistan ranges from PKR 4,649,000 for the base variant 1.2L M/T to PKR 5,849,000 for the top of the line 1.5L ASPIRE CVT variant. These prices of Honda City in Pakistan are ex-factory.',
    fueltype: 'Petrol',
    mileage: '16',
    factor: 'Automatic',
    register: 'Punjab',
    exterior: 'white',
    assembly: 'Imported',
    engine: '1200',
    body: 'Honda',
    brand: 'Honda',
  ),
  TDummyData(
    name: 'KIA Sportage',
    price: '97.5',
    location: 'Karachi',
    model: '2024',
    images: [
      'https://cache2.pakwheels.com/system/car_generation_pictures/7434/original/Front-Side.jpg?1677672521',
      'https://cache2.pakwheels.com/system/car_generation_pictures/6664/original/Engine.jpg?1661325718',
      'https://cache3.pakwheels.com/system/car_generation_pictures/7436/resized/Rear-Side.jpg?1677672522',
      'https://cache3.pakwheels.com/system/car_generation_pictures/6665/original/Cockpit.jpg?1661325718'
    ],
    thumbnail:
        'https://cache1.pakwheels.com/system/car_generation_pictures/7698/original/Kia-LE-White.jpg?1710401607',
    description:
        'The price of Honda City 2024 in Pakistan ranges from PKR 4,649,000 for the base variant 1.2L M/T to PKR 5,849,000 for the top of the line 1.5L ASPIRE CVT variant. These prices of Honda City in Pakistan are ex-factory.',
    fueltype: 'Petrol',
    mileage: '16',
    factor: 'Automatic',
    register: 'Punjab',
    exterior: 'white',
    assembly: 'Imported',
    engine: '2000',
    body: 'KIA',
    brand: 'KIA',
  ),
  TDummyData(
    name: 'Suzuki Alto',
    price: '30.5',
    location: 'Karachi',
    model: '2024',
    images: [
      'https://cache1.pakwheels.com/system/car_generation_pictures/7295/original/Front.jpg?1677135197',
      'https://cache2.pakwheels.com/system/car_generation_pictures/7296/original/Side.jpg?1677135197',
      'https://cache4.pakwheels.com/system/car_generation_pictures/7297/original/Rear-Side.jpg?1677135198',
      'https://cache1.pakwheels.com/system/car_generation_pictures/7298/original/Rear.jpg?1677135198'
    ],
    thumbnail:
        'https://cache4.pakwheels.com/system/car_generation_pictures/6013/original/Suzuki_Alto_-_PNG.png?1635945100',
    description:
        'The price of Suzuki Alto 2024 in Pakistan ranges from PKR 2,331,000 for the base variant VX to PKR 3,045,000 for the top of the line VXL AGS variant. These prices of Suzuki Alto in Pakistan are ex-factory.',
    fueltype: 'Petrol',
    mileage: '68',
    factor: 'Automatic',
    register: 'Punjab',
    exterior: 'white',
    assembly: 'Imported',
    engine: '658',
    body: 'Suzuki Alto',
    brand: 'Suzuki',
  ),
];

List<TDummyData> cheapCarList = [
  TDummyData(
    name: 'Honda City ',
    price: '47.5',
    location: 'Karachi',
    model: '2024',
    images: [
      'https://cache4.pakwheels.com/system/car_generation_pictures/6533/original/Engine-bay_11zon.jpg?1659358941',
      'https://cache4.pakwheels.com/system/car_generation_pictures/5538/original/6cb96dce-f633-469b-8a4d-2792206b5d48.jfif?1628242360',
      'https://cache1.pakwheels.com/system/car_generation_pictures/6527/original/Rim_11zon.jpg?1659358938',
      'https://cache3.pakwheels.com/system/car_generation_pictures/6524/original/cockpit.jpg?1659357865'
    ],
    thumbnail:
        'https://cache1.pakwheels.com/system/car_generation_pictures/7389/original/Front-Side.jpg?1677579932',
    description:
        'The price of Honda City 2024 in Pakistan ranges from PKR 4,649,000 for the base variant 1.2L M/T to PKR 5,849,000 for the top of the line 1.5L ASPIRE CVT variant. These prices of Honda City in Pakistan are ex-factory.',
    fueltype: 'Petrol',
    mileage: '16',
    factor: 'Automatic',
    register: 'Punjab',
    exterior: 'white',
    assembly: 'Imported',
    engine: '1200',
    body: 'Honda',
    brand: 'Honda',
  ),
  TDummyData(
    name: 'Toyota Corolla',
    price: '57.5',
    location: 'Karachi',
    model: '2024',
    images: [
      'https://cache3.pakwheels.com/system/car_generation_pictures/7274/original/10.jpg?1672214130',
      'https://cache4.pakwheels.com/system/car_generation_pictures/7266/original/2.jpg?1672214127',
      'https://cache1.pakwheels.com/system/car_generation_pictures/7270/resized/6.jpg?1672214129',
      'https://cache4.pakwheels.com/system/car_generation_pictures/7278/original/14.jpg?1672214132'
    ],
    thumbnail:
        'https://cache1.pakwheels.com/system/car_generation_pictures/5361/original/Corolla-X-Cars-Cropped-Pictures-for-Website.jpg?1606903674',
    description:
        'The price of Honda City 2024 in Pakistan ranges from PKR 4,649,000 for the base variant 1.2L M/T to PKR 5,849,000 for the top of the line 1.5L ASPIRE CVT variant. These prices of Honda City in Pakistan are ex-factory.',
    fueltype: 'Petrol',
    mileage: '16',
    factor: 'Automatic',
    register: 'Punjab',
    exterior: 'white',
    assembly: 'Imported',
    engine: '1200',
    body: 'Honda',
    brand: 'Honda',
  ),
  TDummyData(
    name: 'KIA Sportage',
    price: '97.5',
    location: 'Karachi',
    model: '2024',
    images: [
      'https://cache2.pakwheels.com/system/car_generation_pictures/7434/original/Front-Side.jpg?1677672521',
      'https://cache2.pakwheels.com/system/car_generation_pictures/6664/original/Engine.jpg?1661325718',
      'https://cache3.pakwheels.com/system/car_generation_pictures/7436/resized/Rear-Side.jpg?1677672522',
      'https://cache3.pakwheels.com/system/car_generation_pictures/6665/original/Cockpit.jpg?1661325718'
    ],
    thumbnail:
        'https://cache1.pakwheels.com/system/car_generation_pictures/7698/original/Kia-LE-White.jpg?1710401607',
    description:
        'The price of Honda City 2024 in Pakistan ranges from PKR 4,649,000 for the base variant 1.2L M/T to PKR 5,849,000 for the top of the line 1.5L ASPIRE CVT variant. These prices of Honda City in Pakistan are ex-factory.',
    fueltype: 'Petrol',
    mileage: '16',
    factor: 'Automatic',
    register: 'Punjab',
    exterior: 'white',
    assembly: 'Imported',
    engine: '2000',
    body: 'KIA',
    brand: 'KIA',
  ),
  TDummyData(
    name: 'Suzuki Alto',
    price: '30.5',
    location: 'Karachi',
    model: '2024',
    images: [
      'https://cache1.pakwheels.com/system/car_generation_pictures/7295/original/Front.jpg?1677135197',
      'https://cache2.pakwheels.com/system/car_generation_pictures/7296/original/Side.jpg?1677135197',
      'https://cache4.pakwheels.com/system/car_generation_pictures/7297/original/Rear-Side.jpg?1677135198',
      'https://cache1.pakwheels.com/system/car_generation_pictures/7298/original/Rear.jpg?1677135198'
    ],
    thumbnail:
        'https://cache4.pakwheels.com/system/car_generation_pictures/6013/original/Suzuki_Alto_-_PNG.png?1635945100',
    description:
        'The price of Suzuki Alto 2024 in Pakistan ranges from PKR 2,331,000 for the base variant VX to PKR 3,045,000 for the top of the line VXL AGS variant. These prices of Suzuki Alto in Pakistan are ex-factory.',
    fueltype: 'Petrol',
    mileage: '68',
    factor: 'Automatic',
    register: 'Punjab',
    exterior: 'white',
    assembly: 'Imported',
    engine: '658',
    body: 'Suzuki Alto',
    brand: 'Suzuki',
  ),
];

List<TDummyData> mgCarList = [
  TDummyData(
    name: 'Honda City ',
    price: '47.5',
    location: 'Karachi',
    model: '2024',
    images: [
      'https://cache4.pakwheels.com/system/car_generation_pictures/6533/original/Engine-bay_11zon.jpg?1659358941',
      'https://cache4.pakwheels.com/system/car_generation_pictures/5538/original/6cb96dce-f633-469b-8a4d-2792206b5d48.jfif?1628242360',
      'https://cache1.pakwheels.com/system/car_generation_pictures/6527/original/Rim_11zon.jpg?1659358938',
      'https://cache3.pakwheels.com/system/car_generation_pictures/6524/original/cockpit.jpg?1659357865'
    ],
    thumbnail:
        'https://cache1.pakwheels.com/system/car_generation_pictures/7389/original/Front-Side.jpg?1677579932',
    description:
        'The price of Honda City 2024 in Pakistan ranges from PKR 4,649,000 for the base variant 1.2L M/T to PKR 5,849,000 for the top of the line 1.5L ASPIRE CVT variant. These prices of Honda City in Pakistan are ex-factory.',
    fueltype: 'Petrol',
    mileage: '16',
    factor: 'Automatic',
    register: 'Punjab',
    exterior: 'white',
    assembly: 'Imported',
    engine: '1200',
    body: 'Honda',
    brand: 'Honda',
  ),
  TDummyData(
    name: 'Toyota Corolla',
    price: '57.5',
    location: 'Karachi',
    model: '2024',
    images: [
      'https://cache3.pakwheels.com/system/car_generation_pictures/7274/original/10.jpg?1672214130',
      'https://cache4.pakwheels.com/system/car_generation_pictures/7266/original/2.jpg?1672214127',
      'https://cache1.pakwheels.com/system/car_generation_pictures/7270/resized/6.jpg?1672214129',
      'https://cache4.pakwheels.com/system/car_generation_pictures/7278/original/14.jpg?1672214132'
    ],
    thumbnail:
        'https://cache1.pakwheels.com/system/car_generation_pictures/5361/original/Corolla-X-Cars-Cropped-Pictures-for-Website.jpg?1606903674',
    description:
        'The price of Honda City 2024 in Pakistan ranges from PKR 4,649,000 for the base variant 1.2L M/T to PKR 5,849,000 for the top of the line 1.5L ASPIRE CVT variant. These prices of Honda City in Pakistan are ex-factory.',
    fueltype: 'Petrol',
    mileage: '16',
    factor: 'Automatic',
    register: 'Punjab',
    exterior: 'white',
    assembly: 'Imported',
    engine: '1200',
    body: 'Honda',
    brand: 'Honda',
  ),
  TDummyData(
    name: 'KIA Sportage',
    price: '97.5',
    location: 'Karachi',
    model: '2024',
    images: [
      'https://cache2.pakwheels.com/system/car_generation_pictures/7434/original/Front-Side.jpg?1677672521',
      'https://cache2.pakwheels.com/system/car_generation_pictures/6664/original/Engine.jpg?1661325718',
      'https://cache3.pakwheels.com/system/car_generation_pictures/7436/resized/Rear-Side.jpg?1677672522',
      'https://cache3.pakwheels.com/system/car_generation_pictures/6665/original/Cockpit.jpg?1661325718'
    ],
    thumbnail:
        'https://cache1.pakwheels.com/system/car_generation_pictures/7698/original/Kia-LE-White.jpg?1710401607',
    description:
        'The price of Honda City 2024 in Pakistan ranges from PKR 4,649,000 for the base variant 1.2L M/T to PKR 5,849,000 for the top of the line 1.5L ASPIRE CVT variant. These prices of Honda City in Pakistan are ex-factory.',
    fueltype: 'Petrol',
    mileage: '16',
    factor: 'Automatic',
    register: 'Punjab',
    exterior: 'white',
    assembly: 'Imported',
    engine: '2000',
    body: 'KIA',
    brand: 'KIA',
  ),
  TDummyData(
    name: 'Suzuki Alto',
    price: '30.5',
    location: 'Karachi',
    model: '2024',
    images: [
      'https://cache1.pakwheels.com/system/car_generation_pictures/7295/original/Front.jpg?1677135197',
      'https://cache2.pakwheels.com/system/car_generation_pictures/7296/original/Side.jpg?1677135197',
      'https://cache4.pakwheels.com/system/car_generation_pictures/7297/original/Rear-Side.jpg?1677135198',
      'https://cache1.pakwheels.com/system/car_generation_pictures/7298/original/Rear.jpg?1677135198'
    ],
    thumbnail:
        'https://cache4.pakwheels.com/system/car_generation_pictures/6013/original/Suzuki_Alto_-_PNG.png?1635945100',
    description:
        'The price of Suzuki Alto 2024 in Pakistan ranges from PKR 2,331,000 for the base variant VX to PKR 3,045,000 for the top of the line VXL AGS variant. These prices of Suzuki Alto in Pakistan are ex-factory.',
    fueltype: 'Petrol',
    mileage: '68',
    factor: 'Automatic',
    register: 'Punjab',
    exterior: 'white',
    assembly: 'Imported',
    engine: '658',
    body: 'Suzuki Alto',
    brand: 'Suzuki',
  ),
];

List<TDummyData> hondaCarList = [
  TDummyData(
    name: 'Honda City ',
    price: '47.5',
    location: 'Karachi',
    model: '2024',
    images: [
      'https://cache4.pakwheels.com/system/car_generation_pictures/6533/original/Engine-bay_11zon.jpg?1659358941',
      'https://cache4.pakwheels.com/system/car_generation_pictures/5538/original/6cb96dce-f633-469b-8a4d-2792206b5d48.jfif?1628242360',
      'https://cache1.pakwheels.com/system/car_generation_pictures/6527/original/Rim_11zon.jpg?1659358938',
      'https://cache3.pakwheels.com/system/car_generation_pictures/6524/original/cockpit.jpg?1659357865'
    ],
    thumbnail:
        'https://cache1.pakwheels.com/system/car_generation_pictures/7389/original/Front-Side.jpg?1677579932',
    description:
        'The price of Honda City 2024 in Pakistan ranges from PKR 4,649,000 for the base variant 1.2L M/T to PKR 5,849,000 for the top of the line 1.5L ASPIRE CVT variant. These prices of Honda City in Pakistan are ex-factory.',
    fueltype: 'Petrol',
    mileage: '16',
    factor: 'Automatic',
    register: 'Punjab',
    exterior: 'white',
    assembly: 'Imported',
    engine: '1200',
    body: 'Honda',
    brand: 'Honda',
  ),
  TDummyData(
    name: 'Honda City ',
    price: '47.5',
    location: 'Karachi',
    model: '2024',
    images: [
      'https://cache4.pakwheels.com/system/car_generation_pictures/6533/original/Engine-bay_11zon.jpg?1659358941',
      'https://cache4.pakwheels.com/system/car_generation_pictures/5538/original/6cb96dce-f633-469b-8a4d-2792206b5d48.jfif?1628242360',
      'https://cache1.pakwheels.com/system/car_generation_pictures/6527/original/Rim_11zon.jpg?1659358938',
      'https://cache3.pakwheels.com/system/car_generation_pictures/6524/original/cockpit.jpg?1659357865'
    ],
    thumbnail:
        'https://cache1.pakwheels.com/system/car_generation_pictures/7389/original/Front-Side.jpg?1677579932',
    description:
        'The price of Honda City 2024 in Pakistan ranges from PKR 4,649,000 for the base variant 1.2L M/T to PKR 5,849,000 for the top of the line 1.5L ASPIRE CVT variant. These prices of Honda City in Pakistan are ex-factory.',
    fueltype: 'Petrol',
    mileage: '16',
    factor: 'Automatic',
    register: 'Punjab',
    exterior: 'white',
    assembly: 'Imported',
    engine: '1200',
    body: 'Honda',
    brand: 'Honda',
  ),
  TDummyData(
    name: 'Honda City ',
    price: '47.5',
    location: 'Karachi',
    model: '2024',
    images: [
      'https://cache4.pakwheels.com/system/car_generation_pictures/6533/original/Engine-bay_11zon.jpg?1659358941',
      'https://cache4.pakwheels.com/system/car_generation_pictures/5538/original/6cb96dce-f633-469b-8a4d-2792206b5d48.jfif?1628242360',
      'https://cache1.pakwheels.com/system/car_generation_pictures/6527/original/Rim_11zon.jpg?1659358938',
      'https://cache3.pakwheels.com/system/car_generation_pictures/6524/original/cockpit.jpg?1659357865'
    ],
    thumbnail:
        'https://cache1.pakwheels.com/system/car_generation_pictures/7389/original/Front-Side.jpg?1677579932',
    description:
        'The price of Honda City 2024 in Pakistan ranges from PKR 4,649,000 for the base variant 1.2L M/T to PKR 5,849,000 for the top of the line 1.5L ASPIRE CVT variant. These prices of Honda City in Pakistan are ex-factory.',
    fueltype: 'Petrol',
    mileage: '16',
    factor: 'Automatic',
    register: 'Punjab',
    exterior: 'white',
    assembly: 'Imported',
    engine: '1200',
    body: 'Honda',
    brand: 'Honda',
  ),
];

List<TDummyData> toyotaCarList = [
  TDummyData(
    name: 'Honda City ',
    price: '47.5',
    location: 'Karachi',
    model: '2024',
    images: [
      'https://cache4.pakwheels.com/system/car_generation_pictures/6533/original/Engine-bay_11zon.jpg?1659358941',
      'https://cache4.pakwheels.com/system/car_generation_pictures/5538/original/6cb96dce-f633-469b-8a4d-2792206b5d48.jfif?1628242360',
      'https://cache1.pakwheels.com/system/car_generation_pictures/6527/original/Rim_11zon.jpg?1659358938',
      'https://cache3.pakwheels.com/system/car_generation_pictures/6524/original/cockpit.jpg?1659357865'
    ],
    thumbnail:
        'https://cache1.pakwheels.com/system/car_generation_pictures/7389/original/Front-Side.jpg?1677579932',
    description:
        'The price of Honda City 2024 in Pakistan ranges from PKR 4,649,000 for the base variant 1.2L M/T to PKR 5,849,000 for the top of the line 1.5L ASPIRE CVT variant. These prices of Honda City in Pakistan are ex-factory.',
    fueltype: 'Petrol',
    mileage: '16',
    factor: 'Automatic',
    register: 'Punjab',
    exterior: 'white',
    assembly: 'Imported',
    engine: '1200',
    body: 'Honda',
    brand: 'Honda',
  ),
  TDummyData(
    name: 'Honda City ',
    price: '47.5',
    location: 'Karachi',
    model: '2024',
    images: [
      'https://cache4.pakwheels.com/system/car_generation_pictures/6533/original/Engine-bay_11zon.jpg?1659358941',
      'https://cache4.pakwheels.com/system/car_generation_pictures/5538/original/6cb96dce-f633-469b-8a4d-2792206b5d48.jfif?1628242360',
      'https://cache1.pakwheels.com/system/car_generation_pictures/6527/original/Rim_11zon.jpg?1659358938',
      'https://cache3.pakwheels.com/system/car_generation_pictures/6524/original/cockpit.jpg?1659357865'
    ],
    thumbnail:
        'https://cache1.pakwheels.com/system/car_generation_pictures/7389/original/Front-Side.jpg?1677579932',
    description:
        'The price of Honda City 2024 in Pakistan ranges from PKR 4,649,000 for the base variant 1.2L M/T to PKR 5,849,000 for the top of the line 1.5L ASPIRE CVT variant. These prices of Honda City in Pakistan are ex-factory.',
    fueltype: 'Petrol',
    mileage: '16',
    factor: 'Automatic',
    register: 'Punjab',
    exterior: 'white',
    assembly: 'Imported',
    engine: '1200',
    body: 'Honda',
    brand: 'Honda',
  ),
  TDummyData(
    name: 'Honda City ',
    price: '47.5',
    location: 'Karachi',
    model: '2024',
    images: [
      'https://cache4.pakwheels.com/system/car_generation_pictures/6533/original/Engine-bay_11zon.jpg?1659358941',
      'https://cache4.pakwheels.com/system/car_generation_pictures/5538/original/6cb96dce-f633-469b-8a4d-2792206b5d48.jfif?1628242360',
      'https://cache1.pakwheels.com/system/car_generation_pictures/6527/original/Rim_11zon.jpg?1659358938',
      'https://cache3.pakwheels.com/system/car_generation_pictures/6524/original/cockpit.jpg?1659357865'
    ],
    thumbnail:
        'https://cache1.pakwheels.com/system/car_generation_pictures/7389/original/Front-Side.jpg?1677579932',
    description:
        'The price of Honda City 2024 in Pakistan ranges from PKR 4,649,000 for the base variant 1.2L M/T to PKR 5,849,000 for the top of the line 1.5L ASPIRE CVT variant. These prices of Honda City in Pakistan are ex-factory.',
    fueltype: 'Petrol',
    mileage: '16',
    factor: 'Automatic',
    register: 'Punjab',
    exterior: 'white',
    assembly: 'Imported',
    engine: '1200',
    body: 'Honda',
    brand: 'Honda',
  ),
];

List<TDummyData> kiaCarList = [
  TDummyData(
    name: 'Honda City ',
    price: '47.5',
    location: 'Karachi',
    model: '2024',
    images: [
      'https://cache4.pakwheels.com/system/car_generation_pictures/6533/original/Engine-bay_11zon.jpg?1659358941',
      'https://cache4.pakwheels.com/system/car_generation_pictures/5538/original/6cb96dce-f633-469b-8a4d-2792206b5d48.jfif?1628242360',
      'https://cache1.pakwheels.com/system/car_generation_pictures/6527/original/Rim_11zon.jpg?1659358938',
      'https://cache3.pakwheels.com/system/car_generation_pictures/6524/original/cockpit.jpg?1659357865'
    ],
    thumbnail:
        'https://cache1.pakwheels.com/system/car_generation_pictures/7389/original/Front-Side.jpg?1677579932',
    description:
        'The price of Honda City 2024 in Pakistan ranges from PKR 4,649,000 for the base variant 1.2L M/T to PKR 5,849,000 for the top of the line 1.5L ASPIRE CVT variant. These prices of Honda City in Pakistan are ex-factory.',
    fueltype: 'Petrol',
    mileage: '16',
    factor: 'Automatic',
    register: 'Punjab',
    exterior: 'white',
    assembly: 'Imported',
    engine: '1200',
    body: 'Honda',
    brand: 'Honda',
  ),
  TDummyData(
    name: 'Honda City ',
    price: '47.5',
    location: 'Karachi',
    model: '2024',
    images: [
      'https://cache4.pakwheels.com/system/car_generation_pictures/6533/original/Engine-bay_11zon.jpg?1659358941',
      'https://cache4.pakwheels.com/system/car_generation_pictures/5538/original/6cb96dce-f633-469b-8a4d-2792206b5d48.jfif?1628242360',
      'https://cache1.pakwheels.com/system/car_generation_pictures/6527/original/Rim_11zon.jpg?1659358938',
      'https://cache3.pakwheels.com/system/car_generation_pictures/6524/original/cockpit.jpg?1659357865'
    ],
    thumbnail:
        'https://cache1.pakwheels.com/system/car_generation_pictures/7389/original/Front-Side.jpg?1677579932',
    description:
        'The price of Honda City 2024 in Pakistan ranges from PKR 4,649,000 for the base variant 1.2L M/T to PKR 5,849,000 for the top of the line 1.5L ASPIRE CVT variant. These prices of Honda City in Pakistan are ex-factory.',
    fueltype: 'Petrol',
    mileage: '16',
    factor: 'Automatic',
    register: 'Punjab',
    exterior: 'white',
    assembly: 'Imported',
    engine: '1200',
    body: 'Honda',
    brand: 'Honda',
  ),
  TDummyData(
    name: 'Honda City ',
    price: '47.5',
    location: 'Karachi',
    model: '2024',
    images: [
      'https://cache4.pakwheels.com/system/car_generation_pictures/6533/original/Engine-bay_11zon.jpg?1659358941',
      'https://cache4.pakwheels.com/system/car_generation_pictures/5538/original/6cb96dce-f633-469b-8a4d-2792206b5d48.jfif?1628242360',
      'https://cache1.pakwheels.com/system/car_generation_pictures/6527/original/Rim_11zon.jpg?1659358938',
      'https://cache3.pakwheels.com/system/car_generation_pictures/6524/original/cockpit.jpg?1659357865'
    ],
    thumbnail:
        'https://cache1.pakwheels.com/system/car_generation_pictures/7389/original/Front-Side.jpg?1677579932',
    description:
        'The price of Honda City 2024 in Pakistan ranges from PKR 4,649,000 for the base variant 1.2L M/T to PKR 5,849,000 for the top of the line 1.5L ASPIRE CVT variant. These prices of Honda City in Pakistan are ex-factory.',
    fueltype: 'Petrol',
    mileage: '16',
    factor: 'Automatic',
    register: 'Punjab',
    exterior: 'white',
    assembly: 'Imported',
    engine: '1200',
    body: 'Honda',
    brand: 'Honda',
  ),
];

List<TDummyData> suzukiCarList = [
  TDummyData(
    name: 'Honda City ',
    price: '47.5',
    location: 'Karachi',
    model: '2024',
    images: [
      'https://cache4.pakwheels.com/system/car_generation_pictures/6533/original/Engine-bay_11zon.jpg?1659358941',
      'https://cache4.pakwheels.com/system/car_generation_pictures/5538/original/6cb96dce-f633-469b-8a4d-2792206b5d48.jfif?1628242360',
      'https://cache1.pakwheels.com/system/car_generation_pictures/6527/original/Rim_11zon.jpg?1659358938',
      'https://cache3.pakwheels.com/system/car_generation_pictures/6524/original/cockpit.jpg?1659357865'
    ],
    thumbnail:
        'https://cache1.pakwheels.com/system/car_generation_pictures/7389/original/Front-Side.jpg?1677579932',
    description:
        'The price of Honda City 2024 in Pakistan ranges from PKR 4,649,000 for the base variant 1.2L M/T to PKR 5,849,000 for the top of the line 1.5L ASPIRE CVT variant. These prices of Honda City in Pakistan are ex-factory.',
    fueltype: 'Petrol',
    mileage: '16',
    factor: 'Automatic',
    register: 'Punjab',
    exterior: 'white',
    assembly: 'Imported',
    engine: '1200',
    body: 'Honda',
    brand: 'Honda',
  ),
  TDummyData(
    name: 'Toyota Corolla',
    price: '57.5',
    location: 'Karachi',
    model: '2024',
    images: [
      'https://cache3.pakwheels.com/system/car_generation_pictures/7274/original/10.jpg?1672214130',
      'https://cache4.pakwheels.com/system/car_generation_pictures/7266/original/2.jpg?1672214127',
      'https://cache1.pakwheels.com/system/car_generation_pictures/7270/resized/6.jpg?1672214129',
      'https://cache4.pakwheels.com/system/car_generation_pictures/7278/original/14.jpg?1672214132'
    ],
    thumbnail:
        'https://cache1.pakwheels.com/system/car_generation_pictures/5361/original/Corolla-X-Cars-Cropped-Pictures-for-Website.jpg?1606903674',
    description:
        'The price of Honda City 2024 in Pakistan ranges from PKR 4,649,000 for the base variant 1.2L M/T to PKR 5,849,000 for the top of the line 1.5L ASPIRE CVT variant. These prices of Honda City in Pakistan are ex-factory.',
    fueltype: 'Petrol',
    mileage: '16',
    factor: 'Automatic',
    register: 'Punjab',
    exterior: 'white',
    assembly: 'Imported',
    engine: '1200',
    body: 'Honda',
    brand: 'Honda',
  ),
  TDummyData(
    name: 'KIA Sportage',
    price: '97.5',
    location: 'Karachi',
    model: '2024',
    images: [
      'https://cache2.pakwheels.com/system/car_generation_pictures/7434/original/Front-Side.jpg?1677672521',
      'https://cache2.pakwheels.com/system/car_generation_pictures/6664/original/Engine.jpg?1661325718',
      'https://cache3.pakwheels.com/system/car_generation_pictures/7436/resized/Rear-Side.jpg?1677672522',
      'https://cache3.pakwheels.com/system/car_generation_pictures/6665/original/Cockpit.jpg?1661325718'
    ],
    thumbnail:
        'https://cache1.pakwheels.com/system/car_generation_pictures/7698/original/Kia-LE-White.jpg?1710401607',
    description:
        'The price of Honda City 2024 in Pakistan ranges from PKR 4,649,000 for the base variant 1.2L M/T to PKR 5,849,000 for the top of the line 1.5L ASPIRE CVT variant. These prices of Honda City in Pakistan are ex-factory.',
    fueltype: 'Petrol',
    mileage: '16',
    factor: 'Automatic',
    register: 'Punjab',
    exterior: 'white',
    assembly: 'Imported',
    engine: '2000',
    body: 'Honda',
    brand: 'Honda',
  ),
];

List<TDummyData> hyundiaCarList = [
  TDummyData(
    name: 'Honda City ',
    price: '47.5',
    location: 'Karachi',
    model: '2024',
    images: [
      'https://cache4.pakwheels.com/system/car_generation_pictures/6533/original/Engine-bay_11zon.jpg?1659358941',
      'https://cache4.pakwheels.com/system/car_generation_pictures/5538/original/6cb96dce-f633-469b-8a4d-2792206b5d48.jfif?1628242360',
      'https://cache1.pakwheels.com/system/car_generation_pictures/6527/original/Rim_11zon.jpg?1659358938',
      'https://cache3.pakwheels.com/system/car_generation_pictures/6524/original/cockpit.jpg?1659357865'
    ],
    thumbnail:
        'https://cache1.pakwheels.com/system/car_generation_pictures/7389/original/Front-Side.jpg?1677579932',
    description:
        'The price of Honda City 2024 in Pakistan ranges from PKR 4,649,000 for the base variant 1.2L M/T to PKR 5,849,000 for the top of the line 1.5L ASPIRE CVT variant. These prices of Honda City in Pakistan are ex-factory.',
    fueltype: 'Petrol',
    mileage: '16',
    factor: 'Automatic',
    register: 'Punjab',
    exterior: 'white',
    assembly: 'Imported',
    engine: '1200',
    body: 'Honda',
    brand: 'Honda',
  ),
  TDummyData(
    name: 'Toyota Corolla',
    price: '57.5',
    location: 'Karachi',
    model: '2024',
    images: [
      'https://cache3.pakwheels.com/system/car_generation_pictures/7274/original/10.jpg?1672214130',
      'https://cache4.pakwheels.com/system/car_generation_pictures/7266/original/2.jpg?1672214127',
      'https://cache1.pakwheels.com/system/car_generation_pictures/7270/resized/6.jpg?1672214129',
      'https://cache4.pakwheels.com/system/car_generation_pictures/7278/original/14.jpg?1672214132'
    ],
    thumbnail:
        'https://cache1.pakwheels.com/system/car_generation_pictures/5361/original/Corolla-X-Cars-Cropped-Pictures-for-Website.jpg?1606903674',
    description:
        'The price of Honda City 2024 in Pakistan ranges from PKR 4,649,000 for the base variant 1.2L M/T to PKR 5,849,000 for the top of the line 1.5L ASPIRE CVT variant. These prices of Honda City in Pakistan are ex-factory.',
    fueltype: 'Petrol',
    mileage: '16',
    factor: 'Automatic',
    register: 'Punjab',
    exterior: 'white',
    assembly: 'Imported',
    engine: '1200',
    body: 'Honda',
    brand: 'Honda',
  ),
  TDummyData(
    name: 'KIA Sportage',
    price: '97.5',
    location: 'Karachi',
    model: '2024',
    images: [
      'https://cache2.pakwheels.com/system/car_generation_pictures/7434/original/Front-Side.jpg?1677672521',
      'https://cache2.pakwheels.com/system/car_generation_pictures/6664/original/Engine.jpg?1661325718',
      'https://cache3.pakwheels.com/system/car_generation_pictures/7436/resized/Rear-Side.jpg?1677672522',
      'https://cache3.pakwheels.com/system/car_generation_pictures/6665/original/Cockpit.jpg?1661325718'
    ],
    thumbnail:
        'https://cache1.pakwheels.com/system/car_generation_pictures/7698/original/Kia-LE-White.jpg?1710401607',
    description:
        'The price of Honda City 2024 in Pakistan ranges from PKR 4,649,000 for the base variant 1.2L M/T to PKR 5,849,000 for the top of the line 1.5L ASPIRE CVT variant. These prices of Honda City in Pakistan are ex-factory.',
    fueltype: 'Petrol',
    mileage: '16',
    factor: 'Automatic',
    register: 'Punjab',
    exterior: 'white',
    assembly: 'Imported',
    engine: '2000',
    body: 'Honda',
    brand: 'Honda',
  ),
];
