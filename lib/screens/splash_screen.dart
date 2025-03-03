import 'package:app_incidentes/repositories/auth_repository.dart';
import 'package:app_incidentes/screens/pantalla_login.dart';
import 'package:app_incidentes/screens/pantalla_principal.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback(
      (_) {
        _verificarUsuarioLogeado();
      },
    );
  }

  Future<void> _verificarUsuarioLogeado() async {
    final authRepository = AuthRepository();
    final estaLogeado = authRepository.estaLogeado();

    await Future.delayed(Duration(seconds: 2));

    if (estaLogeado) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (_) {
            return PantallaPrincipal();
          },
        ),
      );
    } else {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (_) {
            return PantallaLogin();
          },
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
