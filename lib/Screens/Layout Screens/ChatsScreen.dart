// ignore_for_file: file_names, unnecessary_string_interpolations

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/BloCs%20and%20Cubits/App%20Cubit/app_cubit.dart';
import 'package:social_app/Models/User%20Model.dart';
import 'package:social_app/Screens/DetailedChatScreen.dart';
import 'package:social_app/Shared/Components.dart';

class ChatsScreen extends StatelessWidget {
  const ChatsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppState>(
      listener: (context, state) {},
      builder: (context, state) {
        List<UserModel> models = AppCubit.get(context).chats;
        return ConditionalBuilder(
          condition: models.isNotEmpty,
          fallback: (context) => mainProgressIndicator(),
          builder: (context) => ListView.separated(
            itemBuilder: (context, index) => listBuilder(models[index],context), 
            separatorBuilder: (context, index) => myDivider(0), 
            itemCount: models.length),
        );
      },
    );
  }

  Widget listBuilder(
    UserModel model,
    BuildContext context
  ) => Row(
    children: [
      Expanded(
        child: InkWell(
          onTap: () {
            navigateTo(context: context, destination: DetailedChatScreen(model));
          },
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
                    children: [
                      CircleAvatar(
                        radius: 25,
                        backgroundImage: NetworkImage("${model.profilePicture}"),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                          child: Text(
                        "${model.name}",
                        overflow: TextOverflow.ellipsis,
                      ))
                    ],
                  ),
          ),
        ),
      ),
    ],
  );
}
