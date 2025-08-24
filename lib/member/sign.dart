import 'package:flutter/material.dart';
import 'login.dart';

String id='';
String password='';
String pass2='';

class sign extends StatefulWidget {
  const sign({super.key});

  @override
  State<sign> createState() => _SignState();
}

class _SignState extends State<sign> {
  TextEditingController controller = TextEditingController();
  TextEditingController controller2 = TextEditingController();
  TextEditingController controller3 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffEDEDED),
      body: Container(
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
                          SizedBox(height: 16,),
                          TextField(
                            controller: controller3,
                            decoration: InputDecoration(labelText: '보호자 비밀번호'),
                            keyboardType: TextInputType.number,
                            obscureText: true,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                Row(
                  children: [
                    Expanded(flex: 2,child: SizedBox(),),
                    Expanded(
                      flex: 6,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(0,0,0,10),
                        child: Container(
                            width: 350, // 너비는 상황에 맞게 조정
                            height: 60,
                            decoration: BoxDecoration(
                              color: Color(0xff4eb4e6),
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: TextButton(
                              child: Text('회원가입',style: TextStyle(color: Colors.white,fontSize: 30,fontWeight: FontWeight.w900),),
                              onPressed: (){
                                if (controller.text.isNotEmpty&&controller2.text.isNotEmpty&&controller3.text.isNotEmpty){
                                  Navigator.pushNamed(context, '/login');
                                  showSnackBar(context, Text('회원가입이 완료되었습니다.'));
                                  id=controller.text;
                                  password=controller2.text;
                                  pass2=controller3.text;
                                }
                                else {
                                  showSnackBar(context, Text('입력란을 모두 작성해주세요.'));
                                }
                              },
                            )
                        ),
                      ),
                    ),
                    Expanded(flex: 2,child: SizedBox(),),
                  ],
                ),
                TextButton(
                  child: Text('로그인',style: TextStyle(color: Colors.black,)),
                  onPressed: (){
                    Navigator.pushNamed(context, '/login');
                  },
                ),
              ])
      ),
    );
  }
}
