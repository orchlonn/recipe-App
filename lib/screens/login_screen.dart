import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:recipe_app/screens/main_screen.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter_pw_validator/flutter_pw_validator.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  bool rememberMe = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: Stack(
          children: [
            Container(
              height: double.infinity,
              width: double.infinity,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color(0xFF73AEF5),
                    Color(0xFF64A4F1),
                    Color(0xFF478DE0),
                    Color(0xFF398AE5),
                  ],
                  stops: [0.1, 0.4, 0.7, 0.9],
                ),
              ),
            ),
            Container(
              height: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 70),
              child: Form(
                key: formKey,
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Sign In",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                      ),
                    ),
                    const SizedBox(height: 20),
                    email(),
                    const SizedBox(height: 20),
                    password(),
                    forgotPassword(),
                    rememberMeCheckBox(),
                    loginButton(),
                    signInWith(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        GestureDetector(
                          // ignore: avoid_print
                          onTap: () => print("Login in with facebook."),
                          child: SizedBox(
                            child: IconButton(
                              onPressed: () => const Text("data"),
                              icon: const Icon(
                                Icons.facebook,
                                size: 45,
                              ),
                              color: Colors.white,
                            ),
                          ),
                        ),
                        GestureDetector(
                          // ignore: avoid_print
                          onTap: () => print("Login in with facebook."),
                          child: SizedBox(
                            child: IconButton(
                              onPressed: () => const Text("data"),
                              icon: const Icon(
                                Icons.facebook,
                                size: 45,
                              ),
                              color: Colors.white,
                            ),
                          ),
                        ),
                        signUp(),
                      ],
                    ),
                    const SizedBox(height: 20),
                    RichText(
                      text: const TextSpan(
                        children: [
                          TextSpan(
                            text: "Don't have an account? ",
                            style: TextStyle(fontSize: 15),
                          ),
                          TextSpan(
                            text: "Sign Up",
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  email() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Email",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 10),
        Container(
          alignment: Alignment.centerLeft,
          height: 55,
          decoration: BoxDecoration(
            color: Colors.black12,
            borderRadius: BorderRadius.circular(10),
          ),
          child: SizedBox(
            height: 55,
            child: TextFormField(
              controller: emailController,
              keyboardType: TextInputType.emailAddress,
              autofillHints: const [AutofillHints.email],
              validator: (email) =>
                  email == null || !EmailValidator.validate(email)
                      ? "Enter a valid email."
                      : null,
              style: const TextStyle(color: Colors.white),
              decoration: const InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(top: 14),
                prefixIcon: Icon(
                  Icons.email,
                  color: Colors.white,
                ),
                hintText: "Enter your Email",
                hintStyle: TextStyle(color: Colors.white54),
              ),
            ),
          ),
        )
      ],
    );
  }

  password() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Password",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 10),
        Container(
          alignment: Alignment.centerLeft,
          height: 55,
          decoration: BoxDecoration(
            color: Colors.black12,
            borderRadius: BorderRadius.circular(10),
          ),
          child: TextField(
            controller: passController,
            obscureText: true,
            style: const TextStyle(color: Colors.white),
            decoration: const InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14),
              prefixIcon: Icon(
                Icons.lock,
                color: Colors.white,
              ),
              hintText: "Enter your Password",
              hintStyle: TextStyle(color: Colors.white54),
            ),
          ),
        ),
      ],
    );
  }

  forgotPassword() {
    return Container(
      alignment: Alignment.centerRight,
      child: TextButton(
        child: const Text('Forgot password ?'),
        style: TextButton.styleFrom(
          primary: Colors.white,
        ),
        // ignore: avoid_print
        onPressed: () => print("Did you forgot your password ?"),
      ),
    );
  }

  rememberMeCheckBox() {
    return SizedBox(
      height: 20,
      child: Row(
        children: [
          Theme(
            data: ThemeData(unselectedWidgetColor: Colors.white),
            child: Checkbox(
              value: rememberMe,
              checkColor: Colors.green,
              activeColor: Colors.white,
              onChanged: (value) {
                setState(() {
                  rememberMe = value!;
                });
              },
            ),
          ),
          const Text(
            "Remember me.",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w500,
            ),
          )
        ],
      ),
    );
  }

  loginButton() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20.0),
      width: double.infinity,
      child: RaisedButton(
        elevation: 5.0,
        onPressed: () => {
          if (formKey.currentState!.validate())
            {
              if (passController.text.length >= 6)
                {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              MainScreen(username: emailController.text)))
                }
              else
                {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text(
                    "Your password should include 6 words.",
                    style: TextStyle(fontSize: 20),
                  ))),
                },
            }
          else
            {
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content: Text(
                "Check your Email.",
                style: TextStyle(fontSize: 20),
              ))),
            },
        },
        padding: const EdgeInsets.all(13.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        color: Colors.white,
        child: const Text(
          "LOGIN",
          style: TextStyle(
            color: Color(0xFF527DAA),
            letterSpacing: 1.5,
            fontSize: 17,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  signInWith() {
    return Column(
      children: const [
        Text(
          "- OR -",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w400),
        ),
        SizedBox(height: 15),
        Text(
          "Sign in with",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w400),
        )
      ],
    );
  }

  signUp() {
    return GestureDetector(
      // ignore: avoid_print
      onTap: () => print("Login in with facebook."),
      child: SizedBox(
        child: IconButton(
          onPressed: () => const Text("data"),
          icon: const Icon(
            Icons.facebook,
            size: 45,
          ),
          color: Colors.white,
        ),
      ),
    );
  }
}
