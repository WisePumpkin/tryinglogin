import 'package:flutter/material.dart';

class loginconfirm extends StatelessWidget {
  final String name ;
  final String email ;
  final String password ;

  const loginconfirm({Key? key,required this.name,required this.email,required this.password}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        child: Center(
          child: Column(children: [
            const SizedBox(height: 120),
            Text(name),
            Text(email),
            Text(password)
          ],
          ),
        ),
      ),
    );
  }
}
