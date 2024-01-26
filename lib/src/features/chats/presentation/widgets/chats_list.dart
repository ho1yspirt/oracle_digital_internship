import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:oracle_digital_internship/src/app/data/dependencies.dart';
import 'package:oracle_digital_internship/src/core/components/router/app_router.dart';
import 'package:oracle_digital_internship/src/core/constants/constants.dart';
import 'package:oracle_digital_internship/src/features/chats/bloc/chats_bloc.dart';

class ChatsList extends StatelessWidget {
  const ChatsList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChatsBloc, ChatsState>(
      bloc: Dependencies.of(context).chatsBloc,
      builder: (context, state) {
        if (state is AllChatsSuccess) {
          return ListView.builder(
            itemCount: state.modelList.length,
            itemBuilder: (context, index) => Column(children: [
              const Divider(height: 0),
              ListTile(
                onTap: () {
                  HapticFeedback.lightImpact();
                  context.pushNamed(
                    Routes.singleChat,
                    pathParameters: {'id': state.modelList[index].id},
                  );
                },
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: AppSizes.pDefault,
                  vertical: AppSizes.p20,
                ),
                leading: CircleAvatar(
                  radius: AppSizes.r32,
                  foregroundImage: CachedNetworkImageProvider(
                    state.modelList[index].avatarImageUrl,
                  ),
                ),
                titleAlignment: ListTileTitleAlignment.top,
                title: Text(
                  state.modelList[index].username,
                  style: Theme.of(context).textTheme.labelMedium,
                ),
                subtitle: Text(
                  state.modelList[index].lastMessage,
                  style: Theme.of(context).textTheme.labelSmall,
                ),
              ),
              const Divider(height: 0),
            ]),
          );
        }
        return const SizedBox();
        // return ListView.builder(
        //   itemCount: 4,
        //   itemBuilder: (context, index) => Column(children: [
        //     const Divider(height: 0),
        //     ListTile(
        //       onTap: () {
        //         HapticFeedback.lightImpact();
        //         context.pushNamed(Routes.singleChat);
        //       },
        //       contentPadding: const EdgeInsets.symmetric(
        //         horizontal: AppSizes.pDefault,
        //         vertical: AppSizes.p20,
        //       ),
        //       leading: const CircleAvatar(radius: AppSizes.r32),
        //       titleAlignment: ListTileTitleAlignment.top,
        //       title: Text(
        //         'username',
        //         style: Theme.of(context).textTheme.labelMedium,
        //       ),
        //       subtitle: Text(
        //         'subtitle',
        //         style: Theme.of(context).textTheme.labelSmall,
        //       ),
        //     ),
        //     const Divider(height: 0),
        //   ]),
        // );
      },
    );
  }
}
