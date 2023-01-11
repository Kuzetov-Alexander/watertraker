import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
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

  @override
  void dispose() {
    _emailController.dispose();
    _numberPhoneController.dispose();
    _passwordController.dispose();
    super.dispose();
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
                  controller: _numberPhoneController,
                  maxLength: 11,
                  style: MyStyle.styleTextValidator,
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    FilteringTextInputFormatter(
                      RegExp(r'^[()\d -]{1,11}$'),
                      allow: true,
                    ) // FilteringTextInputFormatter.digitsOnly,
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
                  //   validator: (value) =>
                  //     _validateEmail(value),
                ),
                const SizedBox(height: 7),
                TextFormField(
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
                  validator: _validateEmail,
                ),
                const SizedBox(height: 7),
                TextField(
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
                ),
                const SizedBox(height: 7),
                TextField(
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
                ),
                const SizedBox(height: 7),
                ElevatedButton(
                  onPressed: () {
                    _submitForm();
                  },
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
                    'Сменить аккаунт',
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
      print('Form is valid');

      print(
        'Number phone: ${_numberPhoneController.text}',
      );

      print(
        'Number email: ${_emailController.text}',
      );

      print(
        'Number password: ${_passwordController.text}',
      );
    }
  }

  String? _validateEmail(String? value) {
    final nameExp = RegExp(r'^[A-Za-z]+$');
    if (value!.isEmpty) {
      return 'Name is required';
    } else if (!nameExp.hasMatch(value)) {
      return 'Please enter email characters';
    } else {
      return null;
    }
  }
}
