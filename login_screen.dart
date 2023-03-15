// ignore_for_file: avoid_print, must_be_immutable, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:udemy_flutter/shared/components/components.dart';

class LoginScreen extends StatefulWidget
{
   LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  bool isPassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: SingleChildScrollView(
            child:Form(
              key: formKey ,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Login',
                    style: TextStyle(
                      fontSize: 40.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 40.0,
                  ),
                  defaultFormField(
                      controller: emailController,
                      type: TextInputType.emailAddress,
                      validate: (String value)
                      {
                       if (value.isEmpty){
                          return 'email must not be empty';
                       }
                       return null;
                      },
                      label: "email",
                      prefix: Icons.email,
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
              defaultFormField(
                controller: passwordController,
                type: TextInputType.visiblePassword,
                label: "Password",
                prefix: Icons.lock,
                suffix: isPassword ? Icons.visibility : Icons.visibility_off,
                isPassword: isPassword,
                suffixPressed:()
                {
                   setState(()
                   {
                    // مش شغالهههههههههههه معايااااااااااااا
                     isPassword = !isPassword;
                   });
                },
                validate: (String value)
                {
                  if (value.isEmpty){
                    return 'Password is too short';
                  }
                  return null;
                },
              ),
                  SizedBox(
                    height: 20.0,
                  ),
                  defaultButton(
                    text: 'login',
                    radius: 15.0,
                    function: ()
                      {
                        if(formKey.currentState!.validate())
                        {
                          print(emailController.text);
                          print(passwordController.text);
                        }

                    },

                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                   children: [
                     Text(
                       'Don\'t have an account?',
                     ),
                     TextButton(
                         onPressed: ()
                         {

                         },
                         child: Text(
                           'Register Now',
                         ),
                     ),
                   ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),

    );
  }
}
