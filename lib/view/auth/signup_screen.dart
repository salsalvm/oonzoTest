import 'package:firstcry/res/colors.dart';
import 'package:firstcry/res/components/action_button.dart';
import 'package:firstcry/res/components/custom_form_field.dart';
import 'package:firstcry/res/strings.dart';
import 'package:firstcry/res/styles.dart';
import 'package:firstcry/utils/routes/routes_name.dart';
import 'package:firstcry/utils/utils.dart';
import 'package:firstcry/view/auth/widget/auth_appbar.dart';
import 'package:firstcry/view_model/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ScreenSignUp extends StatefulWidget {
  const ScreenSignUp({super.key});

  @override
  State<ScreenSignUp> createState() => _ScreenSignUpState();
}

class _ScreenSignUpState extends State<ScreenSignUp> {
  final AuthController authController = Get.find<AuthController>();
  TextEditingController mailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  void dispose() {
    mailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        appBar: const PreferredSize(
            preferredSize: Size.fromHeight(56),
            child: AuthAppBar(title: KString.signup)),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(30),
            child: ListView(
              children: [
                const SizedBox(height: 130),
                Card(
                  elevation: 10,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomFormfield(
                          name: KString.emailFormField,
                          controller: mailController,
                          validator: (mail) {
                            if (!GetUtils.isEmail(mail!)) {
                              return KString.errorEmptyMail;
                            }
                            if (mail.toString().isEmpty) {
                              return KString.errorMail;
                            }
                            return null;
                          },
                          prefix: const Icon(Icons.mail)),
                      const Divider(),
                      CustomFormfield(
                        obscureText: true,
                        name: KString.passwordFormField,
                        controller: passwordController,
                        validator: (pass) {
                          if (pass.toString().length < 6) {
                            return KString.errorEmptyPassword;
                          }
                          if (pass.toString().isEmpty) {
                            return KString.errorPassword;
                          }
                          return null;
                        },
                        prefix: const Icon(Icons.password),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 30),
                Row(
                  children: [
                    Checkbox(value: true, onChanged: (value) {}),
                    Text(KString.rememberMe, style: KStyle.title())
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(KString.cAlreadyAccount),
                    TextButton(
                      onPressed: () {
                        // Navigator.popAndPushNamed(context, KRoutesName.login);

                        Navigator.pushNamedAndRemoveUntil(context,
                            KRoutesName.login, (Route<dynamic> route) => false);
                      },
                      child: Text(KString.login, style: KStyle.title()),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                ActionButton(
                  color: kWarnning,
                  onTap: () {
                    signUpButtonPressed(context);
                  },
                  radius: 5,
                  child: authController.signUploading.value
                      ? const Center(
                          child: CircularProgressIndicator(
                          color: kWhite,
                        ))
                      : Text(KString.registerButton,
                          style: KStyle.title(color: kWhite)),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void signUpButtonPressed(BuildContext context) {
    final mail = mailController.text.trim();
    final pass = passwordController.text.trim();

    if (mail.isEmpty || pass.isEmpty) {
      KUtils.snackMessage(context, message: 'Fill the field', color: kError);
      return;
    } else {
      authController.userRegistration(context, mail: mail, pass: pass);
    }
  }
}
