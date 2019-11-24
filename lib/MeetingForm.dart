
import 'package:flutter/material.dart';

class MeetingForm extends StatelessWidget {

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("New Meeting")
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          children: <Widget>[

            ListTile(
              title: Text("alo"),
              subtitle: TextFormField(
                validator: (text) {
                  if (text.isEmpty) {
                    return "Título da reunião não pode ser nulo!";
                  } else {
                    return null;
                  }
                },
              ),
            ),
            RaisedButton(
              onPressed: () {
                if (_formKey.currentState.validate()) {
                  print("deu bom");
                } else {
                  print("deu ruim");
                }},
                child: Text('Feito')
            )
          ],
        ),
      ),
    );
  }
}