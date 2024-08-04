import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:iconsax/iconsax.dart';
import 'package:ecomerence_app/utils/constants/sizes.dart';
import 'package:ecomerence_app/features/shop/screens/mechanic/widget/google_map.dart';
import 'package:ecomerence_app/utils/popups/loaders.dart';

class MechanicScreen extends StatefulWidget {
  const MechanicScreen({super.key});

  @override
  _MechanicScreenState createState() => _MechanicScreenState();
}

class _MechanicScreenState extends State<MechanicScreen> {
  final TextEditingController _locationController = TextEditingController();
  final TextEditingController _messageController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  LatLng _selectedLocation = const LatLng(31.4504, 73.1350);
  // ignore: unused_field
  String? _selectedMechanicId;
  final List<Map<String, dynamic>> _mechanics = [];
  bool _isExpanded = false;

  @override
  void initState() {
    super.initState();
    _fetchMechanics();
  }

  void _fetchMechanics() {
    final DatabaseReference mechanicsRef =
        FirebaseDatabase.instance.ref().child('mechanics');
    mechanicsRef.once().then((snapshot) {
      final mechanicsData = snapshot.snapshot.value as Map?;
      if (mechanicsData != null) {
        setState(() {
          _mechanics.clear();
          mechanicsData.forEach((key, value) {
            _mechanics.add({
              'id': key,
              'phone_number': value['phone_number'],
            });
          });
        });
      }
    });
  }

  void _onLocationSelected(LatLng location) {
    setState(() {
      _selectedLocation = location;
      _locationController.text = '${location.latitude}, ${location.longitude}';
    });
  }

  void _onSendMessage() {
    final String message = _messageController.text;
    final String phoneNumber = _phoneNumberController.text;
    if (message.isNotEmpty && phoneNumber.isNotEmpty) {
      final DatabaseReference messageRef =
          FirebaseDatabase.instance.ref().child('messages').push();
      final String userId = FirebaseAuth.instance.currentUser!.uid;

      messageRef.set({
        'phoneNumber': phoneNumber,
        'userId': userId,
        'message': message,
        'location': {
          'latitude': _selectedLocation.latitude,
          'longitude': _selectedLocation.longitude,
        },
        'timestamp': DateTime.now().millisecondsSinceEpoch,
      }).then((_) {
        TLoaders.successSnackBar(
            title: 'Congratulation',
            message: 'Your message is sent Successfully!');
      }).catchError((error) {
        TLoaders.errorSnackBar(
            title: 'OH Error', message: 'Please fill all fields');
      });
    } else {
      TLoaders.errorSnackBar(
          title: 'OH Error', message: 'Please fill all fields');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          GoogleMapScreen(
            onLocationSelected: _onLocationSelected,
            onSendMessage: (mechanicId, location) {
              _onSendMessage();
            },
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: GestureDetector(
              onTap: () {
                setState(() {
                  _isExpanded = !_isExpanded;
                });
              },
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                height: _isExpanded ? 350 : 50,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius:
                      const BorderRadius.vertical(top: Radius.circular(30)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const SizedBox(height: TSizes.spaceBtwItems),
                      Center(
                        child: Text(
                          'Book Vehicle Mechanic',
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                      ),
                      const SizedBox(height: TSizes.spaceBtwItems),
                      if (_isExpanded) ...[
                        TextFormField(
                          controller: _phoneNumberController,
                          decoration: const InputDecoration(
                            prefixIcon: Icon(Iconsax.call),
                            labelText: 'Enter  Phone Number',
                            border: OutlineInputBorder(),
                          ),
                          keyboardType: TextInputType.phone,
                        ),
                        const SizedBox(height: TSizes.spaceBtwInputFields),
                        TextFormField(
                          controller: _locationController,
                          decoration: const InputDecoration(
                            prefixIcon: Icon(Iconsax.location),
                            labelText: 'Select Your Location',
                            border: OutlineInputBorder(),
                          ),
                          readOnly: true,
                        ),
                        const SizedBox(height: TSizes.spaceBtwInputFields),
                        TextFormField(
                          controller: _messageController,
                          decoration: const InputDecoration(
                            prefixIcon: Icon(Iconsax.message),
                            labelText: 'Send Your Message',
                            border: OutlineInputBorder(),
                          ),
                        ),
                        const SizedBox(height: TSizes.spaceBtwItems),
                        ElevatedButton(
                          onPressed: _onSendMessage,
                          child: const Text('Submit'),
                        ),
                      ],
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
