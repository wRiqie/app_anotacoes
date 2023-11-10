import 'dart:async';

import 'package:app_anotacoes/app/business_logic/stores/text/text_store.dart';
import 'package:app_anotacoes/app/core/helpers/dialog_helper.dart';
import 'package:app_anotacoes/app/core/helpers/session_helper.dart';
import 'package:app_anotacoes/app/core/snackbars.dart';
import 'package:app_anotacoes/app/ui/widgets/edit_bottom_sheet_widget.dart';
import 'package:app_anotacoes/app/ui/widgets/gradient_box_widget.dart';
import 'package:app_anotacoes/app/ui/widgets/privacy_policy_link_widget.dart';
import 'package:app_anotacoes/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final textStore = GetIt.I<TextStore>();
  final dialogHelper = GetIt.I<DialogHelper>();
  final textCtrl = TextEditingController();
  final editTextCtrl = TextEditingController();

  final focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    textStore.loadList();
    scheduleMicrotask(() {
      Future.delayed(const Duration(milliseconds: 400), () {
        focusNode.requestFocus();
      });
    });
  }

  @override
  void dispose() {
    textCtrl.dispose();
    editTextCtrl.dispose();
    focusNode.dispose();
    super.dispose();
  }

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
          body: Center(
            child: SingleChildScrollView(
              child: Center(
                child: SizedBox(
                  width: size.width * .8,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        width: size.width,
                        height: size.height * .35,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Observer(
                          builder: (_) => textStore.texts.isNotEmpty
                              ? SingleChildScrollView(
                                  child: Column(
                                    children: textStore.texts
                                        .map(
                                          (e) => Column(
                                            children: [
                                              ListTile(
                                                title: Text(
                                                  e,
                                                  style: const TextStyle(
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 18,
                                                  ),
                                                ),
                                                trailing: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  children: [
                                                    IconButton(
                                                      onPressed: () {
                                                        setState(() {
                                                          editTextCtrl.text = e;
                                                        });
                                                        showModalBottomSheet(
                                                          context: context,
                                                          isScrollControlled:
                                                              true,
                                                          builder: (context) {
                                                            return EditBottomSheetWidget(
                                                              ctrl:
                                                                  editTextCtrl,
                                                              onEdit: () {
                                                                textStore.editText(
                                                                    e,
                                                                    editTextCtrl
                                                                        .text
                                                                        .trim());
                                                              },
                                                            );
                                                          },
                                                        ).then((value) =>
                                                            focusNode
                                                                .requestFocus());
                                                      },
                                                      icon: const Icon(
                                                        Icons.edit,
                                                        color: Color.fromARGB(
                                                            255, 229, 212, 63),
                                                      ),
                                                    ),
                                                    IconButton(
                                                      onPressed: () {
                                                        dialogHelper
                                                            .showDecisionDialog(
                                                          context,
                                                          title:
                                                              'Excluir registro',
                                                          content:
                                                              'Tem certeza que deseja excluir esse texto?',
                                                          onConfirm: () {
                                                            textStore
                                                                .deleteText(e);
                                                          },
                                                        );
                                                      },
                                                      icon: const Icon(
                                                        Icons.delete,
                                                        color: Colors.red,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              const Padding(
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 12),
                                                child: Divider(),
                                              ),
                                            ],
                                          ),
                                        )
                                        .toList(),
                                  ),
                                )
                              : const Center(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Icon(Icons.inventory),
                                      SizedBox(
                                        height: 12,
                                      ),
                                      Text('Sem textos...')
                                    ],
                                  ),
                                ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        focusNode: focusNode,
                        controller: textCtrl,
                        textInputAction: TextInputAction.done,
                        onFieldSubmitted: (value) {
                          if (value.trim().isEmpty) {
                            AlertSnackbar(context,
                                message:
                                    'Por favor digite um texto para salvá-lo');
                            focusNode.requestFocus();
                            return;
                          }

                          setState(() {
                            textCtrl.clear();
                          });
                          textStore.addText(value.trim());
                          focusNode.requestFocus();
                        },
                        decoration: const InputDecoration(
                          hintText: 'Digite seu texto',
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
