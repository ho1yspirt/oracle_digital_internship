import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oracle_digital_internship/src/app/data/dependencies.dart';
import 'package:oracle_digital_internship/src/core/constants/constants.dart';
import 'package:oracle_digital_internship/src/features/chats/bloc/chats_bloc.dart';
import 'package:oracle_digital_internship/src/features/chats/presentation/widgets/chat_bubble.dart';

class SingleChatList extends StatelessWidget {
  const SingleChatList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChatsBloc, ChatsState>(
      bloc: Dependencies.of(context).chatsBloc,
      builder: (context, state) {
        if (state is SingleChatSuccess) {
          return ListView.builder(
            padding: const EdgeInsets.symmetric(
              horizontal: AppSizes.pDefault,
              vertical: AppSizes.p32,
            ),
            itemCount: state.model.chat.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(bottom: AppSizes.p24),
                child: state.model.chat[index].users
                    ? Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: ChatBubble(
                              title: state.model.chat[index].message,
                              topLeftRadius: AppSizes.rDefault,
                            ),
                          ),
                          const SizedBox(width: AppSizes.pDefault),
                          CircleAvatar(
                            radius: AppSizes.r14,
                            foregroundImage: CachedNetworkImageProvider(
                              state.model.chat[index].avatarImageUrl,
                            ),
                          ),
                        ],
                      )
                    : Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CircleAvatar(
                            radius: AppSizes.r14,
                            foregroundImage: CachedNetworkImageProvider(
                              state.model.chat[index].avatarImageUrl,
                            ),
                          ),
                          const SizedBox(width: AppSizes.pDefault),
                          Expanded(
                            child: ChatBubble(
                              title: state.model.chat[index].message,
                              topRightRadius: AppSizes.rDefault,
                            ),
                          ),
                        ],
                      ),
              );
            },
          );
        }
        return const SizedBox();
        // return ListView.builder(
        //   padding: const EdgeInsets.symmetric(
        //     horizontal: AppSizes.pDefault,
        //     vertical: AppSizes.p32,
        //   ),
        //   itemCount: 3,
        //   itemBuilder: (context, index) {
        //     return Padding(
        //       padding: const EdgeInsets.only(bottom: AppSizes.p24),
        //       child: index.isEven
        //           ? const Row(
        //               crossAxisAlignment: CrossAxisAlignment.start,
        //               children: [
        //                 CircleAvatar(radius: AppSizes.r14),
        //                 SizedBox(width: AppSizes.pDefault),
        //                 Expanded(
        //                   child: ChatBubble(
        //                     title:
        //                         'Really love your most recent photo. I’ve been trying to capture the same thing for a few months and would love some tips!',
        //                     topRightRadius: AppSizes.rDefault,
        //                   ),
        //                 ),
        //               ],
        //             )
        //           : const Row(
        //               crossAxisAlignment: CrossAxisAlignment.start,
        //               children: [
        //                 Expanded(
        //                   child: ChatBubble(
        //                     title:
        //                         'Really love your most recent photo. I’ve been trying to capture the same thing for a few months and would love some tips!',
        //                     topLeftRadius: AppSizes.rDefault,
        //                   ),
        //                 ),
        //                 SizedBox(width: AppSizes.pDefault),
        //                 CircleAvatar(radius: AppSizes.r14),
        //               ],
        //             ),
        //     );
        //   },
        // );
      },
    );
  }
}
