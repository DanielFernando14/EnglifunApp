import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

class Keluarga extends StatefulWidget {
  const Keluarga({super.key});

  @override
  State<Keluarga> createState() => _KeluargaState();
}

class _KeluargaState extends State<Keluarga> {
  FlutterTts flutterTts = FlutterTts();
  int currentIndex = 0;
  Future _speak(String text) async {
    await flutterTts.setLanguage("en-US");
    double speechRate = 0.5;
    await flutterTts.setSpeechRate(speechRate);
    await flutterTts.setPitch(1.0);
    await flutterTts.speak(text);
  }

  List<String> keluargaList = [
    'Adik laki laki',
    'Adik Perempuan',
    'Anak Laki laki',
    'Anak Perempuan',
    'Ayah',
    'Bibi',
    'Cucu laki laki',
    'Cucu Perempuan',
    'Ibu',
    'Istri',
    'Kakak Laki laki',
    'Kakak Perempuan',
    'Kakek',
    'Nenek',
    'Paman',
    'Saudara Ipar \n Laki laki',
    'Saudara Ipar \n Perempuan',
    'Sepupu Laki laki',
    'Sepupu Perempuan',
    'Suami',
    // ... tambahkan daftar Keluarga hingga Keluarga 20
  ];

  List<String> gambarKeluarga = [
    'assets/images/Adik Laki Laki.png',
    'assets/images/Adik Perempuan.png',
    'assets/images/Anak Laki Laki.png',
    'assets/images/Anak Perempuan.png',
    'assets/images/Ayah.png',
    'assets/images/Bibi.png',
    'assets/images/Cucu Laki Laki.png',
    'assets/images/Cucu Perempuan.png',
    'assets/images/Ibu.png',
    'assets/images/Istri.png',
    'assets/images/Kakak Laki Laki.png',
    'assets/images/Kakak Perempuan.png',
    'assets/images/Kakek.png',
    'assets/images/Nenek.png',
    'assets/images/Paman.png',
    'assets/images/Saudara Ipar Laki Laki.png',
    'assets/images/Saudara Ipar Perempuan.png',
    'assets/images/Sepupu Laki Laki.png',
    'assets/images/Sepupu Perempuan.png',
    'assets/images/Suami.png',
    // ... tambahkan daftar gambar sesuai dengan Keluarga hingga Keluarga 20
  ];

  void showFamilyDialog(BuildContext context, int index) {
    List<String> titles = [
      'Family',
      'Family',
      'Family',
      'Family',
      'Family',
      'Family',
      'Family',
      'Family',
      'Family',
      'Family',
      'Family',
      'Family',
      'Family',
      'Family',
      'Family',
      'Family',
      'Family',
      'Family',
      'Family',
      'Family',
    ];
    List<String> familyList = [
      'Younger brother',
      'Younger sister',
      'Son',
      'Daughter',
      'Father',
      'Aunt',
      'Grandson',
      'Granddaughter',
      'Mother',
      'Wife',
      'Older brother',
      'Older sister',
      'Grandfather',
      'Grandmother',
      'Uncle',
      'Brother-in-law',
      'Sister-in-law',
      'Male cousin',
      'Female cousin',
      'Husband',
    ];
    List<String> phoneticSymbols = [
      '/ˈjʌŋɡər ˈbrʌðər/',
      '/ˈjʌŋɡər ˈsɪstər/',
      '/sʌn/',
      '/ˈdɔːtər/',
      '/ˈfɑːðər/',
      '/ænt/',
      '/ˈɡrændsʌn/',
      '/ˈɡrændˌdɔːtər/',
      '/ˈmʌðər/',
      '/waɪf/',
      '/ˈoʊldər ˈbrʌðər/',
      '/ˈoʊldər ˈsɪstər/',
      '/ˈɡrændˌfɑːðər/',
      '/ˈɡrændˌmʌðər/',
      '/ˈʌŋkəl/',
      '/ˈbrʌðər ɪn lɔː/',
      '/ˈsɪstər ɪn lɔː/',
      '/meɪl ˈkʌzn/',
      '/ˈfiːmeɪl ˈkʌzn/',
      '/ˈhʌz.bənd/',
    ];

    List<String> meanings = [
      'A younger male sibling.',
      'A younger female sibling.',
      'A male offspring.',
      'A female offspring.',
      'A male parent.',
      "A parent's sister, or the spouse of one's uncle.",
      'A male grandchild.',
      'A female grandchild.',
      'A female parent.',
      'The female spouse in a marriage.',
      'An older male sibling.',
      'An older female sibling.',
      'A male grandparent.',
      'A female grandparent.',
      "A parent's brother, or the spouse of one's aunt.",
      "The husband of one's sibling.",
      "The wife of one's sibling.",
      "A male child of one's uncle or aunt.",
      "A female child of one's uncle or aunt.",
      "The male spouse in a marriage.",
    ];

    List<String> examples = [
      'My younger brother enjoys playing soccer.',
      'My younger sister loves to read books.',
      'He is a devoted son who takes care of his parents.',
      'She is a talented artist and a loving daughter.',
      'My father works as a doctor at the local hospital.',
      'My aunt teaches mathematics at a high school.',
      'The proud grandfather enjoys spending time with his grandson.',
      'The grandmother bakes cookies with her granddaughters.',
      'She is a kind and caring mother who always puts family first.',
      'My wife is an amazing cook and a supportive partner.',
      'My older brother is a successful entrepreneur.',
      'My older sister is a lawyer and a role model for me.',
      'The wise grandfather tells us fascinating stories from his youth.',
      'The grandmother knits blankets for her grandchildren.',
      'My uncle is a talented musician and plays the guitar.',
      'My brother-in-law helps me with home repairs.',
      'My sister-in-law is a talented chef who owns a restaurant.',
      'My male cousin and I enjoy playing video games together.',
      'My female cousin is a skilled dancer who performs at events.',
      'My husband is a hardworking engineer and a loving partner.',
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
                            keluargaList[index],
                            style: const TextStyle(
                              fontSize: 24,
                              fontFamily: 'Dinofont',
                              color: Color.fromARGB(255, 206, 212, 106),
                            ),
                          ),
                          const SizedBox(height: 0),
                          Image.asset(
                            gambarKeluarga[
                                index], // Use Image.asset to display the image
                            width: MediaQuery.of(context).size.width * 0.50,
                            height: MediaQuery.of(context).size.width * 0.35,
                          ),
                          ElevatedButton(
                            onPressed: () {
                              _speak(familyList[index]);
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
                            familyList[index],
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
                        if (index < keluargaList.length - 1) {
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
                      'Family',
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
              itemCount: (keluargaList.length / 6).ceil(),
              itemBuilder: (context, pageIndex) {
                final startIndex = pageIndex * 6;
                final endIndex = (pageIndex + 1) * 6;
                final visibleKeluarga = keluargaList.sublist(
                  startIndex,
                  endIndex > keluargaList.length
                      ? keluargaList.length
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
                    children: List.generate(visibleKeluarga.length, (index) {
                      final itemIndex = startIndex + index;
                      return GestureDetector(
                        onTap: () {
                          showFamilyDialog(context, itemIndex);
                        },
                        child: Container(
                          color: Colors.transparent,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                visibleKeluarga[index],
                                style: const TextStyle(
                                  color: Color(0xFF07553B),
                                  fontSize: 18,
                                  fontFamily: 'Dinofont',
                                ),
                              ),
                              const SizedBox(height: 0),
                              Image.asset(
                                gambarKeluarga[itemIndex],
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
