import 'package:lumas/general/configs.dart';
import 'package:lumas/general/controllers.dart';
import 'package:lumas/screens/components/login/components.dart';
import 'package:lumas/general/screens.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:lumas/general/services.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:get/get.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;

class SignupScreen extends StatefulWidget {
  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  TextEditingController nameCtrl = TextEditingController();
  TextEditingController userNameCtrl = TextEditingController();
  TextEditingController emailCtrl = TextEditingController();
  TextEditingController phoneCtrl = TextEditingController();
  TextEditingController passCtrl = TextEditingController();
  TextEditingController confirmPassCtrl = TextEditingController();

  String? _nameError;
  String? _userNameError;
  String? _emailError;
  String? _phoneError;
  String? _passError;
  String? _confirmPassError;

  @override
  void dispose() {
    nameCtrl.dispose();
    userNameCtrl.dispose();
    emailCtrl.dispose();
    phoneCtrl.dispose();
    passCtrl.dispose();
    confirmPassCtrl.dispose();
    super.dispose();
  }

  var isRegisterScreen = true;
  var verificationCode = '';
  String pass = '';
  String phone = '';
  final _formKeyOTP = GlobalKey<FormState>();
  var isLoading = false;
  @override
  Widget build(BuildContext context) {
    print(Storage.getToken());
    return Layout(
      child: isRegisterScreen ? registerScreen() : otpScreen(),
    );
  }

  Widget registerScreen() {
    return Column(
      children: [
        Container(
          child: Text(
            'register'.tr,
            style: TextStyle(fontSize: 50, fontWeight: AppFont.wRegular),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 20),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Input(
            label: 'name'.tr,
            txtController: nameCtrl,
            errorText: _nameError,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Input(
            label: 'userName'.tr,
            txtController: userNameCtrl,
            errorText: _userNameError,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Input(
            label: 'email'.tr,
            txtController: emailCtrl,
            keyboardType: TextInputType.emailAddress,
            errorText: _emailError,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Input(
            label: 'phone'.tr,
            txtController: phoneCtrl,
            keyboardType: TextInputType.number,
            errorText: _phoneError,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Input(
            label: 'password'.tr,
            txtController: passCtrl,
            obscureText: true,
            errorText: _passError,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Input(
            label: 'confirmPassword'.tr,
            txtController: confirmPassCtrl,
            obscureText: true,
            errorText: _confirmPassError,
          ),
        ),
        GestureDetector(
          onTap: () {
            Storage.removeToken();
            print(Storage.getToken());
            // AppBloc.userBloc.add(UserSignUpValidate(
            //   name: nameCtrl.text,
            //   userName: nameCtrl.text,
            //   email: emailCtrl.text,
            //   phone: phoneCtrl.text,
            //   password: passCtrl.text,
            //   confirmPass: confirmPassCtrl.text,
            // ));
          },
          child: Padding(
            padding: const EdgeInsets.only(top: 40),
            child: SizedBox(
              width: 300,
              child: Btn(
                languageKey: 'register'.tr,
              ),
            ),
          ),
        ),
      ],
    );
  }

  // ? OTP Screen

  Widget otpScreen() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Form(
        key: _formKeyOTP,
        child: Column(
          children: [
            Text(
              'verifyPhone'.tr,
              style: TextStyle(fontSize: 25, fontWeight: AppFont.wRegular),
            ),
            SizedBox(
              height: 40,
            ),
            Text(
              'weHaveSentOtp'.tr,
              style: TextStyle(fontSize: 16, fontFamily: AppFont.inter),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              phone,
              style: TextStyle(
                fontSize: 22,
                fontFamily: AppFont.inter,
                fontWeight: AppFont.wMedium,
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: PinCodeTextField(
                appContext: context,
                length: 6,
                onChanged: (value) {},
                textStyle: TextStyle(
                  fontSize: 24,
                  fontWeight: AppFont.wMedium,
                ),
                keyboardType: TextInputType.number,
                cursorColor: AppColor.pinkPrimary,
                pinTheme: PinTheme(
                  shape: PinCodeFieldShape.box,
                  fieldWidth: 50,
                  fieldHeight: 50,
                  borderRadius: BorderRadius.circular(15),
                  activeColor: AppColor.pinkPrimary,
                  selectedColor: AppColor.pinkPrimary,
                  inactiveColor: AppColor.blackPrimary,
                ),
                onCompleted: (otpCode) async {
                  if (_formKeyOTP.currentState!.validate()) {
                    // If the form is valid, we want to show a loading Snackbar
                    // If the form is valid, we want to do firebase signup...
                    setState(() {
                      isLoading = true;
                    });
                    try {
                      await _auth
                          .signInWithCredential(PhoneAuthProvider.credential(
                              verificationId: verificationCode, smsCode: otpCode.toString()))
                          .then((user) async => {
                                //sign in was success
                                if (user != null)
                                  {
                                    setState(() {
                                      isLoading = false;
                                    }),
                                    /* AppBloc.memberBloc.add(MemberRegister(
                                      name: usernameController.text.trim(),
                                      phone: phone,
                                      email: emailController.text.trim(),
                                      pass: passwordController.text.trim(),
                                    )),*/
                                    // Navigator.pushAndRemoveUntil(
                                    //   context,
                                    //   MaterialPageRoute(
                                    //     builder: (BuildContext context) => LoginScreen(),
                                    //   ),
                                    //   (route) => false,
                                    // )
                                  }
                              })
                          // ignore: return_of_invalid_type_from_catch_error
                          .catchError((error) => {
                                setState(() {
                                  isLoading = false;
                                }),
                              });
                      setState(() {
                        isLoading = true;
                      });
                    } catch (e) {
                      setState(() {
                        isLoading = false;
                      });
                    }
                  }
                },
              ),
            ),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }

  Future signUp() async {
    setState(() {
      isLoading = true;
    });
    //? Area code HongKong is +852
    var phoneNumber = '+852' + phone;

    var verifyPhoneNumber = _auth.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      verificationCompleted: (phoneAuthCredential) {
        //auto code complete (not manually)
        _auth.signInWithCredential(phoneAuthCredential).then((user) async => {
              if (user != null)
                {
                  setState(() {
                    isLoading = false;
                    // ! -----------------------------------------------------------------------------
                    /*AppBloc.memberBloc.add(MemberRegister(
                  name: usernameController.text.trim(),
                  phone: phone,
                  email: emailController.text.trim(),
                  pass: passwordController.text.trim(),
                ));*/
                    // Navigator.pushAndRemoveUntil(
                    //   context,
                    //   MaterialPageRoute(
                    //     builder: (BuildContext context) => LoginScreen(),
                    //   ),
                    //   (route) => false,
                    // );
                  })
                }
            });
      },
      verificationFailed: (FirebaseAuthException error) {
        setState(() {
          isLoading = false;
        });
      },
      codeSent: (verificationId, [forceResendingToken]) {
        setState(() {
          isLoading = false;
          verificationCode = verificationId;
        });
      },
      codeAutoRetrievalTimeout: (String verificationId) {
        setState(() {
          isLoading = false;
          verificationCode = verificationId;
        });
      },
      timeout: Duration(seconds: 60),
    );
    await verifyPhoneNumber;
  }
}
