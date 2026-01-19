import 'package:flutter/material.dart';

class Patientrecord extends StatelessWidget {
  Patientrecord({super.key});

  final List<String> patientNames = [
    "Fares",
    "Aroa",
    "Hifaa",
    "Adood",
    "Issa",
    "Mariam",
    "Ahmed",
    "Omar",
    "Hinata",
  ];

  final List<bool> isMale = [
    true,
    false,
    false,
    true,
    true,
    false,
    true,
    true,
    false,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 7, 189, 213),
        centerTitle: true,
        title: const Text(
          "Patient Records",
          style: TextStyle(
            fontFamily: 'ShortBaby-Mg2w',
            fontSize: 18,
            color: Colors.white,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              const Text(
                "Patient Records",
                style: TextStyle(
                  fontSize: 28,
                  fontFamily: 'ShortBaby-Mg2w',
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 16),
              GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 2.0 / 1,
                  mainAxisSpacing: 12,
                  crossAxisSpacing: 12,
                ),
                itemCount: patientNames.length,
                itemBuilder: (context, index) {
                  return Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color:
                          isMale[index]
                              ? const Color.fromARGB(255, 7, 189, 213)
                              : const Color.fromARGB(255, 255, 186, 245),
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 6,
                          offset: Offset(1, 1),
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(
                          isMale[index] ? Icons.male : Icons.female,
                          size: 30,
                          color:
                              isMale[index]
                                  ? Colors.white
                                  : const Color.fromARGB(255, 255, 64, 128),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              patientNames[index],
                              style: TextStyle(
                                fontFamily: 'ShortBaby-Mg2w',
                                fontSize: 16,
                                color:
                                    isMale[index] ? Colors.white : Colors.black,
                              ),
                            ),
                            Text(
                              "Data",
                              style: TextStyle(
                                fontSize: 10,
                                color:
                                    isMale[index]
                                        ? const Color.fromARGB(
                                          255,
                                          221,
                                          98,
                                          207,
                                        )
                                        : Colors.black,
                              ),
                            ),
                            Text(
                              "Data",
                              style: TextStyle(
                                fontSize: 8,
                                color:
                                    isMale[index]
                                        ? const Color.fromARGB(
                                          255,
                                          106,
                                          106,
                                          106,
                                        )
                                        : const Color.fromARGB(
                                          178,
                                          221,
                                          98,
                                          207,
                                        ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              icon: const Icon(
                                Icons.edit,
                                color: Colors.blue,
                                size: 20,
                              ),
                              onPressed: () {
                                Navigator.pushNamed(context, '/edit');
                              },
                            ),
                            const SizedBox(width: 4),
                            const Icon(
                              Icons.delete,
                              color: Colors.red,
                              size: 20,
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
