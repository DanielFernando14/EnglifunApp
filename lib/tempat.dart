import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

class Tempat extends StatefulWidget {
  const Tempat({super.key});

  @override
  State<Tempat> createState() => _TempatState();
}

class _TempatState extends State<Tempat> {
  FlutterTts flutterTts = FlutterTts();
  int currentIndex = 0;
  Future _speak(String text) async {
    await flutterTts.setLanguage("en-US");
    double speechRate = 0.5;
    await flutterTts.setSpeechRate(speechRate);
    await flutterTts.setPitch(1.0);
    await flutterTts.speak(text);
  }

  List<String> tempatList = [
    'Gereja',
    'Kebun Binatang',
    'Klenteng',
    'Kolam Renang',
    'Masjid',
    'Museum',
    'Pantai',
    'Pasar Modern',
    'Pasar Tradisional',
    'Pegunungan',
    'Pelabuhan',
    'Perpustakaan',
    'Pura',
    'Rumah',
    'Rumah Sakit',
    'Sekolah',
    'Stadion',
    'Taman',
    'Toko Mainan',
    'Vihara',
    // ... tambahkan daftar Tempat hingga Tempat 20
  ];

  List<String> gambarTempat = [
    'assets/images/Gereja.png',
    'assets/images/Kebun Binatang.png',
    'assets/images/Klenteng.png',
    'assets/images/Kolam Renang.png',
    'assets/images/Masjid.png',
    'assets/images/Museum.png',
    'assets/images/Pantai.png',
    'assets/images/Pasar Modern.png',
    'assets/images/Pasar Tradisional.png',
    'assets/images/Pegunungan.png',
    'assets/images/Pelabuhan.png',
    'assets/images/Perpustakaan.png',
    'assets/images/Pura.png',
    'assets/images/Rumah.png',
    'assets/images/Rumah Sakit.png',
    'assets/images/Sekolah.png',
    'assets/images/Stadion.png',
    'assets/images/Taman.png',
    'assets/images/Toko Mainan.png',
    'assets/images/Vihara.png',
    // ... tambahkan daftar gambar sesuai dengan Tempat hingga Tempat 20
  ];

  void showPlaceDialog(BuildContext context, int index) {
    List<String> titles = [
      'Place',
      'Place',
      'Place',
      'Place',
      'Place',
      'Place',
      'Place',
      'Place',
      'Place',
      'Place',
      'Place',
      'Place',
      'Place',
      'Place',
      'Place',
      'Place',
      'Place',
      'Place',
      'Place',
      'Place',
    ];
    List<String> placeList = [
      'Church',
      'Zoo',
      'Chinese Temple',
      'Swimming Pool',
      'Mosque',
      'Museum',
      'Beach',
      'Supermarket',
      'Traditional Market',
      'Mountains',
      'Port',
      'Library',
      'Hindu Temple',
      'House',
      'Hospital',
      'School',
      'Stadium',
      'Park',
      'Toy Store',
      'Buddhist Temple',
    ];
    List<String> phoneticSymbols = [
      '/tʃɜːrtʃ/',
      '/zuː/',
      '/ˌʧaɪˈniːz ˈtɛmpəl/',
      '/ˈswɪmɪŋ puːl/',
      '/mɒsk/',
      '/mjuːˈziːəm/',
      '/biːʧ/',
      '/ˈsuːpəˌmɑːrkɪt/',
      '/trəˈdɪʃənl ˈmɑrkɪt/',
      '/ˈmaʊntɪnz/',
      '/pɔrt/',
      '/ˈlaɪbrəri/',
      '/ˈhɪnduː ˈtɛmpəl/',
      '/haʊs/',
      '/ˈhɒspɪtl/',
      '/skuːl/',
      '/ˈsteɪdiəm/',
      '/pɑːrk/',
      '/tɔɪ stɔːr/',
      '/ˈbʊdɪst ˈtɛmpəl/',
    ];

    List<String> meanings = [
      'A place of worship for Christians.',
      'A place where animals from around the world are kept for people to see.',
      'A place of worship for people who follow Chinese traditions..',
      'A place with water where people can swim and have fun.',
      'A place of worship for Muslims.',
      'A place where historical artifacts and art are displayed.',
      'A sandy area near the sea or ocean.',
      'A large store where a variety of goods and groceries are sold.',
      'A market where local vendors sell fresh produce, goods.',
      'Large landforms that rise high above the surrounding landscape.',
      'A place to load and unload cargo or passengers.',
      'A place where books and other materials are available for borrowing.',
      'A place of worship for people who follow Hindu traditions.',
      'A place where people live.',
      'A place where people receive medical treatment and care.',
      'A place where students go to learn.',
      'A large arena where sports events and concerts take place.',
      'A public area with open spaces for outdoor activities and relaxation.',
      'A shop where various toys are sold.',
      'A place of worship for people who follow Buddhist traditions.',
    ];

    List<String> examples = [
      'We go to the church every Sunday for prayers.',
      "Let's visit the zoo to see lions, tigers, and elephants.",
      'During festivals, people gather at the Chinese temple to offer prayers.',
      'We love going to the swimming pool to cool off on hot days.',
      'The community gathers at the mosque for Friday prayers.',
      'We learned about ancient history by visiting the museum.',
      'We built sandcastles at the beach and played in the waves.',
      'We went to the supermarket to buy groceries for the week.',
      'People in the village often shop for vegetables and fruits at the traditional market.',
      'We went hiking in the mountains and enjoyed the breathtaking views.',
      'The large cargo ships docked at the port to unload their containers.',
      'I borrowed some books from the library to read during my vacation.',
      'Families visit the Hindu temple to offer prayers and seek blessings.',
      'Our house has a garden where we grow flowers and vegetables.',
      'She was admitted to the hospital for a minor surgery.',
      'I enjoy going to school and learning new things every day.',
      'The stadium was filled with cheering fans during the soccer match.',
      'We had a picnic in the park and played frisbee.',
      'My parents took me to the toy store to choose a new game.',
      'Visitors light incense and offer prayers at the Buddhist temple.',
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
                            tempatList[index],
                            style: const TextStyle(
                              fontSize: 24,
                              fontFamily: 'Dinofont',
                              color: Color.fromARGB(255, 206, 212, 106),
                            ),
                          ),
                          const SizedBox(height: 0),
                          Image.asset(
                            gambarTempat[
                                index], // Use Image.asset to display the image
                            width: MediaQuery.of(context).size.width * 0.50,
                            height: MediaQuery.of(context).size.width * 0.35,
                          ),
                          ElevatedButton(
                            onPressed: () {
                              _speak(placeList[index]);
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
                            placeList[index],
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
                        if (index < tempatList.length - 1) {
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
                      'Place',
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
              itemCount: (tempatList.length / 6).ceil(),
              itemBuilder: (context, pageIndex) {
                final startIndex = pageIndex * 6;
                final endIndex = (pageIndex + 1) * 6;
                final visibleTempat = tempatList.sublist(
                  startIndex,
                  endIndex > tempatList.length ? tempatList.length : endIndex,
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
                    children: List.generate(visibleTempat.length, (index) {
                      final itemIndex = startIndex + index;
                      return GestureDetector(
                        onTap: () {
                          showPlaceDialog(context, itemIndex);
                        },
                        child: Container(
                          color: Colors.transparent,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                visibleTempat[index],
                                style: const TextStyle(
                                  color: Color(0xFF07553B),
                                  fontSize: 18,
                                  fontFamily: 'Dinofont',
                                ),
                              ),
                              const SizedBox(height: 0),
                              Image.asset(
                                gambarTempat[itemIndex],
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
