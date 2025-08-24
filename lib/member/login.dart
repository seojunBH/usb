import 'package:flutter/material.dart';
import 'sign.dart';
class LogIn extends StatefulWidget {
  const LogIn({super.key});

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  TextEditingController controller = TextEditingController();
  TextEditingController controller2 = TextEditingController();

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
                              decoration: InputDecoration(labelText: '아이디'),
                              keyboardType: TextInputType.emailAddress,
                            ),
                            SizedBox(height: 16,),
                            TextField(
                              controller: controller2,
                              decoration: InputDecoration(labelText: '패스워드'),
                              keyboardType: TextInputType.text,
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
                  child: Row(
                    children: [
                      Expanded(flex: 2,child:SizedBox(),),
                      Expanded(
                        flex: 6,
                        child: Container( // 너비는 상황에 맞게 조정
                          height: 60,
                          decoration: BoxDecoration(
                            color: Color(0xff4eb4e6),
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: TextButton(
                            child: Text('로그인',style: TextStyle(color: Colors.white,fontSize: 30,fontWeight: FontWeight.w900),),
                            onPressed: (){
                              if (controller.text == id &&
                                  controller2.text == password) {
                                Navigator.pushNamed(context,'/choice');
                              }
                              else if (controller.text == id && controller2.text != password) {
                                showSnackBar(context, Text('잘못된 비밀번호입니다.'));
                              }
                              else if (controller.text != id && controller2.text == password) {
                                showSnackBar(context, Text('잘못된 아이디입니다.'));
                              }
                              else {
                                showSnackBar(context, Text('다시 올바르게 입력해주세요.'));
                              }
                            },
                          )
                      ),
                      ),
                      Expanded(flex: 2,child:SizedBox(),),
                    ],
                  ),
                ),
                TextButton(
                  child: Text('회원 가입',style: TextStyle(color: Colors.black,)),
                  onPressed: (){
                    Navigator.pushNamed(context, '/sign');
                  },
                ),
              ])
      ),
    );
  }
}
void showSnackBar(BuildContext context, Text text) {
  final snackBar = SnackBar(
    content: text,
    backgroundColor: Color.fromARGB(255, 112, 48, 48),
  );

// Find the ScaffoldMessenger in the widget tree
// and use it to show a SnackBar.
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}

class NextPage extends StatelessWidget {
  const NextPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}