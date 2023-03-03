import 'package:get/get.dart';
import 'package:worldcup_app/details_news/bindings/details_news_bindings.dart';
import 'package:worldcup_app/details_news/view/details_news.dart';
import 'package:worldcup_app/details_team/binding/details_team_binding.dart';
import 'package:worldcup_app/home_page/view/worldcup/details_team_screen.dart';
import 'package:worldcup_app/home_page/view/worldcup/player/details_player_screen.dart';
import 'package:worldcup_app/latest_video/binding/latest_video_binding.dart';
import 'package:worldcup_app/latest_video/view/latest_videos.dart';
import 'package:worldcup_app/news/binding/latest_new_binding.dart';
import 'package:worldcup_app/news/view/latest_new.dart';
import 'package:worldcup_app/store/binding/store_sale_binding.dart';
import 'package:worldcup_app/store/view/store_sale_screen.dart';

import '../detail_match/bindings/details_match_bindings.dart';
import '../first_page/bindings/choose_fav_team_binding.dart';
import '../first_page/bindings/import_details_bindings.dart';
import '../first_page/bindings/language_select_binding.dart';
import '../first_page/bindings/splash_bindings.dart';
import '../first_page/view/choose_favourite_team_screen.dart';
import '../first_page/view/choose_language_screen.dart';
import '../first_page/view/choose_other_team_screen.dart';
import '../first_page/view/details_screen.dart';
import '../first_page/view/splash_first_screen.dart';
import '../home_page/bindings/home_binding.dart';
import '../home_page/view/home_screen.dart';
import '../home_page/view/worldcup/match_infomation.dart';
import '../home_page/view/worldcup/player/player.dart';
import '../player/bindings/players_binding.dart';
import '../ranking/bindings/ranking_bindings.dart';
import '../ranking/view/ranking_screen.dart';
import '../teams/bindings/teams_binding.dart';
import '../teams/view/teams_screen.dart';

class AppRoutes {
  AppRoutes._();

  static const String splash = '/';
  static const String home = '/home';
  static const String detailVideo = '/video-detail';
  static const String detailNews = '/news-detail';
  static const String fixtures = '/fixtures';
  static const String ranking = '/ranking';
  static const String match = '/match';
  static const String inputInfo = '/input-info';
  static const String chooseLanguage = '/choose-language';
  static const String chooseFavTeam = '/choose-fav-team';
  static const String chooseOtherTeam = '/choose-other-team';
  static const String players = '/players';
  static const String teams = '/teams';
  static const String detailsTeam = '/details-team';
  static const String detailsPlayer = '/details-player';
  static const String detailsNews = '/details-news';
  static const String latestNews = '/latest-news';
  static const String latestVideo = '/latest-video';
  static const String storeSale = '/store-sale';

  static List<GetPage<dynamic>> route = [
    GetPage(
      name: AppRoutes.splash,
      page: () => const SplashFirstScreen(),
      binding: SplashBindings(),
    ),
    GetPage(
      name: AppRoutes.storeSale,
      page: () => const StoreSaleSceen(),
      binding: StoreSaleBinding(),
    ),
    GetPage(
      name: AppRoutes.detailsPlayer,
      page: () => const DetailsPlayersScreen(),
      binding: PlayersBinding(),
    ),
    GetPage(
      name: AppRoutes.chooseFavTeam,
      page: () => const ChooseFavouriteTeamScreen(),
      binding: ChooseFavTeamBinding(),
    ),
    GetPage(
      name: AppRoutes.chooseOtherTeam,
      page: () => const ChooseOtherTeamScreen(),
      binding: ChooseFavTeamBinding(),
    ),
    GetPage(
      name: AppRoutes.chooseLanguage,
      page: () => const ChooseLanguageScreen(),
      binding: LanguageSelectBinding(),
      transition: Transition.cupertinoDialog,
    ),
    GetPage(
      name: AppRoutes.inputInfo,
      page: () => DetailsScreen(),
      binding: ImportDetailsBinding(),
    ),
    GetPage(
      name: AppRoutes.home,
      page: () => const HomeScreen(),
      binding: HomeBindings(),
    ),
    GetPage(
      name: AppRoutes.ranking,
      page: () => const RankingScreen(),
      binding: RakingBinding(),
    ),
    GetPage(
      name: AppRoutes.match,
      page: () => const MatchInfomation(),
      binding: DetailsMatchBinding(),
    ),
    GetPage(
      name: AppRoutes.teams,
      page: () => const TeamsScreen(),
      binding: TeamsBinding(),
    ),
    GetPage(
      name: AppRoutes.detailsTeam,
      page: () => const DetailsTeamScreen(),
      binding: DetailsTeamBinding(),
    ),
    GetPage(
      name: AppRoutes.detailsPlayer,
      page: () => const DetailsPlayersScreen(),
      binding: DetailsTeamBinding(),
    ),
    GetPage(
      name: AppRoutes.latestNews,
      page: () => const LatestNew(),
      binding: LatestNewsBinding(),
    ),
    GetPage(
      name: AppRoutes.latestVideo,
      page: () => const LatestVideo(),
      binding: LatestVideoBindings(),
    ),
  ];
}
