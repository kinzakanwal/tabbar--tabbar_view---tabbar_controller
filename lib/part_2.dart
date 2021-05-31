import 'package:flutter/material.dart';
// import 'package:flutter/src/material/colors.dart';

//CHECKBOX WIDGET START
class CheckBox extends StatefulWidget {
  CheckBox({Key? key}) : super(key: key);

  @override
  _CheckBoxState createState() => _CheckBoxState();
}

class _CheckBoxState extends State<CheckBox> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    Color getColor(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused,
      };
      if (states.any(interactiveStates.contains)) {
        return Colors.blue;
      }
      return Colors.red;
    }

    return Checkbox(
      checkColor: Colors.white,
      fillColor: MaterialStateProperty.resolveWith(getColor),
      value: isChecked,
      onChanged: (bool? value) {
        setState(() {
          isChecked = value!;
        });
      },
    );
  }
}
//CHECKBOX WIDGET END

//RADIO WIDGET START
class RadioWidget extends StatefulWidget {
  RadioWidget({Key? key}) : super(key: key);
  // final String title;
  @override
  _RadioWidgetState createState() => _RadioWidgetState();
}

class _RadioWidgetState extends State<RadioWidget> {
  // String CGV = '';
  // int _value = 1;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          // Icon(
          //   Icons.lightbulb_outline,
          //   size: 100,
          //   // color: bulbColor,
          // ),
          Container(
            width: 150,
            child: Row(
              children: <Widget>[
                Radio(
                  value: 1,
                  groupValue: 1,
                  onChanged: (value) {
                    setState(() {
                      // _value = value;
                    });
                  },
                ),
                Text(
                  'Radio 1',
                  style: TextStyle(fontSize: 24),
                )
              ],
            ),
          ),
          Container(
            width: 150,
            child: Row(
              children: <Widget>[
                Radio(
                  value: 2,
                  groupValue: 1,
                  onChanged: (value) {
                    setState(() {
                      // _value = value;
                    });
                  },
                ),
                Text(
                  'Radio 2',
                  style: TextStyle(fontSize: 24),
                )
              ],
            ),
          ),
          Container(
            width: 150,
            child: Row(
              children: <Widget>[
                Radio(
                  value: 3,
                  groupValue: 1,
                  onChanged: (value) {
                    setState(() {
                      // _value = value;
                    });
                  },
                ),
                Text(
                  'Radio 3',
                  style: TextStyle(fontSize: 24),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

//RADIO WIDGET END
//DATE PICKER START
class DatePickerWidget extends StatefulWidget {
  DatePickerWidget({Key? key}) : super(key: key);

  @override
  _DatePickerWidgetState createState() => _DatePickerWidgetState();
}

class _DatePickerWidgetState extends State<DatePickerWidget> {
  DateTime date = DateTime.now();
  Future<Null> selectTimePicker(BuildContext context) async {
    final DateTime picked = (await showDatePicker(
        context: context,
        initialDate: date,
        firstDate: DateTime(1940),
        lastDate: DateTime(2030)))!;

    if (picked != null && picked != date) {
      setState(() {
        date = picked;
        print(date.toString());
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: FlatButton(
          child: Text('Show Date Picker'),
          color: Colors.blue,
          textColor: Colors.white,
          onPressed: () {
            selectTimePicker(context);
          },
        ),
      ),
    );
  }
}
//DATE PICKER END

//TEXT FIELD START
class TextFieldWid extends StatefulWidget {
  TextFieldWid({Key? key}) : super(key: key);

  @override
  _TextFieldWidState createState() => _TextFieldWidState();
}

class _TextFieldWidState extends State<TextField> {
  @override
  Widget build(BuildContext context) {
    return TextField();
  }
}
//TEXT FIELD END

//SLIDER START
class SliderWidget extends StatefulWidget {
  SliderWidget({Key? key}) : super(key: key);

  @override
  _SliderWidgetState createState() => _SliderWidgetState();
}

class _SliderWidgetState extends State<SliderWidget> {
  double _currentSliderValue = 20;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Slider(
        value: _currentSliderValue,
        min: 0,
        max: 100,
        divisions: 5,
        label: _currentSliderValue.round().toString(),
        onChanged: (double value) {
          setState(() {
            _currentSliderValue = value;
          });
        },
      ),
    );
  }
}

//SLIDER END

//SWITCH START
class SwitchWidget extends StatefulWidget {
  SwitchWidget({Key? key}) : super(key: key);

  @override
  _SwitchWidgetState createState() => _SwitchWidgetState();
}

class _SwitchWidgetState extends State<SwitchWidget> {
  bool _lights = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SwitchListTile(
        title: const Text('Lights'),
        value: _lights,
        onChanged: (bool value) {
          setState(() {
            _lights = value;
          });
        },
        secondary: const Icon(Icons.lightbulb_outline),
      ),
    );
  }
}
//SWITCH END

class PartTwo extends StatelessWidget {
  const PartTwo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 1,
      length: 6,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('TabBar Widget'),
          bottom: const TabBar(
            tabs: <Widget>[
              Tab(
                icon: Icon(Icons.cloud_outlined),
              ),
              Tab(
                icon: Icon(Icons.cloud_outlined),
              ),
              Tab(
                icon: Icon(Icons.cloud_outlined),
              ),
              Tab(
                icon: Icon(Icons.cloud_outlined),
              ),
              Tab(
                icon: Icon(Icons.beach_access_sharp),
              ),
              Tab(
                icon: Icon(Icons.brightness_5_sharp),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            Center(
              child: CheckBox(),
            ),
            Center(
              child: TextField(),
              // child: Text("It's rainy here"),
            ),
            Center(
              child: SliderWidget(),
            ),
            Center(
              child: SwitchWidget(),
            ),
            Center(
              child: RadioWidget(),
            ),
            Center(
              child: DatePickerWidget(),
            ),
          ],
        ),
      ),
    );
  }
}

//ROUGH WORK
// class DateTimePickerWidget extends StatefulWidget {
//   DateTimePickerWidget({Key? key}) : super(key: key);

//   @override
//   _DateTimePickerWidgetState createState() => _DateTimePickerWidgetState();
// }

// class _DateTimePickerWidgetState extends State<DateTimePickerWidget> {
//   DateTime _dateTime;
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//        child: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             Text(_dateTime == null ? 'Nothing has been picked yet' : _dateTime.toString()),
//             RaisedButton(
//               child: Text('Pick a date'),
//               onPressed: () {
//                 showDatePicker(
//                   context: context,
//                   initialDate: _dateTime == null ? DateTime.now() : _dateTime,
//                   firstDate: DateTime(2001),
//                   lastDate: DateTime(2021)
//                 ).then((date) {
//                   setState(() {
//                     _dateTime = DateTime(date);
//                   });
//                 });
//               },
//             )
//           ],
//         ),
//     ));
//   }
// }
