import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

class RuanganDiRumah extends StatefulWidget {
  const RuanganDiRumah({super.key});

  @override
  State<RuanganDiRumah> createState() => _RuanganDiRumahState();
}

class _RuanganDiRumahState extends State<RuanganDiRumah> {
  FlutterTts flutterTts = FlutterTts();
  int currentIndex = 0;
  Future _speak(String text) async {
    await flutterTts.setLanguage("en-US");
    double speechRate = 0.5;
    await flutterTts.setSpeechRate(speechRate);
    await flutterTts.setPitch(1.0);
    await flutterTts.speak(text);
  }

  List<String> ruangandirumahList = [
    'Dapur',
    'Garasi',
    'Gudang',
    'Kamar Anak',
    'Kamar Mandi',
    'Kamar Orangtua',
    'Kamar Tamu',
    'Ruang Baca',
    'Ruang Belajar',
    'Ruang Cuci',
    'Ruang Kecantikan',
    'Ruang Keluarga ',
    'Ruang Kerja',
    'Ruang Mainan',
    'Ruang Makan',
    'Ruang Musik',
    'Ruang Olahraga',
    'Ruang Tamu',
    'Taman',
    'Teras',
    // ... tambahkan daftar Ruangan di Rumah hingga Ruangan di Rumah 20
  ];

  List<String> gambarRuangandiRumah = [
    'assets/images/Dapur.png',
    'assets/images/Garasi.png',
    'assets/images/Gudang.png',
    'assets/images/Kamar Anak.png',
    'assets/images/Kamar Mandi.png',
    'assets/images/Kamar Orangtua.png',
    'assets/images/Kamar Tamu.png',
    'assets/images/Ruang Baca.png',
    'assets/images/Ruang Belajar.png',
    'assets/images/Ruang Cuci.png',
    'assets/images/Ruang Kecantikan.png',
    'assets/images/Ruang Keluarga.png',
    'assets/images/Ruang Kerja.png',
    'assets/images/Ruang Mainan.png',
    'assets/images/Ruang Makan.png',
    'assets/images/Ruang Musik.png',
    'assets/images/Ruang Olahraga.png',
    'assets/images/Ruang Tamu.png',
    'assets/images/Taman.png',
    'assets/images/Teras.png',
    // ... tambahkan daftar gambar sesuai dengan Ruangan di Rumah hingga Ruangan di Rumah 20
  ];

  void showRoomDialog(BuildContext context, int index) {
    List<String> titles = [
      'Room at Home',
      'Room at Home',
      'Room at Home',
      'Room at Home',
      'Room at Home',
      'Room at Home',
      'Room at Home',
      'Room at Home',
      'Room at Home',
      'Room at Home',
      'Room at Home',
      'Room at Home',
      'Room at Home',
      'Room at Home',
      'Room at Home',
      'Room at Home',
      'Room at Home',
      'Room at Home',
      'Room at Home',
      'Room at Home',
    ];
    List<String> roomList = [
      'Kitchen',
      'Garage',
      'Storage',
      "Children's Room",
      'Bathroom',
      "Master Bedroom",
      'Guest Bedroom',
      'Reading Room',
      'Study Room',
      'Laundry Room',
      'Beauty Room',
      'Family Room',
      'Home Office',
      'Playroom',
      'Dining Room',
      'Music Room',
      'Exercise Room',
      'Living Room',
      'Garden',
      'Terrace',
    ];
    List<String> phoneticSymbols = [
      '/ˈkɪtʃən/',
      '/ˈɡærɪdʒ/',
      '/ˈstɔrɪdʒ/',
      '/ˈʧɪldrənz ruːm/',
      '/ˈbæθruːm/',
      '/ˈmæstər ˈbɛdruːm/',
      '/ɡɛst ˈbɛdruːm/',
      '/ˈriːdɪŋ ruːm/',
      '/ˈstʌdi ruːm/',
      '/ˈlɔːndri ruːm/',
      '/ˈbjuːti ruːm/',
      '/ˈfæməli ruːm/',
      '/hoʊm ˈɔːfɪs/',
      '/pleɪ ruːm/',
      '/ˈdaɪnɪŋ ruːm/',
      '/ˈmjuːzɪk ruːm/',
      '/ˈɛksərsaɪz ruːm/',
      '/ˈlɪvɪŋ ruːm/',
      '/ˈɡɑːrdən/',
      '/ˈter.əs/',
    ];

    List<String> meanings = [
      'A room used for cooking and food preparation.',
      'A place to park and store vehicles.',
      'A space for storing items or materials.',
      'A room designed for children to sleep and play in.',
      'A space for personal hygiene activities.',
      'The main bedroom of the house, typically for parents.',
      'A bedroom intended for guests.',
      'A room designated for reading and studying.',
      'A dedicated room for studying and learning.',
      'A room equipped with laundry appliances.',
      'A room designated for beauty and personal care.',
      'A communal space for family members to gather.',
      'A room used for work and business-related tasks.',
      'A designated area for children to play and engage in activities.',
      'A space for dining and enjoying meals.',
      'A room equipped with musical instruments.',
      'A room designed for exercise and physical activities.',
      'A common area for relaxation and socializing.',
      'An outdoor space typically with plants and greenery.',
      'An outdoor area often attached to the house.',
    ];

    List<String> examples = [
      "I'm preparing dinner in the kitchen.",
      'The garage is where we keep our car.',
      'The storage room is filled with boxes.',
      'My children love their colorful bedroom.',
      "I'll be in the bathroom getting ready.",
      'Our master bedroom has a king-sized bed.',
      'The guest bedroom is ready for visitors.',
      'I like to read in the cozy reading room.',
      'He studies in the quiet study room.',
      "I'm doing laundry in the laundry room.",
      'She has a beauty room for her skincare routine.',
      'We gather in the family room to watch movies.',
      'My home office is where I work remotely.',
      'The playroom is filled with toys and games.',
      'We enjoy meals together in the dining room.',
      'I practice playing the piano in the music room.',
      'I exercise in the home gym in the basement.',
      'Guests are welcomed in the living room.',
      'We relax in the garden on weekends.',
      'The outdoor terrace makes it a rare treat on a sunny day.',
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
                            ruangandirumahList[index],
                            style: const TextStyle(
                              fontSize: 24,
                              fontFamily: 'Dinofont',
                              color: Color.fromARGB(255, 206, 212, 106),
                            ),
                          ),
                          const SizedBox(height: 0),
                          Image.asset(
                            gambarRuangandiRumah[
                                index], // Use Image.asset to display the image
                            width: MediaQuery.of(context).size.width * 0.50,
                            height: MediaQuery.of(context).size.width * 0.35,
                          ),
                          ElevatedButton(
                            onPressed: () {
                              _speak(roomList[index]);
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
                            roomList[index],
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
                      fontSize: 2,
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
                        if (index < ruangandirumahList.length - 1) {
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
                      'Room at Home',
                      style: TextStyle(
                        color: Color(0xFF07553B),
                        fontSize: 30,
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
              itemCount: (ruangandirumahList.length / 6).ceil(),
              itemBuilder: (context, pageIndex) {
                final startIndex = pageIndex * 6;
                final endIndex = (pageIndex + 1) * 6;
                final visibleRuangandirumah = ruangandirumahList.sublist(
                  startIndex,
                  endIndex > ruangandirumahList.length
                      ? ruangandirumahList.length
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
                    children:
                        List.generate(visibleRuangandirumah.length, (index) {
                      final itemIndex = startIndex + index;
                      return GestureDetector(
                        onTap: () {
                          showRoomDialog(context, itemIndex);
                        },
                        child: Container(
                          color: Colors.transparent,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                visibleRuangandirumah[index],
                                style: const TextStyle(
                                  color: Color(0xFF07553B),
                                  fontSize: 18,
                                  fontFamily: 'Dinofont',
                                ),
                              ),
                              const SizedBox(height: 0),
                              Image.asset(
                                gambarRuangandiRumah[itemIndex],
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
