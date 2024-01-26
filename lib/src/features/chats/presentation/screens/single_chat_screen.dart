import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:oracle_digital_internship/src/app/data/dependencies.dart';
import 'package:oracle_digital_internship/src/features/chats/bloc/chats_bloc.dart';
import 'package:oracle_digital_internship/src/features/chats/presentation/widgets/single_chat_appbar_title.dart';
import 'package:oracle_digital_internship/src/features/chats/presentation/widgets/single_chat_list.dart';

class SingleChatScreen extends StatelessWidget {
  const SingleChatScreen({super.key, required this.id});

  final String id;

  @override
  Widget build(BuildContext context) {
    Dependencies.of(context).chatsBloc.add(LoadSingleChatPageEvent(id));

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            HapticFeedback.lightImpact();
            Dependencies.of(context).chatsBloc.add(LoadChatsPageEvent());
            context.pop();
          },
          icon: const Icon(CupertinoIcons.back),
        ),
        title: const SingleChatAppBarTitle(),
      ),
      body: const SingleChatList(),
    );
  }
}
