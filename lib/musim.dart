import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

class Musim extends StatefulWidget {
  const Musim({super.key});

  @override
  State<Musim> createState() => _MusimState();
}

class _MusimState extends State<Musim> {
  FlutterTts flutterTts = FlutterTts();
  int currentIndex = 0;
  Future _speak(String text) async {
    await flutterTts.setLanguage("en-US");
    double speechRate = 0.5;
    await flutterTts.setSpeechRate(speechRate);
    await flutterTts.setPitch(1.0);
    await flutterTts.speak(text);
  }

  List<String> musimList = [
    'Musim Dingin',
    'Musim Gugur',
    'Musim Hujan',
    'Musim Panas',
    'Musim Salju',
    'Musim Semi',
    // ... tambahkan daftar Musim hingga Musim 20
  ];

  List<String> gambarMusim = [
    'assets/images/Musim Dingin.png',
    'assets/images/Musim Gugur.png',
    'assets/images/Musim Hujan.png',
    'assets/images/Musim Panas.png',
    'assets/images/Musim Salju.png',
    'assets/images/Musim Semi.png',
    // ... tambahkan daftar gambar sesuai dengan Musim hingga Musim 20
  ];

  void showSeasonDialog(BuildContext context, int index) {
    List<String> titles = [
      'Season',
      'Season',
      'Season',
      'Season',
      'Season',
      'Season',
    ];
    List<String> seasonList = [
      'Winter Season',
      'Autumn Season',
      'Rainy Season',
      'Summer Season',
      'Snowy Season',
      'Spring Season',
    ];
    List<String> phoneticSymbols = [
      '/ˈwɪntər/',
      '/ˈɔːtəm/',
      '/ˈreɪni ˈsiːzən/',
      '/ˈsʌmər/',
      '/ˈsnoʊi ˈsiːzən/',
      '/sprɪŋ/',
    ];

    List<String> meanings = [
      'The coldest season of the year, characterized by low temperatures, short days, and snowfall.',
      'The season between summer and winter, and the shedding of leaves from deciduous trees.',
      'The time of year when a region experiences higher amounts of rainfall than usual.',
      'The warmest season of the year, typically characterized by longer daylight hours, higher temperatures.',
      'The period when snowfall is common, covering the landscape in a layer of snow.',
      'The season between winter and summer, known for blooming flowers, warmer temperatures.',
    ];

    List<String> examples = [
      'In winter, people often enjoy activities like skiing and building snowmen.',
      'During autumn, the leaves of trees change colors and fall to the ground.',
      'The rainy season is a great time to stay indoors and read a book.',
      'Summer is perfect for going to the beach and having picnics in the park.',
      'Children love to play with snowballs and make snow angels.',
      'Flowers like tulips and daffodils bloom, adding color to the landscape.',
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
                            musimList[index],
                            style: const TextStyle(
                              fontSize: 24,
                              fontFamily: 'Dinofont',
                              color: Color.fromARGB(255, 206, 212, 106),
                            ),
                          ),
                          const SizedBox(height: 0),
                          Image.asset(
                            gambarMusim[
                                index], // Use Image.asset to display the image
                            width: MediaQuery.of(context).size.width * 0.50,
                            height: MediaQuery.of(context).size.width * 0.35,
                          ),
                          ElevatedButton(
                            onPressed: () {
                              _speak(seasonList[index]);
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
                            seasonList[index],
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
                        if (index < musimList.length - 1) {
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
                      'Season',
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
              itemCount: (musimList.length / 6).ceil(),
              itemBuilder: (context, pageIndex) {
                final startIndex = pageIndex * 6;
                final endIndex = (pageIndex + 1) * 6;
                final visibleMusim = musimList.sublist(
                  startIndex,
                  endIndex > musimList.length ? musimList.length : endIndex,
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
                    children: List.generate(visibleMusim.length, (index) {
                      final itemIndex = startIndex + index;
                      return GestureDetector(
                        onTap: () {
                          showSeasonDialog(context, itemIndex);
                        },
                        child: Container(
                          color: Colors.transparent,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                visibleMusim[index],
                                style: const TextStyle(
                                  color: Color(0xFF07553B),
                                  fontSize: 18,
                                  fontFamily: 'Dinofont',
                                ),
                              ),
                              const SizedBox(height: 0),
                              Image.asset(
                                gambarMusim[itemIndex],
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
