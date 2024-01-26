import 'package:flutter/material.dart';
import 'package:oracle_digital_internship/src/app/data/dependencies.dart';
import 'package:oracle_digital_internship/src/core/localization/generated/l10n.dart';
import 'package:oracle_digital_internship/src/features/search/bloc/search_bloc.dart';

class SearchForm extends StatelessWidget {
  const SearchForm({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = TextEditingController();

    return TextFormField(
      controller: controller,
      decoration: InputDecoration(hintText: S.of(context).hint_search),
      onFieldSubmitted: (value) {
        Dependencies.of(context).searchBloc.add(SearchAllEvent(value));
      },
    );
  }
}
