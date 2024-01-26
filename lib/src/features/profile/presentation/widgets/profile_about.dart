import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oracle_digital_internship/src/app/data/dependencies.dart';
import 'package:oracle_digital_internship/src/core/constants/constants.dart';
import 'package:oracle_digital_internship/src/core/localization/generated/l10n.dart';
import 'package:oracle_digital_internship/src/features/profile/bloc/profile_bloc.dart';

class ProfileAbout extends StatelessWidget {
  const ProfileAbout({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileBloc, ProfileState>(
      bloc: Dependencies.of(context).profileBloc,
      builder: (context, state) {
        if (state is ProfileSuccess) {
          return SliverMainAxisGroup(slivers: [
            SliverToBoxAdapter(
              child: CircleAvatar(
                radius: AppSizes.r64,
                foregroundImage: CachedNetworkImageProvider(
                  state.profile.imageUrl,
                ),
              ),
            ),
            SliverList(
              delegate: SliverChildListDelegate([
                const SizedBox(height: AppSizes.p32),
                Text(
                  state.profile.username,
                  style: Theme.of(context).textTheme.titleLarge,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: AppSizes.pDefault),
                Text(
                  state.profile.location,
                  style: Theme.of(context).textTheme.labelLarge,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: AppSizes.p32),
                FilledButton(
                  onPressed: () => HapticFeedback.lightImpact(),
                  child: Text(
                    '${S.of(context).action_follow} ${state.profile.username}'
                        .toUpperCase(),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const SizedBox(height: AppSizes.pDefault),
                OutlinedButton(
                  onPressed: () => HapticFeedback.lightImpact(),
                  child: Text(S.of(context).action_message.toUpperCase()),
                ),
              ]),
            ),
          ]);
        }
        return SliverMainAxisGroup(slivers: [
          const SliverToBoxAdapter(
            child: CircleAvatar(
              radius: AppSizes.r64,
              foregroundImage: CachedNetworkImageProvider(AppImages.temp),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              const SizedBox(height: AppSizes.p32),
              Text(
                'Username',
                style: Theme.of(context).textTheme.titleLarge,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: AppSizes.pDefault),
              Text(
                'Location',
                style: Theme.of(context).textTheme.labelLarge,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: AppSizes.p32),
              FilledButton(
                onPressed: () => HapticFeedback.lightImpact(),
                child: Text(S.of(context).action_follow.toUpperCase()),
              ),
              const SizedBox(height: AppSizes.pDefault),
              OutlinedButton(
                onPressed: () => HapticFeedback.lightImpact(),
                child: Text(S.of(context).action_message.toUpperCase()),
              ),
            ]),
          ),
        ]);
      },
    );
  }
}
