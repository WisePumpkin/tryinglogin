import 'package:flutter/material.dart';
import 'package:tryinglogin/login.dart';

class intro extends StatelessWidget {
  const intro({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SafeArea(
        child:Column(
          children:[
            const SizedBox(height: 220),
            const Center(child: Text("Welcome")),
            const Center(child: SizedBox(height: 20,)),
            Center(
              child: ElevatedButton(
                  onPressed:
                      ()=>Navigator.pushReplacement(context, MaterialPageRoute(builder:(context) {return const login();})),
                  child: const Text("Start")
              ),
            )],
        ),
      ),
    );
  }
}
