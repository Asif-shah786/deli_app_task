import 'package:deli_sol_task/custom_Text_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

import '../constants.dart';
import '../model/loginmodel/login_request_model.dart';
import '../services/account/api_service.dart';

class SignInView extends StatefulWidget {
  SignInView({Key? key}) : super(key: key);
  static const routeName = '/signInView';

  @override
  State<SignInView> createState() => _SignInViewState();
}

class _SignInViewState extends State<SignInView> {

  @override
  initState() {
    FlutterNativeSplash.remove();
    super.initState();
    // Add listeners to this class
  }


  bool hidePassword = true;

  final _formKey = GlobalKey<FormState>();

  TextEditingController mailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  void SignIn(BuildContext context){
    print(mailController.text);
    print(passwordController.text);

    // setState(() {
      //   isAPICallProcess = true;
      // });
    {
      LoginRequestModel model = LoginRequestModel(
          email: mailController.text, password: passwordController.text);
      ApiService.login(model).then((response) {
        print(response);
        if (response) {
          Navigator.pushNamedAndRemoveUntil(
              context, "HomePage", (route) => false);
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('ERROR')),
          );
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      appBar: AppBar(),
      resizeToAvoidBottomInset: true,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                  height: 150,
                  width: double.infinity,
                  child: Image.asset('assets/images/sticker.png')),
              const Text('Let\'s Sign you in.',
              style: headline1,),
              const SizedBox(height: 8,),
              const Text('Welcome back\nYou have been missed!', style: normalText,),
              const SizedBox(height: 16,),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        isDense: true,
                        filled: true,
                        fillColor: Colors.grey.shade100,
                        border: const OutlineInputBorder(),
                        focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black38,),
                        ),
                        labelText: 'Email',
                        labelStyle: const TextStyle(color: Colors.black38),
                        hintText: 'ns991989@gmail.com',
                        helperText: 'Email help',
                      ),
                    ),
                    TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        isDense: true,
                        filled: true,
                        fillColor: Colors.grey.shade100,
                        border: null,
                        focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black38,),
                        ),
                        hintText: 'Password',
                        helperText: 'Password help',
                        suffixIcon: const Icon(Icons.remove_red_eye, color: Colors.black38,size: 30,),
                      ),
                    ),
                  ],
                ),
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(onPressed: (){}, style: TextButton.styleFrom(
                    minimumSize: Size.zero,
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  primary: Colors.black87,
                  ), child: const Text('Recover Password'),),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Don\'t have an account?',
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                            color: Colors.black,)
                    ),
                    TextButton(onPressed: (){},
                    style: TextButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 4),
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    ), child: const Text(
                    'Sign Up',style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                      color: appColor,),
              ),
              ),
                  ],
                ),
                  CustomTextButton(title : 'Sign in', color: appColor, onPressed: () => SignIn(context) , borderRadius: 16,),
                ],
              )
            ],
          ),
        ),
      ),
    ));
  }

  bool validateAndSave() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      return true;
    } else {
      return false;
    }
  }
}
