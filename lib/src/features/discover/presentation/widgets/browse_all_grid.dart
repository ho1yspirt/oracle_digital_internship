import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:oracle_digital_internship/src/app/data/dependencies.dart';
import 'package:oracle_digital_internship/src/core/constants/constants.dart';
import 'package:oracle_digital_internship/src/features/discover/bloc/discover/discover_bloc.dart';

class BrowseAllGrid extends StatelessWidget {
  const BrowseAllGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DiscoverBloc, DiscoverState>(
      bloc: Dependencies.of(context).discoverBloc,
      builder: (context, state) {
        if (state is DiscoverSuccess) {
          return SliverMasonryGrid(
            mainAxisSpacing: AppSizes.p5,
            crossAxisSpacing: AppSizes.p5,
            gridDelegate: const SliverSimpleGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
            ),
            delegate: SliverChildBuilderDelegate(
              childCount: state.browseAll.length,
              (context, index) => SizedBox(
                height: (index % 5 + 1) * 100,
                child: CachedNetworkImage(
                  imageUrl: state.browseAll[index].imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          );
        }
        return SliverMasonryGrid(
          mainAxisSpacing: AppSizes.p5,
          crossAxisSpacing: AppSizes.p5,
          gridDelegate: const SliverSimpleGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
          ),
          delegate: SliverChildBuilderDelegate(
            childCount: 9,
            (context, index) => ColoredBox(
              color: Colors.black,
              child: SizedBox(
                height: (index % 5 + 1) * 100,
              ),
            ),
          ),
        );
      },
    );
  }
}
