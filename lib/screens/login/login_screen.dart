import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:states_rebuilder/states_rebuilder.dart';
import 'package:travel_buddy/constants/extensions.dart';
import 'package:travel_buddy/models/login_data/login_data.dart';
import 'package:travel_buddy/screens/login/login_screen_repository/login_screen_repository.dart';
import 'package:travel_buddy/screens/login/store/login_screen_store.dart';
import 'package:travel_buddy/widgets/background_wrapper/background_wrapper.dart';
import 'package:travel_buddy/validator/validator.dart';
import 'package:travel_buddy/widgets/buttons/full_width_elevated_button/full_width_elevated_button.dart';
import '../../constants/assets_constants.dart';
import '../../constants/color_constants.dart';
import '../../constants/text_styles.dart';
import '../../navigator/app_routes.dart';
import '../../widgets/auth_text_field/auth_text_field.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  final isPasswordVisible = false.inj();
  final email = RM.injectTextEditing(
    validators: [
      (String? val) {
        if (val?.trim().isEmpty == true) {
          return 'Please enter email address';
        } else if (!Validators.isValidEmail(val!.trim().toLowerCase())) {
          return 'Please enter valid email address';
        }
        return null;
      },
    ],
    validateOnTyping: true,
  );
  final password = RM.injectTextEditing(
    validators: [
      (String? value) {
        if (value?.trim().isEmpty == true) {
          return 'Please enter password';
        }
        return null;
      },
    ],
    validateOnTyping: true,
  );

  final form = RM.injectForm(
    autovalidateMode: AutovalidateMode.disabled,
    autoFocusOnFirstError: true,
    submit: () async {
      print("the form is submitted !!");
    },
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackgroundWrapper(
        child: SingleChildScrollView(
          child: GestureDetector(
            onTap: () {
              FocusScopeNode currentFocus = FocusScope.of(context);

              if (!currentFocus.hasPrimaryFocus) {
                currentFocus.unfocus();
              }
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: OnFormBuilder(
                listenTo: form,
                builder: () => Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 28.0),
                      child: Image.asset(
                        AssetsConstants.loginScreenImage,
                        height: 232,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 38),
                      child: Text(
                        'Login',
                        style: TextStyles.h2.semiBold.copyWith(
                          color: Colors.black,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 18),
                      child: Text(
                        'Please enter the details below to continue',
                        style: TextStyles.body.medium.copyWith(
                          color: Colors.black.withOpacity(0.5),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20, top: 29),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Email',
                          style: TextStyles.h6.medium.copyWith(
                            color: Colors.black.withOpacity(0.5),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 16, right: 16, top: 5),
                      child: AuthTextField(
                        suffixWidget: email.hasError
                            ? SvgPicture.asset(
                                AssetsConstants.failIcon,
                                color: ColorConstants.primary,
                                height: 10,
                              )
                            : SvgPicture.asset(
                                AssetsConstants.successIcon,
                                color: ColorConstants.primary,
                                height: 10,
                              ),
                        controller: email.controller,
                        focusNode: email.focusNode,
                        isEnabled: form.isWaiting ? false : true,
                        hintText: 'Email Address',
                        type: 'email address',
                        keyboardType: TextInputType.emailAddress,
                        errorText: email.error,
                        onSubmitted: (_) {
                          password.focusNode.requestFocus();
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 20,
                        top: 10,
                      ),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Password',
                          style: TextStyles.h6.medium.copyWith(
                            color: Colors.black.withOpacity(0.5),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 5),
                      child: AuthTextField(
                        suffixWidget: OnBuilder(
                          listenTo: isPasswordVisible,
                          builder: () {
                            return isPasswordVisible.state == true
                                ? IconButton(
                                    iconSize: 25,
                                    constraints: const BoxConstraints(),
                                    padding: const EdgeInsets.all(0.0),
                                    onPressed: () {
                                      isPasswordVisible.toggle();
                                    },
                                    icon: SvgPicture.asset(
                                      AssetsConstants.passwordEyeOff,
                                      color: ColorConstants.primary,
                                      height: 25,
                                    ),
                                  )
                                : IconButton(
                                    constraints: const BoxConstraints(),
                                    padding: const EdgeInsets.all(0.0),
                                    onPressed: () {
                                      isPasswordVisible.toggle();
                                    },
                                    icon: SvgPicture.asset(
                                      AssetsConstants.passwordEye,
                                      color: ColorConstants.primary,
                                      height: 25,
                                    ),
                                  );
                          },
                        ),
                        controller: password.controller,
                        focusNode: password.focusNode,
                        isEnabled: form.isWaiting ? false : true,
                        hintText: 'Password',
                        type: 'password',
                        keyboardType: TextInputType.emailAddress,
                        errorText: password.error,
                        isPasswordVisible: isPasswordVisible.state,
                        onSubmitted: (_) {
                          form.submitFocusNode.requestFocus();
                        },
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 16, right: 16, top: 24),
                      child: OnFormSubmissionBuilder(
                        listenTo: form,
                        onSubmitting: () => const CircularProgressIndicator(
                          color: ColorConstants.primary,
                        ),
                        child: FullWidthElevatedButton(
                          text: 'Login',
                          backgroundColor: ColorConstants.primary,
                          onPressed: () async {
                            form.submit(
                              () async {
                                await LoginScreenRepository().loginUser(
                                    email: email.text, password: password.text);

                                print('^^^^^^^^^^^^^${token.state.token}');
                                print(password.text);
                                RM.navigate.toReplacementNamed(AppRoutes.home);
                              },
                            );
                          },
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Image.asset(AssetsConstants.loginBottomImage),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
