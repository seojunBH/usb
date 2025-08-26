import 'package:flutter/material.dart';

class addnfc extends StatefulWidget {
  const addnfc({super.key});

  @override
  State<addnfc> createState() => _addnfcState();
}

class _addnfcState extends State<addnfc> {
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffededed),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(30, 20, 30, 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("NFC 모듈명",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 25,
                      fontWeight: FontWeight.bold)),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 6),
                padding: const EdgeInsets.symmetric(horizontal: 12),
                height: 80,
                decoration: BoxDecoration(
                  color: const Color(0xffFAFAF8),
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.05),
                      blurRadius: 4,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Center(
                  child: TextField(
                    controller: controller,
                    decoration: const InputDecoration(
                        labelText: 'NFC 모듈명 입력란',
                        border: InputBorder.none,
                        labelStyle: TextStyle(
                            color: Colors.black,
                            fontSize: 30,
                            fontWeight: FontWeight.bold)),
                    keyboardType: TextInputType.text,
                  ),
                ),
              ),
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(flex: 1,child: Container(color: Colors.transparent,),),
                    Flexible(
                      flex: 2,
                      child: SizedBox(
                        child: ElevatedButton(
                          onPressed: () => Navigator.pushNamed(context, "/protector"),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xff67CC6D),
                            foregroundColor: Colors.black,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
                          ),
                          child: const Text("완료", style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold)),
                        ),
                      ),
                    ),
                    Expanded(flex: 1,child: Container(color: Colors.transparent,),),
                  ]
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: const Color(0xffFAFAF8),
        height: 80,
        child: Row(
          children: [
            const Expanded(child: SizedBox(height: 80)),
            Column(
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/protector');
                  },
                  icon: const Icon(Icons.home,
                      size: 35, color: Color(0xff999999)),
                  padding: EdgeInsets.zero,
                ),
                const Text("홈", style: TextStyle(height: 0.5)),
              ],
            ),
            const Expanded(child: SizedBox(height: 80)),
            Column(
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/schedule');},
                  icon: const Icon(Icons.alarm_add,
                      size: 35, color: Color(0xff999999)),
                  padding: EdgeInsets.zero,
                ),
                const Text("일정추가", style: TextStyle(height: 0.5)),
              ],
            ),
            const Expanded(child: SizedBox(height: 80)),
            Column(
              children: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.nfc,
                      size: 35, color: Colors.black),
                  padding: EdgeInsets.zero,
                ),
                const Text("NFC추가", style: TextStyle(height: 0.5)),
              ],
            ),
            const Expanded(child: SizedBox(height: 80)),
          ],
        ),
      ),
    );
  }
}
