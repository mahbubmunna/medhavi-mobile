import 'package:flutter/material.dart';

import 'OTP2.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController _controller = TextEditingController();
  TextEditingController _cnt = TextEditingController();
  TextEditingController _name = TextEditingController();
  TextEditingController _password = TextEditingController();
  bool hidePass = true;
  @override
  Widget build(BuildContext context) {
    String defaultFontFamily = 'Roboto-Light.ttf';
    double defaultFontSize = 14;
    double defaultIconSize = 17;
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(children: [
            SizedBox(height: 35),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                width: 230,
                height: 100,
                alignment: Alignment.center,
                child: Image.asset(
                  "assets/images/logo.png",
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 40, right: 10, left: 10),
              child: TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    borderSide: BorderSide(
                      width: 0,
                      style: BorderStyle.none,
                    ),
                  ),
                  filled: true,
                  prefixIcon: Icon(
                    Icons.phone,
                    color: Color(0xFF666666),
                    size: defaultIconSize,
                  ),
                  fillColor: Color(0xFFF2F3F5),
                  hintStyle: TextStyle(
                    color: Color(0xFF666666),
                    fontFamily: defaultFontFamily,
                    fontSize: defaultFontSize,
                  ),
                  hintText: "Full Name",
                ),
                validator: (value) {
                  if (value.isEmpty) {
                    return "The name field cannot be empty";
                  }
                  return null;
                },
                maxLength: 10,
                keyboardType: TextInputType.number,
                controller: _name,
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 40, right: 10, left: 10),
              child: TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    borderSide: BorderSide(
                      width: 0,
                      style: BorderStyle.none,
                    ),
                  ),
                  filled: true,
                  prefixIcon: Icon(
                    Icons.phone,
                    color: Color(0xFF666666),
                    size: defaultIconSize,
                  ),
                  fillColor: Color(0xFFF2F3F5),
                  hintStyle: TextStyle(
                    color: Color(0xFF666666),
                    fontFamily: defaultFontFamily,
                    fontSize: defaultFontSize,
                  ),
                  hintText: "Phone Number",
                ),
                validator: (value) {
                  if (value.isEmpty) {
                    return "The name field cannot be empty";
                  }
                  return null;
                },
                maxLength: 10,
                keyboardType: TextInputType.number,
                controller: _controller,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              margin: EdgeInsets.only(right: 10, left: 10),
              child: TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    borderSide: BorderSide(
                      width: 0,
                      style: BorderStyle.none,
                    ),
                  ),
                  filled: true,
                  prefixIcon: Icon(
                    Icons.email,
                    color: Color(0xFF666666),
                    size: defaultIconSize,
                  ),
                  fillColor: Color(0xFFF2F3F5),
                  hintStyle: TextStyle(
                    color: Color(0xFF666666),
                    fontFamily: defaultFontFamily,
                    fontSize: defaultFontSize,
                  ),
                  hintText: "Email",
                ),
                validator: (value) {
                  if (value.isEmpty) {
                    Pattern pattern =
                        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                    RegExp regex = new RegExp(pattern);
                    if (!regex.hasMatch(value))
                      return 'Please make sure your email address is valid';
                    else
                      return null;
                  }
                },
                keyboardType: TextInputType.emailAddress,
                controller: _cnt,
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(14.0, 8.0, 14.0, 8.0),
              child: Material(
                borderRadius: BorderRadius.circular(10.0),
                color: Color(0xFFF2F3F5),
                elevation: 0.0,
                child: Padding(
                  padding: const EdgeInsets.only(left: 12.0),
                  child: ListTile(
                    title: TextFormField(
                      obscureText: hidePass,
                      controller: _password,
                      showCursor: true,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          borderSide: BorderSide(
                            width: 0,
                            style: BorderStyle.none,
                          ),
                        ),
                        filled: true,
                        prefixIcon: Icon(
                          Icons.security,
                          color: Color(0xFF666666),
                          size: defaultIconSize,
                        ),
                        fillColor: Color(0xFFF2F3F5),
                        hintStyle: TextStyle(
                          color: Color(0xFF666666),
                          fontFamily: defaultFontFamily,
                          fontSize: defaultFontSize,
                        ),
                        hintText: "Password",
                      ),
                      validator: (value) {
                        if (value.isEmpty) {
                          return "The password field cannot be empty";
                        } else if (value.length < 6) {
                          return "the password has to be at least 6 characters long";
                        }
                        return null;
                      },
                    ),
                    trailing: IconButton(
                        icon: Icon(Icons.remove_red_eye),
                        onPressed: () {
                          setState(() {
                            hidePass = !hidePass;
                          });
                        }),
                  ),
                ),
              ),
            ),
          ]),

          // onPressed: () {
          //       Navigator.of(context).push(MaterialPageRoute(
          //           builder: (context) =>
          //               OTPScreen(_controller.text, _cnt.text)));
          //     },

          Padding(
            padding: const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 8.0),
            child: Material(
                borderRadius: BorderRadius.circular(5.0),
                color: Color(0xFFff3b5c),
                elevation: 0.0,
                child: MaterialButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => OTPScreen(_controller.text,
                            _cnt.text, _name.text, _password.text)));
                  },
                  minWidth: MediaQuery.of(context).size.width,
                  child: Text(
                    "SIGN UP",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 25.0,
                        fontFamily: "WorkSansBold"),
                  ),
                )),
          ),
        ],
      ),
    );
  }
}
