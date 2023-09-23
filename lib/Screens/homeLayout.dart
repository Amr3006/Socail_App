// ignore_for_file: file_names, avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:icon_broken/icon_broken.dart';
import 'package:social_app/BloCs%20and%20Cubits/App%20Cubit/app_cubit.dart';
import 'package:social_app/Design/Colors.dart';


class HomeLayout extends StatelessWidget {
  const HomeLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppState>(
      listener: (context, state) {},
      builder: (context, state) {
        AppCubit cubit = AppCubit.get(context);
        return Scaffold(
          key: cubit.scaffoldKey,
          appBar: AppBar(
            leading: null,
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
              IconButton(
                  onPressed: () {
                  },
                  icon: const Icon(
                    IconBroken.Notification,
                    color: Colors.black,
                    size: 30,
                  )),
              IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    IconBroken.Search,
                    color: Colors.black,
                    size: 30,
                  )),
              const SizedBox(
                width: 10,
              )
            ],
          ),
          body: cubit.screens[cubit.currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            unselectedItemColor: Colors.grey,
            selectedItemColor: mainColor,
            elevation: 0,
            backgroundColor: Colors.white,
            type: BottomNavigationBarType.fixed,
            onTap: (value) {
              cubit.changeBottomBarIndex(value);
            },
            currentIndex: cubit.currentIndex,
            unselectedIconTheme: const IconThemeData(size: 20),
            selectedIconTheme: const IconThemeData(size: 30),
            unselectedFontSize: 10,
            selectedFontSize: 16,
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(IconBroken.Home), label: "Home"),
              BottomNavigationBarItem(
                  icon: Icon(IconBroken.Chat), label: "Chats"),
              BottomNavigationBarItem(
                  icon: Icon(IconBroken.Setting), label: "Settings"),
            ],
          ),
        );
      },
    );
  }
}
