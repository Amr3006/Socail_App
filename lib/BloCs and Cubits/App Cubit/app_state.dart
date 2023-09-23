// ignore_for_file: camel_case_types

part of 'app_cubit.dart';

@immutable
abstract class AppState {}

final class AppInitial extends AppState {}

final class loadingUserState extends AppState {}

final class successUserState extends AppState {}

final class failedUserState extends AppState {
  final String error;
  failedUserState(this.error);
}

final class loadingPostsState extends AppState {}

final class successPostsState extends AppState {}

final class failedPostsState extends AppState {
  final String error;
  failedPostsState(this.error);
}

final class changeBottomNaviagationBar extends AppState {}

final class loadingSignOutState extends AppState {}

final class failedSignOutState extends AppState {}

final class successSignOutState extends AppState {}

final class changeCoverPictureState extends AppState {}

final class failedChangeCoverPictureState extends AppState {}

final class changeProfilePictureState extends AppState {}

final class loadingChangeCoverPictureState extends AppState {}

final class loadingChangeProfilePictureState extends AppState {}

final class changePostPictureState extends AppState {}

final class failedChangePostPictureState extends AppState {}

final class failedChangeProfilePictureState extends AppState {}

final class failedUploadingState extends AppState {}

final class failedUpdateState extends AppState {}

final class loadingUploadPostPicState extends AppState {}

final class loadingUploadPostState extends AppState {}

final class failedUploadPostState extends AppState {}

final class successUploadPostState extends AppState {}

final class postPicDeletedState extends AppState {}

final class likePostState extends AppState {}

final class failedLikePostState extends AppState {}

final class failedUploadCommentState extends AppState {}

final class successUploadCommentState extends AppState {}

final class loadingGetChatsState extends AppState {}

final class failedGetChatsState extends AppState {}

final class successGetChatsState extends AppState {}

final class failedSendMessageState extends AppState {}

final class successSendMessageState extends AppState {}

final class successgetMessageState extends AppState {}


