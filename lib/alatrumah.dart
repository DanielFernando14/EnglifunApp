import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

class AlatRumah extends StatefulWidget {
  const AlatRumah({super.key});

  @override
  State<AlatRumah> createState() => _AlatRumahState();
}

class _AlatRumahState extends State<AlatRumah> {
  FlutterTts flutterTts = FlutterTts();
  int currentIndex = 0;
  Future _speak(String text) async {
    await flutterTts.setLanguage("en-US");
    double speechRate = 0.5;
    await flutterTts.setSpeechRate(speechRate);
    await flutterTts.setPitch(1.0);
    await flutterTts.speak(text);
  }

  List<String> alatrumahList = [
    'Foto ',
    'Jam',
    'Kipas Angin',
    'Komputer',
    'Kulkas',
    'Kursi',
    'Lemari Pakaian',
    'Meja',
    'Mesin Cuci',
    'Microwave',
    'Pemanas Air',
    'Pembersih Vakum',
    'Pemutar DVD',
    'Pengeras Suara',
    'Pengering Rambut',
    'Pintu',
    'Setrika',
    'Sofa',
    'Televisi',
    'Tempat Tidur',
    // ... tambahkan daftar AlatRumah hingga AlatRumah 20
  ];

  List<String> gambarAlatRumah = [
    'assets/images/Foto.png',
    'assets/images/Jam.png',
    'assets/images/Kipas Angin.png',
    'assets/images/Komputer.png',
    'assets/images/Kulkas.png',
    'assets/images/Kursi.png',
    'assets/images/Lemari Pakaian.png',
    'assets/images/Meja.png',
    'assets/images/Mesin Cuci.png',
    'assets/images/Microwave.png',
    'assets/images/Pemanas Air.png',
    'assets/images/Pembersih Vakum.png',
    'assets/images/Pemutar DVD.png',
    'assets/images/Pengeras Suara.png',
    'assets/images/Pengering Rambut.png',
    'assets/images/Pintu.png',
    'assets/images/Setrika.png',
    'assets/images/Sofa.png',
    'assets/images/Televisi.png',
    'assets/images/Tempat Tidur.png',
    // ... tambahkan daftar gambar sesuai dengan AlatRumah hingga AlatRumah 20
  ];

  void showActivityDialog(BuildContext context, int index) {
    List<String> titles = [
      'Home Appliance',
      'Home Appliance',
      'Home Appliance',
      'Home Appliance',
      'Home Appliance',
      'Home Appliance',
      'Home Appliance',
      'Home Appliance',
      'Home Appliance',
      'Home Appliance',
      'Home Appliance',
      'Home Appliance',
      'Home Appliance',
      'Home Appliance',
      'Home Appliance',
      'Home Appliance',
      'Home Appliance',
      'Home Appliance',
      'Home Appliance',
      'Home Appliance',
    ];
    List<String> homeappliancesList = [
      'Photo',
      'Clock',
      'Fan',
      'Computer',
      'Refrigerator',
      'Chair',
      'Wardrobe',
      'Table',
      'Washing Machine',
      'Microwave',
      'Water Heater',
      'Vacuum Cleaner',
      'DVD Player',
      'Speaker',
      'Hair Dryer',
      'Door',
      'Iron',
      'Sofa',
      'Television',
      'Bed',
    ];
    List<String> phoneticSymbols = [
      '/foh-toh/',
      '/klawk/',
      '/fan/',
      '/kuhm-pyoo-ter/',
      '/ri-frij-uh-rey-ter/',
      '/cher/',
      '/wawr-drohb/',
      '/tey-buhl/',
      '/wosh-ing muh-sheen/',
      '/my-kroh-weyv/',
      '/waw-ter hee-ter/',
      '/vak-yoom klee-ner/',
      '/dee-vee-dee pley-er/',
      '/spee-ker/',
      '/hair drahy-er/',
      '/dawr/',
      '/ahy-ern/',
      '/soh-fuh/',
      '/tel-uh-vizh-uhn/',
      '/bed/',
    ];

    List<String> meanings = [
      'Picture or visual representation taken using a camera or other device.',
      'A device used to measure time, such as a wall clock or wristwatch.',
      'A device used to generate moving air or wind to cool a room or provide comfort.',
      'An electronic device used to applications.',
      'An appliance used to store food and beverages at a cold temperature to prevent spoilage.',
      'A piece of furniture for sitting, typically having a seat and a backrest.',
      'A storage unit for clothes and other personal items, often with doors and shelves.',
      'A flat surface used to place food, drinks, or other items.',
      'An appliance used to wash clothes and other textiles.',
      'A small electric oven used to heat or cook food using microwave radiation.',
      'An appliance used to heat water, often used for bathing or washing purposes.',
      'A device used to clean dust and dirt from floors and other surfaces using vacuum power.',
      'An electronic device used to play movies or videos from DVDs.',
      'A device to amplify and produce sound, typically used for listening to music or conversations.',
      'An appliance used to dry hair using hot air.',
      'A panel or barrier that can be opened and closed to enter or exit a room or building.',
      'An appliance used to straighten clothes and fabrics using heat.',
      'A comfortable seating furniture, often designed to seat more than one person.',
      'An electronic device for watching TV programs and other videos..',
      'A piece of furniture used for sleeping and restings.',
    ];

    List<String> examples = [
      'She took a photo of the beautiful sunset at the beach.',
      "The clock on the wall shows that it's already 8 o'clock.",
      "It's so hot in the room; let's turn on the fan to cool down.",
      'He uses his computer to work on assignments.',
      'The milk and fruits are kept fresh in the refrigerator.',
      'Please have a seat on the chair in the living room.',
      'She stored her clothes neatly in the wardrobe.',
      'We sat around the table and enjoyed a delicious dinner together.',
      'She put the dirty clothes into the washing machine to do the laundry.',
      'I heated the leftover pizza in the microwave for a quick snack.',
      'The water heater provides hot water for the shower.',
      'He used the vacuum cleaner to clean the carpets and floors.',
      'They watched their favorite movie on the DVD player.',
      'The music sounded so clear through the high-quality speakers.',
      'She used the hair dryer to dry her wet hair after taking a shower.',
      'Please close the door when you leave the room.',
      'She ironed her wrinkled shirt before going to the party.',
      'The family gathered on the sofa to watch a movie together.',
      'We watched the news on the television in the living room.',
      'She lay down on her cozy bed to rest.',
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
                            alatrumahList[index],
                            style: const TextStyle(
                              fontSize: 24,
                              fontFamily: 'Dinofont',
                              color: Color.fromARGB(255, 206, 212, 106),
                            ),
                          ),
                          const SizedBox(height: 0),
                          Image.asset(
                            gambarAlatRumah[
                                index], // Use Image.asset to display the image
                            width: MediaQuery.of(context).size.width * 0.50,
                            height: MediaQuery.of(context).size.width * 0.35,
                          ),
                          ElevatedButton(
                            onPressed: () {
                              _speak(homeappliancesList[index]);
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
                            homeappliancesList[index],
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
                        if (index < alatrumahList.length - 1) {
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
                      'Home Appliance',
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
              itemCount: (alatrumahList.length / 6).ceil(),
              itemBuilder: (context, pageIndex) {
                final startIndex = pageIndex * 6;
                final endIndex = (pageIndex + 1) * 6;
                final visibleAlatRumah = alatrumahList.sublist(
                  startIndex,
                  endIndex > alatrumahList.length
                      ? alatrumahList.length
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
                    children: List.generate(visibleAlatRumah.length, (index) {
                      final itemIndex = startIndex + index;
                      return GestureDetector(
                        onTap: () {
                          showActivityDialog(context, itemIndex);
                        },
                        child: Container(
                          color: Colors.transparent,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                visibleAlatRumah[index],
                                style: const TextStyle(
                                  color: Color(0xFF07553B),
                                  fontSize: 18,
                                  fontFamily: 'Dinofont',
                                ),
                              ),
                              const SizedBox(height: 0),
                              Image.asset(
                                gambarAlatRumah[itemIndex],
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
