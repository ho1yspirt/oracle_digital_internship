import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:oracle_digital_internship/src/app/data/dependencies.dart';
import 'package:oracle_digital_internship/src/core/constants/assets/icons.dart';
import 'package:oracle_digital_internship/src/core/constants/assets/images.dart';
import 'package:oracle_digital_internship/src/core/constants/sizes/sizes.dart';
import 'package:oracle_digital_internship/src/core/widgets/widgets.dart';
import 'package:oracle_digital_internship/src/features/initial/bloc/initial_bloc.dart';
import 'package:oracle_digital_internship/src/features/initial/presentation/widgets/initial_buttons.dart';

class InitialScreen extends StatelessWidget {
  const InitialScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        BlocBuilder<InitialBloc, InitialState>(
          bloc: Dependencies.of(context).initialBloc
            ..add(ShowInitialPostEvent()),
          builder: (context, state) {
            if (state is InitialSuccess) {
              return Expanded(
                child: Stack(alignment: Alignment.bottomLeft, children: [
                  CachedNetworkImage(
                    imageUrl: state.model.imageUrl,
                    fit: BoxFit.cover,
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: SvgPicture.asset(AppIcons.logo),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: AppSizes.pDefault,
                      vertical: AppSizes.p20,
                    ),
                    child: UserCard(
                      username: state.model.username,
                      nickname: state.model.nickname,
                      imageUrl: state.model.avatarImageUrl,
                      foregroundColor: Colors.white,
                    ),
                  ),
                ]),
              );
            }
            if (state is InitialError) {
              return ErrorCard(e: state.e, s: state.s);
            }
            return Expanded(
              child: Stack(alignment: Alignment.bottomLeft, children: [
                Image.asset(
                  AppImages.intialBg,
                  fit: BoxFit.cover,
                  width: MediaQuery.of(context).size.width,
                ),
                Align(
                  alignment: Alignment.center,
                  child: SvgPicture.asset(AppIcons.logo),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: AppSizes.pDefault,
                    vertical: AppSizes.p20,
                  ),
                  child: UserCard(
                    username: 'username',
                    nickname: 'nickname',
                    imageUrl: AppImages.temp,
                  ),
                ),
              ]),
            );
          },
        ),
        const InitialButtons(),
      ]),
    );
  }
}
