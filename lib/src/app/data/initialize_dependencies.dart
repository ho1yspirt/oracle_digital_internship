import 'package:oracle_digital_internship/src/app/data/app_config.dart';
import 'package:oracle_digital_internship/src/app/data/dependencies.dart';
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
import 'package:oracle_digital_internship/test/src/features/auth/repositories/mock_auth_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// initialization of all dependencies on start of the app
Future<Dependencies> initializeDependencies(String env) async {
  final IAppConfig appConfig;
  final IAppRestClient appRestClient;
  final AppTheme appTheme = AppTheme();
  final SharedPreferences sharedPreferences =
      await SharedPreferences.getInstance();

  // datasources
  final IAuthDataSource authDataSource;
  final ITokenDataSource tokenDataSource = TokenDataSource(
    sharedPreferences,
  );
  final IInitialDataSource initialDataSource;
  final IDiscoverDataSource discoverDataSource;
  final ISearchDataSource searchDataSource;
  final IProfileDataSource profileDataSource;
  final IChatsDataSource chatsDataSource;

  // repositories
  final ITokenRepository tokenRepository = TokenRepository(tokenDataSource);
  final IAuthRepository authRepository;
  final IInitialRepository initialRepository;
  final IDiscoverRepository discoverRepository;
  final ISearchRepository searchRepository;
  final IProfileRepository profileRepository;
  final IChatsRepository chatsRepository;

  switch (env) {
    case 'prod':
      appConfig = ProdAppConfig();
      appRestClient = AppRestClient(appConfig);
      authDataSource = AuthDataSource(appRestClient);
      authRepository = AuthRepository(authDataSource);
    default:
      appConfig = DevAppConfig();
      appRestClient = AppRestClient(appConfig);
      authDataSource = AuthDataSource(appRestClient);
      authRepository = MockAuthRepository(authDataSource);
  }

  initialDataSource = InitialDataSource(appRestClient);
  discoverDataSource = DiscoverDataSource(appRestClient);
  searchDataSource = SearchDataSource(appRestClient);
  profileDataSource = ProfileDataSource(appRestClient);
  chatsDataSource = ChatsDataSource(appRestClient);

  initialRepository = InitialRepository(initialDataSource);
  discoverRepository = DiscoverRepository(discoverDataSource);
  searchRepository = SearchRepository(searchDataSource);
  profileRepository = ProfileRepository(profileDataSource);
  chatsRepository = ChatsRepository(chatsDataSource);

  // blocs
  final AuthBloc authBloc = AuthBloc(authRepository, tokenRepository);
  final InitialBloc initialBloc = InitialBloc(initialRepository);
  final DiscoverBloc discoverBloc = DiscoverBloc(discoverRepository);
  final SearchBloc searchBloc = SearchBloc(searchRepository);
  final ProfileBloc profileBloc = ProfileBloc(profileRepository);
  final ChatsBloc chatsBloc = ChatsBloc(chatsRepository);
  final PostPreviewBloc postPreviewBloc = PostPreviewBloc(discoverRepository);

  final AppRouter appRouter = AppRouter(authBloc);

  return Dependencies()
    ..appConfig = appConfig
    ..appRouter = appRouter
    ..appTheme = appTheme
    ..sharedPreferences = sharedPreferences
    ..appRestClient = appRestClient

    /// datasources
    ..tokenDataSource = tokenDataSource
    ..authDataSource = authDataSource
    ..initialDataSource = initialDataSource
    ..discoverDataSource = discoverDataSource
    ..searchDataSource = searchDataSource
    ..profileDataSource = profileDataSource
    ..chatsDataSource = chatsDataSource

    /// repositories
    ..tokenRepository = tokenRepository
    ..authRepository = authRepository
    ..initialRepository = initialRepository
    ..discoverRepository = discoverRepository
    ..searchRepository = searchRepository
    ..profileRepository = profileRepository
    ..chatsRepository = chatsRepository

    /// blocs
    ..authBloc = authBloc
    ..discoverBloc = discoverBloc
    ..searchBloc = searchBloc
    ..initialBloc = initialBloc
    ..profileBloc = profileBloc
    ..postPreviewBloc = postPreviewBloc
    ..chatsBloc = chatsBloc;
}
