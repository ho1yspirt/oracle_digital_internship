import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oracle_digital_internship/src/app/data/dependencies.dart';
import 'package:oracle_digital_internship/src/core/constants/constants.dart';
import 'package:oracle_digital_internship/src/core/localization/generated/l10n.dart';
import 'package:oracle_digital_internship/src/features/profile/bloc/profile_bloc.dart';

class ProfileGallery extends StatelessWidget {
  const ProfileGallery({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileBloc, ProfileState>(
      bloc: Dependencies.of(context).profileBloc,
      builder: (context, state) {
        if (state is ProfileSuccess) {
          return SliverMainAxisGroup(slivers: [
            SliverGrid(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                mainAxisSpacing: 11,
                crossAxisSpacing: 11,
                crossAxisCount: 3,
              ),
              delegate: SliverChildBuilderDelegate(
                childCount: state.profileImages.length,
                (context, index) => CachedNetworkImage(
                  imageUrl: state.profileImages[index].imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.symmetric(vertical: AppSizes.p32),
              sliver: SliverToBoxAdapter(
                child: OutlinedButton(
                  onPressed: () => HapticFeedback.lightImpact(),
                  child: Text(S.of(context).action_see_more.toUpperCase()),
                ),
              ),
            ),
          ]);
        }

        return SliverGrid.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            mainAxisSpacing: 11,
            crossAxisSpacing: 11,
            crossAxisCount: 3,
          ),
          itemCount: 15,
          itemBuilder: (context, index) => const ColoredBox(
            color: Colors.black,
          ),
        );
      },
    );
  }
}
