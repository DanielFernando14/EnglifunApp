import 'package:englifun/abjadquiz.dart';
import 'package:englifun/aktivitasquiz.dart';
import 'package:englifun/alatdapurquiz.dart';
import 'package:englifun/alatmusikquiz.dart';
import 'package:englifun/alatrumahquiz.dart';
import 'package:englifun/alatsekolahquiz.dart';
import 'package:englifun/anggotatubuhquiz.dart';
import 'package:englifun/angkaquiz.dart';
import 'package:englifun/bentukquiz.dart';
import 'package:englifun/buahquiz.dart';
import 'package:englifun/hewanquiz.dart';
import 'package:englifun/hobbyquiz.dart';
import 'package:englifun/keluargaquiz.dart';
import 'package:englifun/makananquiz.dart';
import 'package:englifun/minumanquiz.dart';
import 'package:englifun/musimquiz.dart';
import 'package:englifun/olahragaquiz.dart';
import 'package:englifun/pakaianquiz.dart';
import 'package:englifun/profesiquiz.dart';
import 'package:englifun/ruangandirumahquiz.dart';
import 'package:englifun/sayuranquiz.dart';
import 'package:englifun/tempatquiz.dart';
import 'package:englifun/transportasiquiz.dart';
import 'package:englifun/warnaquiz.dart';
import 'package:flutter/material.dart';

class Quiz extends StatefulWidget {
  Quiz({super.key});

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
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height,
            color: const Color.fromARGB(255, 221, 169, 75),
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
                      "Let's Quiz",
                      style: TextStyle(
                        color: Color.fromARGB(255, 30, 65, 116),
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
                          switch (itemIndex) {
                            case 0:
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const AbjadQuiz(),
                                ),
                              );
                            case 1:
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const AktivitasQuiz(),
                                ),
                              );
                              break;
                            case 2:
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const AlatDapurQuiz(),
                                ),
                              );
                              break;
                            case 3:
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const AlatMusikQuiz(),
                                ),
                              );
                              break;
                            case 4:
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const AlatRumahQuiz(),
                                ),
                              );
                              break;
                            case 5:
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const AlatSekolahQuiz(),
                                ),
                              );
                              break;
                            case 6:
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const AnggotaTubuhQuiz(),
                                ),
                              );
                              break;
                            case 7:
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const AngkaQuiz(),
                                ),
                              );
                              break;
                            case 8:
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const BentukQuiz(),
                                ),
                              );
                              break;
                            case 9:
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const BuahQuiz(),
                                ),
                              );
                              break;
                            case 10:
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const HewanQuiz(),
                                ),
                              );
                              break;
                            case 11:
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const HobbyQuiz(),
                                ),
                              );
                              break;
                            case 12:
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const KeluargaQuiz(),
                                ),
                              );
                              break;
                            case 13:
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const MakananQuiz(),
                                ),
                              );
                              break;
                            case 14:
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const MinumanQuiz(),
                                ),
                              );
                              break;
                            case 15:
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const MusimQuiz(),
                                ),
                              );
                              break;
                            case 16:
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const OlahragaQuiz(),
                                ),
                              );
                              break;
                            case 17:
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const PakaianQuiz(),
                                ),
                              );
                              break;
                            case 18:
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const ProfesiQuiz(),
                                ),
                              );
                              break;
                            case 19:
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const RuanganDiRumahQuiz(),
                                ),
                              );
                              break;
                            case 20:
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const SayuranQuiz(),
                                ),
                              );
                              break;
                            case 21:
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const TempatQuiz(),
                                ),
                              );
                              break;
                            case 22:
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const TransportasiQuiz(),
                                ),
                              );
                              break;
                            case 23:
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const WarnaQuiz(),
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
                                    color: Color.fromARGB(255, 30, 65, 116),
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
