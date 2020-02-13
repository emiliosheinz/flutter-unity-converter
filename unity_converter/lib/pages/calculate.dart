import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:unity_converter/models/unit.dart';

class CalculatePage extends StatefulWidget {
  final List<UnitModel> availableUnities;
  final String image;
  final Color appBarColor;

  CalculatePage(
      {@required this.availableUnities,
      @required this.image,
      @required this.appBarColor});

  @override
  _CalculatePageState createState() => _CalculatePageState();
}

class _CalculatePageState extends State<CalculatePage> {
  double selectedInputOption;
  double selectedOutputOption;
  double inputValue;
  TextEditingController outputFieldController = new TextEditingController();

  @override
  void initState() {
    super.initState();

    outputFieldController.text =
        widget.availableUnities[1].conversion.toString();

    setState(() {
      selectedInputOption = widget.availableUnities[0].conversion;
      selectedOutputOption = widget.availableUnities[1].conversion;
    });
  }

  _getDropDownItems() {
    return widget.availableUnities.map<DropdownMenuItem<double>>(
      (UnitModel value) {
        return DropdownMenuItem<double>(
          value: value.conversion,
          child: Text(value.name),
        );
      },
    ).toList();
  }

  _renderInputFields() {
    return Column(
      children: <Widget>[
        TextFormField(
          onChanged: (String newValue) {
            setState(() {
              inputValue = double.parse(newValue);
            });
          },
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            labelText: 'Input',
            labelStyle: TextStyle(color: Colors.black),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.black,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.grey,
              ),
            ),
          ),
        ),
        DropdownButtonFormField(
          isExpanded: true,
          value: selectedInputOption,
          icon: Icon(Icons.arrow_drop_down),
          onChanged: (double newValue) {
            setState(() {
              selectedInputOption = newValue;
            });
          },
          items: _getDropDownItems(),
        )
      ],
    );
  }

  _renderOutputFields() {
    return Column(
      children: <Widget>[
        TextFormField(
          enabled: false,
          controller: outputFieldController,
          decoration: InputDecoration(
            labelText: 'Output',
            labelStyle: TextStyle(color: Colors.black),
            disabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.grey,
              ),
            ),
          ),
        ),
        DropdownButtonFormField(
          isExpanded: true,
          value: selectedOutputOption,
          icon: Icon(Icons.arrow_drop_down),
          onChanged: (double newValue) {
            setState(() {
              selectedOutputOption = newValue;
            });
          },
          items: _getDropDownItems(),
        )
      ],
    );
  }

  _renderForm() {
    return Form(
      child: Column(
        children: <Widget>[
          _renderInputFields(),
          SizedBox(
            height: 20,
          ),
          Icon(
            Icons.compare_arrows,
            size: 50,
          ),
          SizedBox(
            height: 10,
          ),
          _renderOutputFields(),
          SizedBox(
            height: 60,
          ),
          SizedBox(
            height: 60,
            width: double.infinity,
            child: CupertinoButton(
              onPressed: () {
                outputFieldController.text =
                    ((selectedOutputOption * inputValue) / selectedInputOption)
                        .toString();
              },
              color: widget.appBarColor,
              child: Text(
                'CALCULAR',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Teste'.toUpperCase(),
          style: TextStyle(),
        ),
        backgroundColor: widget.appBarColor,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: EdgeInsets.only(top: 60, left: 30, right: 30, bottom: 30),
            child: Column(
              children: <Widget>[
                Hero(
                  tag: widget.image,
                  child: SizedBox(
                    height: 120,
                    width: 120,
                    child: Image.asset('assets/icons/${widget.image}.png'),
                  ),
                ),
                SizedBox(height: 50),
                _renderForm(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
