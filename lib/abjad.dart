import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

class Abjad extends StatefulWidget {
  const Abjad({super.key});

  @override
  State<Abjad> createState() => _AbjadState();
}

class _AbjadState extends State<Abjad> {
  FlutterTts flutterTts = FlutterTts();
  int currentIndex = 0;

  List<String> abjadList = [
    'A',
    'B',
    'C',
    'D',
    'E',
    'F',
    'G',
    'H',
    'I',
    'J',
    'K',
    'L',
    'M',
    'N',
    'O',
    'P',
    'Q',
    'R',
    'S',
    'T',
    'U',
    'V',
    'W',
    'X',
    'Y',
    'Z'
  ];

  List<String> gambarAbjad = [
    'assets/images/A.png',
    'assets/images/B.png',
    'assets/images/C.png',
    'assets/images/D.png',
    'assets/images/E.png',
    'assets/images/F.png',
    'assets/images/G.png',
    'assets/images/H.png',
    'assets/images/I.png',
    'assets/images/J.png',
    'assets/images/K.png',
    'assets/images/L.png',
    'assets/images/M.png',
    'assets/images/N.png',
    'assets/images/O.png',
    'assets/images/P.png',
    'assets/images/Q.png',
    'assets/images/R.png',
    'assets/images/S.png',
    'assets/images/T.png',
    'assets/images/U.png',
    'assets/images/V.png',
    'assets/images/W.png',
    'assets/images/X.png',
    'assets/images/Y.png',
    'assets/images/Z.png'
  ];

  List<String> alphabetList = [
    'Ey',
    'Bee',
    'See',
    'Dee',
    'Ee',
    'Ef',
    'Jee',
    'Eych',
    'Ai',
    'Jei',
    'Kei',
    'El',
    'Em',
    'En',
    'Ou',
    'Pee',
    'Kyu',
    'Aar',
    'Es',
    'Tee',
    'Yoo',
    'Vee',
    'Dah-blyoo',
    'Eks',
    'Wai',
    'Zee'
  ];

  List<String> phoneticSymbols = [
    '/eɪ/',
    '/biː/',
    '/siː/',
    '/diː/',
    '/iː/',
    '/ɛf/',
    '/dʒiː/',
    '/eɪtʃ/',
    '/aɪ/',
    '/dʒeɪ/',
    '/keɪ/',
    '/ɛl/',
    '/ɛm/',
    '/ɛn/',
    '/oʊ/',
    '/piː/',
    '/kjuː/',
    '/ɑr/',
    '/ɛs/',
    '/tiː/',
    '/juː/',
    '/viː/',
    '/ˈdʌbəljuː/',
    '/ɛks/',
    '/waɪ/',
    '/zɛɛ/',
  ];

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
                      'Alphabet',
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
          Positioned.fill(
            top: 85,
            child: PageView.builder(
              controller: PageController(viewportFraction: 1.3),
              itemCount: (abjadList.length / 6).ceil(),
              itemBuilder: (context, pageIndex) {
                final startIndex = pageIndex * 6;
                final endIndex = (pageIndex + 1) * 6;
                final visibleAbjad = abjadList.sublist(
                  startIndex,
                  endIndex > abjadList.length ? abjadList.length : endIndex,
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
                    children: List.generate(visibleAbjad.length, (index) {
                      final itemIndex = startIndex + index;
                      return GestureDetector(
                        onTap: () {
                          _showAlphabetDialog(itemIndex);
                        },
                        child: Container(
                          color: Colors.transparent,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    visibleAbjad[index],
                                    style: const TextStyle(
                                      color: Color(0xFF07553B),
                                      fontSize: 18,
                                      fontFamily: 'Dinofont',
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 0),
                              Image.asset(
                                gambarAbjad[itemIndex],
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

  Future _speak(String text) async {
    await flutterTts.setLanguage("en-US");
    double speechRate = 0.5;
    await flutterTts.setSpeechRate(speechRate);
    await flutterTts.setPitch(1.0);
    await flutterTts.speak(text);
  }

  void _showAlphabetDialog(int index) {
    List<String> meanings = [
      'The first letter in the English alphabet',
      'The second letter in the English alphabet',
      'The third letter in the English alphabet.',
      'The fourth letter in the English alphabet.',
      'The fifth letter in the English alphabet',
      'The sixth letter in the English alphabet.',
      'The seventh letter in the English alphabet.',
      'The eighth letter in the English alphabet.',
      'The ninth letter in the English alphabet',
      'The tenth letter in the English alphabet.',
      'The eleventh letter in the English alphabet.',
      'The twelfth letter in the English alphabet.',
      'The thirteenth letter in the English alphabet.',
      'The fourteenth letter in the English alphabet.',
      'The fifteenth letter in the English alphabet',
      'The sixteenth letter in the English alphabet.',
      'The seventeenth letter in the English alphabet.',
      'The eighteenth letter in the English alphabet.',
      'The nineteenth letter in the English alphabet.',
      'The twentieth letter in the English alphabet.',
      'The twenty-first letter in the English alphabet',
      'The twenty-second letter in the English alphabet',
      'The twenty-third letter in the English alphabet.',
      'The twenty-fourth letter in the English alphabet.',
      'The twenty-fifth letter in the English alphabet.',
      'The twenty-sixth letter in the English alphabet.',
    ];

    List<String> examples = [
      'Ani aspires to be a successful entrepreneur.',
      'Budi always dresses modestly and avoids extravagance.',
      'Cindy quickly finds solutions to complex problems.',
      'Doni often donates to charitable organizations.',
      'Eko works efficiently to complete his projects on time.',
      'Fina is always flexible in dealing with changes at her workplace.',
      'Galih is tenacious in studying for exams to achieve high grades.',
      'Hani always brightens the atmosphere with her jokes.',
      'Ira creates innovative products that receive positive responses.',
      'Joko never lies, even in challenging situations.',
      'Krisna always displays his creativity in painting.',
      'Lisa makes decisions based on logical considerations.',
      'Maya has been independent since a young age, living and working on her own.',
      'Nia always listens to her conscience when making decisions.',
      'Oki remains optimistic even in the face of significant challenges.',
      'Putri is always caring about the well-being of her friends.',
      'Qonita has a quirky yet captivating fashion style.',
      'Rudi is very friendly and easy to get along with.',
      'Siti demonstrates patience when teaching children.',
      "Tono is very resilient in overcoming life's obstacles.",
      'Umi has a unique way of speaking that is captivating.',
      'Vino has a visionary outlook for expanding his business.',
      'Wulan is always welcoming to guests in her home.',
      'Xena has the X-factor that makes her stand out from the rest.',
      'Yudi is confident he can achieve all his goals with hard work.',
      'Zara approaches life with zest, always enthusiastic.',
    ];

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
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
              const Text(
                'Alphabet',
                style: TextStyle(
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
                        abjadList[index],
                        style: const TextStyle(
                          fontSize: 24,
                          fontFamily: 'Dinofont',
                          color: Color.fromARGB(255, 206, 212, 106),
                        ),
                      ),
                      Image.asset(
                        gambarAbjad[index],
                        width: MediaQuery.of(context).size.width * 0.50,
                        height: MediaQuery.of(context).size.width * 0.35,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          _speak(abjadList[index]);
                        },
                        style: ElevatedButton.styleFrom(
                          foregroundColor: const Color(0xFF07553B),
                          backgroundColor:
                              const Color.fromARGB(255, 206, 212, 106),
                        ),
                        child: const Text('Play'),
                      ),
                      Text(
                        alphabetList[index],
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
                        currentIndex = index - 1;
                      });
                      Navigator.pop(context);
                      _showAlphabetDialog(currentIndex);
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: const Color(0xFF07553B),
                    backgroundColor: const Color.fromARGB(255, 206, 212, 106),
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
                    if (index < abjadList.length - 1) {
                      setState(() {
                        currentIndex = index + 1;
                      });
                      Navigator.pop(context);
                      _showAlphabetDialog(currentIndex);
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: const Color(0xFF07553B),
                    backgroundColor: const Color.fromARGB(255, 206, 212, 106),
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
  }
}
