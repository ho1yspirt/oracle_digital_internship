import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oracle_digital_internship/src/app/data/dependencies.dart';
import 'package:oracle_digital_internship/src/core/constants/constants.dart';
import 'package:oracle_digital_internship/src/core/widgets/widgets.dart';
import 'package:oracle_digital_internship/src/features/discover/bloc/post_preview/post_preview_bloc.dart';

class PhotoViewScreen extends StatelessWidget {
  const PhotoViewScreen({super.key, required this.id});

  final String id;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PostPreviewBloc, PostPreviewState>(
      bloc: Dependencies.of(context).postPreviewBloc
        ..add(LoadPostPreviewEvent(id)),
      builder: (context, state) {
        // make statusbar light
        SystemChrome.setSystemUIOverlayStyle(
          const SystemUiOverlayStyle(
            statusBarBrightness: Brightness.dark,
            statusBarIconBrightness: Brightness.light,
          ),
        );

        if (state is PostPreviewSuccess) {
          return Material(
            child: Stack(alignment: Alignment.topCenter, children: [
              ShaderMask(
                shaderCallback: (Rect bounds) {
                  return const LinearGradient(
                    colors: [Colors.black, Colors.transparent],
                    stops: [0, 0.5],
                    begin: Alignment.topCenter,
                    end: Alignment.center,
                  ).createShader(bounds);
                },
                blendMode: BlendMode.srcOver,
                child: SizedBox(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  child: Hero(
                    tag: id,
                    child: CachedNetworkImage(
                      imageUrl: state.model.imageUrl,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              SafeArea(
                child: Padding(
                  padding: const EdgeInsets.all(AppSizes.pDefault),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      UserCard(
                        username: state.model.username,
                        nickname: state.model.nickname,
                        imageUrl: state.model.avatarImageUrl,
                        foregroundColor: AppColors.white,
                      ),
                      IconButton(
                        onPressed: () {
                          HapticFeedback.lightImpact();
                          Navigator.pop(context);
                        },
                        icon: const Icon(
                          CupertinoIcons.clear,
                          color: AppColors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ]),
          );
        }
        return const Scaffold();
      },
    );
  }
}
