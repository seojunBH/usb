import 'package:flutter/material.dart';
import 'login.dart';
import 'sign.dart';

class propass extends StatefulWidget {
  const propass({super.key});

  @override
  State<propass> createState() => _propassState();
}

class _propassState extends State<propass> {
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffEDEDED),
      body: Container(
          width: double.infinity,
          height: double.infinity,
        child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 100, 0, 0),
                  child: Image.asset('assets/logo.png',width: 150,height: 150,),
                ),
                Padding(
                  padding: const EdgeInsets.all(0.0),
                  child: Text('U.S.B.',style: TextStyle(
                    fontSize: 80,decoration: TextDecoration.none,
                    color: Color(0xff4eb4e6)
                  ),
                              ),
                ),
                Form(
                  child: Theme(
                    data: ThemeData(
                      inputDecorationTheme: InputDecorationTheme(
                        //border: InputBorder.none,
                        labelStyle: TextStyle(color: Color(0xff4eb4e6),fontSize: 15)
                      )
                    ),
                    child: Container(
                      padding: EdgeInsets.all(60.0),
                      child: Column(
                          children: [
                            TextField(
                              controller: controller,
                              decoration: InputDecoration(labelText: '보호자 비밀번호를 입력하세요.'),
                              keyboardType: TextInputType.number,
                              obscureText: true,
                            ),
                          ],
                        ),
                    ),
                  ),
                ),
                /*Padding(
                  padding: const EdgeInsets.fromLTRB(0,0,0,10),
                  child: Container(
                    width: 350, // 너비는 상황에 맞게 조정
                    height: 60,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(50),
                    )
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0,0,0,70),
                  child: Container(
                      width: 350, // 너비는 상황에 맞게 조정
                      height: 60,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(50),
                      )
                  ),
                ),*/
                Padding(
                  padding: const EdgeInsets.fromLTRB(0,0,0,10),
                  child: Container(
                      width: 350, // 너비는 상황에 맞게 조정
                      height: 60,
                      decoration: BoxDecoration(
                        color: Color(0xff4eb4e6),
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: IconButton(
                        icon: Icon(Icons.arrow_forward,color: Colors.white,size: 30),
                        onPressed: (){
                          if (controller.text == pass2) {
                            Navigator.pushNamed(context, '/protector');
                          } else {
                            showSnackBar(context, Text('잘못된 비밀번호입니다.'));
                          }

                        },
                      )
                  ),
                ),
              ])

      ),
    );
  }
}