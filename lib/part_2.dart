import 'package:flutter/material.dart';



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



class RadioWidget extends StatefulWidget {
  RadioWidget({Key? key}) : super(key: key);
  
  @override
  _RadioWidgetState createState() => _RadioWidgetState();
}

class _RadioWidgetState extends State<RadioWidget> {
  
  
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          
          
          
          
          
          Container(
            width: 150,
            child: Row(
              children: <Widget>[
                Radio(
                  value: 1,
                  groupValue: 1,
                  onChanged: (value) {
                    setState(() {
                      
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
                icon: Icon(Icons.check_box),
              ),
              Tab(
                icon: Icon(Icons.text_fields),
              ),
              Tab(
                icon: Icon(Icons.slideshow),
              ),
              Tab(
                icon: Icon(Icons.cached ),
              ),
              Tab(
                icon: Icon(Icons.adjust),
              ),
              Tab(
                icon: Icon(Icons.date_range),
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
