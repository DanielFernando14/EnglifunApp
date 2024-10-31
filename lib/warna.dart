import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

class Warna extends StatefulWidget {
  const Warna({super.key});

  @override
  State<Warna> createState() => _WarnaState();
}

class _WarnaState extends State<Warna> {
  FlutterTts flutterTts = FlutterTts();
  int currentIndex = 0;
  Future _speak(String text) async {
    await flutterTts.setLanguage("en-US");
    double speechRate = 0.5;
    await flutterTts.setSpeechRate(speechRate);
    await flutterTts.setPitch(1.0);
    await flutterTts.speak(text);
  }

  List<String> warnaList = [
    'Abu-abu',
    'Biru',
    'Biru Muda',
    'Cokelat',
    'Cokelat Muda',
    'Emas',
    'Hijau',
    'Hijau Muda',
    'Hitam',
    'Kuning',
    'Kuning Muda',
    'Merah',
    'Oranye',
    'Perak',
    'Pink',
    'Putih',
    'Ungu',
    // ... tambahkan daftar Warna hingga Warna 20
  ];

  List<String> gambarWarna = [
    'assets/images/Abu - Abu.png',
    'assets/images/Biru.png',
    'assets/images/Biru Muda.png',
    'assets/images/Coklat.png',
    'assets/images/Coklat Muda.png',
    'assets/images/Emas.png',
    'assets/images/Hijau.png',
    'assets/images/Hijau Muda.png',
    'assets/images/Hitam.png',
    'assets/images/Kuning.png',
    'assets/images/Kuning Muda.png',
    'assets/images/Merah.png',
    'assets/images/Orange.png',
    'assets/images/Perak.png',
    'assets/images/Pink.png',
    'assets/images/Putih.png',
    'assets/images/Ungu.png',
    // ... tambahkan daftar gambar sesuai dengan Warna hingga Warna 20
  ];

  void showColorDialog(BuildContext context, int index) {
    List<String> titles = [
      'Color',
      'Color',
      'Color',
      'Color',
      'Color',
      'Color',
      'Color',
      'Color',
      'Color',
      'Color',
      'Color',
      'Color',
      'Color',
      'Color',
      'Color',
      'Color',
      'Color',
    ];
    List<String> colorList = [
      'Grey',
      'Blue',
      'Light Blue',
      'Brown',
      'Light Brown',
      'Gold',
      'Green',
      'Light Green',
      'Black',
      'Yellow',
      'Light Yellow',
      'Red',
      'Orange',
      'Silver',
      'Pink',
      'White',
      'Purple',
    ];
    List<String> phoneticSymbols = [
      '/ɡreɪ/',
      '/bluː/',
      '/laɪt bluː/',
      '/braʊn/',
      '/laɪt braʊn/',
      '/ɡoʊld/',
      '/ɡriːn/',
      '/laɪt ɡriːn/',
      '/blæk/',
      '/ˈjɛloʊ/',
      '/laɪt ˈjɛloʊ/',
      '/rɛd/',
      '/ˈɔrɪndʒ/',
      '/ˈsɪlvər/',
      '/pɪŋk/',
      '/waɪt/',
      '/ˈpɜrpl/',
    ];

    List<String> meanings = [
      'A color that is intermediate between black and white, often associated with neutrality and lack of emotion.',
      'A color resembling the clear sky or the open sea, often associated with calmness and serenity.',
      "A pale shade of blue, often associated with tranquility and softness.",
      'A color resembling the earth, often associated with stability and comfort.',
      'A lighter shade of brown, conveying warmth and naturalness.',
      'A precious metal color, often associated with wealth, luxury, and prestige.',
      'A color resembling the grass or leaves of plants, often associated with nature and growth.',
      'A pale shade of green, representing freshness and renewal.',
      'The absence of color or light, often symbolizing mystery and darkness.',
      'A bright color resembling the sun, often associated with happiness and energy.',
      'A pale shade of yellow, representing lightness and optimism.',
      'A strong color resembling blood or fire, often associated with passion and intensity.',
      'A color between red and yellow, often associated with enthusiasm and warmth.',
      'A metallic color resembling the precious metal silver.',
      'A color often associated with femininity, sweetness, and tenderness.',
      'The color of pure light, often symbolizing purity, innocence, and cleanliness.',
      'A color resulting from the mixture of red and blue, often associated with royalty and luxury.',
    ];

    List<String> examples = [
      'The elephant had a grey coat.',
      'The sky on a clear day is blue.',
      'The ocean water appeared light blue.',
      'The tree trunks were covered in brown bark.',
      'The sandy beach had a light brown hue.',
      'She received a gold medal for her performance.',
      'The grass in the park was a vibrant green.',
      'The leaves on the trees were a soft, light green color.',
      'The night sky was so dark it looked black.',
      'The sunflower petals were bright yellow.',
      'The walls of the nursery were painted a light yellow.',
      'The roses in the garden bloomed in various shades of red.',
      'The sunsets in the desert were often orange.',
      'The sports car gleamed in silver under the sunlight.',
      'The baby blanket was a delicate shade of pink.',
      'The snow-covered landscape was pure white.',
      'The royal robes were a deep shade of purple.',
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
                            warnaList[index],
                            style: const TextStyle(
                              fontSize: 24,
                              fontFamily: 'Dinofont',
                              color: Color.fromARGB(255, 206, 212, 106),
                            ),
                          ),
                          const SizedBox(height: 0),
                          Image.asset(
                            gambarWarna[
                                index], // Use Image.asset to display the image
                            width: MediaQuery.of(context).size.width * 0.50,
                            height: MediaQuery.of(context).size.width * 0.35,
                          ),
                          ElevatedButton(
                            onPressed: () {
                              _speak(colorList[index]);
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
                            colorList[index],
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
                        if (index < warnaList.length - 1) {
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
                      'Color',
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
              itemCount: (warnaList.length / 6).ceil(),
              itemBuilder: (context, pageIndex) {
                final startIndex = pageIndex * 6;
                final endIndex = (pageIndex + 1) * 6;
                final visibleWarna = warnaList.sublist(
                  startIndex,
                  endIndex > warnaList.length ? warnaList.length : endIndex,
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
                    children: List.generate(visibleWarna.length, (index) {
                      final itemIndex = startIndex + index;
                      return GestureDetector(
                        onTap: () {
                          showColorDialog(context, itemIndex);
                        },
                        child: Container(
                          color: Colors.transparent,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                visibleWarna[index],
                                style: const TextStyle(
                                  color: Color(0xFF07553B),
                                  fontSize: 18,
                                  fontFamily: 'Dinofont',
                                ),
                              ),
                              const SizedBox(height: 0),
                              Image.asset(
                                gambarWarna[itemIndex],
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
