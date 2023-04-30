import 'package:firstcry/res/colors.dart';
import 'package:firstcry/res/components/action_button.dart';
import 'package:firstcry/res/styles.dart';
import 'package:firstcry/view_model/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PageMenu extends StatelessWidget {
  const PageMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final AuthController authController = Get.put(AuthController());
    return Center(
      child: Obx(
        () => ActionButton(
          color: const Color(0xffFFC238),
          radius: 5,
          onTap: () {
            authController.signOut(context);
          },
          child:
              authController.loading.value || authController.signUploading.value
                  ? const Center(
                      child: CircularProgressIndicator(
                      color: kWhite,
                    ))
                  : Text('Sign Out', style: KStyle.title(color: kWhite)),
        ),
      ),
    );
  }
}
