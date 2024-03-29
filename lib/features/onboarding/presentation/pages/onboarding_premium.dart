import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:watertraker/utils/style.dart';

class OnboardingPremiumPage extends StatefulWidget {
  OnboardingPremiumPage({
    super.key,
    this.value,
    required this.onPressed,
  });

  final VoidCallback onPressed;
  bool? value;

  @override
  State<OnboardingPremiumPage> createState() => _OnboardingPremiumPageState();
}

class _OnboardingPremiumPageState extends State<OnboardingPremiumPage> {
  final LinearGradient _gradient = const LinearGradient(
    colors: <Color>[
      Color(0xffFE36B3),
      Color(0xffFFFFBE),
    ],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );

  bool status = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Stack(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                      'assets/images/screen.png',
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
                child: Container(
                  alignment: Alignment.center,
                  child: DefaultTextStyle(
                    style: MyStyle.styleTextSmall.copyWith(color: Colors.white),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 162,
                          width: double.infinity,
                        ),
                        Text(
                          'balance+',
                          style: GoogleFonts.montserrat(
                            fontSize: 48,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        ShaderMask(
                          shaderCallback: (Rect rect) {
                            return _gradient.createShader(rect);
                          },
                          child: Text(
                            'PREMIUM',
                            style: GoogleFonts.montserrat(
                              fontSize: 48,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                        const SizedBox(height: 15),
                        Text(
                          '100 ₽',
                          style: GoogleFonts.montserrat(
                            fontSize: 48,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const SizedBox(height: 25),
                        Text(
                          'БЕЗ РЕКЛАМЫ',
                          style: GoogleFonts.montserrat(
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const SizedBox(
                          height: 37,
                          width: double.infinity,
                        ),
                        ElevatedButton(
                          onPressed: () {
                            setState(() {
                              widget.value = true;
                              Future.delayed(
                                const Duration(seconds: 1),
                                (() => widget.value = null),
                              );
                            });
                          },
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                              const Color(0xff33E34F),
                            ),
                            fixedSize:
                                const MaterialStatePropertyAll(Size(300, 70)),
                            shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50),
                              ),
                            ),
                          ),
                          child: Text(
                            'Купить',
                            style: GoogleFonts.montserrat(
                              fontSize: 32,
                              fontWeight: FontWeight.w700,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 140,
                          width: double.infinity,
                          child: Center(
                            child: Text(
                              widget.value == null
                                  ? ''
                                  : widget.value == true
                                      ? 'Василий, мое уважение!'
                                      : 'Куда собрался?! \nИщи бабки, Василий!',
                              textAlign: TextAlign.center,
                              style: MyStyle.styleText,
                            ),
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            widget.value = false;
                            setState(() {
                              Future.delayed(
                                const Duration(seconds: 1),
                                (() => widget.value = null),
                              );
                            });
                          },
                          child: Text(
                            'Пропустить',
                            style: GoogleFonts.montserrat(
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            widget.onPressed();

                            // Navigator.pushReplacement(
                            //   context,
                            //   MaterialPageRoute(
                            //     builder: (context) => PageAccount(
                            //       onPressed: () {},
                            //     ),
                            //   ),
                            // );
                          },
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                              const Color(0xff33E34F),
                            ),
                            fixedSize:
                                const MaterialStatePropertyAll(Size(342, 70)),
                            maximumSize:
                                const MaterialStatePropertyAll(Size(342, 70)),
                            shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50),
                              ),
                            ),
                          ),
                          child: Text(
                            'Продолжить',
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
            ],
          ),
        ),
      ),
    );
  }
}
