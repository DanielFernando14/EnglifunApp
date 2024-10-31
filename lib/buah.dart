import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

class Buah extends StatefulWidget {
  const Buah({super.key});

  @override
  State<Buah> createState() => _BuahState();
}

class _BuahState extends State<Buah> {
  FlutterTts flutterTts = FlutterTts();
  int currentIndex = 0;
  Future _speak(String text) async {
    await flutterTts.setLanguage("en-US");
    double speechRate = 0.5;
    await flutterTts.setSpeechRate(speechRate);
    await flutterTts.setPitch(1.0);
    await flutterTts.speak(text);
  }

  List<String> fruitList = [
    'Alpukat',
    'Anggur',
    'Apel',
    'Belimbing',
    'Blueberry',
    'Jeruk',
    'Kiwi',
    'Kurma',
    'Mangga',
    'Manggis',
    'Melon',
    'Nanas',
    'Naga',
    'Pepaya',
    'Pisang',
    'Pir',
    'Rambutan',
    'Salak',
    'Semangka',
    'Stroberi',
    // ... tambahkan daftar Fruit hingga Fruit 20
  ];

  List<String> gambarBuah = [
    'assets/images/Alpukat.png',
    'assets/images/Anggur.png',
    'assets/images/Apel.png',
    'assets/images/Belimbing.png',
    'assets/images/Blueberry.png',
    'assets/images/Jeruk.png',
    'assets/images/Kiwi.png',
    'assets/images/Kurma.png',
    'assets/images/Mangga.png',
    'assets/images/Manggis.png',
    'assets/images/Melon.png',
    'assets/images/Nanas.png',
    'assets/images/Naga.png',
    'assets/images/Pepaya.png',
    'assets/images/Pisang.png',
    'assets/images/Pir.png',
    'assets/images/Rambutan.png',
    'assets/images/Salak.png',
    'assets/images/Semangka.png',
    'assets/images/Stroberi.png',
    // ... tambahkan daftar gambar sesuai dengan Fruit hingga Fruit 20
  ];

  void showFruitDialog(BuildContext context, int index) {
    List<String> titles = [
      'Fruit',
      'Fruit',
      'Fruit',
      'Fruit',
      'Fruit',
      'Fruit',
      'Fruit',
      'Fruit',
      'Fruit',
      'Fruit',
      'Fruit',
      'Fruit',
      'Fruit',
      'Fruit',
      'Fruit',
      'Fruit',
      'Fruit',
      'Fruit',
      'Fruit',
      'Fruit',
    ];
    List<String> fruitList = [
      'Avocado',
      'Grapes',
      'Apple',
      'Starfruit',
      'Blueberry',
      'Orange',
      'Kiwi',
      'Date',
      'Mango',
      'Passion Fruit',
      'Melon',
      'Pineapple',
      'Dragon Fruit',
      'Papaya',
      'Banana',
      'Pear',
      'Rambutan',
      'Snake Fruit',
      'Watermelon',
      'Strawberry',
    ];
    List<String> phoneticSymbols = [
      '/ˈʧɛri/',
      '/ɡreɪps/',
      '/ˈæpəl/',
      '/ˈnʌtˌmɛɡ/',
      '/ˈbluːˌbɛri/',
      '/ˈɔrɪndʒ/',
      '/ˈkiwi/',
      '/deɪt/',
      '/ˈmæŋɡoʊ/',
      '/ˈpæʃən fruːt/',
      '/ˈmɛlən/',
      '/ˈpaɪnˌæpəl/',
      '/ˈdræɡən fruːt/',
      '/pəˈpaɪə/',
      '/bəˈnænə/',
      '/pɛr/',
      '/ræmˈbuːtən/',
      '/sneɪk fruːt/',
      '/ˈwɔtərˌmɛlən/',
      '/ˈstrɔˌbɛri/',
    ];

    List<String> meanings = [
      'Small, round fruit with a hard pit in the center, typically red or dark in color.',
      'Small, round, and usually purple or green fruit that grows in clusters on vines.',
      'A round, usually red or green fruit with crisp flesh and a core containing seeds.',
      'A spice made from the seed of a tropical tree, used to add flavor to sweet and savory dishes.',
      'Small, round, dark blue or purple fruit that grows on bushes.',
      'Round fruit with a tough, bright orange rind and juicy, sweet-tasting flesh.',
      'Small, brown fruit with green or yellow flesh and tiny black seeds..',
      'Sweet and chewy fruit with a single seed.',
      'Large, juicy fruit with a sweet taste.',
      'Round or oval fruit with a tough outer rind and aromatic.',
      'Round or oval fruit with sweet, juicy flesh and a hard outer rind.',
      'Tropical fruit with a spiky, rough outer rind and sweet.',
      'Unique-looking fruit with bright pink or yellow skin and white or red flesh.',
      'Large, orange fruit with soft, orange or pink flesh and black seeds.',
      'Curved fruit with a yellow skin and sweet, creamy flesh.',
      'Fruit with a rounded shape and a sweet, juicy flesh.',
      'Exotic fruit with hairy skin and juicy, translucent flesh surrounding a single seed.',
      'it has reddish-brown scaly skin and sweet-tasting flesh.',
      'Large, juicy fruit with a green rind and sweet, red or pink flesh.',
      'Small, red fruit with tiny seeds on the outside and sweet, juicy flesh.',
    ];

    List<String> examples = [
      'She picked a ripe cherry from the tree and savored its sweetness.',
      'She enjoyed a handful of sweet grapes as a snack.',
      'He took a bite of the juicy red apple.',
      'The aroma of nutmeg added warmth to the holiday cookies.',
      'The pancakes were topped with a generous serving of fresh blueberries.',
      'He peeled the orange and divided it into segments.',
      'The green kiwi was a refreshing addition to the fruit salad.',
      'She savored a dried date as a quick energy boost.',
      'The ripe mango dripped with juice as she sliced into it.',
      'The exotic flavor of passion fruit made the dessert truly special.',
      'The watermelon slices were a hit at the summer picnic.',
      'The tropical drink was garnished with a wedge of fresh pineapple.',
      'She was intrigued by the vibrant colors of the dragon fruit.',
      'The papaya smoothie was a delicious way to start the day.',
      'He packed a banana in his lunch for a convenient and healthy snack.',
      'The ripe pear was soft and juicy when bitten into.',
      'The spiky rambutan fruit had a sweet and tangy taste.',
      'She tried the unique flavor of snake fruit during her travels.',
      'The backyard barbecue was complete with slices of chilled watermelon.',
      'The strawberry shortcake was topped with whipped cream.',
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
                            fruitList[index],
                            style: const TextStyle(
                              fontSize: 24,
                              fontFamily: 'Dinofont',
                              color: Color.fromARGB(255, 206, 212, 106),
                            ),
                          ),
                          const SizedBox(height: 0),
                          Image.asset(
                            gambarBuah[
                                index], // Use Image.asset to display the image
                            width: MediaQuery.of(context).size.width * 0.50,
                            height: MediaQuery.of(context).size.width * 0.35,
                          ),
                          ElevatedButton(
                            onPressed: () {
                              _speak(fruitList[index]);
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
                            fruitList[index],
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
                        if (index < fruitList.length - 1) {
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
                      'Fruit',
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
              itemCount: (fruitList.length / 6).ceil(),
              itemBuilder: (context, pageIndex) {
                final startIndex = pageIndex * 6;
                final endIndex = (pageIndex + 1) * 6;
                final visibleFruit = fruitList.sublist(
                  startIndex,
                  endIndex > fruitList.length ? fruitList.length : endIndex,
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
                    children: List.generate(visibleFruit.length, (index) {
                      final itemIndex = startIndex + index;
                      return GestureDetector(
                        onTap: () {
                          showFruitDialog(context, itemIndex);
                        },
                        child: Container(
                          color: Colors.transparent,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                visibleFruit[index],
                                style: const TextStyle(
                                  color: Color(0xFF07553B),
                                  fontSize: 18,
                                  fontFamily: 'Dinofont',
                                ),
                              ),
                              const SizedBox(height: 0),
                              Image.asset(
                                gambarBuah[itemIndex],
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
