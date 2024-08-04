import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecomerence_app/utils/constants/image_strings.dart';

class ProductModel {
  String id;
  double price;
  String name;
  String brand;
  String location;
  double model;
  String fueltype;
  double mileage;
  String factor;
  String register;
  String exterior;
  String assembly;
  double engine;
  String body;
  DateTime? lastupdate;
  String description;
  String thumbnail;
  List<String> images;
  bool? isfeature;

  ProductModel({
    required this.id,
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
    this.isfeature,
    required this.description,
    required this.thumbnail,
    required this.images,
  });

  static ProductModel empty() => ProductModel(
      id: '',
      name: '',
      price: 0,
      thumbnail: '',
      location: '',
      fueltype: '',
      mileage: 0,
      factor: '',
      register: '',
      exterior: '',
      assembly: '',
      engine: 0,
      body: '',
      description: '',
      images: [],
      model: 0,
      brand: '');

  //Json Format
  toJson() {
    return {
      'Thumbnail': thumbnail,
      'Images': images,
      'Price': price,
      'Name': name,
      'Brand': brand,
      'Location': location,
      'Model': model,
      'FuelType': fueltype,
      'Mileage': mileage,
      'Factors': factor,
      'Registered': register,
      'Exterior': exterior,
      'Assembly': assembly,
      'Engine': engine,
      'Body': body,
      'Description': description,
      'isFeatured': isfeature,
      'LastUpdate': lastupdate,
    };
  }

  factory ProductModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    if (document.data() == null) return ProductModel.empty();
    final data = document.data()!;
    return ProductModel(
      id: document.id,
      name: data['Name'] ?? '',
      brand: data['Brand'] ?? '',
      images: data['Images'] != null && data['Images'] is List
          ? List<String>.from(data['Images'])
          : [TImages.productImage1], // Default image if empty
      price: _parseDouble(data['Price']),
      isfeature: data['isFeatured'] ?? false,
      thumbnail: data['Thumbnail']?.isNotEmpty == true
          ? data['Thumbnail']
          : TImages.productImage1, // Default thumbnail if empty
      location: data['Location'] ?? '',
      model: _parseDouble(data['Model']),
      fueltype: data['FuelType'] ?? '',
      mileage: _parseDouble(data['Mileage']),
      factor: data['Factors'] ?? '',
      register: data['Registered'] ?? '',
      exterior: data['Exterior'] ?? '',
      assembly: data['Assembly'] ?? '',
      engine: _parseDouble(data['Engine']),
      body: data['Body'] ?? '',
      description: data['Description'] ?? '',
      lastupdate: _parseDateTime(data['LastUpdate']),
    );
  }

  static double _parseDouble(dynamic value) {
    if (value == null || value.toString().isEmpty) {
      return 0.0;
    }
    try {
      return double.parse(value.toString());
    } catch (e) {
      print('Error parsing double: $e');
      return 0.0;
    }
  }

  static DateTime? _parseDateTime(dynamic value) {
    if (value == null || value.toString().isEmpty) {
      return null;
    }
    try {
      return DateTime.parse(value.toString());
    } catch (e) {
      print('Error parsing date: $e');
      return null;
    }
  }
}
