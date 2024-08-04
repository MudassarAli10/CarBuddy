import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ecomerence_app/utils/constants/colors.dart';
import 'package:ecomerence_app/utils/constants/sizes.dart';
import 'dart:io';

class AutoPartsForm extends StatefulWidget {
  const AutoPartsForm({super.key});

  @override
  _AutoPartsFormState createState() => _AutoPartsFormState();
}

class _AutoPartsFormState extends State<AutoPartsForm> {
  final _formKey = GlobalKey<FormState>();
  final ImagePicker _picker = ImagePicker();
  File? _thumbnailImage;
  List<File> _moreImages = [];
  bool _isLoading = false;

  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _locationController = TextEditingController();
  final TextEditingController _partTypeController = TextEditingController();
  final TextEditingController _brandController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  @override
  void dispose() {
    _priceController.dispose();
    _nameController.dispose();
    _locationController.dispose();
    _partTypeController.dispose();
    _brandController.dispose();
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
        FirebaseStorage.instance.ref().child('autoparts_images/$fileName');
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
        'partType': _partTypeController.text,
        'brand': _brandController.text,
        'description': _descriptionController.text,
      };

      await FirebaseFirestore.instance.collection('auto_parts').add(formData);

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Auto Part data added successfully')),
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
          'Sell Auto Parts',
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
                    icon: const Icon(Icons.image,
                        color: TColors.primary), // Customize icon color
                    label: const Text(
                      'Pick Thumbnail Image',
                      style: TextStyle(
                          color: TColors.primary), // Customize text color
                    ),
                  )),
              if (_thumbnailImage != null) Image.file(_thumbnailImage!),
              const SizedBox(height: TSizes.spaceBtwItems),
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
                controller: _partTypeController,
                decoration: const InputDecoration(labelText: 'Part Type'),
                validator: (value) =>
                    value!.isEmpty ? 'Part Type is required' : null,
              ),
              const SizedBox(height: TSizes.spaceBtwItems),
              TextFormField(
                controller: _brandController,
                decoration: const InputDecoration(labelText: 'Brand'),
                validator: (value) =>
                    value!.isEmpty ? 'Brand is required' : null,
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
