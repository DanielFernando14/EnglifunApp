import 'package:englifun/abjad.dart';
import 'package:englifun/aktivitas.dart';
import 'package:englifun/alatdapur.dart';
import 'package:englifun/alatmusik.dart';
import 'package:englifun/alatrumah.dart';
import 'package:englifun/alatsekolah.dart';
import 'package:englifun/anggotatubuh.dart';
import 'package:englifun/angka.dart';
import 'package:englifun/bentuk.dart';
import 'package:englifun/buah.dart';
import 'package:englifun/hewan.dart';
import 'package:englifun/hobby.dart';
import 'package:englifun/keluarga.dart';
import 'package:englifun/makanan.dart';
import 'package:englifun/minuman.dart';
import 'package:englifun/musim.dart';
import 'package:englifun/olahraga.dart';
import 'package:englifun/pakaian.dart';
import 'package:englifun/profesi.dart';
import 'package:englifun/ruangandirumah.dart';
import 'package:englifun/sayuran.dart';
import 'package:englifun/tempat.dart';
import 'package:englifun/transportasi.dart';
import 'package:englifun/warna.dart';
import 'package:flutter/material.dart';

class Belajar extends StatefulWidget {
  Belajar({super.key});

  final List<String> boxTexts = [
    'Alphabet',
    'Activity',
    'Kitchen set',
    'Musical instrument',
    'Home Appliance',
    'School tools',
    'Body Parts',
    'Number',
    'Shape',
    'Fruit',
    'Animal',
    'Hobby',
    'Family',
    'Food',
    'Drink',
    'Season',
    'Sport',
    'Clothes',
    'Profession',
    'Room at Home',
    'Vegetables',
    'Place',
    'Vehicle',
    'Color',
  ];

  final List<String> boxImages = [
    'assets/images/Gambar Abjad.png',
    'assets/images/Gambar Aktivitas.png',
    'assets/images/Gambar Alat Dapur.png',
    'assets/images/Gambar Alat Musik.png',
    'assets/images/Gambar Alat Rumah.png',
    'assets/images/Gambar Alat Sekolah.png',
    'assets/images/Gambar Anggota Tubuh.png',
    'assets/images/Gambar Angka.png',
    'assets/images/Gambar Bentuk.png',
    'assets/images/Gambar Buah.png',
    'assets/images/Gambar Hewan.png',
    'assets/images/Gambar Hobby.png',
    'assets/images/Gambar Keluarga.png',
    'assets/images/Gambar Makanan.png',
    'assets/images/Gambar Minuman.png',
    'assets/images/Gambar Musim.png',
    'assets/images/Gambar Olahraga.png',
    'assets/images/Gambar Pakaian.png',
    'assets/images/Gambar Profesi.png',
    'assets/images/Gambar Ruangan di Rumah.png',
    'assets/images/Gambar Sayuran.png',
    'assets/images/Gambar Tempat.png',
    'assets/images/Gambar Transportasi.png',
    'assets/images/Gambar Warna.png',
  ];

  @override
  State<Belajar> createState() => _BelajarState();
}

class _BelajarState extends State<Belajar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height,
            color: const Color.fromARGB(255, 173, 239, 209),
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
                      "Let's Study",
                      style: TextStyle(
                        color: Color(0xFF00203F),
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
              itemCount: (widget.boxTexts.length / 6).ceil(),
              itemBuilder: (context, pageIndex) {
                final startIndex = pageIndex * 6;
                final endIndex = (pageIndex + 1) * 6;
                final visibleBoxTexts = widget.boxTexts.sublist(
                    startIndex,
                    endIndex > widget.boxTexts.length
                        ? widget.boxTexts.length
                        : endIndex);
                final visibleBoxImages = widget.boxImages.sublist(
                    startIndex,
                    endIndex > widget.boxImages.length
                        ? widget.boxImages.length
                        : endIndex);
                return Container(
                  padding: const EdgeInsets.only(
                    left: 35,
                    right: 35,
                    bottom: 0,
                  ),
                  child: GridView.count(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    crossAxisCount: 2,
                    mainAxisSpacing: 0,
                    crossAxisSpacing: 0,
                    children: List.generate(visibleBoxTexts.length, (index) {
                      final itemIndex = startIndex + index;
                      return GestureDetector(
                        onTap: () {
                          // Aksi ketika kotak di-klik, navigasi ke kelas selanjutnya di sini
                          switch (itemIndex) {
                            case 0:
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const Abjad(),
                                ),
                              );
                              break;
                            case 1:
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const Aktivitas(),
                                ),
                              );
                              break;
                            case 2:
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const AlatDapur(),
                                ),
                              );
                              break;
                            case 3:
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const AlatMusik(),
                                ),
                              );
                              break;
                            case 4:
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const AlatRumah(),
                                ),
                              );
                              break;
                            case 5:
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const AlatSekolah(),
                                ),
                              );
                              break;
                            case 6:
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const AnggotaTubuh(),
                                ),
                              );
                              break;
                            case 7:
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const Angka(),
                                ),
                              );
                              break;
                            case 8:
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const Bentuk(),
                                ),
                              );
                              break;
                            case 9:
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const Buah(),
                                ),
                              );
                              break;
                            case 10:
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const Hewan(),
                                ),
                              );
                              break;
                            case 11:
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const Hobby(),
                                ),
                              );
                              break;
                            case 12:
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const Keluarga(),
                                ),
                              );
                              break;
                            case 13:
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const Makanan(),
                                ),
                              );
                              break;
                            case 14:
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const Minuman(),
                                ),
                              );
                              break;
                            case 15:
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const Musim(),
                                ),
                              );
                              break;
                            case 16:
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const Olahraga(),
                                ),
                              );
                              break;
                            case 17:
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const Pakaian(),
                                ),
                              );
                              break;
                            case 18:
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const Profesi(),
                                ),
                              );
                              break;
                            case 19:
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const RuanganDiRumah(),
                                ),
                              );
                              break;
                            case 20:
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const Sayuran(),
                                ),
                              );
                              break;
                            case 21:
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const Tempat(),
                                ),
                              );
                              break;
                            case 22:
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const Transportasi(),
                                ),
                              );
                              break;
                            case 23:
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const Warna(),
                                ),
                              );
                              break;
                          }
                        },
                        child: Container(
                          color: Colors.transparent,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                visibleBoxTexts[index],
                                style: const TextStyle(
                                    color: Color(0xFF00203F),
                                    fontSize: 18,
                                    fontFamily: 'Dinofont'),
                              ),
                              const SizedBox(
                                height: 0,
                              ),
                              Image.asset(
                                visibleBoxImages[index],
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
