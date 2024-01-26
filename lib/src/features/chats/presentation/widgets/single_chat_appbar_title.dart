import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oracle_digital_internship/src/app/data/dependencies.dart';
import 'package:oracle_digital_internship/src/features/chats/bloc/chats_bloc.dart';

class SingleChatAppBarTitle extends StatelessWidget {
  const SingleChatAppBarTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChatsBloc, ChatsState>(
      bloc: Dependencies.of(context).chatsBloc,
      builder: (context, state) {
        if (state is SingleChatSuccess) {
          return Text(
            state.model.username,
            style: Theme.of(context).textTheme.labelMedium,
          );
        }
        return Text(
          'Username',
          style: Theme.of(context).textTheme.labelMedium,
        );
      },
    );
  }
}
