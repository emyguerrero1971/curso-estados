import 'package:flutter/material.dart';

import 'package:estados/models/usuario.dart';
import 'package:estados/services/usuario_service.dart';

class Pagina2Page extends StatelessWidget {
  const Pagina2Page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: StreamBuilder(
          stream: usuarioService.usuarioStream,
          builder: (BuildContext context, AsyncSnapshot<Usuario> snapshot) {
            return snapshot.hasData
              ? Text('Nombre: ${snapshot.data?.nombre}')
              : const Text('Pagina 2');
          },
        ),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          MaterialButton(
            color: Colors.blue,
            onPressed: () {
              final nuevoUsuario = Usuario(nombre: 'Emilio', edad: 20);
              usuarioService.cargarUsuario(nuevoUsuario);
            },
            child: const Text(
              'Establecer Usuario',
              style: TextStyle(color: Colors.white),
            ),
          ),
          const SizedBox(
            height: 10.0,
          ),
          MaterialButton(
            color: Colors.blue,
            onPressed: () {
              usuarioService.cambiarEdad(50);
            },
            child: const Text(
              'Cambiar Edad',
              style: TextStyle(color: Colors.white),
            ),
          ),
          const SizedBox(
            height: 10.0,
          ),
          MaterialButton(
            color: Colors.blue,
            onPressed: () {},
            child: const Text(
              'Añadir Profesión',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      )),
    );
  }
}
