// ignore_for_file: must_be_immutable, unnecessary_import, file_names

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/BloCs%20and%20Cubits/Login%20Cubit/login_cubit.dart';

import '../Shared/Components.dart';

class RegisterScreen extends StatelessWidget {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var nameController = TextEditingController();
  var phoneController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => LoginCubit(),
        child: BlocConsumer<LoginCubit, LoginState>(
          listener: (context, state) {
            if (state is failedRegisterState) {
              snackBar(context: context, text: state.error);
            } 
            if (state is failedCreateUserState) {
              snackBar(context: context, text: state.error);
            }
          },
          builder: (context, state) {
            LoginCubit cubit = LoginCubit.get(context);
            return Container(
              height: double.infinity,
              width: double.infinity,
              decoration: const BoxDecoration(
                  gradient: LinearGradient(colors: [
                Color(0xff351be7),
                Color(0xffb245e8),
                Color(0xffc52846)
              ], begin: Alignment.topLeft, end: Alignment.bottomRight)),
              child: ConditionalBuilder(
                condition: state is! loadingRegisterState,
                builder: (context) => SafeArea(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Form(
                    key: formKey,
                    child: Center(
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "REGISTER",
                              style: TextStyle(
                                  color: Colors.white.withOpacity(0.9),
                                  fontSize: 60,
                                  fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            reusableTextField(
                                controller: nameController,
                                inputType: TextInputType.text,
                                hintText: "USERNAME",
                                prefixIcon: Icons.person,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "Please Enter Your Name";
                                  }
                                  return null;
                                }),
                                const SizedBox(
                              height: 20,
                            ),
                            reusableTextField(
                                controller: emailController,
                                inputType: TextInputType.emailAddress,
                                hintText: "EMAIL",
                                prefixIcon: Icons.email,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "Please Enter Your Email";
                                  }
                                  return null;
                                }),
                                const SizedBox(
                              height: 20,
                            ),
                                reusableTextField(
                                controller: phoneController,
                                inputType: TextInputType.phone,
                                hintText: "PHONE",
                                prefixIcon: Icons.phone,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "Please Enter Your Phone";
                                  }
                                  return null;
                                }),
                            const SizedBox(
                              height: 20,
                            ),
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
                                }),
                            const SizedBox(
                              height: 30,
                            ),
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
                                    "REGISTER",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 30,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                              onPressed: () {
                                if (formKey.currentState!.validate()) {
                                  cubit.Register(
                                      email: emailController.text,
                                      password: passwordController.text,
                                      context: context,
                                      name: nameController.text,
                                      phone: phoneController.text
                                      );
                                }
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
                fallback: (context) => const Center(child: CircularProgressIndicator(color: Colors.white,),),
              ),
            );
          },
        ),
      ),
    );
  }
}
