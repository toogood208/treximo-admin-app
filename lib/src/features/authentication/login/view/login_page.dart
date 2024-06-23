import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import 'package:treximino_admin_app/src/features/authentication/login/notifier/login_notifier.dart';
import 'package:treximino_admin_app/src/shared/go_router/route_constants.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late TextEditingController emailController;
  late TextEditingController passwordController;

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
                TextField(
                  controller: emailController,
                  decoration: InputDecoration(
                      hintText: 'email',
                      suffixIcon: Icon(
                        Icons.email,
                        size: 15,
                      )),
                ),
                TextField(
                  controller: passwordController,
                  decoration: InputDecoration(
                      hintText: 'password',
                      suffixIcon: Icon(
                        Icons.lock,
                        size: 15,
                      )),
                ),
                SizedBox(
                  height: 30,
                ),
                Consumer(builder: (context, ref, child) {
                  final login = ref.watch(loginNotifierProvider);
                  return Column(
                    children: [
                      if(login.isLoading)
                      CircularProgressIndicator(),
                      SizedBox(height: 10),
                      GestureDetector(
                        onTap: () {
                          ref.read(loginNotifierProvider.notifier).login(
                              email: emailController.text,
                              password: passwordController.text);
                          context.go(RouteConstants.navigateToAddUser);
                        },
                        child: Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                          width: double.infinity,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(39),
                              color: Theme.of(context).colorScheme.secondary),
                          child: Center(
                            child: Text('Enter',
                                style: Theme.of(context).textTheme.bodyMedium),
                          ),
                        ),
                      ),
                    ],
                  );
                })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
