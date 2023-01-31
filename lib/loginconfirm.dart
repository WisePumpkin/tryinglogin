import 'package:flutter/material.dart';

class loginconfirm extends StatelessWidget {
  final String name ;
  final String email ;
  final String password ;

  const loginconfirm({Key? key,required this.name,required this.email,required this.password}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items:const [
          BottomNavigationBarItem(
            label: "Home",
            icon: Icon(Icons.home),backgroundColor: Colors.black),
          BottomNavigationBarItem(
            label: "Fav",
            icon: Icon(Icons.favorite),backgroundColor: Colors.black),
          BottomNavigationBarItem(
            label: "Search",
            icon: Icon(Icons.search),backgroundColor: Colors.black),
          BottomNavigationBarItem(
            label: "Profile",
            icon: Icon(Icons.person),backgroundColor: Colors.black),
      ]),
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
