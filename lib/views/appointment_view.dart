import 'package:flutter/material.dart';
import '../widgets/custom_textfield.dart';
import '../widgets/custom_button.dart';

class AppointmentView extends StatefulWidget {
  const AppointmentView({super.key});

  @override
  State<AppointmentView> createState() => _AppointmentViewState();
}

class _AppointmentViewState extends State<AppointmentView> {
  final GlobalKey<FormState> _formState = GlobalKey<FormState>();

  AutovalidateMode _autoValidateMode = AutovalidateMode.disabled;

  String? patientName;
  String? appointmentDate;
  String? appointmentTime;
  String? reasonForVisit;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: const Text('Book a New Appointment'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formState,
          autovalidateMode: _autoValidateMode,
          child: Column(
            spacing: 16,
            children: [
              CustomTextField(
                label: 'Patient Name',
                icon: Icons.person,
                onChanged: (value) {
                  patientName = value;
                },
              ),
              CustomTextField(
                label: 'Appointment Date',
                icon: Icons.calendar_today,
                keyboardType: TextInputType.datetime,
                onChanged: (value) {
                  appointmentDate = value;
                },
              ),
              CustomTextField(
                label: 'Appointment Time',
                icon: Icons.access_time,
                keyboardType: TextInputType.datetime,
                onChanged: (value) {
                  appointmentTime = value;
                },
              ),
              CustomTextField(
                label: 'Reason for Visit',
                icon: Icons.note,
                maxLines: 3,
                onChanged: (value) {
                  reasonForVisit = value;
                },
              ),
              CustomButton(
                text: 'Save Patient Data',
                onPressed: () {
                  if (_formState.currentState!.validate()) {
                    debugPrint(
                      'Name: $patientName, Date: $appointmentDate, Time: $appointmentTime',
                    );

                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Saving $patientName Data...'),
                        backgroundColor: Colors.teal,
                      ),
                    );
                  }

                  setState(() {
                    _autoValidateMode = AutovalidateMode.always;
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
