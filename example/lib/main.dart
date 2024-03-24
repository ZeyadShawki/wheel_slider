import 'package:example/wheelslider_with_double.dart';
import 'package:example/widgets/custom_box.dart';
import 'package:flutter/material.dart';
import 'package:wheel_slider/wheel_slider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        textTheme: const TextTheme(
          headlineSmall: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 20.0,
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final int _totalCount = 100;
  final int _initValue = 50;
  int _currentValue = 50;

  final int _nTotalCount = 50;
  final int _nInitValue = 10;
  int _nCurrentValue = 10;

  final int _cInitValue = 7;
  int _cCurrentValue = 7;

  final List<Map<String, String>> _countryList = [
    {'flag': 'assets/argentina.png', 'name': 'Argssssssssssssssentina'},
    {'flag': 'assets/australia.png', 'name': 'Australiasssssssss'},
    {'flag': 'assets/brazil.png', 'name': 'Brazil'},
    {'flag': 'assets/canada.png', 'name': 'Canada'},
    {'flag': 'assets/cuba.png', 'name': 'Cuba'},
    {'flag': 'assets/hungary.png', 'name': 'Hungary'},
    {'flag': 'assets/iceland.png', 'name': 'Iceland'},
    {'flag': 'assets/india.png', 'name': 'Issssssssssssssndia'},
    {'flag': 'assets/monaco.png', 'name': 'Monaco'},
    {'flag': 'assets/south-africa.png', 'name': 'South Africa'},
    {'flag': 'assets/ukraine.png', 'name': 'Ukraine'},
    {'flag': 'assets/usa.png', 'name': 'USA'},
  ];

  final List<int> heights = [];
  @override
  void initState() {
    for (var i = 100; i < 250; i++) {
      heights.add(i);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Wheel Slider',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 20.0,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                const WheelSliderWithDouble()));
                  },
                  child: const Text('Examples with double value')),
              const SizedBox(
                height: 10.0,
              ),
              CustomBox(
                title: 'Default Wheel Slider',
                wheelSlider: WheelSlider(
                  totalCount: _totalCount,
                  initValue: _initValue,
                  onValueChanged: (val) {
                    setState(() {
                      _currentValue = val;
                    });
                  },
                  hapticFeedbackType: HapticFeedbackType.vibrate,
                  pointerColor: Colors.redAccent,
                ),
                valueText: Text(
                  _currentValue.toString(),
                  style: const TextStyle(
                    fontSize: 18.0,
                    height: 2.0,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              const SizedBox(
                height: 30.0,
              ),
              SizedBox(
                child: WheelSlider.number(
                  ageDivider: true,
                  verticalListWidth: 70,
                  ageDividerColor: Colors.amber,
                  horizontal: false,
                  itemSize: 55,
                  verticalListHeight: 450.0,
                  perspective: 0.01,
                  dividerSpacing: 450 * 0.43,
                  totalCount: _nTotalCount,
                  initValue: _nInitValue,
                  unSelectedNumberStyle: const TextStyle(
                    fontSize: 32.0,
                    color: Colors.black54,
                  ),
                  // horizontalListHeight: 500,
                  selectedNumberStyle: const TextStyle(
                    fontSize: 45.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.redAccent,
                  ),
                  currentIndex: _nCurrentValue,
                  onValueChanged: (val) {
                    setState(() {
                      _nCurrentValue = val;
                    });
                  },
                  hapticFeedbackType: HapticFeedbackType.heavyImpact,
                ),
              ),
              const SizedBox(
                height: 50.0,
              ),
              WheelSlider.customWidget(
                totalCount: _countryList.length,
                horizontal: false,
                initValue: _cInitValue,
                isInfinite: false,
                scrollPhysics: const BouncingScrollPhysics(),
                ageDivider: true,
                listWidth: 700,
                verticalListWidth: 700,
                pointerWidth: 700,
                horizontalListWidth: 700,
                ageDividerColor: Colors.amber,
                itemSize: 55,
                verticalListHeight: 450.0,
                perspective: 0.01,
                dividerSpacing: 450 * 0.43,
                dividerWidth: 100,
                children: List.generate(
                    _countryList.length,
                    (index) => Center(
                          child: RichText(
                            text: TextSpan(
                              children: [
                                if (_cCurrentValue == index) ...[
                                  TextSpan(
                                    text:
                                        '${_countryList[index]['name']}', // Display height when _cCurrentValue is equal to index
                                    style: TextStyle(
                                        fontSize: 45,
                                        color: Colors
                                            .black), // Style for height text
                                  ),
                                ] else if (_cCurrentValue == index - 1 ||
                                    _cCurrentValue == index + 1) ...[
                                  TextSpan(
                                    text:
                                        '${_countryList[index]['name']}', // Display height when _cCurrentValue is equal to index
                                    style: TextStyle(
                                        fontSize: 45 - (index.toDouble()),
                                        color: Colors
                                            .black), // Style for height text
                                  ),
                                ] else if (_cCurrentValue != index) ...[
                                  TextSpan(
                                    text:
                                        '${_countryList[index]['name']}', // Display height when _cCurrentValue is equal to index
                                    style: TextStyle(
                                        fontSize: 45 - (index.toDouble() * 2),
                                        color: Colors
                                            .grey), // Style for height text
                                  ),
                                ],
                              ],
                            ),
                          ),
                        )),
                onValueChanged: (val) {
                  setState(() {
                    _cCurrentValue = val;
                  });
                },
                hapticFeedbackType: HapticFeedbackType.vibrate,
                showPointer: false,
              ),
              const SizedBox(
                height: 50.0,
              ),
              CustomBox(
                title: 'Custom Pointer Wheel Slider',
                wheelSlider: WheelSlider(
                  totalCount: _totalCount,
                  initValue: _initValue,
                  perspective: 0.01,
                  isVibrate: false,
                  background: Container(
                    width: 300,
                    height: double.infinity,
                    color: Colors.brown,
                  ),
                  lineColor: Colors.white,
                  customPointer: const ImageIcon(
                    AssetImage('assets/crosshair.png'),
                    color: Colors.black,
                    size: 35.0,
                  ),
                  onValueChanged: (val) {},
                ),
              ),
              const SizedBox(
                height: 50.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
