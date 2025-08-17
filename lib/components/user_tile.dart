import 'package:flutter/material.dart';

class UserTile extends StatelessWidget {
  const UserTile({super.key, required this.text,required this.onTap});

final String text ;
final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color:Theme.of( context).colorScheme.secondary,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            //user icon
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(
                Icons.person,
                
              ),
            ),

            //user name
            Text(
              text,
              
            ),
          ],
        ),
      ),
    );
  }
}