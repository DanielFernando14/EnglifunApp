import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

class Aktivitas extends StatefulWidget {
  const Aktivitas({super.key});

  @override
  State<Aktivitas> createState() => _AktivitasState();
}

class _AktivitasState extends State<Aktivitas> {
  FlutterTts flutterTts = FlutterTts();
  int currentIndex = 0;
  Future _speak(String text) async {
    await flutterTts.setLanguage("en-US");
    double speechRate = 0.5;
    await flutterTts.setSpeechRate(speechRate);
    await flutterTts.setPitch(1.0);
    await flutterTts.speak(text);
  }

  List<String> aktivitasList = [
    'Bangun Tidur',
    'Berdoa',
    'Berjalan',
    'Berkumpul',
    'Berlari',
    'Berteriak',
    'Duduk',
    'Keluar',
    'Makan',
    'Mandi',
    'Melempar',
    'Melepaskan',
    'Meletus',
    'Meloncat',
    'Memadamkan',
    'Memakai',
    'Memanggang',
    'Memasak',
    'Memasuki',
    'Mematahkan',
    // ... tambahkan daftar aktivitas hingga Aktivitas 20
  ];

  List<String> gambarActivities = [
    'assets/images/BangunTidur.png',
    'assets/images/Berdoa.png',
    'assets/images/Berjalan.png',
    'assets/images/Berkumpul.png',
    'assets/images/Berlari.png',
    'assets/images/Berteriak.png',
    'assets/images/Duduk.png',
    'assets/images/Keluar.png',
    'assets/images/Makan.png',
    'assets/images/Mandi.png',
    'assets/images/Melempar.png',
    'assets/images/Melepaskan.png',
    'assets/images/Meletus.png',
    'assets/images/Meloncat.png',
    'assets/images/Memadamkan.png',
    'assets/images/Memakai.png',
    'assets/images/Memanggang.png',
    'assets/images/Memasak.png',
    'assets/images/Memasuki.png',
    'assets/images/Mematahkan.png',
    // ... tambahkan daftar gambar sesuai dengan aktivitas hingga Aktivitas 20
  ];

  void showActivityDialog(BuildContext context, int index) {
    List<String> titles = [
      'Activity',
      'Activity',
      'Activity',
      'Activity',
      'Activity',
      'Activity',
      'Activity',
      'Activity',
      'Activity',
      'Activity',
      'Activity',
      'Activity',
      'Activity',
      'Activity',
      'Activity',
      'Activity',
      'Activity',
      'Activity',
      'Activity',
      'Activity',
    ];
    List<String> activitiesList = [
      'Wake Up',
      'Pray',
      'Walk',
      'Gather',
      'Run',
      'Shout',
      'Sit',
      'Go Out',
      'Eat',
      'Take a Bath',
      'Throw',
      'Release',
      'Explode',
      'Jump',
      'Extinguish',
      'Wear',
      'Bake',
      'Cook',
      'Enter',
      'Break',
    ];
    List<String> phoneticSymbols = [
      '/weik up/',
      '/prei/',
      '/walk/',
      '/ˈɡather/',
      '/run/',
      '/ʃaʊt/',
      '/sɪt/',
      '/ɡoʊ aʊt/',
      '/iːt/',
      '/teɪk ə bæθ/',
      '/θroʊ/',
      '/rɪˈliːs/',
      '/ɪkˈsploʊd/',
      '/dʒʌmp/',
      '/ɪkˈstɪŋɡwɪʃ/',
      '/wɛr/',
      '/beɪk/',
      '/kʊk/',
      '/ˈɛntər/',
      '/breɪk/',
    ];

    List<String> meanings = [
      'To awaken from sleep.',
      'To pray or worship to God.',
      'To move on foot.',
      'To assemble or collect people or things.',
      'To move quickly or compete in a race.',
      'To yell or raise one\'s voice loudly.',
      'To be in a seated position.',
      'To exit or leave a place.',
      'To consume food.',
      'To bathe or clean oneself with water.',
      'To toss or hurl something.',
      'To let go or set free from something.',
      'To burst or blow up with force.',
      'To leap or hop from one place to another.',
      'To put out, quench, or completely suppress a fire, flame, or light.',
      'To put on or dress in clothes or accessories.',
      'To cook or prepare food using an oven.',
      'To prepare or make food.',
      'To go into or get inside a place.',
      'To fracture or damage something until it\'s not whole.',
    ];

    List<String> examples = [
      'I wake up at 06:00.',
      'I pray when I want to eat, sleep, and after waking up.',
      'I walk to the park.',
      'I gather with friends.',
      'I run with my brother/sister in the park.',
      'I shout because there\'s a cockroach in front of me.',
      'I sit together with friends.',
      'I go out of the bedroom.',
      'I eat with my family.',
      'I take a bath in the bathroom with my doll.',
      'I throw trash into the trash bin.',
      'I release a balloon into the sky.',
      'This blue balloon explodes.',
      'I jump to get a flower.',
      'I extinguish the fire.',
      'I wear clothes in the bedroom.',
      'I bake meat with friends.',
      'I cook in the kitchen.',
      'I enter the airport.',
      'I break the window glass with a ball.',
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
                  color: Color.fromARGB(255, 202, 208, 104),
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
                      color: Color.fromARGB(255, 202, 208, 104),
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
                            aktivitasList[index],
                            style: const TextStyle(
                              fontSize: 24,
                              fontFamily: 'Dinofont',
                              color: Color.fromARGB(255, 202, 208, 104),
                            ),
                          ),
                          const SizedBox(height: 0),
                          Image.asset(
                            gambarActivities[
                                index], // Use Image.asset to display the image
                            width: MediaQuery.of(context).size.width * 0.50,
                            height: MediaQuery.of(context).size.width * 0.35,
                          ),
                          ElevatedButton(
                            onPressed: () {
                              _speak(activitiesList[index]);
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
                            activitiesList[index],
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 24,
                              fontFamily: 'Dinofont',
                              color: Color.fromARGB(255, 202, 208, 104),
                            ),
                          ),
                          Text(
                            phoneticSymbols[index],
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 18,
                              color: Color.fromARGB(255, 202, 208, 104),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 0),
                  const Text(
                    'Meaning:',
                    style: TextStyle(
                      fontFamily: 'Dinofont',
                      fontSize: 24,
                      color: Color.fromARGB(255, 202, 208, 104),
                    ),
                  ),
                  const SizedBox(height: 0),
                  Text(
                    meanings[index],
                    style: const TextStyle(
                      fontFamily: 'Dinofont',
                      fontSize: 16,
                      color: Color.fromARGB(255, 202, 208, 104),
                    ),
                  ),
                  const SizedBox(height: 0),
                  const Text(
                    'Example:',
                    style: TextStyle(
                      fontFamily: 'Dinofont',
                      fontSize: 24,
                      color: Color.fromARGB(255, 202, 208, 104),
                    ),
                  ),
                  const SizedBox(height: 0),
                  Text(
                    examples[index],
                    style: const TextStyle(
                      fontFamily: 'Dinofont',
                      fontSize: 16,
                      color: Color.fromARGB(255, 202, 208, 104),
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
                            const Color.fromARGB(255, 202, 208, 104),
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
                        if (index < activitiesList.length - 1) {
                          setState(() {
                            index++;
                          });
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        foregroundColor: const Color(0xFF07553B),
                        backgroundColor:
                            const Color.fromARGB(255, 202, 208, 104),
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
            color: const Color.fromARGB(255, 202, 208, 104),
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
                      'Activity',
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
          // Membuat 20 kotak yang tersusun atas 4 slide secara horizontal
          Positioned.fill(
            top: 85,
            child: PageView.builder(
              controller: PageController(viewportFraction: 1.3),
              itemCount: (aktivitasList.length / 6).ceil(),
              itemBuilder: (context, pageIndex) {
                final startIndex = pageIndex * 6;
                final endIndex = (pageIndex + 1) * 6;
                final visibleAktivitas = aktivitasList.sublist(
                  startIndex,
                  endIndex > aktivitasList.length
                      ? aktivitasList.length
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
                          showActivityDialog(context, itemIndex);
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
                                gambarActivities[itemIndex],
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
