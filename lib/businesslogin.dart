import 'package:flutter/material.dart';

import 'intro.dart';
import 'loginconfirm.dart';

class businesslogin extends StatefulWidget {
  const businesslogin({Key? key}) : super(key: key);

  @override
  State<businesslogin> createState() => _businessloginState();
}

class _businessloginState extends State<businesslogin> {
  final _formkeybusiness = GlobalKey<FormState>();
  double password_strength=0;
  RegExp pass_valid = RegExp(r"(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*\W)");
  RegExp email_valid = RegExp(
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');

  TextEditingController _name = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();
  bool showbutton = false;
  bool enablelogin = false;
  bool loginname=false;
  bool loginemail=false;
  bool loginpassword=false;
  int requirements=0;
  bool _obscured =true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:SafeArea(
        child: Form(
          key: _formkeybusiness,
          child: Center(
            child: Container(
              margin: const EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text("Personal Information"),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                        onChanged: (_name){_formkeybusiness.currentState!.validate();},
                        validator: (_name){
                          if(_name!.isEmpty){
                            setState(() {loginname=false;enablelogin=EnableLogin(loginname,loginemail,loginpassword);});
                            return "Please Enter a Valid name";}
                          else{
                            setState(() {loginname=true;enablelogin=EnableLogin(loginname,loginemail,loginpassword);});
                          }
                        },
                        controller: _name,
                        decoration:const InputDecoration(
                          prefixIcon: Icon(Icons.person_outlined),
                          contentPadding: EdgeInsets.all(15),
                          hintText: "Enter your name here",
                          labelText: "Name",
                          border: OutlineInputBorder(),
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                        )
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                        controller: _email,
                        onChanged: (_email){_formkeybusiness.currentState!.validate();},
                        validator: (_email){
                          if(_email!.isEmpty){
                            setState(() {loginemail=false;enablelogin=EnableLogin(loginname,loginemail,loginpassword);});
                            return "Please Enter a Valid Email";}
                          else{
                            bool result = validateEmail(_email);
                            if(result){
                              setState(() {loginemail=true;enablelogin=EnableLogin(loginname,loginemail,loginpassword);});
                            }
                            else{
                              //setState(() {showbutton=false;});
                              setState(() {loginemail=false;enablelogin=EnableLogin(loginname,loginemail,loginpassword);});
                              return "Not valid";}
                          }
                        },
                        decoration:const InputDecoration(
                          prefixIcon: Icon(Icons.email_outlined),
                          contentPadding: EdgeInsets.all(15),
                          hintText: "Enter your email here",
                          labelText: "Email",
                          border: OutlineInputBorder(),
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                        )
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                        obscureText:_obscured,
                        controller:_password,
                        onChanged: (_password){_formkeybusiness.currentState!.validate();},
                        validator: (_password){
                          if(_password!.isEmpty){
                            setState(() {loginpassword=false;enablelogin=EnableLogin(loginname,loginemail,loginpassword);});
                            return "Please Enter A password";}
                          else{
                            bool result = validatePassword(_password);
                            if(result){setState(() {loginpassword=true;enablelogin=EnableLogin(loginname,loginemail,loginpassword);});}
                            else{
                              setState(() {loginpassword=false;enablelogin=EnableLogin(loginname,loginemail,loginpassword);});
                              return "Not strong enough";}
                          }
                        },
                        decoration:InputDecoration(
                            prefixIcon: const Icon(Icons.lock_outlined),
                            contentPadding: const EdgeInsets.all(15),
                            hintText: "Enter your password here",
                            labelText: "Password",
                            border: const OutlineInputBorder(),
                            floatingLabelBehavior: FloatingLabelBehavior.always,
                            suffixIcon: IconButton(
                              onPressed :(){
                                setState(()=> _obscured= !_obscured);},
                              icon: _obscured ? Icon(Icons.vpn_key_off_outlined) : Icon(Icons.vpn_key_outlined),)
                        )
                    ),
                  ),
                  ElevatedButton(onPressed:()=> {if(enablelogin){Navigator.pushReplacement(context, MaterialPageRoute(builder:(context){
                    return loginconfirm(name: _name.text, email: _email.text ,password: _password.text);}))}},

                        child: const Text("Sign Up !"))



                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
  bool validatePassword(String pass) {
    String a = pass.trim();
    if(pass_valid.hasMatch(a)){return true;}
    else{return false;}

  }
  bool EnableLogin(loginname,loginemail,loginpassword){
    if(loginname){if(loginemail){if(loginpassword){return true;}else{return false;}}else{return false;}}else{return false;}
  }

  bool validateEmail(String pass) {
    String a = pass.trim();
    if(email_valid.hasMatch(a)){return true;}
    else{return false;}

  }
}
