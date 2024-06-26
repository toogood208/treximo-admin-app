import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lottie/lottie.dart';
import 'package:treximino_admin_app/src/features/authentication/notifier/login_notifier.dart';
import 'package:treximino_admin_app/src/shared/service/field_validators.dart';
import 'package:treximino_admin_app/src/shared/widgets/custom_button.dart';
import 'package:treximino_admin_app/src/shared/widgets/custom_text_field.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late TextEditingController emailController;
  late TextEditingController passwordController;
  final _loginFormKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/login_background.png'),
            fit: BoxFit.fill,
          ),
        ),
        child: Center(
          child: Form(
            key: _loginFormKey,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 12),
              width: 300,
              height: 400,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Theme.of(context).colorScheme.surfaceContainer),
              child: Column(
                children: [
                  SizedBox(
                    height: 15,
                  ),
                  Lottie.asset('assets/images/login_asset.json',
                      width: 100,
                      height: 100,
                      fit: BoxFit.fill,
                      options:
                          LottieOptions(enableApplyingOpacityToLayers: true)),
                  Text(
                    'Treximo',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  CustomFormField(
                    controller: emailController,
                    validator: FieldValidator.validateEmail,
                    hintText: 'email',
                    preficeIcon: Icon(
                      Icons.email,
                      size: 15,
                    ),
                  ),
                  CustomFormField(
                    controller: passwordController,
                    validator: FieldValidator.validatePassword,
                    hintText: 'password',
                    obscureText: FieldValidator.passwordVisibilty,
                    sufficeIcon: GestureDetector(
                      onTap: () {
                        setState(() {
                          FieldValidator.passwordVisibilty =
                              !FieldValidator.passwordVisibilty;
                        });
                      },
                      child: Icon(
                        FieldValidator.passwordVisibilty
                            ? Icons.visibility
                            : Icons.visibility_off,
                        size: 15,
                      ),
                    ),
                    preficeIcon: Icon(
                      Icons.lock,
                      size: 15,
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Consumer(builder: (context, ref, child) {
                    final login = ref.watch(authNotifierProvider);
                    return Column(
                      children: [
                        if (login.isLoading) CircularProgressIndicator(),
                        SizedBox(height: 10),
                        if (login.hasError)
                          Text(
                            login.error.toString(),
                            style: TextStyle(color: Colors.redAccent),
                          ),
                        CustomButton(
                          onPress: () {
                            if (_loginFormKey.currentState!.validate()) {
                              ref.read(authNotifierProvider.notifier).login(
                                  email: emailController.text,
                                  password: passwordController.text);
                            }
                          },
                          title: 'Enter',
                        ),
                      ],
                    );
                  })
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
