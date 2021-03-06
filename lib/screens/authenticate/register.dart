import 'package:airweather/services/auth.dart';
import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  final Function toggleView;
  Register({this.toggleView});

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final _formKey = GlobalKey<FormState>();

  final AuthService _auth = AuthService();
  String email= '';
  String password= '';
  String error = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[100],
      appBar: AppBar(
        backgroundColor: Colors.brown[400],
        elevation: 0.0,
        title: Text("Sign up to Brew Crew"),
        actions: [
          FlatButton.icon(onPressed: (){
            widget.toggleView();
          }, icon: Icon(Icons.person), label: Text("Sign In"))
        ],
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 50),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              SizedBox(height: 20),
              TextFormField(
                validator: (val)=> val.isEmpty ? 'Enter an Email' : null,
                onChanged: (val) {
                  setState(() => email = val);

                },
              ),
              SizedBox(height: 20),
              TextFormField(
                obscureText: true,
                validator: (val)=> val.length < 6 ? 'Enter a password 6+ char' : null,
                onChanged: (val){
                  setState(() => password = val);

                },
              ),
              SizedBox(height: 20),
              RaisedButton(onPressed: () async {
                if(_formKey.currentState.validate()){
                  dynamic result = await _auth.registerWithEmailAndPassword(email, password);
                  if(result == null){
                    setState(() => error = 'Please Enter valid email');

                  }
                }
              },
                color: Colors.pink[400],
                child: Text(
                  "Sign Up",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              SizedBox(height: 12,),
              Text(error, style: TextStyle(
                color: Colors.red,
                  fontSize: 14
              ),)
            ],
          ),
        ),
      ),
    );
  }
}
