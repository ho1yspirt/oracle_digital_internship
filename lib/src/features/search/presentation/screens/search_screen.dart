import 'package:flutter/material.dart';
import 'package:oracle_digital_internship/src/core/constants/constants.dart';
import 'package:oracle_digital_internship/src/core/localization/generated/l10n.dart';
import 'package:oracle_digital_internship/src/features/search/presentation/widgets/all_results_grid.dart';
import 'package:oracle_digital_internship/src/features/search/presentation/widgets/search_form.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Material(
        child: CustomScrollView(slivers: [
          SliverAppBar.medium(
            title: Text(
              S.of(context).search,
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          const SliverPadding(padding: EdgeInsets.only(top: AppSizes.p24)),
          const SliverPadding(
            padding: EdgeInsets.symmetric(horizontal: AppSizes.pDefault),
            sliver: SliverToBoxAdapter(child: SearchForm()),
          ),
          const SliverPadding(padding: EdgeInsets.only(top: AppSizes.p32)),
          const SliverPadding(
            padding: EdgeInsets.symmetric(horizontal: AppSizes.pDefault),
            sliver: AllResultsGrid(),
          ),
        ]),
      ),
    );
  }
}
