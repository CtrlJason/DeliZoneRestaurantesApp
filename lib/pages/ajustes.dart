import "package:flutter/material.dart";
import "package:foodpartner_app/pages/login.dart";
import 'config/manual.dart';
import 'config/actualizaciones.dart';
import 'config/notificaciones.dart';

class Ajustes extends StatelessWidget {
  const Ajustes({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        title: const Text(
          "Ajustes",
          style: TextStyle(fontSize: 20),
        ),
      ),
      body: Center(
        child: Container(
            padding: const EdgeInsets.only(bottom: 100),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Boton Notificaciones
                  _botonesAjustes(
                      context: context,
                      route: const Notificaciones(),
                      buttonText: "Notificaciones"),
                  const SizedBox(height: 60.0),
                  // Boton del Manual
                  _botonesAjustes(
                      context: context,
                      route: const Manual(),
                      buttonText: "Manual"),
                  const SizedBox(height: 60.0),
                  // Boton Actualizaciones
                  _botonesAjustes(
                      context: context,
                      route: const Actualizaciones(),
                      buttonText: "Actualizaciones"),
                  const SizedBox(height: 60.0),
                  // Boton Salir
                  _botonesAjustes(
                      context: context,
                      route: const Login(),
                      buttonText: "Salir")
                ])),
      ),
    );
  }
}

Widget _botonesAjustes({
  required BuildContext context,
  required Widget route,
  required String buttonText, // Agregamos el parámetro para el texto
}) => // El TextButton se coincidera como una sola expresion y el "fat arrow" puede devolver el Widget
    TextButton(
      onPressed: () {
        if (buttonText == "Salir") {
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => route),
              (Route<dynamic> route) => false);
        } else {
          Navigator.push(
              context,
              PageRouteBuilder(
                pageBuilder: (context, animation, secondaryAnimation) => route,
              ));
        }
      },
      style: TextButton.styleFrom(
        foregroundColor: Colors.black,
        iconColor: Colors.red,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20), // Bordes redondeados
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(
            Icons.arrow_circle_left,
            size: 40,
          ),
          const SizedBox(width: 24),
          Text(
            buttonText, // Utilizamos el parámetro para el texto del botón
            style: const TextStyle(fontSize: 25, color: Colors.black),
          ),
        ],
      ),
    );
