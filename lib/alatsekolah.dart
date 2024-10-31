import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

class AlatSekolah extends StatefulWidget {
  const AlatSekolah({super.key});

  @override
  State<AlatSekolah> createState() => _AlatSekolahState();
}

class _AlatSekolahState extends State<AlatSekolah> {
  FlutterTts flutterTts = FlutterTts();
  int currentIndex = 0;
  Future _speak(String text) async {
    await flutterTts.setLanguage("en-US");
    double speechRate = 0.5;
    await flutterTts.setSpeechRate(speechRate);
    await flutterTts.setPitch(1.0);
    await flutterTts.speak(text);
  }

  List<String> alatsekolahList = [
    'Bola Dunia',
    'Buku  Kamus',
    'Buku Tulis',
    'Gunting',
    'Kalender',
    'Kalkulator',
    'Kapur',
    'Krayon',
    'Kuas Lukis',
    'Kursi',
    'Meja Belajar',
    'Papan Tulis',
    'Penggaris',
    'Penghapus Papan Tulis',
    'Penghapus',
    'Penserut',
    'Pensil Warna',
    'Pensil',
    'Pulpen',
    'Ransel',
    // ... tambahkan daftar aktivitas hingga Aktivitas 20
  ];

  List<String> gambarAlatSekolah = [
    'assets/images/Bola Dunia.png',
    'assets/images/Buku Kamus.png',
    'assets/images/Buku Tulis.png',
    'assets/images/Gunting.png',
    'assets/images/Kalender.png',
    'assets/images/Kalkulator.png',
    'assets/images/Kapur.png',
    'assets/images/Krayon.png',
    'assets/images/Kuas Lukis.png',
    'assets/images/Kursi.png',
    'assets/images/Meja Belajar.png',
    'assets/images/Papan Tulis.png',
    'assets/images/Penggaris.png',
    'assets/images/Penghapus Papan Tulis.png',
    'assets/images/Penghapus.png',
    'assets/images/Penserut.png',
    'assets/images/Pensil Warna.png',
    'assets/images/Pensil.png',
    'assets/images/Pulpen.png',
    'assets/images/Ransel.png',
    // ... tambahkan daftar gambar sesuai dengan aktivitas hingga Aktivitas 20
  ];

  void showAlatSekolahDialog(BuildContext context, int index) {
    List<String> titles = [
      'School tools',
      'School tools',
      'School tools',
      'School tools',
      'School tools',
      'School tools',
      'School tools',
      'School tools',
      'School tools',
      'School tools',
      'School tools',
      'School tools',
      'School tools',
      'School tools',
      'School tools',
      'School tools',
      'School tools',
      'School tools',
      'School tools',
      'School tools',
    ];
    List<String> schooltoolList = [
      'Globe',
      'Dictionary Book',
      'Notebook',
      'Scissors',
      'Calendar',
      'Calculator',
      'Chalk',
      'Crayons',
      'Paintbrush',
      'Chair',
      'Study Desk',
      'Whiteboard',
      'Ruler',
      'Whiteboard Eraser',
      'Eraser',
      'Pencil Sharpener',
      'Colored Pencils',
      'Pencil',
      'Pen',
      'Backpack',
    ];
    List<String> phoneticSymbols = [
      '/ɡloʊb/',
      '/ˈdɪkʃəˌneri bʊk/',
      '/ˈnoʊtˌbʊk/',
      '/ˈsɪzərz/',
      '/ˈkæləndər/',
      '/ˈkælkjəˌleɪtər/',
      '/tʃɔːk/',
      '/ˈkreɪənz/',
      '/ˈpeɪntˌbrʌʃ/',
      '/tʃɛr/',
      '/ˈstʌdi dɛsk/',
      '/ˈwaɪtˌbɔːrd/',
      '/ˈruːlər/',
      '/ˈwaɪtˌbɔːrd ɪˈreɪzər/',
      '/ɪˈreɪzər/',
      '/pɛnsəl ˈʃɑːrpənər/',
      '/ˈkʌlərd ˈpɛnsəlz/',
      '/ˈpɛnsəl/',
      '/ˈpɛn/',
      '/ˈbækˌpæk/',
    ];

    List<String> meanings = [
      'globe or world map.',
      'dictionary book with word meanings.',
      'notebook for writing notes.',
      'scissors.',
      'list of days, months, and years.',
      'calculator.',
      'white object used for writing on a blackboard.',
      'coloring tool.',
      'paintbrush.',
      'furniture used for sitting.',
      'study desk.',
      'a white surface that can be written often used in classrooms.',
      'tool for measuring or drawing straight lines.',
      'tool for erasing writing on a whiteboard.',
      'tool for removing ink or pencil marks on paper.',
      'pencil sharpener.',
      'colored pencils.',
      'writing instrument with graphite.',
      'writing instrument with ink.',
      'a bag carried on the back to carry belongings.',
    ];

    List<String> examples = [
      'In the classroom, the teacher shows the locations of various countries on the globe.',
      'When I encounter an unfamiliar word, I always refer to the dictionary book.',
      'The students use their notebooks to take notes during class.',
      'I use scissors to cut paper and create art projects.',
      'I mark exam dates on my calendar to not miss them.',
      'Students are allowed to use calculators during the math exam.',
      'The teacher writes math formulas on the blackboard using chalk.',
      'Children enjoy coloring with crayons in their coloring books.',
      'Painters use paintbrushes to create beautiful paintings.',
      'In the library, I sit on a comfortable chair while reading books.',
      'Students keep their study desks tidy and clean for focused learning.',
      'The teacher writes important notes on the whiteboard for the students to see.',
      ' I use a ruler to draw straight lines on paper.',
      'After the presentation, the students clean the whiteboard with an eraser..',
      ' I use an eraser to correct mistakes in my writing.',
      'When the pencil tip is dull, I use a pencil sharpener to sharpen it.',
      'Children use colored pencils to color pictures with various colors.',
      'Before taking the exam, make sure you bring a pencil and paper.',
      'I use a pen to write notes in my diary.',
      'Students carry books and school supplies in their backpacks every day.',
    ];

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              backgroundColor: const Color(0xFF07553B),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
                side: const BorderSide(
                  color: Color.fromARGB(255, 206, 212, 106),
                  width: 5.0,
                ),
              ),
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    titles[index],
                    style: const TextStyle(
                      fontSize: 20,
                      color: Color.fromARGB(255, 206, 212, 106),
                      fontFamily: 'Dinofont',
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      width: 30,
                      height: 30,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.red,
                      ),
                      child: const Icon(
                        Icons.close,
                        color: Colors.white,
                        size: 20,
                      ),
                    ),
                  ),
                ],
              ),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          Text(
                            alatsekolahList[index],
                            style: const TextStyle(
                              fontSize: 24,
                              fontFamily: 'Dinofont',
                              color: Color.fromARGB(255, 206, 212, 106),
                            ),
                          ),
                          const SizedBox(height: 0),
                          Image.asset(
                            gambarAlatSekolah[
                                index], // Use Image.asset to display the image
                            width: MediaQuery.of(context).size.width * 0.50,
                            height: MediaQuery.of(context).size.width * 0.35,
                          ),
                          ElevatedButton(
                            onPressed: () {
                              _speak(schooltoolList[index]);
                            },
                            style: ElevatedButton.styleFrom(
                              foregroundColor: const Color(0xFF07553B),
                              backgroundColor:
                                  const Color.fromARGB(255, 206, 212, 106),
                            ),
                            child: const Text('Play'),
                          ),
                          const SizedBox(height: 0),
                          Text(
                            schooltoolList[index],
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 22,
                              fontFamily: 'Dinofont',
                              color: Color.fromARGB(255, 206, 212, 106),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Text(
                    phoneticSymbols[index],
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 18,
                      color: Color.fromARGB(255, 206, 212, 106),
                    ),
                  ),
                  const SizedBox(height: 0),
                  const Text(
                    'Meaning:',
                    style: TextStyle(
                      fontFamily: 'Dinofont',
                      fontSize: 22,
                      color: Color.fromARGB(255, 206, 212, 106),
                    ),
                  ),
                  const SizedBox(height: 0),
                  Text(
                    meanings[index],
                    style: const TextStyle(
                      fontFamily: 'Dinofont',
                      fontSize: 14,
                      color: Color.fromARGB(255, 206, 212, 106),
                    ),
                  ),
                  const SizedBox(height: 0),
                  const Text(
                    'Example:',
                    style: TextStyle(
                      fontFamily: 'Dinofont',
                      fontSize: 22,
                      color: Color.fromARGB(255, 206, 212, 106),
                    ),
                  ),
                  const SizedBox(height: 0),
                  Text(
                    examples[index],
                    style: const TextStyle(
                      fontFamily: 'Dinofont',
                      fontSize: 14,
                      color: Color.fromARGB(255, 206, 212, 106),
                    ),
                  ),
                ],
              ),
              actions: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        if (index > 0) {
                          setState(() {
                            index--;
                          });
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        foregroundColor: const Color(0xFF07553B),
                        backgroundColor:
                            const Color.fromARGB(255, 206, 212, 106),
                      ),
                      child: const Row(
                        children: [
                          Icon(Icons.arrow_back),
                          Text(
                            'Previous',
                            style: TextStyle(
                              fontSize: 18,
                              fontFamily: 'Wigglye',
                              color: Color(0xFF07553B),
                            ),
                          ),
                        ],
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        if (index < alatsekolahList.length - 1) {
                          setState(() {
                            index++;
                          });
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        foregroundColor: const Color(0xFF07553B),
                        backgroundColor:
                            const Color.fromARGB(255, 206, 212, 106),
                      ),
                      child: const Row(
                        children: [
                          Text(
                            'Next',
                            style: TextStyle(
                              fontSize: 18,
                              fontFamily: 'Wigglye',
                              color: Color(0xFF07553B),
                            ),
                          ),
                          Icon(Icons.arrow_forward),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height,
            color: const Color.fromARGB(255, 206, 212, 106),
          ),
          Positioned(
            top: 50,
            left: 20,
            child: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                width: 38,
                height: 38,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color.fromARGB(208, 216, 175, 7),
                ),
                child: const Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                  size: 20,
                ),
              ),
            ),
          ),
          const Positioned(
            top: 50,
            left: 0,
            right: 0,
            child: Center(
              child: Align(
                alignment: Alignment.center,
                child: Column(
                  children: [
                    Text(
                      'School tools',
                      style: TextStyle(
                        color: Color(0xFF07553B),
                        fontSize: 32,
                        fontFamily: 'Dinofont',
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          // Membuat 20 kotak yang tersusun atas 5 slide secara horizontal
          Positioned.fill(
            top: 85,
            child: PageView.builder(
              controller: PageController(viewportFraction: 1.3),
              itemCount: (alatsekolahList.length / 6).ceil(),
              itemBuilder: (context, pageIndex) {
                final startIndex = pageIndex * 6;
                final endIndex = (pageIndex + 1) * 6;
                final visibleAktivitas = alatsekolahList.sublist(
                  startIndex,
                  endIndex > alatsekolahList.length
                      ? alatsekolahList.length
                      : endIndex,
                );
                return Container(
                  padding:
                      const EdgeInsets.only(left: 35, right: 35, bottom: 0),
                  child: GridView.count(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    crossAxisCount: 2,
                    mainAxisSpacing: 0,
                    crossAxisSpacing: 0,
                    children: List.generate(visibleAktivitas.length, (index) {
                      final itemIndex = startIndex + index;
                      return GestureDetector(
                        onTap: () {
                          showAlatSekolahDialog(context, itemIndex);
                        },
                        child: Container(
                          color: Colors.transparent,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                visibleAktivitas[index],
                                style: const TextStyle(
                                  color: Color(0xFF07553B),
                                  fontSize: 18,
                                  fontFamily: 'Dinofont',
                                ),
                              ),
                              const SizedBox(height: 0),
                              Image.asset(
                                gambarAlatSekolah[itemIndex],
                                width: MediaQuery.of(context).size.width * 0.35,
                                height:
                                    MediaQuery.of(context).size.width * 0.35,
                              ),
                            ],
                          ),
                        ),
                      );
                    }),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
