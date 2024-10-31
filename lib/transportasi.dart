import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

class Transportasi extends StatefulWidget {
  const Transportasi({super.key});

  @override
  State<Transportasi> createState() => _TransportasiState();
}

class _TransportasiState extends State<Transportasi> {
  FlutterTts flutterTts = FlutterTts();
  int currentIndex = 0;
  Future _speak(String text) async {
    await flutterTts.setLanguage("en-US");
    double speechRate = 0.5;
    await flutterTts.setSpeechRate(speechRate);
    await flutterTts.setPitch(1.0);
    await flutterTts.speak(text);
  }

  List<String> transportasiList = [
    'Balon Udara',
    'Bus',
    'Helikopter',
    'Jet Ski',
    'Jet Tempur',
    'Kapal',
    'Kapal Selam',
    'Kereta',
    'Kereta Kuda',
    'Mobil',
    'Mobil Balap',
    'Mobil Damkar',
    'Motor',
    'Perahu',
    'Pesawat',
    'Sepatu Roda',
    'Sepeda',
    'Skateboard',
    'Traktor',
    'Truk'
    // ... tambahkan daftar Trasnportasi hingga Trasnportasi 20
  ];

  List<String> gambarTransportasi = [
    'assets/images/Balon Udara.png',
    'assets/images/Bus.png',
    'assets/images/Helikopter.png',
    'assets/images/Jet Ski.png',
    'assets/images/Jet Tempur.png',
    'assets/images/Kapal.png',
    'assets/images/Kapal Selam.png',
    'assets/images/Kereta.png',
    'assets/images/Kereta Kuda.png',
    'assets/images/Mobil.png',
    'assets/images/Mobil Balap.png',
    'assets/images/Mobil Damkar.png',
    'assets/images/Motor.png',
    'assets/images/Perahu.png',
    'assets/images/Pesawat.png',
    'assets/images/Sepatu Roda.png',
    'assets/images/Sepeda.png',
    'assets/images/Transportasi Skateboard.png',
    'assets/images/Traktor.png',
    'assets/images/Truck.png',
    // ... tambahkan daftar gambar sesuai dengan Trasnportasi hingga Trasnportasi 20
  ];

  void showVehicleDialog(BuildContext context, int index) {
    List<String> titles = [
      'Vehicle',
      'Vehicle',
      'Vehicle',
      'Vehicle',
      'Vehicle',
      'Vehicle',
      'Vehicle',
      'Vehicle',
      'Vehicle',
      'Vehicle',
      'Vehicle',
      'Vehicle',
      'Vehicle',
      'Vehicle',
      'Vehicle',
      'Vehicle',
      'Vehicle',
      'Vehicle',
      'Vehicle',
      'Vehicle',
    ];
    List<String> vehicleList = [
      'Hot Air Balloon',
      'Bus',
      'Helicopter',
      'Jet Ski',
      'Fighter Jet',
      'Ship',
      'Submarine',
      'Train',
      'Horse-drawn Carriage',
      'Car',
      'Race Car',
      'Fire Truck',
      'Motorcycle',
      'Boat',
      'Airplane',
      'Roller Skates',
      'Bicycle',
      'Skateboard',
      'Tractor',
      'Truck',
    ];
    List<String> phoneticSymbols = [
      '/hɒt ɛr ˈbælən/',
      '/bʌs/',
      '/ˈhɛlɪˌkɒptər/',
      '/dʒɛt ski/',
      '/ˈfaɪtər dʒɛt/',
      '/ʃɪp/',
      '/ˈsʌbməˌriːn/',
      '/treɪn/',
      '/hɔːrs drɔːn ˈkærɪdʒ/',
      '/kɑːr/',
      '/reɪs kɑːr/',
      '/faɪər trʌk/',
      '/ˈmoʊtərˌsaɪkl/',
      '/boʊt/',
      '/ˈɛrˌpleɪn/',
      '/ˈroʊlər skeɪts/',
      '/ˈbaɪsɪkəl/',
      '/ˈskeɪtˌbɔːrd/',
      '/ˈtræktər/',
      '/trʌk/',
    ];

    List<String> meanings = [
      'A large balloon filled with hot air that can carry people',
      'A large vehicle used to transport people, usually along specific routes.',
      'An aircraft with rotating blades on top that allow it to hover and fly in any direction.',
      'A small watercraft used for recreation on water, propelled by a jet of water.',
      'A fast and powerful military aircraft designed for combat.',
      'A large boat used for traveling across the sea or carrying goods.',
      'A watercraft capable of underwater operation.',
      'A set of connected vehicles on rails used for transportation.',
      'A vehicle pulled by horses, often used in the past for transportation.',
      'A four-wheeled vehicle used for transportation on roads.',
      'A high-speed car used in races.',
      'A specialized vehicle used by firefighters to respond to fires and emergencies.',
      'A two-wheeled vehicle powered by a motor engine.',
      'A small watercraft designed for travel on water.',
      'A powered flying vehicle with fixed wings and a weight greater than the air it displaces.',
      'Shoes with small wheels used for gliding on smooth surfaces.',
      'A two-wheeled vehicle powered by pedaling.',
      'A flat board with wheels used for riding and performing tricks.',
      'A powerful vehicle used mainly for pulling heavy loads or agricultural work.',
      'A large motor vehicle used for transporting goods.',
    ];

    List<String> examples = [
      'We went on a hot air balloon ride and saw the beautiful landscape from above.',
      'I take the bus to school every morning.',
      'The helicopter landed on the helipad at the hospital.',
      'We had a blast riding the jet ski at the beach.',
      'The fighter jet soared through the sky during the air show.',
      'We took a cruise on a massive ship to explore different islands.',
      'The submarine dove deep into the ocean to explore underwater life.',
      'We took the train to the city to visit grandma.',
      'The horse-drawn carriage took us on a charming ride through the park.',
      'Mom drives us to school in the car every day.',
      'The race car sped around the track at incredible speeds.',
      'The fire truck rushed to the scene of the fire to put it out.',
      'Dad loves to ride his motorcycle on weekends.',
      'We rowed the boat across the peaceful lake.',
      'We flew on an airplane to visit our relatives in another country.',
      'I enjoy skating around the park on my roller skates.',
      'I learned how to ride a bicycle without training wheels.',
      'He showed off his tricks on the skateboard at the skate park.',
      'The farmer used the tractor to plow the fields for planting.',
      'The delivery truck brought a new sofa to our house.',
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
                            transportasiList[index],
                            style: const TextStyle(
                              fontSize: 24,
                              fontFamily: 'Dinofont',
                              color: Color.fromARGB(255, 206, 212, 106),
                            ),
                          ),
                          const SizedBox(height: 0),
                          Image.asset(
                            gambarTransportasi[
                                index], // Use Image.asset to display the image
                            width: MediaQuery.of(context).size.width * 0.50,
                            height: MediaQuery.of(context).size.width * 0.35,
                          ),
                          ElevatedButton(
                            onPressed: () {
                              _speak(vehicleList[index]);
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
                            vehicleList[index],
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
                        if (index < transportasiList.length - 1) {
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
                      'Vehicle',
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
              itemCount: (transportasiList.length / 6).ceil(),
              itemBuilder: (context, pageIndex) {
                final startIndex = pageIndex * 6;
                final endIndex = (pageIndex + 1) * 6;
                final visibleTrasnportasi = transportasiList.sublist(
                  startIndex,
                  endIndex > transportasiList.length
                      ? transportasiList.length
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
                    children:
                        List.generate(visibleTrasnportasi.length, (index) {
                      final itemIndex = startIndex + index;
                      return GestureDetector(
                        onTap: () {
                          showVehicleDialog(context, itemIndex);
                        },
                        child: Container(
                          color: Colors.transparent,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                visibleTrasnportasi[index],
                                style: const TextStyle(
                                  color: Color(0xFF07553B),
                                  fontSize: 18,
                                  fontFamily: 'Dinofont',
                                ),
                              ),
                              const SizedBox(height: 0),
                              Image.asset(
                                gambarTransportasi[itemIndex],
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
