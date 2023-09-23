// ignore_for_file: file_names

import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Design/Colors.dart';

Widget reusableTextField({
required TextEditingController controller,
required TextInputType inputType,
String? hintText,
String? labelText,
IconData? prefixIcon,
IconData? suffixIcon,
bool obscured = false,
void Function()? suffixFunction,
String? Function(String?)? validator,
void Function(String)? onEdit
}) => TextFormField(
validator: validator,
controller: controller,
cursorColor: mainColor,
obscureText: obscured,
keyboardType: inputType,
onChanged: onEdit,
style: TextStyle(
    color: Colors.white.withOpacity(0.8),
    fontWeight: FontWeight.bold
),
decoration: InputDecoration(
  contentPadding: const EdgeInsets.symmetric(horizontal: 100,vertical: 20),
  fillColor: Colors.white.withOpacity(0.3),
  filled: true,
  border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(20),
      borderSide: const BorderSide(color: mainColor)
  ),
  hintText: hintText,
  labelText: labelText,
  labelStyle: TextStyle(
      color: Colors.white.withOpacity(0.6),
      fontWeight: FontWeight.bold
  ),
  hintStyle: TextStyle(
      color: Colors.white.withOpacity(0.6),
      fontWeight: FontWeight.bold
  ),
  prefixIcon: prefixIcon==null ? null : Padding(
    padding: const EdgeInsets.symmetric(horizontal: 16.0),
    child: Icon(prefixIcon,),
  ),
  prefixIconColor: Colors.white.withOpacity(0.8),
  suffixIcon: suffixIcon==null ? null : IconButton(icon: Icon(suffixIcon), onPressed: suffixFunction,padding: const EdgeInsets.symmetric(horizontal: 20),),
  suffixIconColor: Colors.white.withOpacity(0.8),
  focusColor: mainColor,
  hoverColor: mainColor,
  focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(40),
      borderSide: const BorderSide(color: mainColor)
  ),
),
);

Widget mainTextField({
required BuildContext context,
required TextEditingController controller,
required TextInputType inputType,
String? hintText,
String? labelText,
IconData? prefixIcon,
IconData? suffixIcon,
int maxLines=1,
bool obscured = false,
void Function()? suffixFunction,
String? Function(String?)? validator,
void Function(String)? onEdit
}) => TextFormField(
validator: validator,
controller: controller,
cursorColor: mainColor,
obscureText: obscured,
keyboardType: inputType,
maxLines: maxLines,
minLines: 1,
onChanged: onEdit,
style: Theme.of(context).textTheme.bodyMedium,
decoration: InputDecoration(
  floatingLabelStyle: const TextStyle(color: mainColor),
  contentPadding: const EdgeInsets.symmetric(horizontal: 30,vertical: 20),
  border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(20),
      borderSide: const BorderSide(color: mainColor)
  ),
  hintText: hintText,
  labelText: labelText,
  prefixIcon: prefixIcon==null ? null : Padding(
    padding: const EdgeInsets.symmetric(horizontal: 16.0),
    child: Icon(prefixIcon,),
  ),
  prefixIconColor: Colors.black,
  suffixIcon: suffixIcon==null ? null : IconButton(icon: Icon(suffixIcon), onPressed: suffixFunction,padding: const EdgeInsets.symmetric(horizontal: 20),),
  suffixIconColor: Colors.black,
  focusColor: mainColor,
  hoverColor: mainColor,
  focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(40),
      borderSide: const BorderSide(color: mainColor)
  ),
),
);

void navigateTo({
required BuildContext context,
required Widget destination,
}) {
Navigator.push(context, MaterialPageRoute(builder: (context) => destination));
}

void navigateToAndErase({
required BuildContext context,
required Widget destination,
}) {
Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => destination));
}

void snackBar({
required BuildContext context,
required String text
}) => ScaffoldMessenger.of(context).showSnackBar(SnackBar(
content: Row(
                children: [
                  Expanded(
                      child: Text(
                    text,
                    overflow: TextOverflow.ellipsis,
                  )),
                  TextButton(
                      onPressed: () {
                        ScaffoldMessenger.of(context).clearSnackBars();
                      },
                      child: const Text("Dismiss",
                          style: TextStyle(color: Colors.orangeAccent)))
                ],
              )
));

Widget myDivider(double padding) => Padding(
                        padding: EdgeInsets.symmetric(vertical: padding),
                        child: Container(
                          width: double.infinity,
                          height: 1,
                          color: Colors.grey[300],
                        ),
                      );

Widget mainProgressIndicator() {
  if (Platform.isIOS) {
    return const Center(child: CupertinoActivityIndicator(radius: 16,),);
  }

  return const Center(child: CircularProgressIndicator(color: mainColor,),);
}
