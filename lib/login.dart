import 'package:flutter/material.dart';
import 'package:form_validation/mixins/validation_mixin.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> with ValidationMixin {

  final formKey = GlobalKey<FormState>();
  String email="";
  String password="";


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login Validator"),
      ),
      body: ListView(
        children: [
          Center(
            child: Form(
              key: formKey,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [

                      TextFormField(
                        validator:emailValidation ,
                        onSaved: (String value){
                          email=value;
                        },
                        decoration: InputDecoration(
                          hintText: "Email",

                        ),
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          hintText: "Password",

                        ),
                        validator: passwordValidation,
                        onSaved: (String value){
                          password=value;
                        },
                      ),
                      RaisedButton(
                        onPressed: () {
                          if(formKey.currentState.validate()){
                            formKey.currentState.save();
                            print("your data is saved");
                          }
                        },
                        child: Text("Submit"),
                      ),
                      RaisedButton(
                        onPressed: () {

                           
                              formKey.currentState.reset();


                        },
                        child: Text("Reset"),
                      ),


                      SizedBox(height: 50,),
                      Text("Your validated email is :   ${email}"),
                      Text("Your validated password is :   ${password}"),

                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
