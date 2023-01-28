import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:watertraker/features/account/presentation/pages/auth_page.dart';
import 'package:watertraker/utils/style.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key, required this.onPressed});
  final VoidCallback onPressed;

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  bool hidePassword = true;
  final _numberPhoneController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final _confirmPasswordController = TextEditingController();
  String password = '';
  final _numberFocus = FocusNode();
  final _emailFocus = FocusNode();
  final _passwordFocus = FocusNode();
  final _confirmPasswordFocus = FocusNode();

  @override
  void dispose() {
    _emailController.dispose();
    _numberPhoneController.dispose();
    _passwordController.dispose();
    _numberFocus.dispose();
    _emailFocus.dispose();
    _passwordFocus.dispose();
    _confirmPasswordFocus.dispose();
    super.dispose();
  }

  void _fieldFocusChange(
    BuildContext context,
    FocusNode currentfocus,
    FocusNode nextFocus,
  ) {
    currentfocus.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Регистрация', style: MyStyle.styleTextW7),
            ],
          ),
        ),
        body: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 7),
            child: ListView(
              children: [
                const SizedBox(height: 7),
                TextFormField(
                  focusNode: _numberFocus,
                  autofocus: true,
                  onFieldSubmitted: (_) {
                    _fieldFocusChange(context, _numberFocus, _emailFocus);
                  },
                  controller: _numberPhoneController,
                  maxLength: 11,
                  style: MyStyle.styleTextValidator,
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    FilteringTextInputFormatter(
                      RegExp(r'^[()\d -]{1,11}$'),
                      allow: true,
                    ),
                  ],
                  decoration: InputDecoration(
                    labelText: 'Номер телефона',
                    labelStyle: MyStyle.styleTextBlue,
                    focusedBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(24),
                      ),
                      borderSide: BorderSide(
                        color: Color(0xff33E34F),
                        width: 2,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: const BorderRadius.all(
                        Radius.circular(24),
                      ),
                      borderSide: BorderSide(
                        color: Colors.blue.shade200,
                        width: 2,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 7),
                TextFormField(
                  focusNode: _emailFocus,
                  onFieldSubmitted: (_) {
                    _fieldFocusChange(context, _emailFocus, _passwordFocus);
                  },
                  controller: _emailController,
                  style: MyStyle.styleTextValidator,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    labelText: 'Почта',
                    labelStyle: MyStyle.styleTextBlue,
                    focusedBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(24),
                      ),
                      borderSide: BorderSide(
                        color: Color(0xff33E34F),
                        width: 2,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: const BorderRadius.all(
                        Radius.circular(24),
                      ),
                      borderSide: BorderSide(
                        color: Colors.blue.shade200,
                        width: 2,
                      ),
                    ),
                  ),
                  validator: emailValidator,
                ),
                const SizedBox(height: 7),
                TextFormField(
                  focusNode: _passwordFocus,
                  onFieldSubmitted: (_) {
                    _fieldFocusChange(
                      context,
                      _passwordFocus,
                      _confirmPasswordFocus,
                    );
                  },
                  controller: _passwordController,
                  style: MyStyle.styleTextValidator,
                  obscureText: hidePassword,
                  maxLength: 10,
                  keyboardType: TextInputType.visiblePassword,
                  decoration: InputDecoration(
                    labelText: 'Пароль',
                    labelStyle: MyStyle.styleTextBlue,
                    suffixIcon: IconButton(
                      icon: Icon(
                        hidePassword
                            ? Icons.visibility_off
                            : Icons.remove_red_eye_sharp,
                        size: 35,
                      ),
                      onPressed: () {
                        setState(() {
                          hidePassword = !hidePassword;
                        });
                      },
                    ),
                    focusedBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(24),
                      ),
                      borderSide: BorderSide(
                        color: Color(0xff33E34F),
                        width: 2,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: const BorderRadius.all(
                        Radius.circular(24),
                      ),
                      borderSide: BorderSide(
                        color: Colors.blue.shade200,
                        width: 2,
                      ),
                    ),
                  ),
                  onChanged: (value) => password = value,
                  validator: passwordValidator,
                ),
                const SizedBox(height: 7),
                TextFormField(
                  focusNode: _confirmPasswordFocus,
                  controller: _confirmPasswordController,
                  style: MyStyle.styleTextValidator,
                  obscureText: hidePassword,
                  maxLength: 10,
                  keyboardType: TextInputType.visiblePassword,
                  decoration: InputDecoration(
                    labelText: 'Подтверждение пароля',
                    labelStyle: MyStyle.styleTextBlue,
                    suffixIcon: IconButton(
                      icon: Icon(
                        hidePassword
                            ? Icons.visibility_off
                            : Icons.remove_red_eye_sharp,
                        size: 35,
                      ),
                      onPressed: () {
                        setState(() {
                          hidePassword = !hidePassword;
                        });
                      },
                    ),
                    focusedBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(24),
                      ),
                      borderSide: BorderSide(
                        color: Color(0xff33E34F),
                        width: 2,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: const BorderRadius.all(
                        Radius.circular(24),
                      ),
                      borderSide: BorderSide(
                        color: Colors.blue.shade200,
                        width: 2,
                      ),
                    ),
                  ),
                  validator: (value) =>
                      MatchValidator(errorText: 'passwords do not match')
                          .validateMatch(value!, password),
                ),
                const SizedBox(height: 7),
                ElevatedButton(
                  onPressed: widget.onPressed,
                  // () {
                  //   _submitForm();
                  // },
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(const Color(0xff33E34F)),
                    fixedSize: MaterialStatePropertyAll(
                      Size(
                        MediaQuery.of(context).size.width,
                        70,
                      ),
                    ),
                    maximumSize: MaterialStatePropertyAll(
                      Size(
                        MediaQuery.of(context).size.width,
                        70,
                      ),
                    ),
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24),
                      ),
                    ),
                  ),
                  child: Text(
                    'Создать аккаунт',
                    style: GoogleFonts.montserrat(
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      _alertDialogs();

      log(
        'Number phone: ${_numberPhoneController.text}',
      );

      log(
        'Number email: ${_emailController.text}',
      );

      log(
        'Number password: ${_passwordController.text}',
      );
      log(
        'Confirm password: ${_confirmPasswordController.text}',
      );
    }
  }

  final passwordValidator = MultiValidator([
    RequiredValidator(errorText: 'password is required'),
    MinLengthValidator(8, errorText: 'password must be at least 8 digits long'),
    PatternValidator(
      r'(?=.*?[#?!@$%^&*()_])',
      errorText: 'passwords must have at least one special character',
    )
  ]);

  final emailValidator = MultiValidator([
    EmailValidator(errorText: 'Error Text'),
  ]);

  void _alertDialogs() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(
            'Registration successful',
            style: MyStyle.styleText,
            textAlign: TextAlign.center,
          ),
          content: Text(
            ' Dear User is now a verified register form',
            style: MyStyle.styleTextSmall,
            textAlign: TextAlign.center,
          ),
          actions: [
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => AuthentificalPage(
                        onPressed:
                            // widget.onPressed,
                            () {
                          Navigator.pop(context);
                        },
                      ),
                    ),
                  );
                },
                child: Text(
                  'Verified',
                  style: MyStyle.styleTextSmall,
                  textAlign: TextAlign.start,
                ),
              ),
            )
          ],
        );
      },
    );
  }
}
