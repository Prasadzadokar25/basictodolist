import "package:flutter/material.dart";
import "information.dart";
import "loginPage.dart";

class NewAccount extends StatefulWidget {
  const NewAccount({super.key});

  @override
  State createState() => _NewAccountState();
}

class _NewAccountState extends State {
  bool accountCreated = false;
  int usernameError = 0;
  int passwordError = 0;
  int contactNoError = 0;
  String username = "";
  String password = "";
  String contact = "";
  bool userNamehaveoneletter = false;
  bool passwordhaveoneletter = false;
  bool contacthaveoneletter = false;
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController contactNoController = TextEditingController();

  void singUp() {
    username = usernameController.text;
    password = passwordController.text;
    contact = contactNoController.text;

    if (UserInfo()
        .addUser(username: username, password: password, contact: contact)) {
      accountCreated = true;
      setState(() {});
    } else {
      usernameError = 2;
    }
  }

  @override
  Widget build(BuildContext context) {
    return (accountCreated == false)
        ? Scaffold(
            body: SingleChildScrollView(
              child: Stack(children: [
                SizedBox(
                  height: MediaQuery.sizeOf(context).height,
                  width: MediaQuery.sizeOf(context).width,
                  child: Image.asset(
                    "assets/images/background4.jpg",
                    fit: BoxFit.cover,
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  // mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 80,
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(
                          60.0), // Adjust the value as needed
                      child: Image.asset(
                        'assets/images/atten.png',
                        height: 170, // Adjust height as needed
                        fit: BoxFit.cover, // Adjust the fit as needed
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    const Text(
                      "Create an account",
                      style:
                          TextStyle(fontSize: 23, fontWeight: FontWeight.w700),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                        width: 300,
                        child: TextField(
                          //maxLength: 40,
                          onChanged: (value) {
                            username = usernameController.text;
                            userNamehaveoneletter = true;
                            setState(() {});
                          },
                          controller: usernameController,
                          decoration: InputDecoration(
                            // hintText: "Username",
                            labelText: "Username",
                            labelStyle: const TextStyle(
                                fontSize: 17,
                                color: Color.fromRGBO(0, 0, 0, 0.5)),
                            errorText: (username == "" && userNamehaveoneletter)
                                ? "please enter correct user name"
                                : (usernameError == 2)
                                    ? "username already exits"
                                    : null,
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide: const BorderSide(
                                    color: Color.fromARGB(255, 22, 20, 20))),
                            errorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15.0),
                                borderSide:
                                    BorderSide(color: Colors.red.shade800)),
                            contentPadding: const EdgeInsets.only(left: 25),
                            filled: true,
                            fillColor: const Color.fromARGB(255, 236, 236, 236),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15.0),
                              borderSide: const BorderSide(color: Colors.black),
                            ),
                          ),
                        )),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                        width: 300,
                        child: TextField(
                          //maxLength: 40,
                          //maxLength: 40,

                          controller: passwordController,
                          decoration: InputDecoration(
                            labelText: "Password",

                            labelStyle: const TextStyle(
                                fontSize: 17,
                                color: Color.fromRGBO(0, 0, 0, 0.5)),
                            //hintText: "Password",
                            errorText: (passwordError == 1)
                                ? "password should have atlest 4 letters"
                                : null,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15.0),
                                borderSide: const BorderSide(
                                    color: Color.fromARGB(255, 0, 0, 0))),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide: const BorderSide(
                                    color: Color.fromARGB(255, 24, 10, 9))),
                            errorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15.0),
                                borderSide:
                                    BorderSide(color: Colors.red.shade800)),
                            contentPadding: const EdgeInsets.only(left: 25),
                            filled: true,
                            fillColor: const Color.fromARGB(255, 241, 241, 241),
                          ),
                        )),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                        width: 300,
                        child: TextFormField(
                          //maxLength: 40,
                          controller: contactNoController,
                          decoration: InputDecoration(
                            labelText: "Phone No.",
                            labelStyle: const TextStyle(
                                color: Color.fromRGBO(0, 0, 0, 0.5)),
                            errorText: (contactNoError == 1)
                                ? "please enter void mobile number"
                                : null,
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide:
                                    const BorderSide(color: Colors.black)),
                            errorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15.0),
                                borderSide:
                                    BorderSide(color: Colors.red.shade800)),
                            contentPadding: const EdgeInsets.only(left: 25),
                            filled: true,
                            fillColor: const Color.fromARGB(255, 241, 241, 241),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15.0),
                              borderSide: const BorderSide(color: Colors.black),
                            ),
                          ),
                        )),
                    const SizedBox(
                      height: 3,
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Container(
                        width: 300,
                        height: 43,
                        decoration: BoxDecoration(boxShadow: [
                          BoxShadow(
                              color: Colors.grey.withOpacity(0.7),
                              spreadRadius: 0,
                              blurRadius: 14,
                              offset: const Offset(2, 8))
                        ]),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  const Color.fromARGB(255, 2, 167, 172),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10))),
                          onPressed: () {
                            userNamehaveoneletter = true;
                            passwordhaveoneletter = true;
                            setState(() {});
                            if (cheachuserNamehaveoneletterIsFilled()) {
                              singUp();
                            }
                          },
                          child: const Text(
                            "Submit",
                            style: TextStyle(
                                fontSize: 20,
                                color: Color.fromARGB(255, 243, 243, 243)),
                          ),
                        )),
                    const SizedBox(
                      height: 25.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 2,
                          width: 100,
                          decoration: const BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Color.fromARGB(34, 103, 102, 102),
                                Color.fromARGB(143, 87, 86, 86),
                                Color.fromARGB(234, 41, 41, 41),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 12,
                        ),
                        const Text(
                          "Or sign up with",
                          style: TextStyle(
                              fontWeight: FontWeight.w400, fontSize: 15),
                        ),
                        const SizedBox(
                          width: 12,
                        ),
                        Container(
                          height: 2,
                          width: 100,
                          decoration: const BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Color.fromARGB(234, 41, 41, 41),
                                Color.fromARGB(143, 87, 86, 86),
                                Color.fromARGB(34, 103, 102, 102),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 23,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 1, horizontal: 80),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.amber,
                            ),
                            height: 45,
                            width: 45,
                            child: Image.asset(
                              "assets/images/googlelogo.png",
                              width: 20,
                            ),
                          ),
                          Container(
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white,
                            ),
                            height: 45,
                            width: 45,
                            child: Image.asset(
                              "assets/images/facebook.png",
                              height: 20,
                              width: 20,
                            ),
                          ),
                          Container(
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white,
                            ),
                            height: 42,
                            width: 42,
                            child: Image.asset(
                              "assets/images/linkdin2.png",
                              height: 18,
                              width: 20,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                      const Text(
                        "   Already have an account?",
                        style: TextStyle(
                          fontSize: 16,
                          color: Color(0xff000000),
                        ),
                        textAlign: TextAlign.center,
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            PageRouteBuilder(
                              transitionDuration:
                                  const Duration(milliseconds: 400),
                              pageBuilder: (context, animation, _) {
                                return FadeTransition(
                                  opacity: animation,
                                  child: const Login(),
                                );
                              },
                            ),
                          );
                        },
                        style: const ButtonStyle(),
                        child: const Text(
                          "sing in",
                          style: TextStyle(
                            color: Color.fromARGB(255, 2, 167, 172),
                            fontSize: 17,
                          ),
                        ),
                      )
                    ]),
                  ],
                ),
              ]),
            ),
          )
        : Scaffold(
            body: Center(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                    height: 100,
                    width: 100,
                    child: CircleAvatar(
                      backgroundColor: Color.fromARGB(255, 139, 254, 126),
                      child: Icon(
                        Icons.check,
                        grade: 400,
                        // weight: 200,
                        size: 45,
                      ),
                    )),
                const SizedBox(
                  height: 25,
                ),
                const Text(
                  "Your account has been \n   succesfully created",
                  style: TextStyle(fontSize: 20),
                ),
                const SizedBox(
                  height: 25,
                ),
                Container(
                  margin: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: const Color.fromARGB(255, 242, 219, 184),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey.withOpacity(0.7),
                            spreadRadius: 0,
                            blurRadius: 14,
                            offset: const Offset(2, 8))
                      ]),
                  width: 350,
                  height: 120,
                  alignment: Alignment.center,
                  child: const SizedBox(
                    width: 300,
                    child: Text(
                      "   Welcome to our To-Do List app! Stay organized, stay productive. Start managing your tasks effortlessly. 📝✨",
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                Container(
                    decoration: BoxDecoration(boxShadow: [
                      BoxShadow(
                          color: Colors.grey.withOpacity(0.7),
                          spreadRadius: 0,
                          blurRadius: 14,
                          offset: const Offset(2, 8))
                    ]),
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            fixedSize: const Size(250, 45),
                            backgroundColor:
                                const Color.fromARGB(255, 139, 254, 126),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12))),
                        onPressed: () {
                          Navigator.push(
                            context,
                            PageRouteBuilder(
                              transitionDuration:
                                  const Duration(milliseconds: 50),
                              pageBuilder: (context, animation, _) {
                                return FadeTransition(
                                  opacity: animation,
                                  child: const Login(),
                                );
                              },
                            ),
                          );
                        },
                        child: const Text(
                          "Continue",
                          style: TextStyle(fontSize: 18, color: Colors.black87),
                        )))
              ],
            )),
          );
  }

  bool cheachuserNamehaveoneletterIsFilled() {
    username = usernameController.text;
    password = passwordController.text;
    contact = contactNoController.text;

    if (username.isEmpty) {
      usernameError = 1;
    } else {
      usernameError = 0;
    }
    if (password.isEmpty || password.length < 4) {
      passwordError = 1;
    } else {
      passwordError = 0;
    }
    if (contact.isEmpty || contact.length != 10) {
      contactNoError = 1;
    } else {
      contactNoError = 0;

      try {
        int.parse(contact);
        contactNoError = 0;
      } catch (e) {
        contactNoError = 1;
      }
    }

    setState(() {});
    if (usernameError == 0 && passwordError == 0 && contactNoError == 0) {
      return true;
    } else {
      return false;
    }
  }
}
