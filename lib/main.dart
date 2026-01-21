import 'package:clinic/helpers/shared.dart';
import 'package:clinic/views/add_patient_view.dart';
import 'package:clinic/views/edit_patient_view.dart';
import 'package:clinic/views/home_view.dart';
import 'package:clinic/views/login_view.dart';
import 'package:clinic/views/patient_list_view.dart';
import 'package:clinic/views/splash_view.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Shared.initalperf();
  runApp(const Clinic());
}

class Clinic extends StatefulWidget {
  const Clinic({super.key});

  @override
  State<Clinic> createState() => _ClinicState();
}

bool isDark = false;
void onChangValue(bool value) {
  isDark = value;
}

class _ClinicState extends State<Clinic> {
  bool isDark = Shared.getBool("isDark");
  void onChangValue(bool value) {
    setState(() {
     isDark = value;
    });
     isDark = Shared.setBool("isDark", value);
    
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: isDark ? ThemeMode.dark : ThemeMode.light,
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),

      initialRoute: '/',
      routes: {
        '/': (context) => SplashView(),
        '/home': (context) => HomeView(isDark: isDark, onChanged: onChangValue),
        '/add': (context) => AddPatientView(),
        '/edit': (context) => EditPatientView(),
        '/patient': (context) => PatientListView(),
        '/login': (context) => LoginView(),
      },
    );
  }
}
