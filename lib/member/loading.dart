import 'package:flutter/material.dart';

class loading extends StatelessWidget {
  const loading({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Color(0xffEDEDED),
      child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
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
            ])
    );
  }
}
