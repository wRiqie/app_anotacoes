import 'package:app_anotacoes/app/core/helpers/session_helper.dart';
import 'package:app_anotacoes/app/ui/widgets/gradient_box_widget.dart';
import 'package:app_anotacoes/app/ui/widgets/privacy_policy_link_widget.dart';
import 'package:app_anotacoes/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> texts = [
    'Olá mundo',
    '123456',
    'Sei lá',
    'Sei lá',
    'Sei lá',
    'Sei lá',
    'Sei lá',
    'Sei lá',
    'Sei lá',
    'Sei lá',
    'Sei lá',
    'Sei lá',
  ];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Stack(
      children: [
        const GradientBoxWidget(),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            actions: [
              IconButton(
                onPressed: () {
                  GetIt.I<SessionHelper>().signOut().then(
                        (_) => Navigator.pushReplacementNamed(
                            context, AppRoutes.signin),
                      );
                },
                icon: const Icon(Icons.logout),
              ),
            ],
          ),
          bottomNavigationBar: const PrivacyPolicyLinkWidget(),
          body: SingleChildScrollView(
            child: Center(
              child: SizedBox(
                width: size.width * .8,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      height: size.height * .45,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: SingleChildScrollView(
                        child: Column(
                          children: texts
                              .map(
                                (e) => ListTile(
                                  title: Text(
                                    e,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 18,
                                    ),
                                  ),
                                  trailing: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      IconButton(
                                        onPressed: () {},
                                        icon: const Icon(
                                          Icons.edit,
                                          color:
                                              Color.fromARGB(255, 172, 158, 31),
                                        ),
                                      ),
                                      IconButton(
                                        onPressed: () {},
                                        icon: const Icon(
                                          Icons.delete,
                                          color: Colors.red,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              )
                              .toList(),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
