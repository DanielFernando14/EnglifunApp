import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

class Pakaian extends StatefulWidget {
  const Pakaian({super.key});

  @override
  State<Pakaian> createState() => _PakaianState();
}

class _PakaianState extends State<Pakaian> {
  FlutterTts flutterTts = FlutterTts();
  int currentIndex = 0;
  Future _speak(String text) async {
    await flutterTts.setLanguage("en-US");
    double speechRate = 0.5;
    await flutterTts.setSpeechRate(speechRate);
    await flutterTts.setPitch(1.0);
    await flutterTts.speak(text);
  }

  List<String> pakaianList = [
    'Baju Hujan',
    'Baju Renang',
    'Baju T-shirt',
    'Celana Dalam',
    'Celana Olahraga',
    'Celana Panjang',
    'Celana Pendek',
    'Gaun',
    'Jaket',
    'Kaos Kaki',
    'Kemeja',
    'Mantel',
    'Piyama',
    'Rok',
    'Rompi',
    'Sarung Tangan',
    'Sendal',
    'Sepatu',
    'Seragam Sekolah',
    'Topi',
    // ... tambahkan daftar Pakaian hingga Pakaian 20
  ];

  List<String> gambarPakaian = [
    'assets/images/Baju Hujan.png',
    'assets/images/Baju Renang.png',
    'assets/images/Baju T-shirt.png',
    'assets/images/Celana Dalam.png',
    'assets/images/Celana Olahraga.png',
    'assets/images/Celana Panjang.png',
    'assets/images/Celana Pendek.png',
    'assets/images/Gaun.png',
    'assets/images/Jaket.png',
    'assets/images/Kaos Kaki.png',
    'assets/images/Kemeja.png',
    'assets/images/Mantel.png',
    'assets/images/Piyama.png',
    'assets/images/Rok.png',
    'assets/images/Rompi.png',
    'assets/images/Sarung Tangan.png',
    'assets/images/Sendal.png',
    'assets/images/Sepatu.png',
    'assets/images/Seragam Sekolah.png',
    'assets/images/Topi.png',
    // ... tambahkan daftar gambar sesuai dengan Pakaian hingga Pakaian 20
  ];

  void showClothesDialog(BuildContext context, int index) {
    List<String> titles = [
      'Clothes',
      'Clothes',
      'Clothes',
      'Clothes',
      'Clothes',
      'Clothes',
      'Clothes',
      'Clothes',
      'Clothes',
      'Clothes',
      'Clothes',
      'Clothes',
      'Clothes',
      'Clothes',
      'Clothes',
      'Clothes',
      'Clothes',
      'Clothes',
      'Clothes',
      'Clothes',
    ];
    List<String> clothesList = [
      'Raincoat',
      'Swimsuit',
      'T-shirt',
      'Underwear',
      'Sport Pants',
      'Long Pants',
      'Shorts',
      'Dress',
      'Jacket',
      'Socks',
      'Shirt',
      'Coat',
      'Pajamas',
      'Skirt',
      'Vest',
      'Gloves',
      'Sandal',
      'Shoes',
      'School Uniform',
      'Hat',
    ];
    List<String> phoneticSymbols = [
      '/ˈreɪnˌkoʊt/',
      '/ˈswɪmˌsut/',
      '/ˈtiːˌʃɜrt/',
      '/ˈʌndərˌwɛr/',
      '/spɔrt pænts/',
      '/lɔŋ pænts/',
      '/ʃɔrts/',
      '/drɛs/',
      '/ˈdʒækɪt/',
      '/sɑks/',
      '/ʃɜrt/',
      '/koʊt/',
      '/pəˈdʒæməz/',
      '/skɜrt/',
      '/vɛst/',
      '/ɡlʌvz/',
      '/ˈsændəl/',
      '/ʃuz/',
      '/skul ˈjunɪˌfɔrm/',
      '/hæt/',
    ];

    List<String> meanings = [
      'A waterproof coat worn to protect against rain.',
      'Clothing worn for swimming, typically consisting of a top and bottom.',
      'A casual shirt with short sleeves and a round neckline.',
      'Clothing worn under outer clothes, including bras and panties.',
      'Athletic pants worn during exercise or sports activities.',
      'Trousers that cover the legs completely.',
      'Casual clothing with short legs, usually worn in warm weather.',
      'A one-piece garment with a skirt, typically worn by women.',
      'A lightweight outer garment with sleeves, often worn for warmth.',
      'Garments worn on the feet, usually made of cotton or wool.',
      'A garment worn on the upper body, often with buttons and a collar.',
      'A heavy outer garment worn to keep warm.',
      'Comfortable clothing worn for sleeping, often consisting of a top and pants.',
      'A garment worn around the waist, usually covering the legs partially or fully.',
      'A sleeveless garment worn over a shirt.',
      'Hand coverings used to protect and keep hands warm.',
      'Open footwear with straps, often worn in warm weather.',
      'Footwear that covers and protects the feet.',
      'Standard clothing worn by students in educational institutions.',
      'Headwear used for protection, fashion, or religious purposes.',
    ];

    List<String> examples = [
      "I wear a raincoat when it's wet outside.",
      "Let's go to the pool, and don't forget your swimsuit!",
      'I like to wear a comfortable T-shirt on weekends.',
      'Make sure to pack enough underwear for the trip.',
      'I wear sport pants for soccer practice.',
      'In the winter, I prefer wearing long pants to keep warm.',
      "It's so hot today; I'll wear shorts to stay cool.",
      'She wore a beautiful dress to the party.',
      "Don't forget your jacket; it might get cold later.",
      'My favorite socks have colorful stripes.',
      "I'm wearing a nice shirt for the family dinner.",
      "It's snowing outside, so I'm putting on my warm coat.",
      'After a long day, I like to change into my cozy pajamas.',
      'She wore a pretty skirt to the school dance.',
      " wear a vest over my shirt when it's chilly outside.",
      'In the winter, I always wear gloves to keep my hands warm.',
      'I wear sandals when I go to the beach.',
      'I need new shoes for gym class.',
      'We all wear the same school uniform at our school.',
      'I wear a hat to protect my head from the sun.',
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
                            pakaianList[index],
                            style: const TextStyle(
                              fontSize: 24,
                              fontFamily: 'Dinofont',
                              color: Color.fromARGB(255, 206, 212, 106),
                            ),
                          ),
                          const SizedBox(height: 0),
                          Image.asset(
                            gambarPakaian[
                                index], // Use Image.asset to display the image
                            width: MediaQuery.of(context).size.width * 0.50,
                            height: MediaQuery.of(context).size.width * 0.35,
                          ),
                          ElevatedButton(
                            onPressed: () {
                              _speak(clothesList[index]);
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
                            clothesList[index],
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
                        if (index < pakaianList.length - 1) {
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
                      'Clothes',
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
              itemCount: (pakaianList.length / 6).ceil(),
              itemBuilder: (context, pageIndex) {
                final startIndex = pageIndex * 6;
                final endIndex = (pageIndex + 1) * 6;
                final visiblePakaian = pakaianList.sublist(
                  startIndex,
                  endIndex > pakaianList.length ? pakaianList.length : endIndex,
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
                    children: List.generate(visiblePakaian.length, (index) {
                      final itemIndex = startIndex + index;
                      return GestureDetector(
                        onTap: () {
                          showClothesDialog(context, itemIndex);
                        },
                        child: Container(
                          color: Colors.transparent,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                visiblePakaian[index],
                                style: const TextStyle(
                                  color: Color(0xFF07553B),
                                  fontSize: 18,
                                  fontFamily: 'Dinofont',
                                ),
                              ),
                              const SizedBox(height: 0),
                              Image.asset(
                                gambarPakaian[itemIndex],
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
