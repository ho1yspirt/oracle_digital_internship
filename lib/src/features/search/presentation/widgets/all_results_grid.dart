import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oracle_digital_internship/src/app/data/dependencies.dart';
import 'package:oracle_digital_internship/src/core/constants/constants.dart';
import 'package:oracle_digital_internship/src/core/localization/generated/l10n.dart';
import 'package:oracle_digital_internship/src/features/search/bloc/search_bloc.dart';

class AllResultsGrid extends StatelessWidget {
  const AllResultsGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchBloc, SearchState>(
      bloc: Dependencies.of(context).searchBloc,
      builder: (context, state) {
        if (state is SearchSuccess) {
          return SliverMainAxisGroup(slivers: [
            SliverToBoxAdapter(
              child: Text(
                S.of(context).all_results.toUpperCase(),
                style: Theme.of(context).textTheme.labelLarge,
              ),
            ),
            const SliverPadding(padding: EdgeInsets.only(top: AppSizes.p24)),
            SliverGrid(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                mainAxisSpacing: 11,
                crossAxisSpacing: 11,
                crossAxisCount: 3,
              ),
              delegate: SliverChildBuilderDelegate(
                childCount: state.modelList.length,
                (context, index) => CachedNetworkImage(
                  imageUrl: state.modelList[index].imageUrl,
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
        return const SliverToBoxAdapter();
        // return SliverGrid.builder(
        //   gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        //     mainAxisSpacing: 11,
        //     crossAxisSpacing: 11,
        //     crossAxisCount: 3,
        //   ),
        //   itemCount: 15,
        //   itemBuilder: (context, index) => const ColoredBox(
        //     color: Colors.black,
        //   ),
        // );
      },
    );
  }
}
