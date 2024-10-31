import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

class AlatMusik extends StatefulWidget {
  const AlatMusik({super.key});

  @override
  State<AlatMusik> createState() => _AlatMusikState();
}

class _AlatMusikState extends State<AlatMusik> {
  FlutterTts flutterTts = FlutterTts();
  int currentIndex = 0;
  Future _speak(String text) async {
    await flutterTts.setLanguage("en-US");
    double speechRate = 0.5;
    await flutterTts.setSpeechRate(speechRate);
    await flutterTts.setPitch(1.0);
    await flutterTts.speak(text);
  }

  List<String> alatmusikList = [
    'Akordeon',
    'Angklung',
    'Biola',
    'Drum',
    'Gitar Listrik',
    'Gitar',
    'Harmonika',
    'Harpa',
    'Kajon',
    'Kalimba',
    'Kendang',
    'Klarinet',
    'Marakas',
    'Piano',
    'Rebana',
    'Saksofon',
    'Seruling',
    'Simbals',
    'Terompet',
    'Ukulele',
    // ... tambahkan daftar AlatMusik hingga AlatMusik 20
  ];

  List<String> gambarAlatMusik = [
    'assets/images/Akordeon.png',
    'assets/images/Angklung.png',
    'assets/images/Biola.png',
    'assets/images/Drum.png',
    'assets/images/Gitar Listrik.png',
    'assets/images/Gitar.png',
    'assets/images/Harmonika.png',
    'assets/images/Harpa.png',
    'assets/images/Kajon.png',
    'assets/images/Kalimba.png',
    'assets/images/Kendang.png',
    'assets/images/Klarinet.png',
    'assets/images/Marakas.png',
    'assets/images/Piano.png',
    'assets/images/Rebana.png',
    'assets/images/Saksofon.png',
    'assets/images/Seruling.png',
    'assets/images/Simbals.png',
    'assets/images/Terompet.png',
    'assets/images/Ukulele.png',
    // ... tambahkan daftar gambar sesuai dengan AlatMusik hingga AlatMusik 20
  ];

  void showAlatMusikDialog(BuildContext context, int index) {
    List<String> titles = [
      'Musical instrument',
      'Musical instrument',
      'Musical instrument',
      'Musical instrument',
      'Musical instrument',
      'Musical instrument',
      'Musical instrument',
      'Musical instrument',
      'Musical instrument',
      'Musical instrument',
      'Musical instrument',
      'Musical instrument',
      'Musical instrument',
      'Musical instrument',
      'Musical instrument',
      'Musical instrument',
      'Musical instrument',
      'Musical instrument',
      'Musical instrument',
      'Musical instrument',
    ];
    List<String> musicalinstrumentList = [
      'Accordion',
      'Angklung',
      'Violin',
      'Drum',
      'Electric Guitar',
      'Acoustic Guitar',
      'Harmonica',
      'Harp',
      'Cajon',
      'Kalimba',
      'Kendang',
      'Clarinet',
      'Maracas',
      'Piano',
      'Rebab',
      'Saxophone',
      'Flute',
      'Cymbals',
      'Trumpet',
      'Ukulele',
    ];
    List<String> phoneticSymbols = [
      '/uh-kawr-dee-uhn/',
      '/ahng-kloong/',
      '/vahy-uh-lin/',
      '/druhm/',
      '/ih-lek-trik gi-tahr/',
      '/uh-koo-stik gi-tahr/',
      '/hahr-mon-i-kuh/',
      '/hahrp/',
      '/kuh-hon/',
      '/kuh-lim-bah/',
      '/kehn-dahng/',
      '/klar-i-net/',
      '/muh-rah-kuhs/',
      '/pee-an-oh/',
      '/ree-bab/',
      '/sak-suh-fohn/',
      '/flooht/',
      '/sim-buh lz/',
      '/truhm-pit/',
      '/yoo-kuh-lei-lee/',
    ];

    List<String> meanings = [
      'A musical instrument with buttons and a bellows that produces sound when squeezed and expanded.',
      'A traditional Indonesian musical instrument made of bamboo.',
      'A string instrument played with a bow, typically having four strings.',
      'A percussion instrument that produces sound through striking.',
      'A version of the guitar that requires amplification to produce sound.',
      'A string instrument that produces sound without amplification.',
      'A small wind instrument with multiple holes and reeds.',
      'A large, vertical string instrument.',
      'A box-shaped percussion instrument played by slapping or tapping.',
      'An African thumb piano with metal tines that are plucked to produce sound.',
      'A traditional Indonesian drum, typically made of wood or metal.',
      'A woodwind instrument used to produce melodic sound.',
      'Ball-shaped percussion instruments filled with seeds or metal balls, typically used in pairs.',
      'A keyboard instrument with many keys that produce sound when pressed.',
      'A traditional bowed instrument with two to three strings.',
      'A versatile metal wind instrument known for its unique sound.',
      'A wind instrument typically made of wood or metal, played by blowing air into it..',
      'A pair of thin metal plates that produce sound.',
      'A brass wind instrument with a curved tube and valves.',
      'A small stringed instrument with four strings, originating from Hawaii.',
    ];

    List<String> examples = [
      'I am playing the accordion.',
      'My mother is playing the angklung.',
      'My sibling is playing the violin.',
      'My father is playing the drum.',
      'I am playing the electric guitar.',
      'My older brother is playing the guitar by the roadside.',
      'My younger brother is playing the harmonica.',
      'My female cousin is playing the harp.',
      'I am playing the cajon.',
      'Someone is playing the kalimba.',
      'My male cousin is playing the kendang.',
      'My female cousin is playing the clarinet.',
      'I am playing the maracas.',
      'My father is playing the piano.',
      'My male cousin is sibling is playing the rebana.',
      'My uncle is playing the saxophone.',
      'I am playing the flute.',
      'My male cousin is sibling is playing the cymbals.',
      'My male cousin is playing the trumpet.',
      'My sibling is playing the ukulele.',
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
                  color: Color.fromARGB(255, 204, 209, 105),
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
                      color: Color.fromARGB(255, 204, 209, 105),
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
                            alatmusikList[index],
                            style: const TextStyle(
                              fontSize: 24,
                              fontFamily: 'Dinofont',
                              color: Color.fromARGB(255, 204, 209, 105),
                            ),
                          ),
                          const SizedBox(height: 0),
                          Image.asset(
                            gambarAlatMusik[
                                index], // Use Image.asset to display the image
                            width: MediaQuery.of(context).size.width * 0.50,
                            height: MediaQuery.of(context).size.width * 0.35,
                          ),
                          ElevatedButton(
                            onPressed: () {
                              _speak(musicalinstrumentList[index]);
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
                            musicalinstrumentList[index],
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 24,
                              fontFamily: 'Dinofont',
                              color: Color.fromARGB(255, 204, 209, 105),
                            ),
                          ),
                          Text(
                            phoneticSymbols[index],
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 18,
                              color: Color.fromARGB(255, 204, 209, 105),
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
                      color: Color.fromARGB(255, 204, 209, 105),
                    ),
                  ),
                  const SizedBox(height: 0),
                  Text(
                    meanings[index],
                    style: const TextStyle(
                      fontFamily: 'Dinofont',
                      fontSize: 16,
                      color: Color.fromARGB(255, 204, 209, 105),
                    ),
                  ),
                  const SizedBox(height: 0),
                  const Text(
                    'Example:',
                    style: TextStyle(
                      fontFamily: 'Dinofont',
                      fontSize: 24,
                      color: Color.fromARGB(255, 204, 209, 105),
                    ),
                  ),
                  const SizedBox(height: 0),
                  Text(
                    examples[index],
                    style: const TextStyle(
                      fontFamily: 'Dinofont',
                      fontSize: 16,
                      color: Color.fromARGB(255, 204, 209, 105),
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
                            const Color.fromARGB(255, 204, 209, 105),
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
                        if (index < alatmusikList.length - 1) {
                          setState(() {
                            index++;
                          });
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        foregroundColor: const Color(0xFF07553B),
                        backgroundColor:
                            const Color.fromARGB(255, 204, 209, 105),
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
            color: const Color.fromARGB(255, 204, 209, 105),
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
                      'Musical instrument',
                      style: TextStyle(
                        color: Color(0xFF07553B),
                        fontSize: 26,
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
              itemCount: (alatmusikList.length / 6).ceil(),
              itemBuilder: (context, pageIndex) {
                final startIndex = pageIndex * 6;
                final endIndex = (pageIndex + 1) * 6;
                final visibleAlatMusik = alatmusikList.sublist(
                  startIndex,
                  endIndex > alatmusikList.length
                      ? alatmusikList.length
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
                    children: List.generate(visibleAlatMusik.length, (index) {
                      final itemIndex = startIndex + index;
                      return GestureDetector(
                        onTap: () {
                          showAlatMusikDialog(context, itemIndex);
                        },
                        child: Container(
                          color: Colors.transparent,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                visibleAlatMusik[index],
                                style: const TextStyle(
                                  color: Color(0xFF07553B),
                                  fontSize: 18,
                                  fontFamily: 'Dinofont',
                                ),
                              ),
                              const SizedBox(height: 0),
                              Image.asset(
                                gambarAlatMusik[itemIndex],
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
