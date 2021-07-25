import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({ Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _showPassword = false;

  void _toggle(){
    setState(() {
      _showPassword = !_showPassword;
    });
  }

  final formkey = GlobalKey<FormState>();
  final scaffoldkey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green.shade50,
      key: scaffoldkey,
      appBar: AppBar(
        title: Text("Login Page",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: Colors.white),),
        centerTitle: true,
        backgroundColor: Colors.greenAccent,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Form(
            key: formkey,
            child: Column(
              children: [
                SizedBox(height: 100,),
                TextFormField(
                  decoration: InputDecoration(hintText: "Name", labelText: "Name", prefixIcon:Icon(Icons.person),
                      border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(50)))),
                  validator: (value){
                    if(value!.isEmpty){
                      return "Name Required";
                    }
                  },
                  onSaved: (value){},
                ),
                SizedBox(height: 30,),
                TextFormField(
                  obscureText: !_showPassword,
                  decoration: InputDecoration(hintText: "Password",labelText: "Password", prefixIcon: Icon(Icons.lock),
                      suffixIcon: GestureDetector(
                        onTap: (){
                          _toggle();
                        },
                        child: Icon(Icons.remove_red_eye),
                      ),
                      border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(50)))),
                  validator: (value){
                    if(value!.isEmpty){
                      return "Password Required";
                    }
                  },
                  onSaved: (value){},
                ),

                SizedBox(height: 50,),

                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.greenAccent
                  ),
                    onPressed: (){
                    if(formkey.currentState!.validate()){
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text("Sign In"),
                            actions: [
                              Text("Are you sure you want to sign in ?"),
                              Row(
                                children: [
                                  TextButton(onPressed: (){
                                    formkey.currentState!.save();
                                    scaffoldkey.currentState!.showSnackBar (
                                          SnackBar(content: Text("Your Successfully login"),duration: Duration(seconds: 4),));
                                    Navigator.of(context).pop();
                                    },
                                      child: Text("Ok")),

                                  TextButton(onPressed: (){
                                    Navigator.of(context).pop();
                                  },
                                      child: Text("Cancel")),
                                ],
                              ),


                            ],
                          );
                        },
                      );


                    }
                    },
                    child: Text("Login")
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}


