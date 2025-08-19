import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:text_me/services/auth_services.dart';
import 'package:text_me/components/Custom_button.dart';
import 'package:text_me/components/custom_textField.dart';
import 'package:text_me/pages/home_page.dart';
import 'package:text_me/pages/register_page.dart';

 class LoginPage extends StatefulWidget{
  
  LoginPage({super.key});

static final String routName = 'LoginPage';

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController usernameController = TextEditingController();

final TextEditingController emailController = TextEditingController();

final TextEditingController passwordController = TextEditingController();

//login methode
void login(BuildContext context)async {
    final authServices = AuthServices();

    //try login 
    try{
 await authServices.signInWithEmailAndPassword(emailController.text.trim(), passwordController.text, context);
      //if login is successful, navigate to home page
      Navigator.pushReplacementNamed(context, HomePage.routName);

    }
    //catch error
    catch(e){
      // ignore: use_build_context_synchronously
      showDialog(context:context,
      builder:(context)=>AlertDialog(
        title: Text(e.toString()),
      )
      );
    }
  }

  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      
        backgroundColor: Theme.of(context).colorScheme.surface,
        body: 
          
             Padding(
               padding: const EdgeInsets.only(top: 150 ),
               child:  SingleChildScrollView(
                 child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                   
                    //logo
                    children: [
                      SingleChildScrollView(
                        child: Column(
                          children: [
                            
                          ],
                        ),
                      ),
                      Icon(Icons.message,
                        size: 100,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                      Gap(50),
                      //welcome back massage
                    Text('Welcome Back',
                      style: TextStyle(
                        fontSize: 24,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                      Gap(20),
                      
                     // pw text field
                    CustomTextfield(
                      hintText: 'Enter your email',
                      focusNode: FocusNode(),
                      obscureText: false, 
                      controller: emailController,
                    ),
                    Gap(10),
                    CustomTextfield(
                      focusNode: FocusNode(),
                      hintText: 'Enter password',
                      obscureText: true,
                      controller: passwordController,
                    ),
                    Gap(20),
                    //loginButton
                    CustomButton(
                      text: 'L O G I N',
                      onTap: () => login(context), // Call the login method
                    ),
                             
                    Gap(20),
                             
                     //register
                     Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Don\'t have an account?',
                          style: TextStyle(
                            
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.pushNamed(context, RegisterPage.routName);
                          },
                          child: Text('Register Now',
                            style: TextStyle(
                              
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                     ),
                    ],
                               
                    
                    
                               
                               
                               
                               
                               ),
               ),
                 
               
             ),
          
        
    );
  }
}