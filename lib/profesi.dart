import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

class Profesi extends StatefulWidget {
  const Profesi({super.key});

  @override
  State<Profesi> createState() => _ProfesiState();
}

class _ProfesiState extends State<Profesi> {
  FlutterTts flutterTts = FlutterTts();
  int currentIndex = 0;
  Future _speak(String text) async {
    await flutterTts.setLanguage("en-US");
    double speechRate = 0.5;
    await flutterTts.setSpeechRate(speechRate);
    await flutterTts.setPitch(1.0);
    await flutterTts.speak(text);
  }

  List<String> profesiList = [
    'Ahli Astronomi',
    'Ahli Kebun Binatang',
    'Ahli Ruang Angkasa',
    'Aktor',
    'Dokter',
    'Fotografer',
    'Guru',
    'Koki',
    'Montir',
    'Pelaut',
    'Pemadam Kebakaran',
    'Penari',
    'Penjahit',
    'Penyanyi',
    'Petani',
    'Petugas Pos',
    'Pilot',
    'Polisi',
    'Sipir',
    'Tukang Kayu',
    // ... tambahkan daftar Profesi hingga Profesi 20
  ];

  List<String> gambarProfesi = [
    'assets/images/Ahli Astronomi.png',
    'assets/images/Ahli Kebun Binatang.png',
    'assets/images/Ahli Ruang Angkasa.png',
    'assets/images/Aktor.png',
    'assets/images/Dokter.png',
    'assets/images/Fotografer.png',
    'assets/images/Guru.png',
    'assets/images/Koki.png',
    'assets/images/Montir.png',
    'assets/images/Pelaut.png',
    'assets/images/Pemadam Kebakaran.png',
    'assets/images/Penari.png',
    'assets/images/Penjahit.png',
    'assets/images/Penyanyi.png',
    'assets/images/Petani.png',
    'assets/images/Petugas Pos.png',
    'assets/images/Pilot.png',
    'assets/images/Polisi.png',
    'assets/images/Sipir.png',
    'assets/images/Tukang Kayu.png',
    // ... tambahkan daftar gambar sesuai dengan Profesi hingga Profesi 20
  ];

  void showProfessionDialog(BuildContext context, int index) {
    List<String> titles = [
      'Profession',
      'Profession',
      'Profession',
      'Profession',
      'Profession',
      'Profession',
      'Profession',
      'Profession',
      'Profession',
      'Profession',
      'Profession',
      'Profession',
      'Profession',
      'Profession',
      'Profession',
      'Profession',
      'Profession',
      'Profession',
      'Profession',
      'Profession',
    ];
    List<String> professionList = [
      'Astronomer',
      'Zookeeper',
      'Astronaut',
      'Actor',
      'Doctor',
      'Photographer',
      'Teacher',
      'Chef',
      'Mechanic',
      'Sailor',
      'Firefighter',
      'Dancer',
      'Tailor',
      'Singer',
      'Farmer',
      'Postman',
      'Pilot',
      'Police',
      'Guard',
      'Carpenter',
    ];
    List<String> phoneticSymbols = [
      '/əˈstrɒn.ə.mər/',
      '/ˈzuːˌkiː.pər/',
      '/ˈæs.trə.nɔːt/',
      '/ˈæk.tər/',
      '/ˈdɒk.tər/',
      '/fəˈtɒɡ.rə.fər/',
      '/ˈtiː.tʃər/',
      '/ʃɛf/',
      '/məˈkæn.ɪk/',
      '/ˈseɪ.lər/',
      '/ˈfaɪə.faɪ.tər/',
      '/ˈdæn.sər/',
      '/ˈteɪ.lər/',
      '/ˈsɪŋ.ər/',
      '/ˈfɑːr.mər/',
      '/ˈpəʊst.mən/',
      '/ˈpaɪ.lət/',
      '/pəˈliːs/',
      '/ɡɑːrd/',
      '/ˈkɑː.pən.tər/',
    ];

    List<String> meanings = [
      'An astronomy expert who studies celestial objects and the universe.',
      'A caretaker of a zoo who looks after the animals.',
      'A space explorer who ventures into outer space.',
      'An actor or actress who performs in theater, movies, or television.',
      'Someone who provides medical care and treats illnesses.',
      'A person who takes photos with a camera.',
      'A person who provides education and teaches subjects to students.',
      'A chef or cook who prepares food according to specific recipes.',
      'A technician who repairs and maintains machines or vehicles.',
      'A person who works on a ship or boat and sails on the sea.',
      'A firefighter who extinguishes fires and saves lives.',
      'A performer who expresses themselves through dance movements.',
      'A seamstress who creates or repairs clothing according to orders.',
      'Someone who sings for entertainment or performances.',
      'A farmer who cultivates and takes care of plants and animals on a farm.',
      'A postal worker who delivers letters and packages to recipients.',
      'A person who operates and controls aircraft.',
      'An officer who maintains law and order in the community.',
      'Someone who watches over and ensures the security of a place.',
      'A woodworker who creates and repairs various objects from wood.',
    ];

    List<String> examples = [
      'The astronomer observed the stars through a telescope.',
      'The zookeeper fed the lions and cleaned their enclosure.',
      'The astronaut conducted experiments on the International Space Station.',
      'The actor portrayed a brave knight in the play.',
      "The doctor examined the patient's throat and prescribed medicine.",
      'The photographer captured stunning landscapes during the trip.',
      'The teacher explained the math problem to the students.',
      'The chef prepared a delicious meal for the restaurant guests.',
      "The mechanic fixed the car's engine so it could run smoothly.",
      'The sailor navigated the ship through rough seas.',
      'The firefighter quickly extinguished the fire in the building.',
      'The dancer gracefully moved across the stage during the ballet.',
      'The tailor sewed a new dress for the customer.',
      'The singer performed a beautiful song on the stage.',
      'The farmer harvested ripe tomatoes from the garden.',
      'The postman delivered the package to our doorstep.',
      'The pilot safely landed the airplane at the airport.',
      'The police officer helped direct traffic during the parade.',
      "The guard checked everyone's ID before allowing them inside.",
      'The carpenter built a sturdy wooden table.',
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
                            profesiList[index],
                            style: const TextStyle(
                              fontSize: 24,
                              fontFamily: 'Dinofont',
                              color: Color.fromARGB(255, 206, 212, 106),
                            ),
                          ),
                          const SizedBox(height: 0),
                          Image.asset(
                            gambarProfesi[
                                index], // Use Image.asset to display the image
                            width: MediaQuery.of(context).size.width * 0.50,
                            height: MediaQuery.of(context).size.width * 0.35,
                          ),
                          ElevatedButton(
                            onPressed: () {
                              _speak(professionList[index]);
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
                            professionList[index],
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 22,
                              fontFamily: 'Dinofont',
                              color: Color.fromARGB(255, 206, 212, 106),
                            ),
                          ),
                          Text(
                            phoneticSymbols[index],
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 18,
                              color: Color.fromARGB(255, 206, 212, 106),
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
                        if (index < profesiList.length - 1) {
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
                      'Profession',
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
              itemCount: (profesiList.length / 6).ceil(),
              itemBuilder: (context, pageIndex) {
                final startIndex = pageIndex * 6;
                final endIndex = (pageIndex + 1) * 6;
                final visibleProfesi = profesiList.sublist(
                  startIndex,
                  endIndex > profesiList.length ? profesiList.length : endIndex,
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
                    children: List.generate(visibleProfesi.length, (index) {
                      final itemIndex = startIndex + index;
                      return GestureDetector(
                        onTap: () {
                          showProfessionDialog(context, itemIndex);
                        },
                        child: Container(
                          color: Colors.transparent,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                visibleProfesi[index],
                                style: const TextStyle(
                                  color: Color(0xFF07553B),
                                  fontSize: 18,
                                  fontFamily: 'Dinofont',
                                ),
                              ),
                              const SizedBox(height: 0),
                              Image.asset(
                                gambarProfesi[itemIndex],
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
