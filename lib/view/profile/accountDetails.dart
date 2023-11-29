import 'package:flutter/material.dart';

import '../../common/colo_extension.dart';

class EditAccountPage extends StatefulWidget {
  @override
  _EditAccountPageState createState() => _EditAccountPageState();
}

class _EditAccountPageState extends State<EditAccountPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  String selectedGender = 'Male'; // Default gender selection
  TextEditingController dobController = TextEditingController();

  bool isEditMode = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: TColor.white,
        centerTitle: true,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: TColor.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          "Account Details",
          style: TextStyle(
            color: TColor.black,
            fontSize: 20,
            fontWeight: FontWeight.w700,
          ),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(isEditMode ? Icons.save : Icons.edit ,color: Colors.black,),
            onPressed: () {
              setState(() {
                isEditMode = !isEditMode;
              });
            },
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: 15,
            ),
            buildField("Name", nameController),
            SizedBox(
              height: 15,
            ),
            buildField("Age", ageController),
            SizedBox(
              height: 15,
            ),
            buildGenderField(),
            SizedBox(
              height: 15,
            ),
            buildDateOfBirthField("Date of Birth", dobController),
            SizedBox(
              height: 15,
            ),
          ],
        ),
      ),
    );
  }

  Widget buildField(String label, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            label,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 8),
          isEditMode
              ? TextFormField(
            controller: controller,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Enter $label',
            ),
          )
              : Text(
            controller.text.isNotEmpty ? controller.text : 'No $label',
            style: TextStyle(
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }

  Widget buildGenderField() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Gender',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 8),
          isEditMode
              ? DropdownButton<String>(
            value: selectedGender,
            onChanged: (newValue) {
              setState(() {
                selectedGender = newValue!;
              });
            },
            items: <String>['Male', 'Female']
                .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          )
              : Text(
            selectedGender,
            style: TextStyle(
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }

  Widget buildDateOfBirthField(String label, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            label,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 8),
          isEditMode
              ? InkWell(
            onTap: () => _selectDate(context, controller),
            child: InputDecorator(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Select $label',
              ),
              child: Text(
                controller.text.isNotEmpty ? controller.text : 'Select $label',
                style: TextStyle(fontSize: 16),
              ),
            ),
          )
              : Text(
            controller.text.isNotEmpty ? controller.text : 'No $label',
            style: TextStyle(
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _selectDate(BuildContext context, TextEditingController controller) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );

    if (picked != null && picked != DateTime.now()) {
      setState(() {
        controller.text = picked.toString().substring(0, 10);
      });
    }
  }

  @override
  void dispose() {
    nameController.dispose();
    ageController.dispose();
    dobController.dispose();
    super.dispose();
  }
}
