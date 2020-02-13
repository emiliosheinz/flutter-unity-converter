import 'package:flutter/material.dart';

class CalculatePage extends StatelessWidget {
  _renderInputFields() {
    return Column(
      children: <Widget>[
        TextFormField(
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
        DropdownButtonFormField()
      ],
    );
  }

  _renderOutputFields() {
    return Column(
      children: <Widget>[
        TextFormField(
          decoration: InputDecoration(
            labelText: 'Output',
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
        DropdownButtonFormField(),
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
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Teste'.toUpperCase(), style: TextStyle()),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.only(top: 60, left: 30, right: 30, bottom: 30),
          child: Column(
            children: <Widget>[
              Hero(
                tag: 'area',
                child: SizedBox(
                  height: 120,
                  width: 120,
                  child: Image.asset('assets/icons/area.png'),
                ),
              ),
              SizedBox(height: 50),
              _renderForm(),
            ],
          ),
        ),
      ),
    );
  }
}
