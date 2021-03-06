import 'package:airweather/services/auth.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  final Function toggleView;
  SignIn({this.toggleView});

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();

  //text field state
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
        title: Text("Sign in to Brew Crew"),
        actions: [
          FlatButton.icon(onPressed: (){
            widget.toggleView();
          }, icon: Icon(Icons.person), label: Text("Register"))
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
                  dynamic result = await _auth.signInWithEmailAndPassword(email, password);
                  if(result == null){
                    setState(() => error = 'Incorrect Credentials');
                  }
                }
              },
              color: Colors.pink[400],
                child: Text(
                  "Sign In",
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
