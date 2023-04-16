import 'dart:convert';
import 'dart:io';
import 'package:booking_app/pages/owner/owner_profile_page.dart';
import 'package:booking_app/pages/owner/owner_property_page.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:image_picker/image_picker.dart';
import 'package:uuid/uuid.dart';
import '../../utils/colors.dart';
import '../../widgets/_common/widget/round_corner_text_input_widget.dart';
import '../../widgets/_common/widget/round_corners_button_widget.dart';
import '../../widgets/big_text.dart';
import '../../widgets/small_text.dart';
import 'package:http/http.dart' as http;

class MultiSelect extends StatefulWidget {
  final List<String> items;
  const MultiSelect({Key? key, required this.items}) : super(key: key);

  @override
  State<MultiSelect> createState() => _MultiSelectState();
}

class _MultiSelectState extends State<MultiSelect> {
  final List<String> _selectedItems = [];
  void _itemChange(String itemValue, bool isSelected) {
    setState(() {
      if (isSelected) {
        _selectedItems.add(itemValue);
      } else {
        _selectedItems.remove(itemValue);
      }
    });
  }

  void _cancel() {
    Navigator.pop(context);
  }

  void _submit() {
    Navigator.pop(context, _selectedItems);
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Select Services'),
      content: SingleChildScrollView(
        child: ListBody(
          children: widget.items
              .map((item) => CheckboxListTile(
                    value: _selectedItems.contains(item),
                    title: Text(item),
                    controlAffinity: ListTileControlAffinity.leading,
                    onChanged: (isChecked) => _itemChange(item, isChecked!),
                  ))
              .toList(),
        ),
      ),
      actions: [
        TextButton(
          onPressed: _cancel,
          child: const Text('Cancel'),
        ),
        ElevatedButton(
          onPressed: _submit,
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.resolveWith(
                (states) => AppColors.accentColor),
          ),
          child: const Text('Submit'),
        )
      ],
    );
  }
}

class OwnerHotelListingPage extends StatefulWidget {
  dynamic owner;
  OwnerHotelListingPage({Key? key, required this.owner}) : super(key: key);

  @override
  State<OwnerHotelListingPage> createState() => _OwnerHotelListingPageState(owner);
}

class _OwnerHotelListingPageState extends State<OwnerHotelListingPage> {

  dynamic owner;
  _OwnerHotelListingPageState(this.owner);

  List<String> _selectedItems = [];

  TextEditingController nameController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  File? _image;
  PickedFile? _pickedFile;
  final _picker = ImagePicker();

  Future<void> _pickImage() async {
    _pickedFile = await _picker.getImage(source: ImageSource.gallery);
    if (_pickedFile != null) {
      setState(() {
        _image = File(_pickedFile!.path);
      });
    }
  }

  void _showMultiSelect() async {
    final List<String> items = [
      'Wifi',
      'Parking',
      'Washroom',
      'Bathroom',
      'Breakfast'
    ];

    final List<String>? results = await showDialog(
      context: context,
      builder: (BuildContext context) {
        return MultiSelect(items: items);
      },
    );
    if (results != null) {
      setState(() {
        _selectedItems = results;
      });
    }

    print(_selectedItems[0].toString());
  }



  Future<void> _submitForm() async {

    final url = 'http://10.0.2.2:8000/api/hotels';
    final request = http.MultipartRequest('POST', Uri.parse(url));
    request.fields['name'] = nameController.text;
    request.fields['location'] = locationController.text;
    request.fields['description'] = descriptionController.text;
    request.fields['wifi'] = _selectedItems.contains('Wifi') ? "1": "0";
    request.fields['bathroom'] = _selectedItems.contains('Bathroom') ? "1": "0";
    request.fields['washroom'] = _selectedItems.contains('Washroom') ? "1": "0";
    request.fields['parking'] = _selectedItems.contains('Parking') ? "1": "0";
    request.fields['breakfast'] = _selectedItems.contains('Breakfast') ? "1": "0";
    request.fields['owner_id'] = owner['id'].toString();
    //TODO: pass the value of existing owner

    if (_pickedFile != null) {
      final file = await http.MultipartFile.fromPath('image_path', _pickedFile!.path);
      request.files.add(file);
    }
    else{
      //TODO: file didnt selected
    }
    final response = await request.send();
    if(response.statusCode == 200) {
      //   Navigator.push(
      //     context,
      //     MaterialPageRoute(
      //         builder: (context) => OwnerHotelListingPage()),
      //   );
      //   print(await response.stream.bytesToString());
    }
    //TODO: Navigate to the list of hotels you own page
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: AppColors.secondaryBackgroundColor,
        body: Column(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  margin: const EdgeInsets.only(top: 45, bottom: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SmallText(
                          text: owner == null ? 'Name': "Hey, " + owner['name'] + " !", color: AppColors.primaryTextColor),
                      Icon(Icons.notifications,
                          color: AppColors.buttonColor.withOpacity(0.0),
                          size: 30),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  margin: const EdgeInsets.only(bottom: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const BigText(
                          text: 'Create Hotel Listing',
                          size: 24,
                          color: AppColors.primaryTextColor),
                      Icon(Icons.notifications,
                          color: AppColors.buttonColor.withOpacity(0.0),
                          size: 30),
                    ],
                  ),
                ),
                Container(
                  height: 570,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 24, vertical: 10),
                          child: RoundCornerTextInputWidget(
                            inputTextKey: Key('txt_'),
                            hintText: 'Hotel Name',
                            controller: nameController,
                            // onChange: (v) {
                            //   _loginEntity.email = v;
                            // },
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 24, vertical: 10),
                          child: RoundCornerTextInputWidget(
                            inputTextKey: Key('txt_location'),
                            hintText: 'Location',
                            controller: locationController,
                            // onChange: (v) {
                            //   _loginEntity.email = v;
                            // },
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 24, vertical: 10),
                          child: RoundCornerTextInputWidget(
                            inputTextKey: Key('txt_description'),
                            hintText: 'Description',
                            maxLines: 5,
                            height: 150,
                            controller: descriptionController,
                            // onChange: (v) {
                            //   _loginEntity.email = v;
                            // },
                          ),
                        ),
                        Padding(
                            padding: const EdgeInsets.all(20),
                            child: Column(children: [
                              Center(
                                  child: RoundCornerButtonWidget(
                                // child: const Text('Select an Image'),
                                bgColor: AppColors.accentColor.withOpacity(0.5),
                                textColor: AppColors.secondaryBackgroundColor,
                                onTap: () => _pickImage(),
                                title: 'Select an Image',
                              )),
                              const SizedBox(
                                height: 20,
                              ),
                              Container(
                                alignment: Alignment.center,
                                width: double.infinity,
                                height: 200,
                                color: Colors.white,
                                child: _pickedFile != null
                                    ? Image.file(
                                  File(_pickedFile!.path), width: double.infinity, fit: BoxFit.cover,
                                )
                                    : const Text('Please select an image'),
                              )
                            ])),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 24, vertical: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              RoundCornerButtonWidget(
                                bgColor: AppColors.accentColor.withOpacity(0.5),
                                textColor: AppColors.secondaryBackgroundColor,
                                onTap: () => {_showMultiSelect()},
                                title: 'Additional Services',
                              ),
                              Wrap(
                                children: _selectedItems
                                    .map((e) => Chip(
                                          label: Text(e),
                                        ))
                                    .toList(),
                              ),
                              const Divider(
                                height: 10,
                                color: Colors.black,
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 24, vertical: 10),
                          child: RoundCornerButtonWidget(
                            bgColor: AppColors.buttonColor,
                            textColor: AppColors.secondaryBackgroundColor,
                            onTap: () => {
                              _submitForm()
                            },
                            title: 'Add Listing   💾 ',
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
        bottomNavigationBar: Container(
          color: AppColors.buttonColor,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: GNav(
              backgroundColor: AppColors.buttonColor,
              color: AppColors.secondaryBackgroundColor,
              activeColor: AppColors.primaryBackgroundColor,
              tabBackgroundColor: AppColors.iconColor,
              gap: 8,
              padding: EdgeInsets.all(16),
              tabs: [
                GButton(
                    icon: Icons.add_circle_outline,
                    text: 'Listing',
                    onPressed: () {

                    }),
                GButton(
                    icon: Icons.list_alt_outlined,
                    text: 'Property',
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => OwnerPropertyPage(owner: owner)),
                      );
                    }),
                GButton(
                    icon: Icons.bookmark_outline,
                    text: 'Orders',
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => OwnerProfilePage(owner: owner)),
                      );
                    }),
                GButton(
                    icon: Icons.person,
                    text: 'Profile',
                    onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => OwnerProfilePage(owner: owner)),
                        );
                    }),
              ],
            ),
          ),
        ));
  }
}
