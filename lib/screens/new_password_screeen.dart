import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/layout/password_reset_widget.dart';
import 'package:graduation_project/network/cubit/layoutCubit.dart';
import 'package:graduation_project/network/cubit/layoutStates.dart';
import 'package:graduation_project/shared/inContainer.dart';

class NewPassword extends StatelessWidget {
  static const routeName = 'new_password';
  NewPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LayoutCubit, LayoutStates>(
        builder: (context, state) {
          var layout = LayoutCubit.get(context);
          return PasswordResetWidget(
              emojiUrl: layout.passEmojiUrl,
              inContainer: InContainer(),
              smallText: layout.passSmallText,
              bigText: layout.passBigText,
              fistLineAfterEmoji: layout.passFistLineAfterEmoji,
              secondLine: layout.passSecondLine);
        },
        listener: (context, state) {});
  }
}
