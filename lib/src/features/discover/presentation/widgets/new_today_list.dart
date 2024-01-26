import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:oracle_digital_internship/src/app/data/dependencies.dart';
import 'package:oracle_digital_internship/src/core/components/router/app_router.dart';
import 'package:oracle_digital_internship/src/core/constants/constants.dart';
import 'package:oracle_digital_internship/src/core/widgets/widgets.dart';
import 'package:oracle_digital_internship/src/features/discover/bloc/discover/discover_bloc.dart';

class NewTodayList extends StatelessWidget {
  const NewTodayList({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = PageController();

    return AspectRatio(
      aspectRatio: 0.88,
      child: BlocBuilder<DiscoverBloc, DiscoverState>(
        bloc: Dependencies.of(context).discoverBloc,
        builder: (context, state) {
          if (state is DiscoverSuccess) {
            return PageView.builder(
              controller: controller,
              itemCount: state.newToday.length,
              itemBuilder: ((context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppSizes.pDefault,
                  ),
                  child: Column(children: [
                    Hero(
                      tag: state.newToday[index].imageUrl,
                      child: GestureDetector(
                        onTap: () {
                          HapticFeedback.lightImpact();
                          context.pushNamed(
                            Routes.photoViewer,
                            pathParameters: {'id': state.newToday[index].id},
                          );
                        },
                        child: AspectRatio(
                          aspectRatio: 1,
                          child: CachedNetworkImage(
                            imageUrl: state.newToday[index].imageUrl,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: AppSizes.pDefault),
                    UserCard(
                      username: state.newToday[index].username,
                      nickname: state.newToday[index].nickname,
                      imageUrl: state.newToday[index].avatarImageUrl,
                    ),
                  ]),
                );
              }),
            );
          }
          return PageView.builder(
            controller: controller,
            itemCount: 4,
            itemBuilder: ((context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppSizes.pDefault,
                ),
                child: Column(children: [
                  Hero(
                    tag: '$index',
                    child: GestureDetector(
                      onTap: () {
                        HapticFeedback.lightImpact();
                        context.pushNamed(
                          Routes.photoViewer,
                          pathParameters: {'id': '$index'},
                        );
                      },
                      child: const AspectRatio(
                        aspectRatio: 1,
                        child: ColoredBox(color: Colors.black),
                      ),
                    ),
                  ),
                  const SizedBox(height: AppSizes.pDefault),
                  const UserCard(
                    username: 'username',
                    nickname: 'nickname',
                    imageUrl: AppImages.temp,
                  ),
                ]),
              );
            }),
          );
        },
      ),
    );
  }
}
