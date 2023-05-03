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

class ScreenLogin extends StatefulWidget {
  const ScreenLogin({super.key});

  @override
  State<ScreenLogin> createState() => _ScreenLoginState();
}

class _ScreenLoginState extends State<ScreenLogin> {
  TextEditingController mailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

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
        key: _formKey,
        appBar: const PreferredSize(
            preferredSize: Size.fromHeight(56),
            child: AuthAppBar(title: KString.login)),
        body: GetBuilder<AuthController>(init: AuthController(),
       builder: (AuthController controller) => SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(30),
              child: ListView(
                children: [
                  const SizedBox(height: 130),
                  Card(
                    elevation: 10,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        CustomFormfield(
                          name: KString.emailFormField,
                          controller: mailController,
                          validator: (mail) {
                            if (!GetUtils.isEmail(mail!)) {
                              return KString.errorMail;
                            }
                            if (mail.toString().isEmpty) {
                              return KString.errorEmptyMail;
                            }
                            return null;
                          },
                          prefix: const Icon(Icons.mail),
                        ),
                        const Divider(),
                        CustomFormfield(
                          obscureText: true,
                          name: KString.passwordFormField,
                          controller: passwordController,
                          validator: (pass) {
                            if (pass.toString().length < 6) {
                              return KString.errorPassword;
                            }
                            if (pass.toString().isEmpty) {
                              return KString.errorEmptyPassword;
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
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Checkbox(value: true, onChanged: (value) {}),
                      Text(KString.rememberMe, style: KStyle.title()),
                      const SizedBox(
                        height: 30,
                      ),
                      Text(KString.forgotPass,
                          style: KStyle.title(
                            decoration: TextDecoration.underline,
                            color: kWarnning,
                          ))
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(KString.cNoAccount),
                      TextButton(
                        onPressed: () {
                          Navigator.pushNamedAndRemoveUntil(
                              context,
                              KRoutesName.signup,
                              (Route<dynamic> route) => false);
                        },
                        child: Text(KString.signup, style: KStyle.title()),
                      ),
                    ],
                  ),
                  const SizedBox(height: 30),
                  Obx(() => ActionButton(
                        color: kWarnning,
                        radius: 5,
                        onTap: () {
                          loginPressed(context);
                        },
                        child: authController.loading.value
                            ? const Center(
                                child: CircularProgressIndicator(
                                color: kWhite,
                              ))
                            : Text(KString.submit,
                                style: KStyle.title(color: kWhite)),
                      ))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void loginPressed(BuildContext ctx) {
    final mail = mailController.text.trim();
    final pass = passwordController.text.trim();

    if (mail.isEmpty || pass.isEmpty) {
      KUtils.snackMessage(ctx, message: 'Fill the field', color: kError);
      return;
    } else {
      authController.userLogin(ctx, mail: mail, pass: pass);
    }
  }

  final AuthController authController = Get.put(AuthController());
}
