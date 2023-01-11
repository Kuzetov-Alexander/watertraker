import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:watertraker/features/account/presentation/pages/editing_account_page.dart';
import 'package:watertraker/utils/style.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({super.key, required this.onPressed});

  final VoidCallback onPressed;

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  final LinearGradient _gradient = const LinearGradient(
    colors: <Color>[
      Color(0xffFE36B3),
      Color(0xffFFFFBE),
    ],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          leading: InkWell(
            onTap: () {
              Navigator.of(context).pop();
            },
            customBorder: const CircleBorder(),
            child: SvgPicture.asset(
              'assets/images/back.svg',
              width: 16,
              height: 25,
            ),
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Аккаунт', style: MyStyle.styleTextW7),
              InkWell(
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          EditingAccountPage(onPressed: () {}),
                    ),
                  );
                },
                customBorder: const CircleBorder(),
                child: SvgPicture.asset(
                  'assets/images/pencil.svg',
                  width: 30,
                  height: 30,
                ),
              )
            ],
          ),
        ),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 7),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                const SizedBox(height: 7),
                ElevatedButton(
                  onPressed: widget.onPressed,
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
                        borderRadius: BorderRadius.circular(50),
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
                const SizedBox(height: 12),
                const ContainerAccount(
                  nameOne: 'Дневная\n  норма',
                  nameTwo: '2200 мл',
                  left: 16,
                  top: 10,
                  bottom: 10,
                  right: 37,
                ),
                const SizedBox(height: 12),
                const ContainerAccount(nameOne: 'Возраст', nameTwo: '33'),
                const SizedBox(height: 6),
                const ContainerAccount(nameOne: 'Пол', nameTwo: 'муж'),
                const SizedBox(height: 6),
                const ContainerAccount(nameOne: 'Вес', nameTwo: '88 кг'),
                const SizedBox(height: 6),
                const ContainerAccount(nameOne: 'Рост', nameTwo: '188'),
                const SizedBox(height: 6),
                const ContainerAccount(nameOne: 'Возраст', nameTwo: '33'),
                const SizedBox(height: 6),
                const ContainerAccount(nameOne: 'Тренировки', nameTwo: 'часто'),
                const SizedBox(height: 6),
                const ContainerAccount(
                  nameOne: 'Кофе, напитки',
                  nameTwo: 'часто',
                ),
                const SizedBox(height: 12),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 136,
                  decoration: BoxDecoration(
                    image: const DecorationImage(
                      image: AssetImage(
                        'assets/images/screen.png',
                      ),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.circular(24),
                  ),
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.fromLTRB(24, 24, 24, 0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'balance+',
                              style: MyStyle.styleTextWhite,
                            ),
                            ShaderMask(
                              shaderCallback: (Rect rect) {
                                return _gradient.createShader(rect);
                              },
                              child: Text(
                                'PREMIUM',
                                style: GoogleFonts.montserrat(
                                  fontSize: 27,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Text(
                        '100 ₽',
                        style: GoogleFonts.montserrat(
                          fontSize: 48,
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ContainerAccount extends StatelessWidget {
  const ContainerAccount({
    Key? key,
    required this.nameOne,
    required this.nameTwo,
    this.left = 12,
    this.bottom = 6,
    this.right = 12,
    this.top = 6,
  }) : super(key: key);

  final String nameOne;
  final String nameTwo;
  final double top;
  final double left;
  final double right;
  final double bottom;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: ShapeDecoration(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(24.0),
          ),
        ),
        color: Colors.blueGrey.shade100,
      ),
      padding: const EdgeInsets.all(24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            nameOne,
            style: MyStyle.styleTextSmall,
          ),
          Container(
            decoration: const ShapeDecoration(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(12.0),
                ),
              ),
              color: Color(0xff0148FF),
            ),
            padding: EdgeInsets.fromLTRB(left, top, right, bottom),
            child: Text(
              nameTwo,
              style: MyStyle.styleTextWhite,
            ),
          )
        ],
      ),
    );
  }
}
