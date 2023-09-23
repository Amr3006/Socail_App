// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, prefer_const_literals_to_create_immutables, must_be_immutable, unused_local_variable, non_constant_identifier_names, file_names

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:icon_broken/icon_broken.dart';
import 'package:social_app/BloCs%20and%20Cubits/App%20Cubit/app_cubit.dart';
import 'package:social_app/Design/Colors.dart';
import 'package:social_app/Models/Message%20Model.dart';
import 'package:social_app/Models/User%20Model.dart';
import 'package:social_app/Shared/Components.dart';
import 'package:social_app/Shared/Variables%20and%20Constants.dart';

class DetailedChatScreen extends StatelessWidget {
  final UserModel model;
  var textController = TextEditingController();

  DetailedChatScreen(this.model, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(IconBroken.Arrow___Left_2),
        ),
        title: Row(
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage(model.profilePicture),
              radius: 24,
            ),
            const SizedBox(
              width: 16,
            ),
            Text(
              model.name,
              style: Theme.of(context).textTheme.bodyMedium,
            )
          ],
        ),
      ),
      body: Builder(
        builder: (context) {
          AppCubit.get(context).getMessages(model.uId);
          return BlocConsumer<AppCubit, AppState>(
            listener: (context, state) {},
            builder: (context, state) {
              List<MessageModel> message = AppCubit.get(context).messages;
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: Column(
                  children: [
                    SizedBox(height: 30,),
                    Expanded(
                      child: ConditionalBuilder(
                        condition: message.isNotEmpty,
                        fallback: (context) {
                          if (AppCubit.get(context).nomessages) {
                            return Center(child :Text("Start Your Chat Now"));
                          }
                          return mainProgressIndicator();
                        },
                        builder: (context) => Column(
                          children: [
                            Expanded(
                                  child: ListView.separated(
                                    physics: BouncingScrollPhysics(),
                                    itemBuilder: (context,index) {
                                      MessageModel currentModel = message[index];
                                      if (uId==currentModel.senderUId) {
                                        return MyMessage(currentModel);
                                      }
                                      return YourMessage(currentModel);
                                    },
                                    itemCount: message.length,
                                    separatorBuilder: (context, index) => SizedBox(height: 12,),),
                                ),
                          ],
                        ),
                      ),
                    ),
                    SafeArea(
                          child: Container(
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            decoration: BoxDecoration(
                                color: Colors.grey.withOpacity(0.1),
                                borderRadius: BorderRadius.circular(12)),
                            child: Row(
                              children: [
                                Expanded(
                                  child: TextFormField(
                                    controller: textController,
                                    minLines: 1,
                                    keyboardType: TextInputType.text,
                                    cursorColor: mainColor,
                                    decoration: InputDecoration(
                                      hintText: "Write Your Message Here...",
                                      contentPadding: EdgeInsetsDirectional.symmetric(
                                          horizontal: 14),
                                      border: InputBorder.none,
                                    ),
                                  ),
                                ),
                                MaterialButton(
                                  elevation: 12,
                                  onPressed: () {
                                    AppCubit.get(context).sendMessage(
                                        reciever_uId: model.uId,
                                        message: textController.text);
                                    textController.text = "";
                                  },
                                  color: mainColor,
                                  minWidth: 1,
                                  height: 50,
                                  child: Icon(
                                    IconBroken.Send,
                                    color: Colors.white,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 16,),
                  ],
                ),
              );
            },
          );
        }
      ),
    );
  }

    Widget YourMessage(MessageModel model) => Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                color: Colors.grey.withOpacity(0.3),
                                borderRadius: BorderRadiusDirectional.only(
                                  bottomEnd: Radius.circular(12),
                                  topEnd: Radius.circular(12),
                                  topStart: Radius.circular(12),
                                )),
                            child: Text(model.text),
                          )
                        ],
                      );

    Widget MyMessage(MessageModel model) => Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                color: mainColor.withOpacity(0.3),
                                borderRadius: BorderRadiusDirectional.only(
                                  bottomStart: Radius.circular(12),
                                  topEnd: Radius.circular(12),
                                  topStart: Radius.circular(12),
                                )),
                            child: Text(model.text),
                          )
                        ],
                      );
}
