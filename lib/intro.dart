import 'package:flutter/material.dart';
import 'package:tryinglogin/businesslogin.dart';
import 'package:tryinglogin/login.dart';

class intro extends StatelessWidget {
  const intro({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SafeArea(
        child: Container(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Personal",style: TextStyle(fontSize: 20)),
                IconButton(

                    onPressed:
                        ()=>Navigator.push(context, MaterialPageRoute(builder:(context) {return const login();})),
                    iconSize: 80,
                    icon: const Icon(Icons.person_outline)),
                const SizedBox(height: 100),
                const Text("Business",style: TextStyle(fontSize: 20)),
                IconButton(
                    onPressed:
                        ()=>Navigator.push(context, MaterialPageRoute(builder:(context) {return const businesslogin();})),
                    icon: Icon(Icons.business_center_outlined),iconSize: 80,)
                
              ],
            ),
          ),
        ),

      ),
    );
  }
}
