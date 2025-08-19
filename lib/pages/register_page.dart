import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:text_me/services/auth_services.dart';
import 'package:text_me/components/Custom_button.dart';
import 'package:text_me/components/custom_textField.dart';
import 'package:text_me/pages/home_page.dart';

class RegisterPage extends StatefulWidget {
  RegisterPage({super.key});

static final  String routName = 'RegisterPage';

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController usernameController = TextEditingController();

final TextEditingController emailController = TextEditingController();

final TextEditingController passwordController = TextEditingController();

final TextEditingController confirmPasswordController = TextEditingController();

//signUp methode
void register(BuildContext context) async{
    final auth = AuthServices();

    // if passwrd match create account
  if(passwordController.text== confirmPasswordController.text){
    try{
   await auth.signUpWithEmailAndPassword(
       emailController.text.trim(), 
        passwordController.text.trim(),
       context,
       
    );
    if(mounted){
Navigator.pushReplacementNamed(context, HomePage.routName);
    }
    
    }catch(e){
showDialog(context:context,
      builder:(context)=>AlertDialog(
        title: Text(e.toString()),
      )
      );
    }
  }else{
showDialog(context:context,
      builder:(context)=>AlertDialog(
        title: Text('Password does not match'),
      )
      );

  }
  }

  @override
  Widget build(BuildContext context) {
    
return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.surface,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 100),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
               
                //logo
                children: [
                  Icon(Icons.message,
                    size: 100,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  Gap(50),
                  //welcome back massage
                Text('create new account',
                  style: TextStyle(
                    fontSize: 24,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
                  Gap(20),
                  CustomTextfield(hintText: 'user name',
                   obscureText: false, 
                   controller: usernameController,
                   focusNode: FocusNode(),
                   ),
                   Gap(10),
                 // pw text field
                CustomTextfield(
                  hintText: 'Enter your email',
                  obscureText: false, 
                  controller: emailController,
                  focusNode: FocusNode(),
                ),
                Gap(10),
                CustomTextfield(
                  hintText: 'Enter password',
                  obscureText: true,
                  controller: passwordController,
                  focusNode: FocusNode(),
                ),
                Gap(10),
                CustomTextfield(
                  hintText: 'Confirm password',
                  obscureText: true,
                  controller: confirmPasswordController,
                  focusNode: FocusNode(),
                ),
                Gap(20),
                //loginButton
                CustomButton(
                  text: 'Register',
                  onTap: () => register(context), // Call the register method
                ),
            
                Gap(20),
            
                 //register
                 Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('allready have an account?',
                      style: TextStyle(
                        
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text('Login Now',
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
        ),
    );


  }
}