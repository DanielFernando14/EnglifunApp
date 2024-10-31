import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

class AlatDapur extends StatefulWidget {
  const AlatDapur({super.key});

  @override
  State<AlatDapur> createState() => _AlatDapurState();
}

class _AlatDapurState extends State<AlatDapur> {
  FlutterTts flutterTts = FlutterTts();
  int currentIndex = 0;
  Future _speak(String text) async {
    await flutterTts.setLanguage("en-US");
    double speechRate = 0.5;
    await flutterTts.setSpeechRate(speechRate);
    await flutterTts.setPitch(1.0);
    await flutterTts.speak(text);
  }

  List<String> alatdapurList = [
    'Blender',
    'Garpu',
    'Gelas',
    'Kompor',
    'Mangkuk',
    'Panci',
    'Parutan',
    'Penanak nasi',
    'Penggorengan',
    'Pengocok telur',
    'Piring',
    'Pisau',
    'Sapu',
    'Saringan',
    'Sendok',
    'Serbet',
    'Teko',
    'Tempat sampah',
    'Timbangan dapur',
    'Wajan',
    // ... tambahkan daftar AlatDapur hingga AlatDapur 20
  ];

  List<String> gambarKitchenUtensils = [
    'assets/images/Blender.png',
    'assets/images/Garpu.png',
    'assets/images/Gelas.png',
    'assets/images/Kompor.png',
    'assets/images/Mangkuk.png',
    'assets/images/Panci.png',
    'assets/images/Parutan.png',
    'assets/images/Penanak Nasi.png',
    'assets/images/Penggorengan.png',
    'assets/images/Pengocok Telur.png',
    'assets/images/Piring.png',
    'assets/images/Pisau.png',
    'assets/images/Sapu.png',
    'assets/images/Saringan.png',
    'assets/images/Sendok.png',
    'assets/images/Serbet.png',
    'assets/images/Teko.png',
    'assets/images/Tempat Sampah.png',
    'assets/images/Timbangan Dapur.png',
    'assets/images/Wajan.png',
    // ... tambahkan daftar gambar sesuai dengan alatdapur hingga AlatDapur 20
  ];

  void showKitchenUtensilsDialog(BuildContext context, int index) {
    List<String> titles = [
      'Kitchen set',
      'Kitchen set',
      'Kitchen set',
      'Kitchen set',
      'Kitchen set',
      'Kitchen set',
      'Kitchen set',
      'Kitchen set',
      'Kitchen set',
      'Kitchen set',
      'Kitchen set',
      'Kitchen set',
      'Kitchen set',
      'Kitchen set',
      'Kitchen set',
      'Kitchen set',
      'Kitchen set',
      'Kitchen set',
      'Kitchen set',
      'Kitchen set',
    ];
    List<String> kitchenutensilsList = [
      'Blender',
      'Fork',
      'Glass',
      'Stove',
      'Bowl',
      'Pot',
      'Grater',
      'Rice Cooker',
      'Frying Pan',
      'Eggbeater',
      'Plate',
      'Knife',
      'Broom',
      'Strainer',
      'Spoon',
      'Napkin',
      'Teapot',
      'Trash Bin',
      'Kitchen Scale',
      'Wok',
    ];
    List<String> phoneticSymbols = [
      '/ˈblɛndər/',
      '/fɔːrk/',
      '/ɡlæs/',
      '/stoʊv/',
      '/boʊl/',
      '/pɒt/',
      '/ˈɡreɪtər/',
      '/raɪs ˈkʊkər/',
      '/ˈfraɪɪŋ pæn/',
      '/ɛɡ ˈbiːtər/',
      '/pleɪt/',
      '/naɪf/',
      'brum/',
      '/ˈstreɪnər/',
      '/spuːn/',
      '/ˈnæpkɪn/',
      '/ˈtiːpɒt/',
      '/træʃ bɪn/',
      '/ˈkɪtʃən skeɪl/',
      '/wɒk/',
    ];

    List<String> meanings = [
      'A device used for crushing or grinding food items.',
      'An eating utensil with two or more prongs or tines.',
      'A container for drinks, typically made of glass.',
      'A cooking appliance used for heating or cooking food.',
      'A cup-shaped container used for holding food or drinks.',
      'A deep cooking vessel used for cooking on a stovetop.',
      'A tool used for shredding or grating food items.',
      'An appliance used for cooking rice.',
      'A flat-bottomed pan with a long handle, used for frying food.',
      'A utensil used for beating eggs or other ingredients.',
      'A utensil used for serving food.',
      'A sharp tool used for cutting or slicing food.',
      'A cleaning tool with dense bristles used for sweeping floors.',
      'A utensil used for separating liquids from solids.',
      ' A utensil used for scooping or stirring food.',
      'A small cloth used for wiping or protecting clothing while eating.',
      'A pot used for steeping or serving tea.',
      'A container for disposing of trash.',
      'A device used for measuring the weight of food items.',
      'A bowl-shaped pan with a long handle, used in Asian cooking.',
    ];

    List<String> examples = [
      'I use the blender to make smoothies and shakes.',
      'Please pass me a fork so I can eat my salad.',
      'Fill the glass with water from the dispenser.',
      'Turn on the stove to start cooking the pasta.',
      'I need a bowl to mix the ingredients for the cake.',
      'The soup is simmering in the pot on the stove.',
      'She used the grater to shred cheese for the pizza.',
      'The rice cooker automatically cooks the rice perfectly.',
      'He fried eggs in the non-stick frying pan.',
      'Use the eggbeater to whisk the eggs for the omelette.',
      'Place the grilled chicken on a plate for serving.',
      'Be careful when using a sharp knife to cut vegetables.',
      'Sweep the floor with the broom to clean up the mess.',
      'Use the strainer to drain the water from the pasta.',
      'Stir the soup with a spoon to mix the ingredients.',
      'Take a napkin to wipe your hands after eating.',
      'The teapot is used to brew tea leaves and hot water.',
      'Throw the empty wrappers in the trash bin.',
      'Use the kitchen scale to measure the flour for the recipe.',
      'Stir-fry the vegetables in the wok for a quick and delicious meal.',
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
                            alatdapurList[index],
                            style: const TextStyle(
                              fontSize: 24,
                              fontFamily: 'Dinofont',
                              color: Color.fromARGB(255, 206, 212, 106),
                            ),
                          ),
                          const SizedBox(height: 0),
                          Image.asset(
                            gambarKitchenUtensils[
                                index], // Use Image.asset to display the image
                            width: MediaQuery.of(context).size.width * 0.50,
                            height: MediaQuery.of(context).size.width * 0.35,
                          ),
                          ElevatedButton(
                            onPressed: () {
                              _speak(kitchenutensilsList[index]);
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
                            kitchenutensilsList[index],
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 24,
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
                      fontSize: 24,
                      color: Color.fromARGB(255, 206, 212, 106),
                    ),
                  ),
                  const SizedBox(height: 0),
                  Text(
                    meanings[index],
                    style: const TextStyle(
                      fontFamily: 'Dinofont',
                      fontSize: 16,
                      color: Color.fromARGB(255, 206, 212, 106),
                    ),
                  ),
                  const SizedBox(height: 0),
                  const Text(
                    'Example:',
                    style: TextStyle(
                      fontFamily: 'Dinofont',
                      fontSize: 24,
                      color: Color.fromARGB(255, 206, 212, 106),
                    ),
                  ),
                  const SizedBox(height: 0),
                  Text(
                    examples[index],
                    style: const TextStyle(
                      fontFamily: 'Dinofont',
                      fontSize: 16,
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
                        if (index < alatdapurList.length - 1) {
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
                      'Kitchen set',
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
              itemCount: (alatdapurList.length / 6).ceil(),
              itemBuilder: (context, pageIndex) {
                final startIndex = pageIndex * 6;
                final endIndex = (pageIndex + 1) * 6;
                final visibleAlatDapur = alatdapurList.sublist(
                  startIndex,
                  endIndex > alatdapurList.length
                      ? alatdapurList.length
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
                    children: List.generate(visibleAlatDapur.length, (index) {
                      final itemIndex = startIndex + index;
                      return GestureDetector(
                        onTap: () {
                          showKitchenUtensilsDialog(context, itemIndex);
                        },
                        child: Container(
                          color: Colors.transparent,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                visibleAlatDapur[index],
                                style: const TextStyle(
                                  color: Color(0xFF07553B),
                                  fontSize: 18,
                                  fontFamily: 'Dinofont',
                                ),
                              ),
                              const SizedBox(height: 0),
                              Image.asset(
                                gambarKitchenUtensils[itemIndex],
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
