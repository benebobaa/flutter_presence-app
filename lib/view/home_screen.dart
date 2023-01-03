import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_presence/bloc/auth/auth_bloc.dart';
import 'package:flutter_presence/models/mhs_data.dart';
import 'package:flutter_presence/utils/custom_colors.dart';
import 'package:flutter_presence/utils/to_title.dart';
import 'package:flutter_presence/view/qrcode_scanner_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  CarouselController buttonCarouselController = CarouselController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: BlocBuilder<AuthBloc, AuthState>(
            builder: (context, state) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 25,
                  ),
                  //topbar
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 20,
                    ),
                    child: Row(
                      children: [
                        Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                state is AuthSignedIn
                                    ? state.user.mhs!.nama!
                                    : 'state.user',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20),
                              ),
                              SizedBox(height: 5),
                              Text(
                                'You have 3 courses today',
                                style: TextStyle(color: Colors.black54),
                              ),
                            ]),
                        const Spacer(),
                        const CircleAvatar(
                          child: Icon(
                            Icons.person,
                            size: 30,
                          ),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(
                    // Horizontal ListView
                    height: 200,
                    width: double.infinity,
                    child: CarouselSlider(
                      carouselController: buttonCarouselController,
                      options: CarouselOptions(
                        autoPlay: true,
                        enlargeCenterPage: true,
                        viewportFraction: 0.82,
                        aspectRatio: 2.0,
                        initialPage: 1,
                      ),
                      items: [
                        for (var data in datas)
                          Stack(
                            children: [
                              Card(
                                elevation: 4, // Change this
                                shadowColor: Colors.black12,
                                color: Colors.deepPurple,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(14),
                                ),
                                child: SizedBox(
                                  height: 200,
                                  width: double.infinity,
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 20),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      // mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        const SizedBox(height: 60),
                                        Text(
                                          data['matkul']!,
                                          style: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 20),
                                        ),
                                        const SizedBox(height: 3),
                                        Text(
                                          data['dosen']!,
                                          style: const TextStyle(
                                              color: Colors.white54,
                                              fontSize: 15),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Align(
                                  alignment: Alignment.bottomCenter,
                                  child: SizedBox(
                                      height: 55,
                                      width: double.infinity,
                                      child: Card(
                                        shape: const RoundedRectangleBorder(
                                          borderRadius: BorderRadius.only(
                                              bottomLeft: Radius.circular(12),
                                              bottomRight: Radius.circular(12)),
                                        ),
                                        color: Colors.white10,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            Row(
                                              children: [
                                                const Icon(
                                                  Icons.timer_sharp,
                                                  color: Colors.white,
                                                  size: 13,
                                                ),
                                                const SizedBox(width: 5),
                                                Text(
                                                  data['jam']!,
                                                  style: const TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 13),
                                                ),
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                const Icon(
                                                  Icons.location_on_sharp,
                                                  color: Colors.white,
                                                  size: 13,
                                                ),
                                                const SizedBox(width: 5),
                                                Text(
                                                  data['ruang']!,
                                                  style: const TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 13),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ))),
                              Positioned(
                                right: -0.5,
                                top: 18,
                                child: Card(
                                  elevation: 4, // Change this
                                  shadowColor: Colors.black12,
                                  color: Colors.amber,
                                  shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(10),
                                        topLeft: Radius.circular(10)),
                                  ),
                                  child: SizedBox(
                                    height: 25,
                                    width: 70,
                                    child: Center(
                                      child: Text(
                                        data['kelas']!,
                                        style: const TextStyle(
                                            color: Colors.white, fontSize: 10),
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          )
                      ],
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 20, top: 20),
                    child: Text('Menu',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18)),
                  ),
                  const Padding(
                      padding: EdgeInsets.only(left: 20, top: 10),
                      child: Text(
                        'Amikom University - Students',
                        style: TextStyle(color: Colors.black54),
                      )),
                  SizedBox(height: 35),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        height: 70,
                        width: 60,
                        child: Column(
                          children: [
                            CircleAvatar(
                              backgroundColor: menu1,
                              child: Icon(
                                Icons.book_outlined,
                                color: icon1,
                              ),
                            ),
                            Spacer(),
                            Center(child: Text('KHS'))
                          ],
                        ),
                      ),
                      Container(
                        height: 70,
                        width: 60,
                        child: Column(
                          children: [
                            CircleAvatar(
                              backgroundColor: menu2,
                              child: Icon(
                                Icons.help_outline,
                                color: icon2,
                              ),
                            ),
                            Spacer(),
                            Center(child: Text('Schedule'))
                          ],
                        ),
                      ),
                      Container(
                        height: 70,
                        width: 60,
                        child: Column(
                          children: [
                            InkWell(
                              onTap: (() => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ScannerScreen()))),
                              // uploadImage(ImageSource.camera, context)),
                              // uploadImage2()),
                              child: CircleAvatar(
                                backgroundColor: menu3,
                                child: Icon(
                                  Icons.checklist_sharp,
                                  color: icon3,
                                ),
                              ),
                            ),
                            Spacer(),
                            Center(child: Text('Presence'))
                          ],
                        ),
                      ),
                      Container(
                        height: 70,
                        width: 60,
                        child: Column(
                          children: [
                            CircleAvatar(
                              backgroundColor: menu4,
                              child: Icon(
                                Icons.my_library_books_outlined,
                                color: icon4,
                              ),
                            ),
                            Spacer(),
                            Center(child: Text('Transkrip'))
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  const Padding(
                    padding: EdgeInsets.only(left: 20, top: 20),
                    child: Text('Latest Info',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18)),
                  ),
                  SizedBox(height: 10),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 22),
                    child: SizedBox(
                      // Horizontal ListView
                      height: 250,
                      width: double.infinity,
                      child: CarouselSlider(
                        carouselController: buttonCarouselController,
                        options: CarouselOptions(
                          scrollDirection: Axis.vertical,
                          autoPlay: true,
                          enlargeCenterPage: true,
                          viewportFraction: 0.91,
                          aspectRatio: 2.0,
                          initialPage: 1,
                        ),
                        items: [
                          for (var data in dataw)
                            Card(
                              color: bgcolor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(14),
                              ),
                              elevation: 3,
                              child: Padding(
                                padding: const EdgeInsets.all(20),
                                child: Column(
                                  children: [
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            // image: DecorationImage(image: )
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                right: 15),
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(13),
                                              child: Image.asset(
                                                'assets/amikom_news.jpg',
                                                width: 90,
                                              ),
                                            ),
                                          ),
                                        ),
                                        const SizedBox(width: 8.0),
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                softWrap: false,
                                                maxLines: 3,
                                                overflow: TextOverflow.ellipsis,
                                                data['title']!,
                                                style: const TextStyle(
                                                    fontSize: 15,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              const SizedBox(height: 8),
                                              Text(
                                                data['date']!,
                                                style: const TextStyle(
                                                    color: Colors.black54),
                                              ),
                                              const SizedBox(height: 8),
                                              Row(
                                                children: [
                                                  const Icon(
                                                    Icons
                                                        .remove_red_eye_outlined,
                                                    color: Colors.blue,
                                                  ),
                                                  const SizedBox(width: 4),
                                                  Text(
                                                    data['views']!,
                                                    style: const TextStyle(
                                                        color: Colors.blue),
                                                  )
                                                ],
                                              ),
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                    SizedBox(height: 5),
                                    Container(
                                      child: Text(
                                        'Perkenalkan saya benediktus Satriya Mukti, saya sekarang sedang berkuliah di universitas amikom yogyakarta. aktivitas saya setiap hari membuat aplikasi berbasis mobile apps maupun internet of things',
                                        softWrap: false,
                                        maxLines: 4,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            )
                        ],
                      ),
                    ),
                  )
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}

List<Map<String?, String?>> datas = [
  {
    'dosen': 'Benediktus Satriya M.Kom',
    'matkul': capitalizeAllWord('INTERNET OF THINGS'),
    'kelas': 'Teori',
    'jam': '20:00-21:00',
    'ruang': '05.03.02'
  },
  {
    'dosen': 'Arvin sujat M.Kom',
    'matkul': capitalizeAllWord('BIG DATA DAN DATA MINING'),
    'kelas': 'Praktikum',
    'jam': '20:00-21:00',
    'ruang': 'VAR.2.1'
  },
  {
    'dosen': 'Arvin sujat M.Kom',
    'matkul': capitalizeAllWord('BIG DATA & PREDICTIVE ANALYTICS LANJUT'),
    'kelas': 'Teori',
    'jam': '20:00-21:00',
    'ruang': '7.3.1'
  },
];

List<Map<String?, String?>> dataw = [
  {
    'title': 'Amikom juara 2 lomba internet of things bro',
    'author': 'Kobo Kanaeru',
    'date': '30 Desember 2022',
    'views': '23',
  },
  {
    'title': 'Mahasiswa pembuat aplikasi presensi amikom',
    'author': 'Kobo Kanaeru',
    'date': '30 Desember 2022',
    'views': '23',
  }
];

// void uploadImage(ImageSource imageSource, context) async {
//   // final String? token = await storage.readToken();
//   try {
//     final pickedFile = await ImagePickerPlugin().pickImage(source: imageSource);
//     // isLoading = true;
//     // notifyListeners();

//     if (pickedFile != null) {
//       // if (token == null) {
//       //   // snackbarMessage(context, 'Debug Mode - Do not have token');
//       //   // Navigator.of(context).pushReplacement(
//       //   //   MaterialPageRoute(builder: (context) => const OnboardingScreen()),
//       //   // );
//       //   return;
//       // }
//       // var response = await _profileRepo.uploadImage(
//       //     token: token, filePath: pickedFile.path);
//       // // imageURL = image['data'];
//       // print(imageURL);

//       // if (response.statusCode == 200) {
//       //   //get image url from api response
//       //   profileData.image = response.data['data'];
//       //   notifyListeners();
//       //   snackbarMessage(context, 'Image uploaded');
//       // } else {
//       //   snackbarMessage(context, 'Failed, Error');
//       // }
//     } else {
//       // snackbarMessage(context, 'Failed, Image not selected');
//     }
//   } finally {
//     // isLoading = false;
//     // notifyListeners();
//   }
// }

// uploadImage2() async {
//   var permissionStatus = requestPermissions();
//   print(permissionStatus);
//   // MOBILE
//   if (!kIsWeb && await permissionStatus.isGranted) {
//     final ImagePicker _picker = ImagePicker();
//     XFile? image = await _picker.pickImage(source: ImageSource.camera);

//     if (image != null) {
//       // var selected = File(image.path);

//       // setState(() {
//       //   _file = selected;
//       // });
//     } else {
//       showToast("No file selected");
//     }
//   }
//   // WEB
//   else if (kIsWeb) {
//     final ImagePicker _picker = ImagePicker();
//     XFile? image = await _picker.pickImage(source: ImageSource.camera);
//     if (image != null) {
//       var f = await image.readAsBytes();
//       // setState(() {
//       //   _file = File("a");
//       //   webImage = f;
//       // });
//     } else {
//       showToast("No file selected");
//     }
//   } else {
//     showToast("Permission not granted");
//   }
// }

// Future<PermissionStatus> requestPermissions() async {
//   await Permission.camera.request();
//   await Permission.photos.request();
//   return Permission.camera.status;
// }

// void showToast(String message) {
//   Fluttertoast.showToast(
//     msg: message,
//     toastLength: Toast.LENGTH_SHORT,
//     gravity: ToastGravity.BOTTOM,
//     timeInSecForIosWeb: 1,
//     backgroundColor: Colors.red,
//     textColor: Colors.white,
//     fontSize: 16.0,
//   );
// }
