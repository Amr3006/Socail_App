// ignore_for_file: must_be_immutable, file_names

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:icon_broken/icon_broken.dart';
import 'package:social_app/BloCs%20and%20Cubits/App%20Cubit/app_cubit.dart';
import 'package:social_app/Design/Colors.dart';
import 'package:social_app/Models/User%20Model.dart';
import 'package:social_app/Shared/Components.dart';

class NewPostScreen extends StatelessWidget {
  NewPostScreen({super.key});

  var textController = TextEditingController();

  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppState>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = AppCubit.get(context);
        UserModel? tempmodel = cubit.model;
        return ConditionalBuilder(
          condition: tempmodel != null,
          fallback: (context) => mainProgressIndicator(),
          builder: (context) {
            UserModel model = cubit.model!;
            return Scaffold(
              appBar: AppBar(
                titleSpacing: 0,
                leading: IconButton(
                  icon: const Icon(
                    IconBroken.Arrow___Left,
                    color: Colors.black,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                title: Row(
                  children: [
                    Text(
                      "Social ",
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          fontFamily: "secondary",
                          fontSize: 30,
                          color: mainColor),
                    ),
                    Text(
                      "App ",
                      style: Theme.of(context)
                          .textTheme
                          .bodyLarge!
                          .copyWith(fontFamily: "secondary", fontSize: 30),
                    )
                  ],
                ),
                actions: [
                  TextButton(
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          if (cubit.postPic == null) {
                            cubit.uploadPost(
                                context: context, text: textController.text);
                          } else {
                            cubit.uploadPostImage(
                                text: textController.text, context: context);
                          }
                        }
                      },
                      child: const Text(
                        "POST",
                        style: TextStyle(
                            color: mainColor, fontWeight: FontWeight.bold),
                      )),
                  const SizedBox(
                    width: 10,
                  ),
                ],
              ),
              body: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(children: [
                  if (state is loadingUploadPostPicState ||
                      state is loadingUploadPostState)
                    const LinearProgressIndicator(
                      color: mainColor,
                      backgroundColor: secondaryColor,
                    ),
                  if (state is loadingUploadPostPicState ||
                      state is loadingUploadPostState)
                    const SizedBox(
                      height: 20,
                    ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        radius: 30,
                        backgroundImage: NetworkImage(model.profilePicture),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: Text(
                          model.name,
                          maxLines: 1,
                          style: Theme.of(context).textTheme.bodySmall,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                  Form(
                    key: formKey,
                    child: TextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Please Enter Text";
                        }
                        return null;
                      },
                      controller: textController,
                      maxLines: 6,
                      decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: "Share What's on Your Mind..."),
                    ),
                  ),
                  const Spacer(),
                  if (cubit.postPic != null)
                    Stack(alignment: AlignmentDirectional.topEnd, children: [
                      Container(
                        height: 180,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            image: DecorationImage(
                                image: FileImage(cubit.postPic!),
                                fit: BoxFit.cover)),
                      ),
                      IconButton(
                          onPressed: () {
                            cubit.deletePostPic();
                          },
                          icon: const CircleAvatar(
                            backgroundColor: mainColor,
                            child: Icon(
                              Icons.close_sharp,
                              color: Colors.white,
                              size: 22,
                            ),
                          )),
                    ]),
                  if (cubit.postPic != null)
                    const SizedBox(
                      height: 20,
                    ),
                  Row(
                    children: [
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            cubit.choosePostImage();
                          },
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Add Image",
                                style: TextStyle(color: mainColor),
                              ),
                              SizedBox(
                                width: 8,
                              ),
                              Icon(
                                IconBroken.Image_2,
                                color: mainColor,
                              )
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                          child: InkWell(
                        onTap: () {},
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "#tags",
                              style: TextStyle(color: mainColor),
                            ),
                          ],
                        ),
                      ))
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  )
                ]),
              ),
            );
          },
        );
      },
    );
  }
}
