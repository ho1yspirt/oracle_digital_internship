import 'package:flutter/material.dart';
import 'package:oracle_digital_internship/src/app/data/app_config.dart';
import 'package:oracle_digital_internship/src/app/presentation/inherited_dependencies.dart';
import 'package:oracle_digital_internship/src/core/components/rest_client/rest_client.dart';
import 'package:oracle_digital_internship/src/core/components/router/app_router.dart';
import 'package:oracle_digital_internship/src/core/components/token_storage/token_datasource.dart';
import 'package:oracle_digital_internship/src/core/components/token_storage/token_repository.dart';
import 'package:oracle_digital_internship/src/core/theme/app_theme.dart';
import 'package:oracle_digital_internship/src/features/auth/bloc/auth/auth_bloc.dart';
import 'package:oracle_digital_internship/src/features/auth/data/datasources/auth_datasource.dart';
import 'package:oracle_digital_internship/src/features/auth/data/repositories/auth_repository.dart';
import 'package:oracle_digital_internship/src/features/chats/bloc/chats_bloc.dart';
import 'package:oracle_digital_internship/src/features/chats/data/datasources/chats_datasource.dart';
import 'package:oracle_digital_internship/src/features/chats/data/repositories/chats_repository.dart';
import 'package:oracle_digital_internship/src/features/discover/bloc/discover/discover_bloc.dart';
import 'package:oracle_digital_internship/src/features/discover/bloc/post_preview/post_preview_bloc.dart';
import 'package:oracle_digital_internship/src/features/discover/data/datasources/discover_datasource.dart';
import 'package:oracle_digital_internship/src/features/discover/data/repositories/discover_repository.dart';
import 'package:oracle_digital_internship/src/features/initial/bloc/initial_bloc.dart';
import 'package:oracle_digital_internship/src/features/initial/data/datasources/initial_datasource.dart';
import 'package:oracle_digital_internship/src/features/initial/data/repositories/initial_repository.dart';
import 'package:oracle_digital_internship/src/features/profile/bloc/profile_bloc.dart';
import 'package:oracle_digital_internship/src/features/profile/data/datasources/profile_datasource.dart';
import 'package:oracle_digital_internship/src/features/profile/data/repositories/profile_repository.dart';
import 'package:oracle_digital_internship/src/features/search/bloc/search_bloc.dart';
import 'package:oracle_digital_internship/src/features/search/data/datasources/search_datasource.dart';
import 'package:oracle_digital_internship/src/features/search/data/repositories/search_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Dependencies {
  Dependencies();

  factory Dependencies.of(BuildContext context) =>
      InheritedDependencies.of(context);

  late final IAppConfig appConfig;
  late final SharedPreferences sharedPreferences;
  late final IAppRestClient appRestClient;
  late final AppRouter appRouter;
  late final AppTheme appTheme;

  // datasources
  late final ITokenDataSource tokenDataSource;
  late final IAuthDataSource authDataSource;
  late final IInitialDataSource initialDataSource;
  late final IDiscoverDataSource discoverDataSource;
  late final ISearchDataSource searchDataSource;
  late final IProfileDataSource profileDataSource;
  late final IChatsDataSource chatsDataSource;

  // repositories
  late final ITokenRepository tokenRepository;
  late final IAuthRepository authRepository;
  late final IInitialRepository initialRepository;
  late final IDiscoverRepository discoverRepository;
  late final ISearchRepository searchRepository;
  late final IProfileRepository profileRepository;
  late final IChatsRepository chatsRepository;

  // blocs
  late final AuthBloc authBloc;
  late final InitialBloc initialBloc;
  late final DiscoverBloc discoverBloc;
  late final SearchBloc searchBloc;
  late final ProfileBloc profileBloc;
  late final ChatsBloc chatsBloc;
  late final PostPreviewBloc postPreviewBloc;
}
