import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ecomerence_app/utils/constants/colors.dart';
import 'package:ecomerence_app/utils/constants/sizes.dart';
import 'dart:io';

class VehicleForm extends StatefulWidget {
  @override
  _VehicleFormState createState() => _VehicleFormState();
}

class _VehicleFormState extends State<VehicleForm> {
  final _formKey = GlobalKey<FormState>();
  final ImagePicker _picker = ImagePicker();
  File? _thumbnailImage;
  List<File> _moreImages = [];
  bool _isLoading = false;

  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _locationController = TextEditingController();
  final TextEditingController _carModelController = TextEditingController();
  final TextEditingController _fuelTypeController = TextEditingController();
  final TextEditingController _mileageController = TextEditingController();
  final TextEditingController _transmissionController = TextEditingController();
  final TextEditingController _registrationController = TextEditingController();
  final TextEditingController _colorController = TextEditingController();
  final TextEditingController _assembleController = TextEditingController();
  final TextEditingController _engineCapacityController =
      TextEditingController();
  final TextEditingController _bodyTypeController = TextEditingController();
  final TextEditingController _lastUpdateController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  @override
  void dispose() {
    _priceController.dispose();
    _nameController.dispose();
    _locationController.dispose();
    _carModelController.dispose();
    _fuelTypeController.dispose();
    _mileageController.dispose();
    _transmissionController.dispose();
    _registrationController.dispose();
    _colorController.dispose();
    _assembleController.dispose();
    _engineCapacityController.dispose();
    _bodyTypeController.dispose();
    _lastUpdateController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  Future<void> _pickImage(ImageSource source, bool isThumbnail) async {
    final pickedFile = await _picker.pickImage(source: source);
    if (pickedFile != null) {
      setState(() {
        if (isThumbnail) {
          _thumbnailImage = File(pickedFile.path);
        } else {
          _moreImages.add(File(pickedFile.path));
        }
      });
    }
  }

  Future<String> _uploadImage(File image) async {
    String fileName = image.path.split('/').last;
    Reference storageReference =
        FirebaseStorage.instance.ref().child('vehicle_images/$fileName');
    UploadTask uploadTask = storageReference.putFile(image);
    await uploadTask.whenComplete(() => null);
    return await storageReference.getDownloadURL();
  }

  Future<void> _submitForm() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
      });

      String? thumbnailUrl;
      List<String> moreImageUrls = [];

      if (_thumbnailImage != null) {
        thumbnailUrl = await _uploadImage(_thumbnailImage!);
      }

      for (File image in _moreImages) {
        String imageUrl = await _uploadImage(image);
        moreImageUrls.add(imageUrl);
      }

      Map<String, dynamic> formData = {
        'thumbnail': thumbnailUrl,
        'images': moreImageUrls,
        'price': _priceController.text,
        'name': _nameController.text,
        'location': _locationController.text,
        'carModel': _carModelController.text,
        'fuelType': _fuelTypeController.text,
        'mileage': _mileageController.text,
        'transmission': _transmissionController.text,
        'registration': _registrationController.text,
        'color': _colorController.text,
        'assemble': _assembleController.text,
        'engineCapacity': _engineCapacityController.text,
        'bodyType': _bodyTypeController.text,
        'lastUpdate': _lastUpdateController.text,
        'description': _descriptionController.text,
      };

      await FirebaseFirestore.instance.collection('vehicles').add(formData);

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Vehicle data added successfully')),
      );

      setState(() {
        _isLoading = false;
        _formKey.currentState!.reset();
        _thumbnailImage = null;
        _moreImages = [];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Sell Cars',
          style: Theme.of(context)
              .textTheme
              .headlineMedium!
              .apply(color: TColors.white),
        ),
        backgroundColor: TColors.primary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: TColors.primary), // Border color
                  borderRadius: BorderRadius.circular(10), // Border radius
                ),
                child: TextButton.icon(
                  onPressed: () => _pickImage(ImageSource.gallery, true),
                  icon: const Icon(
                    Icons.image,
                    color: TColors.primary,
                  ),
                  label: const Text(
                    'Pick Thumbnail Image',
                    style: TextStyle(color: TColors.primary),
                  ),
                ),
              ),
              if (_thumbnailImage != null) Image.file(_thumbnailImage!),
              const SizedBox(height: TSizes.spaceBtwItems),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: TColors.primary), // Border color
                  borderRadius: BorderRadius.circular(10), // Border radius
                ),
                child: TextButton.icon(
                  onPressed: () => _pickImage(ImageSource.gallery, false),
                  icon: const Icon(Icons.image, color: TColors.primary),
                  label: const Text(
                    'Pick More Images',
                    style: TextStyle(color: TColors.primary),
                  ),
                ),
              ),
              if (_moreImages.isNotEmpty)
                Wrap(
                  children: _moreImages
                      .map(
                          (image) => Image.file(image, width: 100, height: 100))
                      .toList(),
                ),
              const SizedBox(height: TSizes.spaceBtwItems),
              TextFormField(
                controller: _priceController,
                decoration: const InputDecoration(labelText: 'Price'),
                keyboardType: TextInputType.number,
                validator: (value) =>
                    value!.isEmpty ? 'Price is required' : null,
              ),
              const SizedBox(height: TSizes.spaceBtwItems),
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(labelText: 'Name'),
                validator: (value) =>
                    value!.isEmpty ? 'Name is required' : null,
              ),
              const SizedBox(height: TSizes.spaceBtwItems),
              TextFormField(
                controller: _locationController,
                decoration: const InputDecoration(labelText: 'Location'),
                validator: (value) =>
                    value!.isEmpty ? 'Location is required' : null,
              ),
              const SizedBox(height: TSizes.spaceBtwItems),
              TextFormField(
                controller: _carModelController,
                decoration: const InputDecoration(labelText: 'Car Model'),
                validator: (value) =>
                    value!.isEmpty ? 'Car Model is required' : null,
              ),
              const SizedBox(height: TSizes.spaceBtwItems),
              TextFormField(
                controller: _fuelTypeController,
                decoration: const InputDecoration(labelText: 'Fuel Type'),
                validator: (value) =>
                    value!.isEmpty ? 'Fuel Type is required' : null,
              ),
              const SizedBox(height: TSizes.spaceBtwItems),
              TextFormField(
                controller: _mileageController,
                decoration: const InputDecoration(labelText: 'Mileage'),
                keyboardType: TextInputType.number,
                validator: (value) =>
                    value!.isEmpty ? 'Mileage is required' : null,
              ),
              const SizedBox(height: TSizes.spaceBtwItems),
              TextFormField(
                controller: _transmissionController,
                decoration: const InputDecoration(
                    labelText: 'Transmission (Auto/Manual)'),
                validator: (value) =>
                    value!.isEmpty ? 'Transmission is required' : null,
              ),
              const SizedBox(height: TSizes.spaceBtwItems),
              TextFormField(
                controller: _registrationController,
                decoration:
                    const InputDecoration(labelText: 'Car Registered In'),
                validator: (value) =>
                    value!.isEmpty ? 'Car Registered In is required' : null,
              ),
              const SizedBox(height: TSizes.spaceBtwItems),
              TextFormField(
                controller: _colorController,
                decoration: const InputDecoration(labelText: 'Exterior Color'),
                validator: (value) =>
                    value!.isEmpty ? 'Exterior Color is required' : null,
              ),
              const SizedBox(height: TSizes.spaceBtwItems),
              TextFormField(
                controller: _assembleController,
                decoration: const InputDecoration(labelText: 'Assembled In'),
                validator: (value) =>
                    value!.isEmpty ? 'Assembled In is required' : null,
              ),
              const SizedBox(height: TSizes.spaceBtwItems),
              TextFormField(
                controller: _engineCapacityController,
                decoration: const InputDecoration(labelText: 'Engine Capacity'),
                keyboardType: TextInputType.number,
                validator: (value) =>
                    value!.isEmpty ? 'Engine Capacity is required' : null,
              ),
              const SizedBox(height: TSizes.spaceBtwItems),
              TextFormField(
                controller: _bodyTypeController,
                decoration: const InputDecoration(labelText: 'Body Type'),
                validator: (value) =>
                    value!.isEmpty ? 'Body Type is required' : null,
              ),
              const SizedBox(height: TSizes.spaceBtwItems),
              TextFormField(
                controller: _lastUpdateController,
                decoration: const InputDecoration(labelText: 'Last Update'),
                validator: (value) =>
                    value!.isEmpty ? 'Last Update is required' : null,
              ),
              const SizedBox(height: TSizes.spaceBtwItems),
              TextFormField(
                controller: _descriptionController,
                decoration: const InputDecoration(labelText: 'Description'),
                maxLines: 3,
                validator: (value) =>
                    value!.isEmpty ? 'Description is required' : null,
              ),
              const SizedBox(height: TSizes.spaceBtwItems),
              ElevatedButton(
                onPressed: _isLoading ? null : _submitForm,
                style: ElevatedButton.styleFrom(
                  backgroundColor: TColors.primary,
                ),
                child: _isLoading
                    ? const SizedBox(
                        width: 24,
                        height: 24,
                        child: CircularProgressIndicator(
                          color: Colors.white,
                          strokeWidth: 2,
                        ),
                      )
                    : const Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
