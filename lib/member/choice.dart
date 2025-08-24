import 'package:flutter/material.dart';

class choice extends StatelessWidget {
  const choice({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Color(0xffEDEDED),
      child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 100, 0, 0),
                child: Image.asset('assets/logo.png',width: 150,height: 150,),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0,0,0,100),
                child: Text('U.S.B.',style: TextStyle(
                    fontSize: 80,decoration: TextDecoration.none,
                    color: Color(0xff4eb4e6)
                ),
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
                  ),
                  child: TextButton(onPressed: (){
                    Navigator.pushNamed(context, '/user');},
                    child: Text('사용자로 시작하기',style: TextStyle(color: Colors.black,fontSize: 25,fontWeight: FontWeight.w700)),
                  ),

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
                    ),
                  child: TextButton(onPressed: (){
                  Navigator.pushNamed(context, '/propass');},
                  child: Text('보호자로 시작하기',style: TextStyle(color: Colors.black,fontSize: 25,fontWeight: FontWeight.w700)),
                ),
              ),

              )])
    );
  }
}
