import 'package:flutter/material.dart';
import '../widgets/custom_textfield.dart';
import '../widgets/custom_button.dart';

class AddPatientView extends StatelessWidget {
  const AddPatientView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: const Text('Add New Patient'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          spacing: 16,
          children: [
            CustomTextField(label: 'Full Name', icon: Icons.person),

            CustomTextField(
              label: 'Phone Number',
              icon: Icons.phone,
              keyboardType: TextInputType.phone,
            ),

            Container(
              margin: const EdgeInsets.only(right: 300),
              child: CustomTextField(
                label: 'Age',
                icon: Icons.calendar_today,
                keyboardType: TextInputType.number,
              ),
            ),

            CustomTextField(
              label: 'Medical Notes',
              icon: Icons.note,
              maxLines: 3,
            ),

            CustomButton(
              text: 'Save Patient Data',
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Save Button (UI Only)')),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
