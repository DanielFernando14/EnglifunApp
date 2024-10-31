import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

class Minuman extends StatefulWidget {
  const Minuman({super.key});

  @override
  State<Minuman> createState() => _MinumanState();
}

class _MinumanState extends State<Minuman> {
  FlutterTts flutterTts = FlutterTts();
  int currentIndex = 0;
  Future _speak(String text) async {
    await flutterTts.setLanguage("en-US");
    double speechRate = 0.5;
    await flutterTts.setSpeechRate(speechRate);
    await flutterTts.setPitch(1.0);
    await flutterTts.speak(text);
  }

  List<String> minumanList = [
    'Air Kelapa',
    'Air Putih',
    'Es Krim Soda',
    'Es Teh',
    'Jus Alpukat',
    'Jus Apel',
    'Jus Jeruk',
    'Jus Mangga',
    'Jus Melon',
    'Jus Naga',
    'Jus Pisang',
    'Jus Semangka',
    'Jus Stroberi',
    'Jus Tomat',
    'Limun Soda',
    'Kopi',
    'Susu',
    'Susu Cokelat',
    'Teh Manis',
    'Yogurt',
    // ... tambahkan daftar Minuman hingga Minuman 20
  ];

  List<String> gambarMinuman = [
    'assets/images/Air Kelapa.png',
    'assets/images/Air Putih.png',
    'assets/images/Es Krim Soda.png',
    'assets/images/Es Teh.png',
    'assets/images/Jus Alpukat.png',
    'assets/images/Jus Apel.png',
    'assets/images/Jus Jeruk.png',
    'assets/images/Jus Mangga.png',
    'assets/images/Jus Melon.png',
    'assets/images/Jus Naga.png',
    'assets/images/Jus Pisang.png',
    'assets/images/Jus Semangka.png',
    'assets/images/Jus Stroberi.png',
    'assets/images/Jus Tomat.png',
    'assets/images/Limun Soda.png',
    'assets/images/Kopi.png',
    'assets/images/Susu.png',
    'assets/images/Susu Coklat.png',
    'assets/images/Teh Manis.png',
    'assets/images/Yogurt.png',
    // ... tambahkan daftar gambar sesuai dengan Minuman hingga Minuman 20
  ];

  void showMinumanDialog(BuildContext context, int index) {
    List<String> titles = [
      'Drink',
      'Drink',
      'Drink',
      'Drink',
      'Drink',
      'Drink',
      'Drink',
      'Drink',
      'Drink',
      'Drink',
      'Drink',
      'Drink',
      'Drink',
      'Drink',
      'Drink',
      'Drink',
      'Drink',
      'Drink',
      'Drink',
      'Drink',
    ];
    List<String> drinkList = [
      'Coconut Water',
      'Water',
      'Ice Cream Soda',
      'Iced Tea',
      'Avocado Juice',
      'Apple Juice',
      'Orange Juice',
      'Mango Juice',
      'Melon Juice',
      'Dragon Fruit Juice',
      'Banana Juice',
      'Watermelon Juice',
      'Strawberry Juice',
      'Tomato Juice',
      'Lemonade',
      'Coffee',
      'Milk',
      'Chocolate Milk',
      'Sweet Tea',
      'Yogurt',
    ];
    List<String> phoneticSymbols = [
      '/ˈkoʊ.kəˌnʌt ˈwɔtər/',
      '/ˈwɔtər/',
      '/aɪs krim ˈsoʊdə/',
      '/aɪst tiː/',
      '/ˌævəˈkɑːdoʊ dʒus/',
      '/ˈæpəl dʒus/',
      '/ˈɔrɪndʒ dʒus/',
      '/ˈmæŋɡoʊ dʒus/',
      '/ˈmɛlən dʒus/',
      '/ˈdræɡən fruːt dʒus/',
      '/bəˈnænə dʒus/',
      '/ˈwɔtərmɛlən dʒus/',
      '/ˈstrɔbəri dʒus/',
      '/təˈmeɪtoʊ dʒus/',
      '/ˌlɛməˈneɪd/',
      '/ˈkɒfi/',
      '/mɪlk/',
      '/ˈtʃɒkəlɪt mɪlk/',
      '/swiːt tiː/',
      '/ˈjoʊɡərt/',
    ];

    List<String> meanings = [
      'The liquid extracted from inside a coconut.',
      'Colorless, odorless, and tasteless liquid.',
      'A beverage made by mixing soda with ice cream.',
      'Tea that has been cooled with ice.',
      'A beverage made from blending avocado with other ingredients.',
      'Liquid extracted from apples.',
      'Liquid extracted from oranges.',
      'Liquid extracted from mangoes.',
      'Liquid extracted from melons.',
      'A beverage made from the juice of dragon fruit.',
      'Liquid extracted from bananas.',
      'Liquid extracted from watermelons.',
      'Liquid extracted from strawberries.',
      'Liquid extracted from tomatoes.',
      'A beverage made from lemon juice and water.',
      'A hot beverage made from ground coffee beans.',
      'White liquid produced by mammary glands of mammals.',
      'Milk with added chocolate powder or syrup.',
      'Tea that has been sweetened.',
      'Fermented food made from milk.',
    ];

    List<String> examples = [
      'A refreshing drink often consumed at the beach or on a hot day.',
      'The fluid essential for hydration.',
      'A refreshing drink with the combination of soda and ice cream.',
      'Tea served with ice and often sweetened with sugar or lemon.',
      'A creamy and nutritious drink often enjoyed for its unique flavor and health benefits.',
      'A refreshing beverage made from apple extract.',
      'A commonly consumed drink during breakfast.',
      'A refreshing drink with a sweet and tropical mango flavor.',
      'A beverage with a delicious melon flavor.',
      'A vibrant and refreshing drink with the natural sweetness of dragon fruit.',
      'A drink with a rich banana taste and nutritional value.',
      'A refreshing beverage particularly enjoyed in the summer.',
      'A delightful drink with a sweet strawberry taste.',
      'A beverage often used as a base for cocktails.',
      'A tangy drink usually sweetened with sugar.',
      'A popular drink enjoyed worldwide.',
      'A nutrient-rich drink.',
      'A delicious drink with chocolate flavor.',
      'A sweet and enjoyable beverage.',
      'A tasty and healthy food.',
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
                            minumanList[index],
                            style: const TextStyle(
                              fontSize: 24,
                              fontFamily: 'Dinofont',
                              color: Color.fromARGB(255, 206, 212, 106),
                            ),
                          ),
                          const SizedBox(height: 0),
                          Image.asset(
                            gambarMinuman[
                                index], // Use Image.asset to display the image
                            width: MediaQuery.of(context).size.width * 0.50,
                            height: MediaQuery.of(context).size.width * 0.35,
                          ),
                          ElevatedButton(
                            onPressed: () {
                              _speak(drinkList[index]);
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
                            drinkList[index],
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
                        if (index < minumanList.length - 1) {
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
                      'Drink',
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
              itemCount: (minumanList.length / 6).ceil(),
              itemBuilder: (context, pageIndex) {
                final startIndex = pageIndex * 6;
                final endIndex = (pageIndex + 1) * 6;
                final visibleMinuman = minumanList.sublist(
                  startIndex,
                  endIndex > minumanList.length ? minumanList.length : endIndex,
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
                    children: List.generate(visibleMinuman.length, (index) {
                      final itemIndex = startIndex + index;
                      return GestureDetector(
                        onTap: () {
                          showMinumanDialog(context, itemIndex);
                        },
                        child: Container(
                          color: Colors.transparent,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                visibleMinuman[index],
                                style: const TextStyle(
                                  color: Color(0xFF07553B),
                                  fontSize: 18,
                                  fontFamily: 'Dinofont',
                                ),
                              ),
                              const SizedBox(height: 0),
                              Image.asset(
                                gambarMinuman[itemIndex],
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
