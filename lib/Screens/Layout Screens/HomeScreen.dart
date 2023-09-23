// ignore_for_file: sized_box_for_whitespace, prefer_const_constructors, prefer_const_literals_to_create_immutables, duplicate_ignore, unnecessary_string_interpolations, non_constant_identifier_names, file_names, must_be_immutable

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:icon_broken/icon_broken.dart';
import 'package:social_app/BloCs%20and%20Cubits/App%20Cubit/app_cubit.dart';
import 'package:social_app/Design/Colors.dart';
import 'package:social_app/Models/Comment%20User%20Model.dart';
import 'package:social_app/Models/Like%20User%20Model.dart';
import 'package:social_app/Models/Post%20Model.dart';
import 'package:social_app/Models/User%20Model.dart';
import 'package:social_app/Screens/NewPostScreen.dart';
import 'package:social_app/Shared/Components.dart';
import 'package:social_app/Shared/Variables%20and%20Constants.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  var formKey= GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppState>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = AppCubit.get(context);
        var model = cubit.model;
        var posts = cubit.posts;
        return ConditionalBuilder(
          condition: model != null && posts.isNotEmpty,
          fallback: (context) => Column(
            children: [
              InkWell(
                  onTap: () {
                    navigateTo(context: context, destination: NewPostScreen());
                  },
                  child: Card(
                    elevation: 6,
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    margin: const EdgeInsets.all(6),
                    child: Stack(alignment: Alignment.centerRight, children: [
                      const Image(
                        image: NetworkImage(postImage),
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SizedBox(
                              width: 200,
                              child: Text(
                                "Post With Your Friends Now!",
                                style: Theme.of(context).textTheme.titleSmall,
                              )),
                          const SizedBox(
                            width: 6,
                          )
                        ],
                      )
                    ]),
                  ),
                ),
                Expanded(child: mainProgressIndicator())
            ],
          ),
          builder: (context) {
            return SingleChildScrollView(
              child: Column(children: [
                InkWell(
                  onTap: () {
                    navigateTo(context: context, destination: NewPostScreen());
                  },
                  child: Card(
                    elevation: 6,
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    margin: const EdgeInsets.all(6),
                    child: Stack(alignment: Alignment.centerRight, children: [
                      const Image(
                        image: NetworkImage(postImage),
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SizedBox(
                              width: 200,
                              child: Text(
                                "Post With Your Friends Now!",
                                style: Theme.of(context).textTheme.titleSmall,
                              )),
                          const SizedBox(
                            width: 6,
                          )
                        ],
                      )
                    ]),
                  ),
                ),
                ListView.separated(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) =>
                        listBuilder(context, posts[index], model!, index),
                    separatorBuilder: (context, index) => SizedBox(
                          height: 10,
                        ),
                    itemCount: posts.length),
                const SizedBox(
                  height: 12,
                )
              ]),
            );
          },
        );
      },
    );
  }

  Widget listBuilder(
          BuildContext context, postModel post, UserModel model, int index) =>
      Card(
          elevation: 10,
          clipBehavior: Clip.antiAliasWithSaveLayer,
          margin: const EdgeInsets.all(6),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      radius: 30,
                      backgroundImage: NetworkImage(post.profilePic),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Expanded(
                                  child: Text(
                                post.name,
                                style: Theme.of(context).textTheme.bodySmall,
                                overflow: TextOverflow.ellipsis,
                              )),
                              const SizedBox(
                                width: 6,
                              ),
                              const Icon(
                                Icons.check_circle,
                                color: Colors.blue,
                              ),
                            ],
                          ),
                          Text(
                            post.dateTime,
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall!
                                .copyWith(color: Colors.grey, fontSize: 12),
                          )
                        ],
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.more_horiz),
                    )
                  ],
                ),
                myDivider(16),
                Text(
                  post.text,
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                const SizedBox(
                  height: 6,
                ),
                Wrap(
                  children: [
                    Container(
                        height: 30,
                        child: MaterialButton(
                            minWidth: 1,
                            height: 20,
                            padding: const EdgeInsets.symmetric(horizontal: 4),
                            onPressed: () {},
                            child: const Text(
                              "#coding",
                              style: TextStyle(
                                  color: Colors.blue,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  height: 1),
                            ))),
                    Container(
                        height: 30,
                        child: MaterialButton(
                            minWidth: 1,
                            height: 20,
                            padding: const EdgeInsets.symmetric(horizontal: 4),
                            onPressed: () {},
                            child: const Text(
                              "#flutter",
                              style: TextStyle(
                                  color: Colors.blue,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  height: 1),
                            ))),
                    Container(
                        height: 30,
                        child: MaterialButton(
                            minWidth: 1,
                            height: 20,
                            padding: const EdgeInsets.symmetric(horizontal: 4),
                            onPressed: () {},
                            child: const Text(
                              "#dart",
                              style: TextStyle(
                                  color: Colors.blue,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  height: 1),
                            ))),
                    Container(
                        height: 30,
                        child: MaterialButton(
                            minWidth: 1,
                            height: 20,
                            padding: const EdgeInsets.symmetric(horizontal: 4),
                            onPressed: () {},
                            child: const Text(
                              "#android",
                              style: TextStyle(
                                  color: Colors.blue,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  height: 1),
                            ))),
                    Container(
                        height: 30,
                        child: MaterialButton(
                            minWidth: 1,
                            height: 20,
                            padding: const EdgeInsets.symmetric(horizontal: 4),
                            onPressed: () {},
                            child: const Text(
                              "#ios",
                              style: TextStyle(
                                  color: Colors.blue,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  height: 1),
                            ))),
                    Container(
                        height: 30,
                        child: MaterialButton(
                            minWidth: 1,
                            height: 20,
                            padding: const EdgeInsets.symmetric(horizontal: 4),
                            onPressed: () {},
                            child: const Text(
                              "#text",
                              style: TextStyle(
                                  color: Colors.blue,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  height: 1),
                            ))),
                  ],
                ),
                const SizedBox(
                  height: 6,
                ),
                if (post.postPic != "")
                  Container(
                      width: double.infinity,
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Image(
                        fit: BoxFit.cover,
                        image: NetworkImage(post.postPic),
                      )),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            AppCubit.get(context)
                                .scaffoldKey
                                .currentState!
                                .showBottomSheet((context) =>
                                    BottomSheetBuilder(
                                        context: context,
                                        LikeListmodel: AppCubit.get(context).likes[AppCubit.get(context).postsId[index]]!,
                                        text: "Likes",
                                        bool: false,
                                        CommentListmodel: AppCubit.get(context).comments[AppCubit.get(context).postsId[index]]!
                                        ));
                          },
                          child: Row(
                            children: [
                              const Icon(
                                IconBroken.Heart,
                                color: Colors.red,
                              ),
                              const SizedBox(
                                width: 8,
                              ),
                              Text(
                                "${AppCubit.get(context).likes[AppCubit.get(context).postsId[index]]!.length}",
                                style:
                                    TextStyle(color: Colors.grey, fontSize: 16),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            AppCubit
                            .get(context)
                            .scaffoldKey
                            .currentState!
                            .showBottomSheet((context) => 
                            BottomSheetBuilder(
                              context: context, 
                              LikeListmodel: AppCubit.get(context).likes[AppCubit.get(context).postsId[index]]!, 
                              text: "Comments", 
                              CommentListmodel: AppCubit.get(context).comments[AppCubit.get(context).postsId[index]]!,
                              bool: true));
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              const Icon(
                                IconBroken.Chat,
                                color: Colors.amber,
                              ),
                              const SizedBox(
                                width: 8,
                              ),
                              Text(
                                "${AppCubit.get(context).comments[AppCubit.get(context).postsId[index]]!.length}",
                                style:
                                    TextStyle(color: Colors.grey, fontSize: 16),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                myDivider(4),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      CircleAvatar(
                        backgroundImage: NetworkImage(model.profilePicture),
                        radius: 22,
                      ),
                      SizedBox(
                        width: 16,
                      ),
                      Expanded(
                        child: InkWell(
                          onTap: () {
                          AppCubit.get(context).scaffoldKey.currentState!.showBottomSheet((context) => addComentBottomSheetBuilder(context: context,postId: "${AppCubit.get(context).postsId[index]}"));
                          },
                          child: Text(
                            "write a comment...",
                            style: TextStyle(color: Colors.grey, fontSize: 12),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          AppCubit.get(context).likePost(
                              postId: "${AppCubit.get(context).postsId[index]}");
                        },
                        child: Row(
                          children: [
                            Icon(
                              IconBroken.Heart,
                              color: Colors.red,
                            ),
                            SizedBox(
                              width: 4,
                            ),
                            Text(
                              "Like",
                              style: Theme.of(context).textTheme.bodySmall,
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      InkWell(
                        onTap: () {
                        },
                        child: Row(
                          children: [
                            Icon(
                              IconBroken.Upload,
                              color: Colors.green,
                            ),
                            SizedBox(
                              width: 4,
                            ),
                            Text(
                              "Share",
                              style: Theme.of(context).textTheme.bodySmall,
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ));

  Widget BottomSheetBuilder(
          {required BuildContext context,
          required List<LikeUserModel> LikeListmodel,
          required String text,
          required List<CommentUserModel> CommentListmodel,
          required bool bool
          }) =>
      BlocBuilder<AppCubit, AppState>(
        builder: (context, state) {
          return Container(
            color: Colors.white,
            child: Container(
              height: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadiusDirectional.vertical(top: Radius.circular(40))
                ),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(height: 16,),
                    Row(
                      children: [
                        SizedBox(
                          width: 28,
                        ),
                        Text("$text",style: Theme.of(context).textTheme.bodyLarge!.copyWith(fontSize: 32),)
                      ],
                    ),
                    SizedBox(height: 8,),
                    Padding(
                          padding: const EdgeInsets.symmetric(vertical: 6),
                          child: Container(
                            color: mainColor,
                            height: 2,
                            width: double.infinity,
                          ),
                        ),
                    ListView.separated(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) => !bool ? likeBottomSheetListBuilder(context: context, model: LikeListmodel[index]) : commentBottomSheetListBuilder(context: context, model: CommentListmodel[index]),
                        separatorBuilder: (context, index) => !bool ? Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 6),
                          child: Container(
                            color: Colors.black38,
                            height: 1,
                            width: double.infinity,
                          ),
                        ) : SizedBox(height: 0,),
                        itemCount: !bool ? LikeListmodel.length : CommentListmodel.length),
                  ],
                ),
              ),
            ),
          );
        },
      );

  Widget likeBottomSheetListBuilder(
          {required BuildContext context, required LikeUserModel model}) =>
      Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 25,
                  backgroundImage: NetworkImage(model.profilePicture),
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                    child: Text(
                  model.name,
                  overflow: TextOverflow.ellipsis,
                ))
              ],
            ),
          ],
        ),
      );

  Widget commentBottomSheetListBuilder(
          {required BuildContext context, required CommentUserModel model}) =>
      Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 25,
                  backgroundImage: NetworkImage(model.profilePicture),
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(model.name,style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: Colors.grey[600]),),
                          SizedBox(height: 14,),
                          Text(model.text, style: Theme.of(context).textTheme.bodySmall,)
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      );


  Widget addComentBottomSheetBuilder({
    required BuildContext context, 
    required String postId, 
  }) => Padding(
    padding: const EdgeInsets.all(12.0),
    child: Form(
      key: formKey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(
                child: mainTextField(
                  context: context, 
                  controller: AppCubit.get(context).commentController, 
                  inputType: TextInputType.text,
                  hintText: "Add a Comment",
                  maxLines: 5,
                  validator: (p0) {
                    if (p0!.isEmpty) {
                      return "Please Write a Comment";
                    }
                    return null;
                  },
                  ),
              ),
              SizedBox(width: 10,),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CircleAvatar(
                    radius: 22,
                    backgroundColor: mainColor,
                    child: IconButton(
                      onPressed: (){
                        if (formKey.currentState!.validate()) {
                          AppCubit.get(context).addComment( postId: postId,context: context);
                        }
                      }, 
                      icon: Icon(IconBroken.Send,color: Colors.white,size: 26,)),
                  ),
                  SizedBox(height: 10,),
                  
                ],
              ),
              SizedBox(width: 5,),
            ],
          ),
          if (AppCubit.get(context).commentAdding)
                LinearProgressIndicator(backgroundColor: secondaryColor,color: mainColor,),
          if (AppCubit.get(context).commentAdding)
              SizedBox(height: 10,),
        ],
      ),
    ),
  );
}
