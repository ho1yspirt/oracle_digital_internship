import 'package:flutter/material.dart';
import 'package:oracle_digital_internship/src/app/data/dependencies.dart';
import 'package:oracle_digital_internship/src/core/localization/generated/l10n.dart';
import 'package:oracle_digital_internship/src/features/chats/bloc/chats_bloc.dart';
import 'package:oracle_digital_internship/src/features/chats/presentation/widgets/chats_list.dart';

class ChatsScreen extends StatelessWidget {
  const ChatsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Dependencies.of(context).chatsBloc.add(LoadChatsPageEvent());

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          S.of(context).chats,
          style: Theme.of(context).textTheme.labelMedium,
        ),
      ),
      body: const ChatsList(),
    );
  }
}
