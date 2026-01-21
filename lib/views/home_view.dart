import 'package:clinic/widgets/patient_card.dart';
import 'package:clinic/models/patient_model.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key, required this.isDark, required this.onChanged});
  final bool isDark;
  final void Function(bool) onChanged;

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: DrawerHeader(
          padding: EdgeInsets.only(top: 60),
          child: Column(
            children: [
              CircleAvatar(
                backgroundImage: const AssetImage(
                  "assets/images/Clinic_img.jpg",
                ),
                radius: 50,
              ),
              SizedBox(height: 50),
              ListTile(
                title: Text(
                  "Dark Mood",
                  style: TextStyle(fontSize: 20, fontFamily: "ShortBaby-Mg2w"),
                ),
                trailing: Switch(
                  value: widget.isDark,
                  onChanged: (value) {
                    widget.onChanged(value);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      appBar: AppBar(
        title: Text(
          "Home",
          style: TextStyle(
            fontFamily: 'ShortBaby-Mg2w',
            fontSize: 20,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        elevation: 30,
        shadowColor: Color.fromARGB(255, 0, 0, 0),
        backgroundColor: const Color.fromARGB(255, 7, 189, 213),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 40),
              Container(
                padding: const EdgeInsets.all(30),
                color: Colors.transparent,
                child: Column(
                  children: const [
                    Text(
                      "Welcome",
                      style: TextStyle(
                        fontSize: 60,
                        fontFamily: "ShortBaby-Mg2w",
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      "to the clinic",
                      style: TextStyle(
                        fontSize: 60,
                        fontFamily: "ShortBaby-Mg2w",
                        color: Color.fromARGB(255, 7, 189, 213),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 50),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  PatientCard(
                    model: PatientModel(
                      Bcolor: const Color.fromARGB(255, 15, 154, 173),
                      color: const Color.fromARGB(255, 10, 10, 10),
                      Tx: "Add",
                      icon: Icons.add,
                      routeName: '/add',
                    ),
                  ),
                  PatientCard(
                    model: PatientModel(
                      Bcolor: const Color.fromARGB(255, 15, 154, 173),
                      color: const Color.fromARGB(255, 9, 9, 9),
                      Tx: "Today",
                      icon: Icons.today,
                      routeName: '/patient',
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  PatientCard(
                    model: PatientModel(
                      Bcolor: const Color.fromARGB(255, 15, 154, 173),
                      color: const Color.fromARGB(255, 7, 7, 7),
                      Tx: "Edit",
                      icon: Icons.edit,
                      routeName: '/edit',
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
