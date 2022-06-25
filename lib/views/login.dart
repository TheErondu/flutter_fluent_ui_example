import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hermes/services/api.dart';
import 'package:hermes/utils/debugger.dart';
import 'package:hermes/utils/functions.dart';
import 'package:hermes/views/dashboard.dart';

import 'package:hermes/views/animations/fadeanimation.dart';
import 'package:hermes/views/signup.dart';

enum Gender {
  email,
  password,
}

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final _clearController = TextEditingController();
  Color enabled = const Color(0xFF827F8A);
  Color enabledtxt = Colors.white;
  Color disabled = Colors.grey;
  Color backgroundColor = const Color(0xEF232323);
  bool ispasswordev = true;
  Gender? selected;
  late Future futureloginCall;

  @override
  void initState() {
    super.initState();
    logout();
    _clearController.addListener(() {
      if (_clearController.text.length == 1 && mounted) setState(() {});
    });
  }

  @override
  void dispose() {
    _clearController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var we = MediaQuery.of(context).size.width;
    var he = MediaQuery.of(context).size.height;
    return Scaffold(
        backgroundColor: backgroundColor,
        body: SingleChildScrollView(
          child: Expanded(
            flex: 1,
            child: SizedBox(
              width: we,
              height: he,
              child: Column(
                children: <Widget>[
                  FadeAnimation(
                    delay: 0.8,
                    child: CachedNetworkImage(
                      imageUrl:
                          "https://cdni.iconscout.com/illustration/premium/thumb/job-starting-date-2537382-2146478.png",
                      width: we * 0.9,
                      height: he * 0.4,
                    ),
                  ),
                  FadeAnimation(
                    delay: 1,
                    child: Container(
                      margin: const EdgeInsets.only(right: 230.0),
                      child: Text(
                        "Login",
                        style: GoogleFonts.lato(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 35,
                            letterSpacing: 2),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: he * 0.01,
                  ),
                  FadeAnimation(
                    delay: 1,
                    child: Container(
                      margin: const EdgeInsets.only(right: 150.0),
                      child: Text(
                        "Please Sign in to continue",
                        style: GoogleFonts.lato(
                            color: Colors.grey, letterSpacing: 0.5),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: he * 0.04,
                  ),
                  FadeAnimation(
                    delay: 1,
                    child: Container(
                      width: we * 0.4,
                      height: he * 0.071,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                        color: selected == Gender.email
                            ? enabled
                            : backgroundColor,
                      ),
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        controller: emailController,
                        onTap: () {
                          setState(() {
                            selected = Gender.email;
                          });
                        },
                        decoration: InputDecoration(
                          enabledBorder: InputBorder.none,
                          border: InputBorder.none,
                          prefixIcon: Icon(
                            Icons.email_outlined,
                            color: selected == Gender.email
                                ? enabledtxt
                                : disabled,
                          ),
                          hintText: 'Email',
                          hintStyle: TextStyle(
                            color: selected == Gender.email
                                ? enabledtxt
                                : disabled,
                          ),
                        ),
                        style: TextStyle(
                            color: selected == Gender.email
                                ? enabledtxt
                                : disabled,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: he * 0.02,
                  ),
                  FadeAnimation(
                    delay: 1,
                    child: Container(
                      width: we * 0.4,
                      height: he * 0.071,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.0),
                          color: selected == Gender.password
                              ? enabled
                              : backgroundColor),
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        controller: passwordController,
                        onTap: () {
                          setState(() {
                            selected = Gender.password;
                          });
                        },
                        decoration: InputDecoration(
                            enabledBorder: InputBorder.none,
                            border: InputBorder.none,
                            prefixIcon: Icon(
                              Icons.lock_open_outlined,
                              color: selected == Gender.password
                                  ? enabledtxt
                                  : disabled,
                            ),
                            suffixIcon: IconButton(
                              icon: ispasswordev
                                  ? Icon(
                                      Icons.visibility_off,
                                      color: selected == Gender.password
                                          ? enabledtxt
                                          : disabled,
                                    )
                                  : Icon(
                                      Icons.visibility,
                                      color: selected == Gender.password
                                          ? enabledtxt
                                          : disabled,
                                    ),
                              onPressed: () =>
                                  setState(() => ispasswordev = !ispasswordev),
                            ),
                            hintText: 'Password',
                            hintStyle: TextStyle(
                                color: selected == Gender.password
                                    ? enabledtxt
                                    : disabled)),
                        obscureText: ispasswordev,
                        style: TextStyle(
                            color: selected == Gender.password
                                ? enabledtxt
                                : disabled,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: he * 0.02,
                  ),
                  FadeAnimation(
                    delay: 1,
                    child: TextButton(
                        onPressed: () {
                          setState(() {
                            String email = emailController.text;
                            String password = passwordController.text;
                            futureloginCall = loginCall(email, password);
                          });
                          authCheck().then((value) {
                            toLog(value.toString());
                             value?null:
                            Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const DashboardView()),
                              (Route<dynamic> route) => false,
                            );
                          });
                        },
                        style: TextButton.styleFrom(
                            backgroundColor: const Color(0xFF0DF5E4),
                            padding: const EdgeInsets.symmetric(
                                vertical: 15.0, horizontal: 80),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30.0))),
                        child: Text(
                          "Login",
                          style: GoogleFonts.lato(
                            color: Colors.black,
                            letterSpacing: 0.5,
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        )),
                  ),
                  SizedBox(
                    height: he * 0.01,
                  ),
                  FadeAnimation(
                    delay: 1,
                    child: Text("Forgot password?",
                        style: GoogleFonts.lato(
                          color: const Color(0xFF0DF5E4).withOpacity(0.9),
                          letterSpacing: 0.5,
                        )),
                  ),
                  SizedBox(height: he * 0.02),
                  FadeAnimation(
                    delay: 1,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Don't have an account?",
                            style: GoogleFonts.lato(
                              color: Colors.grey,
                              letterSpacing: 0.5,
                            )),
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context)
                                .push(MaterialPageRoute(builder: (context) {
                              return const Signup();
                            }));
                          },
                          child: Text("Sign up",
                              style: GoogleFonts.lato(
                                color: const Color(0xFF0DF5E4).withOpacity(0.9),
                                fontWeight: FontWeight.bold,
                                letterSpacing: 0.5,
                              )),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
