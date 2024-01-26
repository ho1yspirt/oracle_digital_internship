import 'package:flutter/material.dart';
import 'package:oracle_digital_internship/src/app/data/dependencies.dart';
import 'package:oracle_digital_internship/src/core/constants/constants.dart';
import 'package:oracle_digital_internship/src/features/profile/bloc/profile_bloc.dart';
import 'package:oracle_digital_internship/src/features/profile/presentation/widgets/profile_about.dart';
import 'package:oracle_digital_internship/src/features/profile/presentation/widgets/profile_gallery.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Dependencies.of(context).profileBloc.add(LoadProfilePageEvent());

    return const SafeArea(
      child: Material(
        child: CustomScrollView(slivers: [
          SliverPadding(
            padding: EdgeInsets.symmetric(
              horizontal: AppSizes.pDefault,
              vertical: AppSizes.p32,
            ),
            sliver: ProfileAbout(),
          ),
          SliverPadding(
            padding: EdgeInsets.symmetric(horizontal: AppSizes.pDefault),
            sliver: ProfileGallery(),
          ),
        ]),
      ),
    );
  }
}
