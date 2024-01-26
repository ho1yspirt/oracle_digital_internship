import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:oracle_digital_internship/src/app/data/dependencies.dart';
import 'package:oracle_digital_internship/src/core/constants/constants.dart';
import 'package:oracle_digital_internship/src/core/localization/generated/l10n.dart';
import 'package:oracle_digital_internship/src/features/discover/bloc/discover/discover_bloc.dart';
import 'package:oracle_digital_internship/src/features/discover/presentation/widgets/browse_all_grid.dart';
import 'package:oracle_digital_internship/src/features/discover/presentation/widgets/new_today_list.dart';

class DiscoverScreen extends StatelessWidget {
  const DiscoverScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Dependencies.of(context).discoverBloc.add(LoadDiscoverPageEvent());

    return SafeArea(
      top: false,
      child: Material(
        child: CustomScrollView(slivers: [
          SliverAppBar.medium(
            title: Text(
              S.of(context).discover,
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.symmetric(
              horizontal: AppSizes.pDefault,
              vertical: AppSizes.p24,
            ),
            sliver: SliverToBoxAdapter(
              child: Text(
                S.of(context).whats_new_today.toUpperCase(),
                style: Theme.of(context).textTheme.labelLarge,
              ),
            ),
          ),
          const SliverToBoxAdapter(child: NewTodayList()),
          SliverPadding(
            padding: const EdgeInsets.symmetric(
              horizontal: AppSizes.pDefault,
              vertical: AppSizes.p24,
            ),
            sliver: SliverToBoxAdapter(
              child: Text(
                S.of(context).browese_all.toUpperCase(),
                style: Theme.of(context).textTheme.labelLarge,
              ),
            ),
          ),
          const SliverPadding(
            padding: EdgeInsets.symmetric(horizontal: AppSizes.pDefault),
            sliver: BrowseAllGrid(),
          ),
          SliverPadding(
            padding: const EdgeInsets.symmetric(
              horizontal: AppSizes.pDefault,
              vertical: AppSizes.p32,
            ),
            sliver: SliverToBoxAdapter(
              child: OutlinedButton(
                onPressed: () {
                  HapticFeedback.lightImpact();
                },
                child: Text(S.of(context).action_see_more.toUpperCase()),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
