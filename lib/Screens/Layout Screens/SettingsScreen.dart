// ignore_for_file: sized_box_for_whitespace, unnecessary_string_interpolations, non_constant_identifier_names, file_names

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:icon_broken/icon_broken.dart';
import 'package:social_app/BloCs%20and%20Cubits/App%20Cubit/app_cubit.dart';
import 'package:social_app/Design/Colors.dart';
import 'package:social_app/Models/User%20Model.dart';
import 'package:social_app/Screens/NewPostScreen.dart';
import 'package:social_app/Screens/editScreen.dart';
import 'package:social_app/Shared/Components.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppState>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = AppCubit.get(context);
        var temp_model = cubit.model;
        return ConditionalBuilder(
            condition: temp_model==null, 
            builder: (context) => mainProgressIndicator(), 
            fallback: (context) {
              UserModel model = cubit.model!; 
              return Padding(
              padding: const EdgeInsets.all(16.0),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      height: 220,
                      width: double.infinity,
                      child: Stack(
                        alignment: AlignmentDirectional.topCenter,
                        children: [
                          Container(
                            height: 180,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
                              image: DecorationImage(
                                image: NetworkImage(model.coverPicture),
                                fit: BoxFit.cover
                                )
                            ),
                          ),
                          Align(
                            alignment: AlignmentDirectional.bottomCenter,
                            child: CircleAvatar(
                              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                              radius: 66,
                              child: CircleAvatar(
                                radius: 60,
                                backgroundColor: mainColor,
                                backgroundImage: NetworkImage(model.profilePicture),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(height: 15,),
                    Text(model.name,style: Theme.of(context).textTheme.bodyMedium,),
                    const SizedBox(height: 12,),
                    Text(model.bio, style: const TextStyle(color: Colors.grey,fontSize: 16),),
                    const SizedBox(height: 14,),
                    Row(
                      children: [
                        Expanded(
                          child: InkWell(
                            onTap: () {
                            
                          },
                            child: Card(
                              elevation: 6,
                              child: Container(
                                height: 80,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                  Text("324",style: Theme.of(context).textTheme.bodyMedium,),
                                  Text("Posts",style: Theme.of(context).textTheme.bodySmall!.copyWith(color: Colors.grey),),
                                ]),
                              ),
                            ),
                          )
                        ),
                        Expanded(
                          child: InkWell(
                            onTap: () {
                            
                          },
                            child: Card(
                              elevation: 6,
                              child: Container(
                                height: 80,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                  Text("38",style: Theme.of(context).textTheme.bodyMedium,),
                                  Text("Followers",style: Theme.of(context).textTheme.bodySmall!.copyWith(color: Colors.grey),),
                                ]),
                              ),
                            ),
                          )
                        ),
                        Expanded(
                          child: InkWell(
                            onTap: () {
                            
                          },
                            child: Card(
                              elevation: 6,
                              child: Container(
                                height: 80,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                  Text("46",style: Theme.of(context).textTheme.bodyMedium,),
                                  Text("Following",style: Theme.of(context).textTheme.bodySmall!.copyWith(color: Colors.grey),),
                                ]),
                              ),
                            ),
                          )
                        ),
                      ],
                    ),
                    const SizedBox(height: 16,),
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            height: 50,
                            child: OutlinedButton(
                              onPressed: () {
                                navigateTo(context: context, destination: NewPostScreen());
                              }, 
                              child: const Text("Add Post",style: TextStyle(color: mainColor,),)),
                          ),
                        ),
                        const SizedBox(width: 6,),
                        Container(
                          height: 50,
                          width: 80,
                          child: OutlinedButton(
                            onPressed: () {
                              navigateTo(context: context, destination: EditScreen());
                            }, 
                            child: const Icon(IconBroken.Edit,color: mainColor,)),
                        ),
                      ],
                    ),
                    const SizedBox(height: 6,),
                    Row(
                      children: [
                        Expanded(child: Container(height: 50,child: OutlinedButton(child: const Text("Sign Out",style: TextStyle(color: mainColor,),),onPressed: () {
                          cubit.SignOut(context);
                          cubit.model=null;
                        },),))
                      ],
                    )
                  ],
                ),
              ),
            );
            });
      },
    );
  }
}
