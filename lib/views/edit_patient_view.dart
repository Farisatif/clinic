import 'package:flutter/material.dart';
import '../widgets/custom_textfield.dart';
import '../widgets/custom_button.dart';

class EditPatientView extends StatelessWidget {
  const EditPatientView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: const Text('Edit Patient'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),

        child: Column(
          spacing: 16,
          children: [
            CustomTextField(label: 'Patient Name', icon: Icons.person),

            CustomTextField(
              label: 'Appointment Date',
              icon: Icons.calendar_today,
              keyboardType: TextInputType.datetime,
            ),

            CustomTextField(
              label: 'Appointment Time',
              icon: Icons.access_time,
              keyboardType: TextInputType.datetime,
            ),

            CustomTextField(
              label: 'Reason for Visit',
              icon: Icons.note,
              maxLines: 3,
            ),

            CustomButton(
              text: 'Confirm Booking',
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
