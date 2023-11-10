import 'package:app_anotacoes/app/business_logic/stores/auth/auth_store.dart';
import 'package:app_anotacoes/app/business_logic/stores/obscure/obscure_store.dart';
import 'package:app_anotacoes/app/core/mixins/validator_mixin.dart';
import 'package:app_anotacoes/app/core/snackbars.dart';
import 'package:app_anotacoes/app/data/models/auth_model.dart';
import 'package:app_anotacoes/app/ui/widgets/gradient_box_widget.dart';
import 'package:app_anotacoes/app/ui/widgets/privacy_policy_link_widget.dart';
import 'package:app_anotacoes/app/ui/widgets/title_wrapper_widget.dart';
import 'package:app_anotacoes/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:url_launcher/url_launcher.dart';

class SigninScreen extends StatefulWidget {
  const SigninScreen({super.key});

  @override
  State<SigninScreen> createState() => _SigninScreenState();
}

class _SigninScreenState extends State<SigninScreen> with ValidatorsMixin {
  // #1c4d65 cima
  // #32918a baixo
  // #44bd6e botao
  // #1d2530 icons
  final authStore = GetIt.I<AuthStore>();
  final obscureStore = GetIt.I<ObscureStore>();

  final formKey = GlobalKey<FormState>();
  final userCtrl = TextEditingController();
  final passwordCtrl = TextEditingController();

  @override
  void initState() {
    super.initState();
    obscureStore.restart();
    reaction<bool>((reaction) => authStore.errorMessage != null, (effect) {
      if (effect) {
        ErrorSnackbar(context, message: authStore.errorMessage);
      }
    });
    reaction<bool>((reaction) => authStore.isSuccess, (effect) {
      if (effect) {
        Navigator.pushReplacementNamed(context, AppRoutes.home);
      }
    });
  }

  @override
  void dispose() {
    userCtrl.dispose();
    passwordCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const GradientBoxWidget(),
        SafeArea(
          child: Scaffold(
            backgroundColor: Colors.transparent,
            bottomNavigationBar: const PrivacyPolicyLinkWidget(),
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Form(
                key: formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TitleWrapperWidget(
                      title: const Text(
                        'Usuário',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w300,
                          color: Colors.white,
                        ),
                      ),
                      child: TextFormField(
                        controller: userCtrl,
                        textInputAction: TextInputAction.next,
                        decoration: const InputDecoration(
                          prefixIcon: Icon(
                            Icons.person,
                            color: Color(0xFF1d2530),
                          ),
                          hintText: 'Digite o usuário',
                        ),
                        validator: (value) => combine([
                          () => isNotEmpty(value),
                          () => hasLessThanTwentyChars(value),
                          () => hasSpaceInEndOrStart(value),
                        ]),
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    TitleWrapperWidget(
                      title: const Text(
                        'Senha',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w300,
                          color: Colors.white,
                        ),
                      ),
                      child: Observer(
                        builder: (_) => TextFormField(
                          controller: passwordCtrl,
                          textInputAction: TextInputAction.done,
                          obscureText: obscureStore.isObscured,
                          onFieldSubmitted: (_) => _signin(),
                          decoration: InputDecoration(
                            prefixIcon: const Icon(
                              Icons.lock,
                              color: Color(0xFF1d2530),
                            ),
                            hintText: 'Digite a senha',
                            suffixIcon: IconButton(
                              onPressed: () {
                                obscureStore.toggleIsObscured();
                              },
                              icon: Icon(
                                obscureStore.isObscured
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                color: const Color(0xFF1d2530),
                              ),
                            ),
                          ),
                          validator: (value) => combine([
                            () => isNotEmpty(value),
                            () => isValidPassword(value),
                            () => hasSpecialChars(value),
                          ]),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 26,
                    ),
                    SizedBox(
                      width: 180,
                      height: 45,
                      child: ElevatedButton(
                        onPressed: _signin,
                        style: ButtonStyle(
                          shape: MaterialStatePropertyAll(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(100),
                            ),
                          ),
                          backgroundColor: const MaterialStatePropertyAll(
                            Color(0xFF44bd6e),
                          ),
                        ),
                        child: const Text(
                          'Entrar',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        Observer(
          builder: (context) => Visibility(
            visible: authStore.isLoading,
            child: Container(
              color: Colors.black38,
              child: const Center(
                child: CircularProgressIndicator(),
              ),
            ),
          ),
        ),
      ],
    );
  }

  void _signin() {
    if (!(formKey.currentState?.validate() ?? false)) return;
    final auth = AuthModel(
      user: userCtrl.text,
      password: passwordCtrl.text,
    );
    authStore.signIn(auth);
  }
}
