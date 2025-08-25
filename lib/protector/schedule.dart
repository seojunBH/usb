import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class schedule extends StatefulWidget {
  const schedule({super.key});

  @override
  State<schedule> createState() => _scheduleState();
}

class _scheduleState extends State<schedule> {
  TextEditingController controller = TextEditingController();
  TextEditingController controller2 = TextEditingController();

  final List<String> periodList = ['오전', '오후'];
  final List<int> hourList = List.generate(12, (index) => index + 1);
  final List<int> minuteList = List.generate(60, (index) => index);

  int selectedPeriod = 0;
  int selectedHour = 0;
  int selectedMinute = 0;

  final List<String> nfcList = ['NFC1', 'NFC2', 'NFC3'];
  String? _selectedValue;

  double _currentValue = 50;

  void _showTimePicker() {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext builder) {
        return SizedBox(
          height: 250,
          child: Row(
            children: [
              Expanded(
                child: CupertinoPicker(
                  scrollController:
                  FixedExtentScrollController(initialItem: selectedPeriod),
                  itemExtent: 40,
                  onSelectedItemChanged: (index) {
                    setState(() {
                      selectedPeriod = index;
                      _updateTimeText();
                    });
                  },
                  children: periodList
                      .map((e) =>
                      Center(child: Text(e, style: TextStyle(fontSize: 20))))
                      .toList(),
                ),
              ),
              Expanded(
                child: CupertinoPicker(
                  scrollController:
                  FixedExtentScrollController(initialItem: selectedHour),
                  itemExtent: 40,
                  onSelectedItemChanged: (index) {
                    setState(() {
                      selectedHour = index;
                      _updateTimeText();
                    });
                  },
                  children: hourList
                      .map((e) =>
                      Center(child: Text(e.toString(), style: TextStyle(fontSize: 20))))
                      .toList(),
                ),
              ),
              Expanded(
                child: CupertinoPicker(
                  scrollController:
                  FixedExtentScrollController(initialItem: selectedMinute),
                  itemExtent: 40,
                  onSelectedItemChanged: (index) {
                    setState(() {
                      selectedMinute = index;
                      _updateTimeText();
                    });
                  },
                  children: minuteList
                      .map((e) => Center(
                      child: Text(e.toString().padLeft(2, '0'),
                          style: TextStyle(fontSize: 20))))
                      .toList(),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  void _updateTimeText() {
    final period = periodList[selectedPeriod];
    final hour = hourList[selectedHour];
    final minute = minuteList[selectedMinute].toString().padLeft(2, '0');
    controller2.text = "$period $hour:$minute";
  }

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
              Text("일정 이름",
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
                        labelText: '일정 이름 입력란',
                        border: InputBorder.none,
                        labelStyle: TextStyle(
                            color: Colors.black,
                            fontSize: 30,
                            fontWeight: FontWeight.bold)),
                    keyboardType: TextInputType.text,
                  ),
                ),
              ),
              Text("일정 시간",
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
                  child: GestureDetector(
                    onTap: _showTimePicker,
                    child: AbsorbPointer(
                      child: TextField(
                        controller: controller2,
                        decoration: const InputDecoration(
                          labelText: '일정 시간 입력란',
                          border: InputBorder.none,
                          labelStyle: TextStyle(
                              color: Colors.black,
                              fontSize: 30,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Text("NFC 선택",
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
                  child: DropdownButton<String>(
                    value: _selectedValue,
                    items: nfcList.map((nfc) {
                      return DropdownMenuItem(
                          value: nfc,
                          child: Text(
                            nfc,
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 30,
                                fontWeight: FontWeight.bold),
                          ));
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        _selectedValue = value;
                      });
                    },
                    hint: const Text(
                      'NFC 선택',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 30,
                          fontWeight: FontWeight.bold),
                    ),
                    isExpanded: true,
                    underline: const SizedBox(),
                  ),
                ),
              ),
              Text("알람 음량",
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
                  child: Row(
                    children: [
                      const Expanded(child: Icon(Icons.volume_down,size: 40,)),
                      Container(
                        width: 500,
                        child: Slider(
                          value: _currentValue,
                          min: 0,
                          max: 100,
                          onChanged: (double value) {
                            setState(() {
                              _currentValue = value;
                            });
                          },
                        ),
                      ),
                      const Expanded(child: Icon(Icons.volume_up,size: 40,)),
                    ],
                  ),
                ),
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
                  onPressed: () {},
                  icon: const Icon(Icons.alarm_add,
                      size: 35, color: Colors.black),
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
                      size: 35, color: Color(0xff999999)),
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
