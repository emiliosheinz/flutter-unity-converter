import 'package:flutter/material.dart';

class CalculatePage extends StatelessWidget {
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
              SizedBox(height: 20),
              Form(
                child: Column(
                  children: <Widget>[
                    TextFormField(
                      decoration: InputDecoration(hintText: 'Input'),
                    ),
                    DropdownButtonFormField(),
                    SizedBox(
                      height: 20,
                    ),
                    Icon(
                      Icons.compare_arrows,
                      size: 50,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      decoration: InputDecoration(hintText: 'Output'),
                    ),
                    DropdownButtonFormField(),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
