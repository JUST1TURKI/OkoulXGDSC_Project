// ignore: file_names
// ignore_for_file: constant_identifier_names, prefer_final_fields, unused_field, avoid_print, file_names, duplicate_ignore

import 'package:flutter/material.dart';
import 'PrayerScreen/PrayerScreen.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _Register();
}

class _Register extends State<Register> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Home() //create new class for 'home' property of MaterialApp()
        //to escape 'No MaterialLocalizations found' error
        );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

enum AuthMode {
  SignUp,
  Login,
}

class _HomeState extends State<Home> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  AuthMode _authMode = AuthMode.Login;
  final Map<String, String> _authData = {
    'email': "",
    'password': "",
  };
  var _isLoading = false;
  final _passwordController = TextEditingController();
  final _passwordControllerChecker = TextEditingController();

  void _switchAuthMode() {
    if (_authMode == AuthMode.Login) {
      setState(() {
        _authMode = AuthMode.SignUp;
      });
    } else {
      setState(() {
        _authMode = AuthMode.Login;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: ExactAssetImage('assets/images/loginBackGround.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Form(
              key: _formKey,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(
                      height: 270,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        textDirection: TextDirection.ltr,
                        decoration: const InputDecoration(
                          suffixText: " :الايميل",
                          prefixIcon:
                              Icon(Icons.email, color: Color(0xFF2D380C)),
                          hintText: 'ادخل ايميلك الشخصي',
                          hintTextDirection: TextDirection.rtl,
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0xFF2D380C),
                            ),
                          ),
                        ),
                        keyboardType: TextInputType.emailAddress,
                        validator: (val) {
                          if (val!.isEmpty || !val.contains('@')) {
                            return "الايميل غير صحيح: يجب اضافةعلامة@ فضلا";
                          }
                          if (_authMode == AuthMode.Login) {
                            return "الحساب المدخل غير موجود";
                          }
                          return null;
                        },
                        onSaved: (val) {
                          _authData['email'] = val!;
                          print(_authData['email']);
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        decoration: const InputDecoration(
                            suffixText: "  :كلمةالمرور",
                            prefixIcon: Icon(
                              Icons.password,
                              color: Color(0xFF2D380C),
                            ),
                            hintText: 'ادخل رمزك السري',
                            hintTextDirection: TextDirection.rtl,
                            focusedBorder: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: Color(0xFF2D380C)))),
                        controller: _passwordController,
                        obscureText: true,
                        keyboardType: TextInputType.visiblePassword,
                        validator: (val) {
                          if (val!.isEmpty || val.length <= 7) {
                            return "فضلا اضف اكثر من سبعة خانات";
                          }

                          return null;
                        },
                        onSaved: (val) {
                          _authData['password'] = val!;
                          print(_authData['password']);
                        },
                      ),
                    ),
                    if (_authMode == AuthMode.SignUp)
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          enabled: _authMode == AuthMode.SignUp,
                          decoration: const InputDecoration(
                              suffixText: " :تأكيد كلمةالمرور",
                              prefixIcon: Icon(Icons.visibility_off,
                                  color: Color(0xFF2D380C)),
                              hintText: 'اعد رمزك السري',
                              hintTextDirection: TextDirection.rtl,
                              focusedBorder: UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Color(0xFF2D380C)))),
                          controller: _passwordControllerChecker,
                          obscureText: true,
                          keyboardType: TextInputType.visiblePassword,
                          validator: _authMode == AuthMode.SignUp
                              ? (value) {
                                  if (value != _passwordController.text) {
                                    return "كلمة المرور غير مطابقة";
                                  }
                                  return null;
                                }
                              : null,
                        ),
                      ),
                    const SizedBox(
                      height: 10,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const MainScreen()));
                        });
                      },
                      // ignore: sort_child_properties_last
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          _authMode == AuthMode.Login
                              ? " سجل دخول"
                              : "انشئ حسابك",
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontFamily: 'Rakkas',
                          ),
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                          backgroundColor:
                              const Color.fromRGBO(125, 101, 13, 1),
                          foregroundColor: Colors.black,
                          padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
                          elevation: 5,
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              bottomRight: Radius.circular(20),
                            ),
                          )),
                    ),
                    MaterialButton(
                      onPressed: _switchAuthMode,
                      padding: const EdgeInsets.all(10),
                      child: Text(
                        '${_authMode == AuthMode.Login ? 'ماعندك حساب؟ انضم لنا' : 'سجل دخولك  '} ',
                        style: const TextStyle(
                          color: Color(0xFF2D380C),
                          fontSize: 16,
                          fontFamily: 'Rakkas',
                        ),
                      ),
                    ),
                    MaterialButton(
                      onPressed: () {
                        setState(() {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const MainScreen()));
                        });
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Icon(Icons.first_page),
                            Text(
                              ' تخطي الان',
                              style: TextStyle(
                                color: Color(0xFF2D380C),
                                fontSize: 30,
                                fontFamily: 'Rakkas',
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              )),
        ),
      ),
    );
  }
}
