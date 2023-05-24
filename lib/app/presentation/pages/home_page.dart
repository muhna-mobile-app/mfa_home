import 'dart:developer';

import 'package:common_dependencies/common_dependencies.dart';
import 'package:flutter/material.dart';
import 'package:mfa_authentication/app/presentation/stores/auth_store.dart';
import './helpers/constants/muhna_texts.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  final authStore = GetIt.I.get<AuthStore>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            ListTile(
              leading: const Icon(Icons.person_2_outlined),
              title: const Text(
                'Perfil',
                style: TextStyle(color: Colors.black),
              ),
              onTap: () {
                Navigator.of(context).pushNamed('/profile');
              },
            ),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text(
                'Sair',
                style: TextStyle(color: Colors.black),
              ),
              onTap: authStore.status == AuthStatus.loading
                  ? null
                  : () {
                      log(authStore.status.toString());
                      authStore.logout().then((value) {
                        if (authStore.errorMessage != null) {
                          showDialog(
                              context: context,
                              builder: (BuildContext context) => AlertDialog(
                                    title: const Text('Ocorreu um erro'),
                                    content: const Text(
                                        'Não foi possível realizar o login'),
                                    actions: [
                                      TextButton(
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                        child: const Text('Fechar'),
                                      )
                                    ],
                                  ));
                          authStore.errorMessage = null;
                          return;
                        }
                        log(authStore.status.toString());
                        Navigator.of(context).pushReplacementNamed('/login');
                      });
                    },
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          Image.asset(
            'assets/images/muhna_logo.jpg',
            fit: BoxFit.cover,
            width: MediaQuery.of(context).size.width,
          ),
          const Card(
            margin: EdgeInsets.all(0),
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                aboutMuhna,
                softWrap: true,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
