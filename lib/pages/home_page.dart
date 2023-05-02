import 'package:cv_application/pages/detail_page.dart';
import 'package:cv_application/pages/skills_programming.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final top = MediaQuery.of(context).size.height * 0.03;
    final left = MediaQuery.of(context).size.height * 0.035;
    return Scaffold(
      backgroundColor: Colors.pink,
      body: Home(top: top, left: left),
    );
  }
}

class Home extends StatefulWidget {
  const Home({
    Key? key,
    required this.top,
    required this.left,
  }) : super(key: key);

  final double top;
  final double left;

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  SharedPreferences? prefs;
  String _key = '';
  late TutorialCoachMark tutorialCoachMark;
  GlobalKey keybutton = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return _cards(context);
  }

  _cards(BuildContext context) {
    return ListView(
        physics: const BouncingScrollPhysics(),
        //shrinkWrap: true,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: widget.top, left: widget.left),
                    child: const Text(
                      "Gerson Aguilar",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(left: widget.left, top: 20, right: 20),
                child: Row(
                  children: const [
                    Expanded(
                      flex: 10,
                      child: Text(
                        "Nombres: Gerson\nApellidos: Aguilar Lizarro\nEdad: 19 Años\nTel: 73231430\nGmail: gerson10107@gmail.com",
                        overflow: TextOverflow.ellipsis,
                        maxLines: 10,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ),
                    Spacer(),
                    CircleAvatar(
                      radius: 50,
                      backgroundColor: Colors.pink,
                      backgroundImage: AssetImage("assets/profile.JPG"),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              CardP(
                //key: keyButton1,
                name: "Certifications",
                description: "Certificaciones",
                icon: Icons.article,
                color: Colors.indigo,
                onTap: () {
                  Navigator.push(context, FadePageRoute(child: DetailPage()));
                  // prefs!.remove("valor");
                  // Navigator.pushNamed(context, "certificaciones");

                  // if (prefs!.getString('valor') == null) {
                  //   //showTutorial();
                  //   saveData();
                  // } else {
                  //   Navigator.pushNamed(context, "certificaciones");
                  // }
                  //showTutorial();
                },
              ),
              CardP(
                name: "Programming Skills and Experience",
                description: "Habilidades en programacion y Experiencia",
                icon: Icons.code,
                color: Colors.pinkAccent,
                onTap: () {
                  //print(prefs!.getString("valor"));
                  // saveData();
                  Navigator.pushNamed(
                    context,
                    'skills_programming',
                    // arguments: loadData(),
                  );
                },
              ),
              Padding(
                padding: EdgeInsets.only(left: widget.left, top: 10),
                child: const Text(
                  "Languages",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              _languages("Spanish", Colors.amber, 0.90, "Native"),
              _languages("English", Colors.indigo, 0.40, "B1"),
              // showTutorial();
            ],
          )
        ]);
  }

  Container _languages(
      String idiom, Color color, double percent, String trailing) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 14, vertical: 9),
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
      ),
      width: double.infinity,
      height: 80,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: LinearPercentIndicator(
        curve: Curves.fastOutSlowIn,
        animation: true,
        animationDuration: 2000,
        leading: SizedBox(
          // width: 80,
          child: Text(
            idiom,
            style: const TextStyle(
                color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
            maxLines: 2,
          ),
        ),
        trailing: Row(
          children: [
            const SizedBox(
              width: 10,
            ),
            SizedBox(
              width: 80,
              child: Text(
                trailing,
                style: const TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontStyle: FontStyle.normal),
                maxLines: 2,
              ),
            ),
          ],
        ),
        // trailing: Flexible(
        //   child: SizedBox(
        //     width: 80,
        //     child: Text(
        //       trailing,
        //       style: const TextStyle(color: Colors.black, fontSize: 16, fontStyle: FontStyle.normal),
        //       maxLines: 2,
        //     ),
        //   ),
        // ),
        width: 150,
        lineHeight: 20.0,
        percent: percent,
        backgroundColor: Colors.grey,
        progressColor: color,
        barRadius: const Radius.circular(20),
      ),
    );
  }

  // void showTutorial() {
  //   tutorialCoachMark.show(context: context);
  // }

  // void createTutorial() {
  //   tutorialCoachMark = TutorialCoachMark(
  //     targets: _createTargets(),
  //     colorShadow: Colors.red,
  //     textSkip: "Continuar",
  //     paddingFocus: 10,
  //     opacityShadow: 0.8,
  //     onSkip: () {
  //       //SAVE STATE
  //       print("skip");
  //     },
  //   );
  // }

  // List<TargetFocus> _createTargets() {
  //   List<TargetFocus> targets = [];
  //   targets.add(
  //     TargetFocus(
  //       identify: "keyButton1",
  //       keyTarget: _,
  //       color: Colors.black,
  //       contents: [
  //         TargetContent(
  //           //donde ira el tecto guia
  //           align: ContentAlign.top,
  //           builder: (context, controller) {
  //             return Column(
  //               //mainAxisSize: MainAxisSize.max,
  //               crossAxisAlignment: CrossAxisAlignment.start,
  //               children: const [
  //                 Text(
  //                   "Para acceder a cada seccion puedes presionar sobre esta para que puedas observar mas informacion acerca de esta misma",
  //                   style: TextStyle(
  //                     fontWeight: FontWeight.bold,
  //                     color: Colors.white,
  //                     fontSize: 20.0,
  //                   ),
  //                 ),
  //                 Padding(
  //                   padding: const EdgeInsets.only(top: 10.0),
  //                   child: Text(
  //                     "Toca sobra el area que deseas conocer",
  //                     style: TextStyle(color: Colors.white),
  //                   ),
  //                 ),
  //                 // ElevatedButton(
  //                 //   onPressed: () {
  //                 //     controller.previous();
  //                 //   },
  //                 //   child: Icon(Icons.chevron_left),
  //                 // ),
  //               ],
  //             );
  //           },
  //         ),
  //       ],
  //       shape: ShapeLightFocus.RRect,
  //       // radius: 10,
  //     ),
  //   );

  //   return targets;
  // }

  // saveData() {
  //   _key = "keyButton1";
  //   prefs!.setString("valor", _key).toString();
  //   //print(_key);
  // }

  // loadData() {
  //   String valor = prefs!.getString("valor").toString();
  //   //valor = prefs.get
  //   valor = prefs!.getString("valor").toString();
  //   _key = valor;
  //   setState(() {});
  // }

  // _initSahred() async {
  //   prefs = await SharedPreferences.getInstance();
  //   //saveData();
  //   loadData();
  // }
}

class CardP extends StatelessWidget {
  final String name;
  final String description;
  final IconData icon;
  final Color? color;
  final Function()? onTap;
  const CardP({
    Key? key,
    required this.name,
    required this.description,
    required this.icon,
    required this.color,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
      child: GestureDetector(
        onTap: onTap,
        //   //Aca para mandar los argumentos
        //   //estoy mandando el Modelo de Card
        //   //y mando al name: el name de CustomCard
        //   //que recibira el name que le pondremos al llamarlo
        //   //y description de igual manera
        //   Navigator.pushNamed(context, "detail_home",
        //       arguments: CardDetail(name: name, description: description));
        // },
        child: Card(
          elevation: 10,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                child: Row(
                  children: [
                    Expanded(
                      flex: 20,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            name,
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            description,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                            style: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Icon(
                      icon,
                      size: 50,
                      color: color,
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class FadePageRoute extends PageRouteBuilder {
  final Widget child;

  FadePageRoute({required this.child})
      : super(
          pageBuilder: (BuildContext context, Animation<double> animation,
                  Animation<double> secondaryAnimation) =>
              child,
          transitionsBuilder: (BuildContext context,
              Animation<double> animation,
              Animation<double> secondaryAnimation,
              Widget child) {
            return FadeTransition(
              opacity: animation,
              child: child,
            );
          },
        );
}
