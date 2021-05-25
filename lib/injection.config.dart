// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:http/http.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'application/auth/auth_bloc.dart';
import 'infrastructure/auth/auth_facade.dart';
import 'infrastructure/datasources/auth_remote_data_source.dart';
import 'infrastructure/api/auth_rest_service.dart';
import 'application/autoenter/autoenter_bloc.dart';
import 'application/wxpage/buying_house/buyinghouse_bloc.dart';
import 'application/wxpage/choose_aff/chooseaff_bloc.dart';
import 'application/wxpage/choose_tented/choosetented_bloc.dart';
import 'infrastructure/webscoket/client_service.dart';
import 'application/coustomer/coustomer_bloc.dart';
import 'infrastructure/datasources/coustomer_data_source.dart';
import 'application/coustomer/coustomer_detail_bloc/coustomer_detail_bloc.dart';
import 'infrastructure/coustomer/coustomer_facade.dart';
import 'application/wxpage/picture/dazzle_the_real_estate_bloc.dart';
import 'application/echarts/echarts_bloc.dart';
import 'infrastructure/datasources/echarts_data_source.dart';
import 'infrastructure/echarts/echarts_facade.dart';
import 'infrastructure/datasources/house_data_source.dart';
import 'application/house/house_bloc.dart';
import 'application/house/house_control_bloc/house_control_bloc.dart';
import 'infrastructure/house/house_facade.dart';
import 'domain/auth/i_auth_facade.dart';
import 'domain/coustomer/i_coustomer_facade.dart';
import 'domain/echarts/i_echarts.facade.dart';
import 'domain/house/i_house_facade.dart';
import 'domain/messages/i_message_facade.dart';
import 'domain/mine/i_mine_service.dart';
import 'domain/process/i_process_service.dart';
import 'domain/web_scoket/i_stomp_service.dart';
import 'domain/wxpage/i_wx_page_facade.dart';
import 'application/messages/messages_bloc.dart';
import 'infrastructure/datasources/messages_data_source.dart';
import 'infrastructure/messages/messages_facade.dart';
import 'application/mine/bloc/mine_bloc.dart';
import 'infrastructure/datasources/mine_remote_data_source.dart';
import 'infrastructure/mine/mine_service.dart';
import 'application/process/bloc/process_bloc.dart';
import 'infrastructure/datasources/process_remote_data_source.dart';
import 'infrastructure/process/process_service.dart';
import 'application/messages/processed/processed_bloc.dart';
import 'application/wxpage/comment/property_reviews_bloc.dart';
import 'application/wxpage/questions/real_estate_bloc.dart';
import 'application/wxpage/recommend_buy_house/recommend_buy_house_bloc.dart';
import 'infrastructure/api/retro_rest_service.dart';
import 'application/auth/sing_in_form/sign_in_form_bloc.dart';
import 'infrastructure/webscoket/stomp_service.dart';
import 'infrastructure/core/util_injectable_module.dart';
import 'infrastructure/datasources/web_socket_remote_data_source.dart';
import 'infrastructure/webscoket/stomp_service_impl.dart' as flutter_ui1;
import 'application/message/bloc/web_scoket_bloc.dart';
import 'application/wxpage/wechat_mine/wechat_mine_bloc.dart';
import 'infrastructure/api/wechat_rest_haskey_service.dart';
import 'infrastructure/api/wechat_rest_service.dart';
import 'application/wxpage/wechat_home_page/wechathomepage_bloc.dart';
import 'infrastructure/wxpage/wx_page_facade.dart';
import 'infrastructure/datasources/wx_page_source.dart';

/// Environment names
const _prod = 'prod';

/// adds generated dependencies
/// to the provided [GetIt] instance

Future<GetIt> $initGetIt(
  GetIt get, {
  String environment,
  EnvironmentFilter environmentFilter,
}) async {
  final gh = GetItHelper(get, environment, environmentFilter);
  final utilInjectableModule = _$UtilInjectableModule();
  gh.lazySingleton<Client>(() => utilInjectableModule.client);
  gh.factory<CoustomerDetailBloc>(() => CoustomerDetailBloc());
  final sharedPreferences = await utilInjectableModule.prefs;
  gh.factory<SharedPreferences>(() => sharedPreferences);
  gh.lazySingleton<WxpageSource>(() => WxpageSourceImpl(
        get<SharedPreferences>(),
        get<AuthRestService>(),
        get<WechatRestService>(),
        get<WechatRestHaskeyService>(),
      ));
  gh.lazySingleton<AuthRemoteDataSource>(() => AuthRemoteDataSourceImpl(
        authRestService: get<AuthRestService>(),
        retroRestService: get<RetroRestService>(),
        sharedPreferences: get<SharedPreferences>(),
      ));
  gh.factory<AutoenterBloc>(() => AutoenterBloc(get<SharedPreferences>()));
  gh.lazySingleton<BaseSessionProvider>(
      () => BaseSessionProvider(sharedPreferences: get<SharedPreferences>()));
  gh.lazySingleton<CoustomerDataSource>(
      () => CoustomerDataSourceImpl(get<RetroRestService>()));
  gh.lazySingleton<EchartsDataSource>(() =>
      EchartsDataSourceImpl(get<SharedPreferences>(), get<RetroRestService>()));
  gh.lazySingleton<HoseDataSource>(() =>
      HoseDataSourceImpl(get<SharedPreferences>(), get<RetroRestService>()));
  gh.lazySingleton<IAuthFacade>(() => AuthFacade(get<AuthRemoteDataSource>()),
      registerFor: {_prod});
  gh.lazySingleton<ICoustomerFacade>(
      () => CoustomerFacade(get<CoustomerDataSource>()));
  gh.lazySingleton<IEchartsFacade>(
      () => EchartsFacade(get<EchartsDataSource>()));
  gh.lazySingleton<IHouseFacade>(() => HouseFacade(get<HoseDataSource>()));
  gh.lazySingleton<IWxPageFacade>(() => WxpageFacade(get<WxpageSource>()));
  gh.lazySingleton<MessagesDataSource>(
      () => MessagesDataSourceImpl(get<RetroRestService>()));
  gh.lazySingleton<MineRemoteDataSource>(() => MineRemoteDataSourceImpl(
      get<SharedPreferences>(), get<RetroRestService>()));
  gh.lazySingleton<ProcessRemoteDataSource>(
      () => ProcessRemoteDataSourceImpl(get<RetroRestService>()));
  gh.factory<PropertyReviewsBloc>(() =>
      PropertyReviewsBloc(get<IWxPageFacade>(), get<SharedPreferences>()));
  gh.factory<RealEstateBloc>(
      () => RealEstateBloc(get<IWxPageFacade>(), get<SharedPreferences>()));
  gh.factory<RecommendBuyHouseBloc>(() =>
      RecommendBuyHouseBloc(get<IWxPageFacade>(), get<SharedPreferences>()));
  gh.factory<SignInFormBloc>(() => SignInFormBloc(get<IAuthFacade>()));
  gh.factory<String>(
      () => utilInjectableModule.apiBaseSession(get<BaseSessionProvider>()),
      instanceName: 'baseSession');
  gh.factory<WechatMineBloc>(() => WechatMineBloc(
        get<IWxPageFacade>(),
        get<SharedPreferences>(),
        get<WechatRestHaskeyService>(),
      ));
  gh.factory<WechathomepageBloc>(
      () => WechathomepageBloc(get<IWxPageFacade>(), get<SharedPreferences>()));
  gh.factory<AuthBloc>(() => AuthBloc(get<IAuthFacade>()));
  gh.factory<BuyinghouseBloc>(
      () => BuyinghouseBloc(get<IWxPageFacade>(), get<SharedPreferences>()));
  gh.factory<ChooseaffBloc>(
      () => ChooseaffBloc(get<IWxPageFacade>(), get<SharedPreferences>()));
  gh.factory<ChoosetentedBloc>(() => ChoosetentedBloc(get<IWxPageFacade>()));
  gh.lazySingleton<ClientService>(() =>
      ClientService(baseSession: get<String>(instanceName: 'baseSession')));
  gh.factory<DazzleTheRealEstateBloc>(() => DazzleTheRealEstateBloc(
        get<IWxPageFacade>(),
        get<SharedPreferences>(),
        get<WechatRestHaskeyService>(),
      ));
  gh.factory<HouseBloc>(
      () => HouseBloc(get<IHouseFacade>(), get<ICoustomerFacade>()));
  gh.factory<HouseControlBloc>(
      () => HouseControlBloc(get<IHouseFacade>(), get<SharedPreferences>()));
  gh.lazySingleton<IMessagesFacade>(
      () => MessagesFacade(get<MessagesDataSource>()));
  gh.lazySingleton<IMineService>(() => MineService(get<MineRemoteDataSource>()),
      registerFor: {_prod});
  gh.lazySingleton<IProcessService>(
      () => ProcessService(get<ProcessRemoteDataSource>()),
      registerFor: {_prod});
  gh.factory<MessagesBloc>(
      () => MessagesBloc(get<SharedPreferences>(), get<IMessagesFacade>()));
  gh.factory<MineBloc>(
      () => MineBloc(get<IMineService>(), get<IProcessService>()));
  gh.factory<ProcessBloc>(() => ProcessBloc(get<IProcessService>()));
  gh.factory<ProcessedBloc>(() => ProcessedBloc(
        get<IMessagesFacade>(),
        get<SharedPreferences>(),
        get<IHouseFacade>(),
        get<ICoustomerFacade>(),
      ));
  gh.lazySingleton<flutter_ui1.WebScoket>(
      () => flutter_ui1.StompServiceImpl(get<ClientService>(), get<Client>()));
  gh.lazySingleton<WebScoket>(() => StompServiceImpl(
        get<ClientService>(),
        get<Client>(),
        get<RetroRestService>(),
        get<SharedPreferences>(),
        get<AuthRestService>(),
      ));
  gh.factory<EchartsBloc>(
      () => EchartsBloc(get<IEchartsFacade>(), get<IMessagesFacade>()));
  gh.lazySingleton<IStompService>(() => StompService(get<WebScoket>()),
      registerFor: {_prod});
  gh.factory<WebScoketBloc>(() => WebScoketBloc(
        get<IStompService>(),
        get<ClientService>(),
        get<ICoustomerFacade>(),
        get<IMessagesFacade>(),
        get<IHouseFacade>(),
      ));
  gh.factory<CoustomerBloc>(() => CoustomerBloc(
        get<ICoustomerFacade>(),
        get<SharedPreferences>(),
        get<IMessagesFacade>(),
        get<IStompService>(),
        get<IHouseFacade>(),
      ));

  // Eager singletons must be registered in the right order
  gh.singleton<AuthRestService>(AuthRestService.create());
  gh.singleton<RetroRestService>(RetroRestService.create());
  gh.singleton<WechatRestHaskeyService>(WechatRestHaskeyService.create());
  gh.singleton<WechatRestService>(WechatRestService.create());
  return get;
}

class _$UtilInjectableModule extends UtilInjectableModule {}
