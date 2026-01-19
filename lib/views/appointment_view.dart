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
        backgroundColor: const Color.fromARGB(255, 7, 189, 213),
        centerTitle: true,
        title: const Text(
          'Book a New Appointment',
          style: TextStyle(
            fontFamily: 'ShortBaby-Mg2w',
            fontSize: 20,
            color: Colors.white,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: Column(
            children: [
              const Text(
                "Book a New Appointment",
                style: TextStyle(
                  fontSize: 40,
                  fontFamily: 'ShortBaby-Mg2w',
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 40),
              Form(
                key: _formState,
                autovalidateMode: _autoValidateMode,
                child: Column(
                  spacing: 40,
                  children: [
                    CustomTextField(
                      label: 'Patient Name',
                      icon: Icons.person,
                      onChanged: (value) => patientName = value,
                    ),
                    CustomTextField(
                      label: 'Appointment Date',
                      icon: Icons.calendar_today,
                      keyboardType: TextInputType.datetime,
                      onChanged: (value) => appointmentDate = value,
                    ),
                    CustomTextField(
                      label: 'Appointment Time',
                      icon: Icons.access_time,
                      keyboardType: TextInputType.datetime,
                      onChanged: (value) => appointmentTime = value,
                    ),
                    CustomTextField(
                      label: 'Reason for Visit',
                      icon: Icons.note,
                      maxLines: 3,
                      onChanged: (value) => reasonForVisit = value,
                    ),
                    CustomButton(
                      text: 'Save Patient Data',
                      onPressed: () {
                        if (_formState.currentState!.validate()) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('Saving $patientName Data...'),
                              backgroundColor: const Color.fromARGB(
                                255,
                                6,
                                6,
                                6,
                              ),
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
            ],
          ),
        ),
      ),
    );
  }
}
