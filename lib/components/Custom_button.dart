import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key,
  required this.text, 
  this.onTap,
  });
  final String text ;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.secondary,
          borderRadius: BorderRadius.circular(8),
        ),
        padding: EdgeInsets.all(19),
        margin: EdgeInsets.symmetric(horizontal:25 ),
        child:Center(
          child: Text(text,style: TextStyle(
            fontWeight: FontWeight.bold,
          ),),
          ),
      ),
    );
  }
}