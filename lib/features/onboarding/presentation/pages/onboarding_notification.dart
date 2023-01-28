import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:watertraker/utils/style.dart';
import 'package:flutter_switch/flutter_switch.dart';

class OnBoardingNotificationPage extends StatefulWidget {
  const OnBoardingNotificationPage({
    super.key,
    required this.onPressed,
  });

  final VoidCallback onPressed;

  @override
  State<OnBoardingNotificationPage> createState() =>
      _OnBoardingNotificPageState();
}

class _OnBoardingNotificPageState extends State<OnBoardingNotificationPage> {
  bool status = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xff0148FF),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
            child: Container(
              alignment: Alignment.center,
              child: DefaultTextStyle(
                style: MyStyle.styleTextSmall.copyWith(color: Colors.white),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 120,
                      width: double.infinity,
                    ),
                    Text(
                      'Ваша дневная норма:',
                      style: MyStyle.styleText.copyWith(color: Colors.white),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      '2200 мл',
                      style: GoogleFonts.montserrat(
                        fontSize: 48,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      'Так держать!',
                      style: MyStyle.styleTextSmall,
                    ),
                    const SizedBox(
                      height: 70,
                      width: double.infinity,
                    ),
                    Container(
                      decoration: ShapeDecoration(
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(24.0),
                          ),
                        ),
                        color: Colors.blueGrey.shade100.withOpacity(0.5),
                      ),
                      padding: const EdgeInsets.all(12),
                      child: SizedBox(
                        width: double.infinity,
                        height: 255,
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 42,
                              width: double.infinity,
                            ),
                            Text(
                              'Включить уведомления?',
                              style: MyStyle.styleText
                                  .copyWith(color: Colors.white),
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(
                              height: 42,
                              width: double.infinity,
                            ),
                            FlutterSwitch(
                              activeColor: const Color(0xff33E34F),
                              activeToggleColor: Colors.white,
                              inactiveColor:
                                  Colors.grey.shade500.withOpacity(0.8),
                              width: 120.0,
                              height: 64.0,
                              toggleSize: 48.0,
                              value: status,
                              borderRadius: 66.0,
                              padding: 8.0,
                              onToggle: (val) {
                                setState(() {
                                  status = val;
                                });
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 30),
                    ElevatedButton(
                      onPressed: widget.onPressed,
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(const Color(0xff33E34F)),
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
                    const SizedBox(height: 21),
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
