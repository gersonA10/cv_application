import 'dart:developer';

import 'package:card_swiper/card_swiper.dart';
import 'package:cv_application/utils/datos.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:showcaseview/showcaseview.dart';
// import 'package:tutorial_coach_mark/tutorial_coach_mark.dart';

class DetailHomePage extends StatefulWidget {
  static const PREFERENCES_IS_FIRST_LAUNCH_STRING =
      "PREFERENCES_IS_FIRST_LAUNCH_STRING";
  const DetailHomePage({super.key});

  @override
  State<DetailHomePage> createState() => _DetailHomePageState();
}

class _DetailHomePageState extends State<DetailHomePage> {
  SharedPreferences? prefs;

  final GlobalKey _one = GlobalKey();
  BuildContext? myContext;

  bool _selected = false;
  final _controller = ScrollController();

  @override
  void initState() {
    super.initState();
    _isFirstLaunch();
  }

  Future<bool> _isFirstLaunch() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    bool isFirstLaunch = sharedPreferences
            .getBool(DetailHomePage.PREFERENCES_IS_FIRST_LAUNCH_STRING) ??
        true;

    if (isFirstLaunch) {
      sharedPreferences.setBool(
          DetailHomePage.PREFERENCES_IS_FIRST_LAUNCH_STRING, false);
    }

    return isFirstLaunch;
  }

  @override
  Widget build(BuildContext context) {
    //final dates = ModalRoute.of(context)!.settings.arguments as CardDetail;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 0),
        child: ListView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.only(top: 50),
          // mainAxisAlignment: MainAxisAlignment.start,
          controller: _controller,
          children: [
            Row(
              children: [
                Container(
                  margin: const EdgeInsets.only(
                    left: 20,
                  ),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black45,
                          blurRadius: 10,
                          spreadRadius: 0,
                          blurStyle: BlurStyle.normal,
                          offset: Offset(0, 5),
                        )
                      ]),
                  child: const CircleAvatar(
                    radius: 25,
                    backgroundColor: Colors.transparent,
                    backgroundImage: AssetImage("assets/profile.JPG"),
                  ),
                ),
                
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Center(
              child: GestureDetector(
                child: const Text(
                  "Regresar",
                  style: TextStyle(fontSize: 15),
                ),
                // onTap: () => showTutorial(),
                onTap: () => Navigator.pop(context),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              "Skills",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.6,
              width: double.infinity,
              child: Swiper(
                autoplay: true,
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    margin: const EdgeInsets.only(bottom: 20),
                    shadowColor: skills[index]["color"],
                    elevation: 10,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 200,
                          width: 200,
                          child: FadeInImage(
                            placeholder:
                                const AssetImage('assets/placeholder.gif'),
                            image: NetworkImage(
                              skills[index]['image'] ?? '',
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Text(
                          skills[index]["name"],
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey,
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Text(
                          skills[index]["level"] ?? "",
                          style: TextStyle(
                            fontSize: 35,
                            fontWeight: FontWeight.bold,
                            color: skills[index]["color"]
                          ),
                        ),
                        // const Spacer(),
                        // circularProgress(
                        //   color: skills[index]["color"],
                        //   nameCenter: skills[index]["namePorcent"] ?? "",
                        //   porcent: skills[index]["porcent"],
                        // ),
                      ],
                    ),
                  );
                },
                itemCount: skills.length,
                scale: 0.75,
                viewportFraction: 0.7,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            // const Text(
            //   "Experience",
            //   textAlign: TextAlign.center,
            //   style: TextStyle(
            //     fontSize: 25,
            //     fontWeight: FontWeight.bold,
            //   ),
            // ),
            ExpansionTile(
              trailing: _selected
                  ? const Icon(
                      Icons.keyboard_arrow_up_outlined,
                      color: Colors.grey,
                    )
                  : const Icon(
                      Icons.keyboard_arrow_down_outlined,
                      color: Colors.grey,
                    ),
              onExpansionChanged: (value) async {
                // _controller.offset. = 0.0;
                _selected = value;
                final off = _controller.position.maxScrollExtent;
                print(off);
                if (value) {
                  await Future.delayed(const Duration(milliseconds: 200));
                  _controller.animateTo(
                    632.4857142857144,
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.easeIn,
                  );
                }
                setState(() {});
              },
              title: const Text(
                "Experience",
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              children: [
                ListTile(
                  title: const Text("Google Developers Student Club"),
                  subtitle: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "August 2022 - Present",
                        style: TextStyle(color: Colors.blueGrey),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text("Dart and Flutter Mentor"),
                    ],
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Divider(),
                ),
                ListTile(
                  title: const Text("Aguilar & Asociados"),
                  subtitle: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "July 2021",
                        style: TextStyle(color: Colors.blueGrey),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                          "Worked with Flutter to develop an application on Bolivian law."),
                    ],
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Divider(),
                ),
                ListTile(
                  title: const Text("ECAM"),
                  subtitle: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "January 2020 - Present",
                        style: TextStyle(color: Colors.blueGrey),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text("App Inventor Application Development Mentor"),
                    ],
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Divider(),
                ),
                ListTile(
                  title: const Text("Smart Service"),
                  subtitle: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "January 2020 - Present",
                        style: TextStyle(color: Colors.blueGrey),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                          "I worked as a software and hardware technician for mobile devices"),
                    ],
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Divider(),
                ),
                ListTile(
                  title: const Text("Cognos Capacitation"),
                  subtitle: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "January 2020 - Present",
                        style: TextStyle(color: Colors.blueGrey),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text("I worked as Flutter Teacher"),
                    ],
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Divider(),
                ),
                ListTile(
                  title: const Text("JF Computer"),
                  subtitle: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "January 2020 - Present",
                        style: TextStyle(color: Colors.blueGrey),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                          "I worked as a software and hardware technician for mobile and computers"),
                    ],
                  ),
                ),
              ],
            ),

            // const Text("data")
          ],
        ),
      ),
    );
  }

  CircularPercentIndicator circularProgress({
    required String nameCenter,
    required Color color,
    required double porcent,
  }) {
    return CircularPercentIndicator(
      animation: true,
      animationDuration: 2000,
      radius: 70.0,
      lineWidth: 18.0,
      percent: porcent, //porcent ?? 1,
      center: Text(nameCenter),
      progressColor: color,
    );
  }
}
