import 'package:flutter/material.dart';
import 'package:flutter_application_1/utills/routes.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

// _ use for to make private class
class _LoginPageState extends State<LoginPage> {
  String name = "";
  bool changeButton = false;
  final _formKey = GlobalKey<FormState>(); // associated with form field

  moveToHome(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        changeButton = true;
      });

      await Future.delayed(Duration(seconds: 1));
      await Navigator.pushNamed(context, MyRoutes.homeRoutes);
      setState(() {
        changeButton = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: Center(
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Image.asset(
                  "assets/images/login_image.png",
                  fit: BoxFit.cover,
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Welcome $name ",
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 16, horizontal: 32),
                  child: Column(
                    children: [
                      TextFormField(
                        decoration: InputDecoration(
                            hintText: " Enter the Username",
                            label: Text("UserName")),
                        onChanged: (value) {
                          name = value;
                          setState(() {});
                        },
                        validator: (value) {
                          if (value!.isEmpty) {
                            return " Username can not be empty !";
                          } else if (value.length < 6) {
                            return " Username length short !";
                          }
                          return null;
                        },
                      ),
                      TextFormField(
                        obscureText: true,
                        decoration: InputDecoration(
                            hintText: " Enter the Password",
                            label: Text("Password")),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return " Password can not be empty !";
                          } else if (value.length < 6) {
                            return " Password length short !";
                          }
                          return null;
                        },
                        onChanged: (value) {
                          name = value;
                          setState(
                              () {}); // it will called build method again ( refresh the content )
                        },
                      ),
                      SizedBox(
                        height: 40,
                      ),

                      // container

                      Material(
                        borderRadius:
                            BorderRadius.circular(changeButton ? 50 : 10),
                        color: Colors.blueAccent,
                        child: InkWell(
                          // splashColor: Colors.red , not work bcz decoration
                          onTap: () => moveToHome(context),

                          // Container == Ink
                          child: AnimatedContainer(
                            duration: Duration(seconds: 1),
                            height: 50,
                            width: changeButton ? 50 : 150, // true : false
                            alignment: Alignment.center,
                            child: changeButton
                                ? Icon(Icons.done, color: Colors.white)
                                : Text(
                                    "Login",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                            // decoration: BoxDecoration(
                            //     color: Colors.blueAccent,
                            //     // shape: changeButton
                            //     //     ? BoxShape.circle
                            //     //     : BoxShape.rectangle
                            //     borderRadius: BorderRadius.circular(
                            //         changeButton ? 50 : 10)),
                          ),
                        ),
                      ),
                      // ElevatedButton(
                      //   onPressed: () {
                      //     Navigator.pushNamed(context, MyRoutes.homeRoutes);
                      //   },
                      //   child: Text("Submit"),
                      //   style: TextButton.styleFrom(minimumSize: Size(150, 45)),
                      // )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
