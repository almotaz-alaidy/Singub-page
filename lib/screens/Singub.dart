import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Singub extends StatefulWidget {
  const Singub({super.key});

  @override
  State<Singub> createState() => _SingubState();
}

class _SingubState extends State<Singub> {
  TextEditingController email = TextEditingController();
  TextEditingController pass = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Singub page"),
        backgroundColor: Color.fromARGB(255, 178, 139, 111),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: NetworkImage(
                  "https://www.mmppicture.co.in/wp-content/uploads/2020/09/Background-1-802x1080.jpg"),
              fit: BoxFit.fill),
        ),
        child: ListView(children: [
          SizedBox(
            height: 60,
          ),
          TextField(
            decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                labelText: 'youre name',
                labelStyle: TextStyle(color: Colors.white, fontSize: 20),
                hintText: 'enter yore name',
                hintStyle: TextStyle(color: Colors.white, fontSize: 20)),
          ),
          SizedBox(
            height: 60,
          ),
          TextField(
            controller: email,
            decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                labelText: 'youre email',
                labelStyle: TextStyle(color: Colors.white, fontSize: 20),
                hintText: 'enter yore email',
                hintStyle: TextStyle(color: Colors.white, fontSize: 20)),
          ),
          SizedBox(
            height: 60,
          ),
          TextField(
            controller: pass,
            decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                labelText: 'youre pass',
                labelStyle: TextStyle(color: Colors.white, fontSize: 20),
                hintText: 'enter yore pass',
                hintStyle: TextStyle(color: Colors.white, fontSize: 20)),
          ),
          Divider(
            height: 100,
          ),
          TextButton(
              onPressed: () async {
                try {
                  var authin = FirebaseAuth.instance;
                  UserCredential user =
                      await authin.createUserWithEmailAndPassword(
                          email: email.text, password: pass.text);
                  ScaffoldMessenger.of(context)
                      .showSnackBar(SnackBar(content: Text("its added")));
                } catch (e) {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content:
                          Text("sorry try to change the pass and the email")));
                }
              },
              child: Text(
                "Singub",
                style: TextStyle(fontSize: 30, color: Colors.white),
              ))
        ]),
      ),
    );
  }
}
