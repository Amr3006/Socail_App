// ignore_for_file: sized_box_for_whitespace, must_be_immutable, file_names

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:icon_broken/icon_broken.dart';
import 'package:social_app/BloCs%20and%20Cubits/App%20Cubit/app_cubit.dart';
import 'package:social_app/Design/Colors.dart';
import 'package:social_app/Models/User%20Model.dart';
import 'package:social_app/Shared/Components.dart';

class EditScreen extends StatelessWidget {
  var nameControlleer = TextEditingController();
  var bioControlleer = TextEditingController();
  var phoneControlleer = TextEditingController();
  var formKey = GlobalKey<FormState>();

  EditScreen({super.key});

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
            nameControlleer.text = model.name;
            phoneControlleer.text = model.phone;
            bioControlleer.text = model.bio;
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
                        if (formKey.currentState!.validate()&&cubit.update) {
                          cubit.updateUser(
                              context: context,
                              bio: bioControlleer.text,
                              name: nameControlleer.text,
                              phone: phoneControlleer.text,
                              email: model.email,
                              uId: model.uId);
                        }
                      },
                      child: const Text(
                        "UPDATE",
                        style: TextStyle(
                            color: mainColor, fontWeight: FontWeight.bold),
                      ),
                      ),
                  const SizedBox(
                    width: 10,
                  ),
                ],
              ),
              body: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Form(
                  key: formKey,
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Column(children: [
                      if (state is loadingChangeProfilePictureState ||
                          state is loadingChangeCoverPictureState)
                        const LinearProgressIndicator(
                          color: mainColor,
                          backgroundColor: secondaryColor,
                        ),
                      if (state is loadingChangeProfilePictureState ||
                          state is loadingChangeCoverPictureState)
                        const SizedBox(
                          height: 20,
                        ),
                      Container(
                        height: 220,
                        width: double.infinity,
                        child: Stack(
                          alignment: AlignmentDirectional.topCenter,
                          children: [
                            Stack(
                                alignment: AlignmentDirectional.bottomEnd,
                                children: [
                                  Container(
                                    height: 180,
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            const BorderRadius.vertical(
                                                top: Radius.circular(12)),
                                        image: DecorationImage(
                                            image: cubit.coverPic == null
                                                ? NetworkImage(
                                                    model.coverPicture)
                                                : FileImage(cubit.coverPic!)
                                                    as ImageProvider,
                                            fit: BoxFit.cover)),
                                  ),
                                  IconButton(
                                      onPressed: () {
                                        cubit.changeCoverPicture();
                                      },
                                      icon: const CircleAvatar(
                                        backgroundColor: mainColor,
                                        child: Icon(
                                          IconBroken.Camera,
                                          color: Colors.white,
                                          size: 22,
                                        ),
                                      )),
                                ]),
                            Align(
                              alignment: AlignmentDirectional.bottomCenter,
                              child: Stack(
                                  alignment: AlignmentDirectional.bottomEnd,
                                  children: [
                                    CircleAvatar(
                                      backgroundColor: Theme.of(context)
                                          .scaffoldBackgroundColor,
                                      radius: 66,
                                      child: CircleAvatar(
                                        radius: 60,
                                        backgroundColor: mainColor,
                                        backgroundImage:
                                            cubit.profilePic == null
                                                ? NetworkImage(
                                                    model.profilePicture)
                                                : FileImage(cubit.profilePic!)
                                                    as ImageProvider,
                                      ),
                                    ),
                                    IconButton(
                                        onPressed: () {
                                          cubit.changeProfilePicture();
                                        },
                                        icon: const CircleAvatar(
                                          backgroundColor: mainColor,
                                          child: Icon(
                                            IconBroken.Camera,
                                            color: Colors.white,
                                            size: 22,
                                          ),
                                        )),
                                  ]),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      mainTextField(
                          controller: nameControlleer,
                          onEdit: (value) {
                            model.name = nameControlleer.text;
                          },
                          inputType: TextInputType.text,
                          context: context,
                          labelText: "Name",
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Enter Your Name Please";
                            }
                            return null;
                          },
                          prefixIcon: IconBroken.User),
                      const SizedBox(
                        height: 20,
                      ),
                      mainTextField(
                          controller: phoneControlleer,
                          onEdit: (value) {
                            model.phone = phoneControlleer.text;
                          },
                          inputType: TextInputType.phone,
                          context: context,
                          labelText: "Phone",
                          prefixIcon: IconBroken.User,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Enter Your Name Please";
                            }
                            return null;
                          }),
                      const SizedBox(
                        height: 20,
                      ),
                      mainTextField(
                          controller: bioControlleer,
                          onEdit: (value) {
                            model.bio = bioControlleer.text;
                          },
                          inputType: TextInputType.text,
                          context: context,
                          labelText: "Bio",
                          prefixIcon: IconBroken.User,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Enter Your Name Bio";
                            }
                            return null;
                          }),
                    ]),
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
