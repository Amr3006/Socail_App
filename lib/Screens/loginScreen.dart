// ignore_for_file: file_names

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/BloCs%20and%20Cubits/Login%20Cubit/login_cubit.dart';
import 'package:social_app/Screens/registerScreen.dart';
import 'package:social_app/Shared/Components.dart';

// ignore: must_be_immutable
class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
  create: (context) => LoginCubit(),
  child: BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is failedLoginState) {
              snackBar(context: context, text: state.error);
            } 
      },
      builder: (context, state) {
        LoginCubit cubit = LoginCubit.get(context);
        return Scaffold(
            body: Container(
              height: double.infinity,
              width: double.infinity,
              decoration: const BoxDecoration(
                  gradient: LinearGradient(
                      colors: [
                        Color(0xff351be7),
                        Color(0xffb245e8),
                        Color(0xffc52846)
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight
                  )
              ),
              child: ConditionalBuilder(
                condition: state is! loadingLoginState,
                builder: (context) => SafeArea(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Form(
                    key: formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "LOGIN",
                          style: TextStyle(
                              color: Colors.white.withOpacity(0.9),
                              fontSize: 60,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                        const SizedBox(height: 20,),
                        reusableTextField(
                            controller: emailController,
                            inputType: TextInputType.emailAddress,
                            hintText: "EMAIL",
                            prefixIcon: Icons.person,
                          validator: (value) {
                            if (value!.isEmpty) {
                            return "Please Enter Your Email";
                            }
                            return null;
                            }
                                  ),
                        const SizedBox(height: 20,),
                        reusableTextField(
                            controller: passwordController,
                            inputType: TextInputType.text,
                            hintText: "PASSWORD",
                            prefixIcon: Icons.lock,
                            obscured: cubit.obscurity,
                            suffixIcon: Icons.remove_red_eye,
                            suffixFunction: () {
                              cubit.changeObscurity();
                            },
                          validator: (value) {
                              if (value!.isEmpty) {
                                return "Please Enter Your Password";
                              }
                              return null;
                          }
                        ),
                        const SizedBox(height: 30,),
                        TextButton(
                          child: Container(
                            alignment: Alignment.center,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: Colors.deepOrangeAccent.withOpacity(0.8),
                            ),
                            child: const Padding(
                              padding: EdgeInsets.all(12.0),
                              child: Text(
                                  "LOGIN",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold
                                ),
                              ),
                            ),
                          ),
                          onPressed: (){
                            if (formKey.currentState!.validate()) {
                              cubit.Login(email: emailController.text, password: passwordController.text,context: context);
                            }
                          },
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text("Need an account?",style: TextStyle(color: Colors.white),),
                            TextButton(onPressed: (){
                              navigateTo(context: context, destination: RegisterScreen());
                            }, child: Text("Register Now!",style: TextStyle(color: Colors.orangeAccent[100]),))
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
                fallback: (context) => const Center(child: CircularProgressIndicator(color: Colors.white,)) ,
              )
            ));
      },
    ),
);
  }
}
