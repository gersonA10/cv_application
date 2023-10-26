import 'package:flutter/material.dart';

class CertificacionesPage extends StatelessWidget {
  const CertificacionesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Certificaciones",
          //style: TextStyle(color: Colors.white),
        ),
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          Certificate(
            image: "assets/flutter.jpg",
            color: Colors.blue,
          ),
          Certificate(
            image: "assets/deliveryCertificate.jpg",
            color: Colors.pink,
          ),
          Certificate(
            image: "assets/java.jpg",
            color: Colors.deepPurpleAccent,
          ),
          Certificate(
            image: "assets/realidad.jpg",
            color: Colors.green,
          ),
          Certificate(
            image: "assets/web.jpg",
            color: Colors.indigoAccent,
          ),
          Certificate(
            image: "assets/wordpress.jpg",
            color: Colors.tealAccent,
          ),
        ],
      ),
    );
  }
}

class Certificate extends StatelessWidget {
  String image;
  Color color;

  Certificate({
    required this.image,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: color,
        boxShadow: const [
          BoxShadow(
            color: Colors.black,
            blurRadius: 5,
            spreadRadius: 1,
          ),
        ],
      ),
      child: FadeInImage(
        height: 250,
        width: double.infinity,
        image: AssetImage(image),
        placeholder: const AssetImage(
          "assets/placeholder.gif",
        ),
        fit: BoxFit.cover,
      ),
    );
  }
}
