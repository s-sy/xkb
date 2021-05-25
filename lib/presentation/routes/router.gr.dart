// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs
import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../bean/process_bean.dart';
import '../core/app_widget.dart';
import '../home/customer/customer_details_page.dart';
import '../home/customer/new_follow_up_page.dart';
import '../home/customer/perfect_information.dart';
import '../home/customer/process_house_page.dart';
import '../home/customer/upload_img_preview.dart';
import '../home/customer/upload_netimg_preview.dart';
import '../home/fitness_app_home_screen.dart';
import '../home/houseing/houseing_seles_control/houseing_seles_control_screen.dart';
import '../home/message/contacts_remarks.dart';
import '../home/message/follow_up.dart';
import '../home/message/message_chat.dart';
import '../home/message/message_page.dart';
import '../home/message/need_to_deal.dart';
import '../home/message/not_follow_up.dart';
import '../home/message/overdue_in_threedays.dart';
import '../home/message/process/manager_details.dart';
import '../home/message/process/salesman_details.dart';
import '../home/message/processed/processed_screen.dart';
import '../home/message/remind_details_view.dart';
import '../home/message/remind_list.dart';
import '../home/message/to_follow_today.dart';
import '../home/mine/about_us.dart';
import '../home/mine/about_us_introduce.dart';
import '../home/mine/ai_card.dart';
import '../home/mine/customer_chat.dart';
import '../home/mine/guest_phone.dart';
import '../home/mine/mine_achievement.dart';
import '../home/mine/mine_order.dart';
import '../home/mine/mine_setting_page.dart';
import '../home/mine/ownership_scheme_page.dart';
import '../home/mine/suggest_feedback.dart';
import '../home/mine/wechat_page.dart';
import '../login/login_page.dart';
import '../login/login_userInfo_page.dart';
import '../login/pin_code_page.dart';
import '../splash/autoenter_page.dart';
import '../splash/platform_page.dart';
import '../splash/splash_page.dart';
import '../wechat/Housing/wechat_comment.dart';
import '../wechat/Housing/wechat_comment_details.dart';
import '../wechat/Housing/wechat_house_details.dart';
import '../wechat/Housing/wechat_house_info.dart';
import '../wechat/Housing/wechat_maps.dart';
import '../wechat/Housing/wechat_news.dart';
import '../wechat/Housing/wechat_news_information.dart';
import '../wechat/Housing/wechat_picture.dart';
import '../wechat/Housing/wechat_picture_details.dart';
import '../wechat/Housing/wechat_questions.dart';
import '../wechat/Housing/wechat_questions_details.dart';
import '../wechat/Housing/wechat_recomm_house.dart';
import '../wechat/Housing/wechat_salesman.dart';
import '../wechat/Housing/wechat_set_picture.dart';
import '../wechat/Housing/wechat_setcomment.dart';
import '../wechat/mine/wechat_add_information.dart';
import '../wechat/mine/wechat_fission_customer.dart';
import '../wechat/mine/wechat_follow_house.dart';
import '../wechat/mine/wechat_mine_comment.dart';
import '../wechat/mine/wechat_mine_customer.dart';
import '../wechat/mine/wechat_mine_picture.dart';
import '../wechat/mine/wechat_mine_questions.dart';
import '../wechat/recommend/wechat_recommend_page.dart';
import '../wechat/wechat_home_screen.dart';
import '../wechat/wechat_notice_page.dart';

class Routes {
  static const String autoenter = '/';
  static const String platformPage = '/platform-page';
  static const String splashPage = '/splash-page';
  static const String loginScreen = '/login-screen';
  static const String pinCodeVerificationScreen =
      '/pin-code-verification-screen';
  static const String fitnessAppHomeScreen = '/fitness-app-home-screen';
  static const String messageChat = '/message-chat';
  static const String contactsRemarks = '/contacts-remarks';
  static const String salesmanDetails = '/salesman-details';
  static const String managerDetails = '/manager-details';
  static const String uploadImgPreview = '/upload-img-preview';
  static const String customerDetails = '/customer-details';
  static const String newFollowUp = '/new-follow-up';
  static const String aiCard = '/ai-card';
  static const String customerChat = '/customer-chat';
  static const String perfectInformation = '/perfect-information';
  static const String suggestFeedback = '/suggest-feedback';
  static const String guestPhone = '/guest-phone';
  static const String mineOrder = '/mine-order';
  static const String ownershipSchemePage = '/ownership-scheme-page';
  static const String mineAchievement = '/mine-achievement';
  static const String notFollowUp = '/not-follow-up';
  static const String overdueInThreeDays = '/overdue-in-three-days';
  static const String toFollowToday = '/to-follow-today';
  static const String uploadNetImgPreview = '/upload-net-img-preview';
  static const String mineSettingPage = '/mine-setting-page';
  static const String remindDetailsView = '/remind-details-view';
  static const String houseingSelesControlScreen =
      '/houseing-seles-control-screen';
  static const String processedScreen = '/processed-screen';
  static const String needToDeal = '/need-to-deal';
  static const String followUp = '/follow-up';
  static const String remindList = '/remind-list';
  static const String messagePage = '/message-page';
  static const String processHousePage = '/process-house-page';
  static const String appWidget = '/app-widget';
  static const String loginUserInfoPage = '/login-user-info-page';
  static const String aboutUs = '/about-us';
  static const String aboutUsIntroduce = '/about-us-introduce';
  static const String wechatPage = '/wechat-page';
  static const String wechatHouseDetails = '/wechat-house-details';
  static const String wechatNews = '/wechat-news';
  static const String wechatSetcomment = '/wechat-setcomment';
  static const String wechatQuestionsDetails = '/wechat-questions-details';
  static const String wechatHomeScreen = '/wechat-home-screen';
  static const String wechatHouseInfo = '/wechat-house-info';
  static const String wechatRecommHouse = '/wechat-recomm-house';
  static const String wechatSalesman = '/wechat-salesman';
  static const String wechatComment = '/wechat-comment';
  static const String wechatQuestions = '/wechat-questions';
  static const String wechatPicture = '/wechat-picture';
  static const String wechatSetPicture = '/wechat-set-picture';
  static const String wechatCommentDetails = '/wechat-comment-details';
  static const String wechatFollowHouse = '/wechat-follow-house';
  static const String wechatMineComment = '/wechat-mine-comment';
  static const String wechatMineQuestions = '/wechat-mine-questions';
  static const String wechatMinePicture = '/wechat-mine-picture';
  static const String wechatMineCustomer = '/wechat-mine-customer';
  static const String wechatFissionCustomer = '/wechat-fission-customer';
  static const String wechatPictureDetails = '/wechat-picture-details';
  static const String wechatNoticePage = '/wechat-notice-page';
  static const String wechatNewsInformation = '/wechat-news-information';
  static const String wechatAddInformation = '/wechat-add-information';
  static const String wechatRecommendPage = '/wechat-recommend-page';
  static const String maps = '/Maps';
  static const all = <String>{
    autoenter,
    platformPage,
    splashPage,
    loginScreen,
    pinCodeVerificationScreen,
    fitnessAppHomeScreen,
    messageChat,
    contactsRemarks,
    salesmanDetails,
    managerDetails,
    uploadImgPreview,
    customerDetails,
    newFollowUp,
    aiCard,
    customerChat,
    perfectInformation,
    suggestFeedback,
    guestPhone,
    mineOrder,
    ownershipSchemePage,
    mineAchievement,
    notFollowUp,
    overdueInThreeDays,
    toFollowToday,
    uploadNetImgPreview,
    mineSettingPage,
    remindDetailsView,
    houseingSelesControlScreen,
    processedScreen,
    needToDeal,
    followUp,
    remindList,
    messagePage,
    processHousePage,
    appWidget,
    loginUserInfoPage,
    aboutUs,
    aboutUsIntroduce,
    wechatPage,
    wechatHouseDetails,
    wechatNews,
    wechatSetcomment,
    wechatQuestionsDetails,
    wechatHomeScreen,
    wechatHouseInfo,
    wechatRecommHouse,
    wechatSalesman,
    wechatComment,
    wechatQuestions,
    wechatPicture,
    wechatSetPicture,
    wechatCommentDetails,
    wechatFollowHouse,
    wechatMineComment,
    wechatMineQuestions,
    wechatMinePicture,
    wechatMineCustomer,
    wechatFissionCustomer,
    wechatPictureDetails,
    wechatNoticePage,
    wechatNewsInformation,
    wechatAddInformation,
    wechatRecommendPage,
    maps,
  };
}

class Router extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(Routes.autoenter, page: Autoenter),
    RouteDef(Routes.platformPage, page: PlatformPage),
    RouteDef(Routes.splashPage, page: SplashPage),
    RouteDef(Routes.loginScreen, page: LoginScreen),
    RouteDef(Routes.pinCodeVerificationScreen, page: PinCodeVerificationScreen),
    RouteDef(Routes.fitnessAppHomeScreen, page: FitnessAppHomeScreen),
    RouteDef(Routes.messageChat, page: MessageChat),
    RouteDef(Routes.contactsRemarks, page: ContactsRemarks),
    RouteDef(Routes.salesmanDetails, page: SalesmanDetails),
    RouteDef(Routes.managerDetails, page: ManagerDetails),
    RouteDef(Routes.uploadImgPreview, page: UploadImgPreview),
    RouteDef(Routes.customerDetails, page: CustomerDetails),
    RouteDef(Routes.newFollowUp, page: NewFollowUp),
    RouteDef(Routes.aiCard, page: AiCard),
    RouteDef(Routes.customerChat, page: CustomerChat),
    RouteDef(Routes.perfectInformation, page: PerfectInformation),
    RouteDef(Routes.suggestFeedback, page: SuggestFeedback),
    RouteDef(Routes.guestPhone, page: GuestPhone),
    RouteDef(Routes.mineOrder, page: MineOrder),
    RouteDef(Routes.ownershipSchemePage, page: OwnershipSchemePage),
    RouteDef(Routes.mineAchievement, page: MineAchievement),
    RouteDef(Routes.notFollowUp, page: NotFollowUp),
    RouteDef(Routes.overdueInThreeDays, page: OverdueInThreeDays),
    RouteDef(Routes.toFollowToday, page: ToFollowToday),
    RouteDef(Routes.uploadNetImgPreview, page: UploadNetImgPreview),
    RouteDef(Routes.mineSettingPage, page: MineSettingPage),
    RouteDef(Routes.remindDetailsView, page: RemindDetailsView),
    RouteDef(Routes.houseingSelesControlScreen,
        page: HouseingSelesControlScreen),
    RouteDef(Routes.processedScreen, page: ProcessedScreen),
    RouteDef(Routes.needToDeal, page: NeedToDeal),
    RouteDef(Routes.followUp, page: FollowUp),
    RouteDef(Routes.remindList, page: RemindList),
    RouteDef(Routes.messagePage, page: MessagePage),
    RouteDef(Routes.processHousePage, page: ProcessHousePage),
    RouteDef(Routes.appWidget, page: AppWidget),
    RouteDef(Routes.loginUserInfoPage, page: LoginUserInfoPage),
    RouteDef(Routes.aboutUs, page: AboutUs),
    RouteDef(Routes.aboutUsIntroduce, page: AboutUsIntroduce),
    RouteDef(Routes.wechatPage, page: WechatPage),
    RouteDef(Routes.wechatHouseDetails, page: WechatHouseDetails),
    RouteDef(Routes.wechatNews, page: WechatNews),
    RouteDef(Routes.wechatSetcomment, page: WechatSetcomment),
    RouteDef(Routes.wechatQuestionsDetails, page: WechatQuestionsDetails),
    RouteDef(Routes.wechatHomeScreen, page: WechatHomeScreen),
    RouteDef(Routes.wechatHouseInfo, page: WechatHouseInfo),
    RouteDef(Routes.wechatRecommHouse, page: WechatRecommHouse),
    RouteDef(Routes.wechatSalesman, page: WechatSalesman),
    RouteDef(Routes.wechatComment, page: WechatComment),
    RouteDef(Routes.wechatQuestions, page: WechatQuestions),
    RouteDef(Routes.wechatPicture, page: WechatPicture),
    RouteDef(Routes.wechatSetPicture, page: WechatSetPicture),
    RouteDef(Routes.wechatCommentDetails, page: WechatCommentDetails),
    RouteDef(Routes.wechatFollowHouse, page: WechatFollowHouse),
    RouteDef(Routes.wechatMineComment, page: WechatMineComment),
    RouteDef(Routes.wechatMineQuestions, page: WechatMineQuestions),
    RouteDef(Routes.wechatMinePicture, page: WechatMinePicture),
    RouteDef(Routes.wechatMineCustomer, page: WechatMineCustomer),
    RouteDef(Routes.wechatFissionCustomer, page: WechatFissionCustomer),
    RouteDef(Routes.wechatPictureDetails, page: WechatPictureDetails),
    RouteDef(Routes.wechatNoticePage, page: WechatNoticePage),
    RouteDef(Routes.wechatNewsInformation, page: WechatNewsInformation),
    RouteDef(Routes.wechatAddInformation, page: WechatAddInformation),
    RouteDef(Routes.wechatRecommendPage, page: WechatRecommendPage),
    RouteDef(Routes.maps, page: Maps),
  ];
  @override
  Map<Type, AutoRouteFactory> get pagesMap => _pagesMap;
  final _pagesMap = <Type, AutoRouteFactory>{
    Autoenter: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => Autoenter(),
        settings: data,
      );
    },
    PlatformPage: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => PlatformPage(),
        settings: data,
      );
    },
    SplashPage: (data) {
      final args = data.getArgs<SplashPageArguments>(
        orElse: () => SplashPageArguments(),
      );
      return MaterialPageRoute<dynamic>(
        builder: (context) => SplashPage(
          key: args.key,
          refresh: args.refresh,
        ),
        settings: data,
      );
    },
    LoginScreen: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const LoginScreen(),
        settings: data,
      );
    },
    PinCodeVerificationScreen: (data) {
      final args =
          data.getArgs<PinCodeVerificationScreenArguments>(nullOk: false);
      return MaterialPageRoute<dynamic>(
        builder: (context) => PinCodeVerificationScreen(args.phoneNumber),
        settings: data,
      );
    },
    FitnessAppHomeScreen: (data) {
      final args = data.getArgs<FitnessAppHomeScreenArguments>(
        orElse: () => FitnessAppHomeScreenArguments(),
      );
      return MaterialPageRoute<dynamic>(
        builder: (context) => FitnessAppHomeScreen(
          key: args.key,
          msgPageTabIndex: args.msgPageTabIndex,
        ),
        settings: data,
      );
    },
    MessageChat: (data) {
      final args = data.getArgs<MessageChatArguments>(
        orElse: () => MessageChatArguments(),
      );
      return MaterialPageRoute<dynamic>(
        builder: (context) => MessageChat(
          key: args.key,
          contactId: args.contactId,
          headImg: args.headImg,
          contactName: args.contactName,
        ),
        settings: data,
      );
    },
    ContactsRemarks: (data) {
      final args = data.getArgs<ContactsRemarksArguments>(
        orElse: () => ContactsRemarksArguments(),
      );
      return MaterialPageRoute<dynamic>(
        builder: (context) => ContactsRemarks(
          key: args.key,
          phone: args.phone,
          contactAvatar: args.contactAvatar,
          contactName: args.contactName,
          contactId: args.contactId,
        ),
        settings: data,
      );
    },
    SalesmanDetails: (data) {
      final args = data.getArgs<SalesmanDetailsArguments>(
        orElse: () => SalesmanDetailsArguments(),
      );
      return MaterialPageRoute<dynamic>(
        builder: (context) => SalesmanDetails(
          key: args.key,
          processBean: args.processBean,
        ),
        settings: data,
      );
    },
    ManagerDetails: (data) {
      final args = data.getArgs<ManagerDetailsArguments>(
        orElse: () => ManagerDetailsArguments(),
      );
      return MaterialPageRoute<dynamic>(
        builder: (context) => ManagerDetails(
          key: args.key,
          processBean: args.processBean,
        ),
        settings: data,
      );
    },
    UploadImgPreview: (data) {
      final args = data.getArgs<UploadImgPreviewArguments>(
        orElse: () => UploadImgPreviewArguments(),
      );
      return MaterialPageRoute<dynamic>(
        builder: (context) => UploadImgPreview(
          key: args.key,
          img: args.img,
        ),
        settings: data,
      );
    },
    CustomerDetails: (data) {
      final args = data.getArgs<CustomerDetailsArguments>(
        orElse: () => CustomerDetailsArguments(),
      );
      return MaterialPageRoute<dynamic>(
        builder: (context) => CustomerDetails(
          key: args.key,
          listData: args.listData,
        ),
        settings: data,
      );
    },
    NewFollowUp: (data) {
      final args = data.getArgs<NewFollowUpArguments>(
        orElse: () => NewFollowUpArguments(),
      );
      return MaterialPageRoute<dynamic>(
        builder: (context) => NewFollowUp(key: args.key),
        settings: data,
      );
    },
    AiCard: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => AiCard(),
        settings: data,
      );
    },
    CustomerChat: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => CustomerChat(),
        settings: data,
      );
    },
    PerfectInformation: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => PerfectInformation(),
        settings: data,
      );
    },
    SuggestFeedback: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => SuggestFeedback(),
        settings: data,
      );
    },
    GuestPhone: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => GuestPhone(),
        settings: data,
      );
    },
    MineOrder: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => MineOrder(),
        settings: data,
      );
    },
    OwnershipSchemePage: (data) {
      final args = data.getArgs<OwnershipSchemePageArguments>(
        orElse: () => OwnershipSchemePageArguments(),
      );
      return MaterialPageRoute<dynamic>(
        builder: (context) => OwnershipSchemePage(key: args.key),
        settings: data,
      );
    },
    MineAchievement: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => MineAchievement(),
        settings: data,
      );
    },
    NotFollowUp: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => NotFollowUp(),
        settings: data,
      );
    },
    OverdueInThreeDays: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => OverdueInThreeDays(),
        settings: data,
      );
    },
    ToFollowToday: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => ToFollowToday(),
        settings: data,
      );
    },
    UploadNetImgPreview: (data) {
      final args = data.getArgs<UploadNetImgPreviewArguments>(
        orElse: () => UploadNetImgPreviewArguments(),
      );
      return MaterialPageRoute<dynamic>(
        builder: (context) => UploadNetImgPreview(
          key: args.key,
          img: args.img,
        ),
        settings: data,
      );
    },
    MineSettingPage: (data) {
      final args = data.getArgs<MineSettingPageArguments>(
        orElse: () => MineSettingPageArguments(),
      );
      return MaterialPageRoute<dynamic>(
        builder: (context) => MineSettingPage(key: args.key),
        settings: data,
      );
    },
    RemindDetailsView: (data) {
      final args = data.getArgs<RemindDetailsViewArguments>(
        orElse: () => RemindDetailsViewArguments(),
      );
      return MaterialPageRoute<dynamic>(
        builder: (context) => RemindDetailsView(
          key: args.key,
          phone: args.phone,
          tenantId: args.tenantId,
        ),
        settings: data,
      );
    },
    HouseingSelesControlScreen: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => HouseingSelesControlScreen(),
        settings: data,
      );
    },
    ProcessedScreen: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => ProcessedScreen(),
        settings: data,
      );
    },
    NeedToDeal: (data) {
      final args = data.getArgs<NeedToDealArguments>(
        orElse: () => NeedToDealArguments(),
      );
      return MaterialPageRoute<dynamic>(
        builder: (context) => NeedToDeal(
          key: args.key,
          listData: args.listData,
          type: args.type,
          mineTitle: args.mineTitle,
          jumpProcessed: args.jumpProcessed,
        ),
        settings: data,
      );
    },
    FollowUp: (data) {
      final args = data.getArgs<FollowUpArguments>(
        orElse: () => FollowUpArguments(),
      );
      return MaterialPageRoute<dynamic>(
        builder: (context) => FollowUp(key: args.key),
        settings: data,
      );
    },
    RemindList: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => RemindList(),
        settings: data,
      );
    },
    MessagePage: (data) {
      final args = data.getArgs<MessagePageArguments>(
        orElse: () => MessagePageArguments(),
      );
      return MaterialPageRoute<dynamic>(
        builder: (context) => MessagePage(
          key: args.key,
          msgPageTabIndex: args.msgPageTabIndex,
        ),
        settings: data,
      );
    },
    ProcessHousePage: (data) {
      final args = data.getArgs<ProcessHousePageArguments>(
        orElse: () => ProcessHousePageArguments(),
      );
      return MaterialPageRoute<dynamic>(
        builder: (context) => ProcessHousePage(
          key: args.key,
          listData: args.listData,
        ),
        settings: data,
      );
    },
    AppWidget: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => AppWidget(),
        settings: data,
      );
    },
    LoginUserInfoPage: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => LoginUserInfoPage(),
        settings: data,
      );
    },
    AboutUs: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => AboutUs(),
        settings: data,
      );
    },
    AboutUsIntroduce: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => AboutUsIntroduce(),
        settings: data,
      );
    },
    WechatPage: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => WechatPage(),
        settings: data,
      );
    },
    WechatHouseDetails: (data) {
      final args = data.getArgs<WechatHouseDetailsArguments>(
        orElse: () => WechatHouseDetailsArguments(),
      );
      return MaterialPageRoute<dynamic>(
        builder: (context) => WechatHouseDetails(
          key: args.key,
          affData: args.affData,
          map: args.map,
        ),
        settings: data,
      );
    },
    WechatNews: (data) {
      final args = data.getArgs<WechatNewsArguments>(
        orElse: () => WechatNewsArguments(),
      );
      return MaterialPageRoute<dynamic>(
        builder: (context) => WechatNews(
          key: args.key,
          affData: args.affData,
        ),
        settings: data,
      );
    },
    WechatSetcomment: (data) {
      final args = data.getArgs<WechatSetcommentArguments>(
        orElse: () => WechatSetcommentArguments(),
      );
      return MaterialPageRoute<dynamic>(
        builder: (context) => WechatSetcomment(
          key: args.key,
          affData: args.affData,
        ),
        settings: data,
      );
    },
    WechatQuestionsDetails: (data) {
      final args = data.getArgs<WechatQuestionsDetailsArguments>(
        orElse: () => WechatQuestionsDetailsArguments(),
      );
      return MaterialPageRoute<dynamic>(
        builder: (context) => WechatQuestionsDetails(
          key: args.key,
          map: args.map,
          affData: args.affData,
        ),
        settings: data,
      );
    },
    WechatHomeScreen: (data) {
      final args = data.getArgs<WechatHomeScreenArguments>(
        orElse: () => WechatHomeScreenArguments(),
      );
      return MaterialPageRoute<dynamic>(
        builder: (context) => WechatHomeScreen(
          key: args.key,
          affData: args.affData,
          msgPageTabIndex: args.msgPageTabIndex,
        ),
        settings: data,
      );
    },
    WechatHouseInfo: (data) {
      final args = data.getArgs<WechatHouseInfoArguments>(
        orElse: () => WechatHouseInfoArguments(),
      );
      return MaterialPageRoute<dynamic>(
        builder: (context) => WechatHouseInfo(
          key: args.key,
          affData: args.affData,
        ),
        settings: data,
      );
    },
    WechatRecommHouse: (data) {
      final args = data.getArgs<WechatRecommHouseArguments>(
        orElse: () => WechatRecommHouseArguments(),
      );
      return MaterialPageRoute<dynamic>(
        builder: (context) => WechatRecommHouse(
          key: args.key,
          affData: args.affData,
        ),
        settings: data,
      );
    },
    WechatSalesman: (data) {
      final args = data.getArgs<WechatSalesmanArguments>(
        orElse: () => WechatSalesmanArguments(),
      );
      return MaterialPageRoute<dynamic>(
        builder: (context) => WechatSalesman(
          key: args.key,
          affData: args.affData,
        ),
        settings: data,
      );
    },
    WechatComment: (data) {
      final args = data.getArgs<WechatCommentArguments>(
        orElse: () => WechatCommentArguments(),
      );
      return MaterialPageRoute<dynamic>(
        builder: (context) => WechatComment(
          key: args.key,
          affData: args.affData,
        ),
        settings: data,
      );
    },
    WechatQuestions: (data) {
      final args = data.getArgs<WechatQuestionsArguments>(
        orElse: () => WechatQuestionsArguments(),
      );
      return MaterialPageRoute<dynamic>(
        builder: (context) => WechatQuestions(
          key: args.key,
          affData: args.affData,
        ),
        settings: data,
      );
    },
    WechatPicture: (data) {
      final args = data.getArgs<WechatPictureArguments>(
        orElse: () => WechatPictureArguments(),
      );
      return MaterialPageRoute<dynamic>(
        builder: (context) => WechatPicture(
          key: args.key,
          affData: args.affData,
        ),
        settings: data,
      );
    },
    WechatSetPicture: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => WechatSetPicture(),
        settings: data,
      );
    },
    WechatCommentDetails: (data) {
      final args = data.getArgs<WechatCommentDetailsArguments>(
        orElse: () => WechatCommentDetailsArguments(),
      );
      return MaterialPageRoute<dynamic>(
        builder: (context) => WechatCommentDetails(
          key: args.key,
          map: args.map,
        ),
        settings: data,
      );
    },
    WechatFollowHouse: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => WechatFollowHouse(),
        settings: data,
      );
    },
    WechatMineComment: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => WechatMineComment(),
        settings: data,
      );
    },
    WechatMineQuestions: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => WechatMineQuestions(),
        settings: data,
      );
    },
    WechatMinePicture: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => WechatMinePicture(),
        settings: data,
      );
    },
    WechatMineCustomer: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => WechatMineCustomer(),
        settings: data,
      );
    },
    WechatFissionCustomer: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => WechatFissionCustomer(),
        settings: data,
      );
    },
    WechatPictureDetails: (data) {
      final args = data.getArgs<WechatPictureDetailsArguments>(
        orElse: () => WechatPictureDetailsArguments(),
      );
      return MaterialPageRoute<dynamic>(
        builder: (context) => WechatPictureDetails(
          key: args.key,
          map: args.map,
          affData: args.affData,
        ),
        settings: data,
      );
    },
    WechatNoticePage: (data) {
      final args = data.getArgs<WechatNoticePageArguments>(nullOk: false);
      return MaterialPageRoute<dynamic>(
        builder: (context) => WechatNoticePage(args.platData),
        settings: data,
      );
    },
    WechatNewsInformation: (data) {
      final args = data.getArgs<WechatNewsInformationArguments>(
        orElse: () => WechatNewsInformationArguments(),
      );
      return MaterialPageRoute<dynamic>(
        builder: (context) => WechatNewsInformation(
          key: args.key,
          url: args.url,
        ),
        settings: data,
      );
    },
    WechatAddInformation: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => WechatAddInformation(),
        settings: data,
      );
    },
    WechatRecommendPage: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => WechatRecommendPage(),
        settings: data,
      );
    },
    Maps: (data) {
      final args = data.getArgs<MapsArguments>(nullOk: false);
      return MaterialPageRoute<dynamic>(
        builder: (context) => Maps(args.affData),
        settings: data,
      );
    },
  };
}

/// ************************************************************************
/// Navigation helper methods extension
/// *************************************************************************

extension RouterExtendedNavigatorStateX on ExtendedNavigatorState {
  Future<dynamic> pushAutoenter() => push<dynamic>(Routes.autoenter);

  Future<dynamic> pushPlatformPage() => push<dynamic>(Routes.platformPage);

  Future<dynamic> pushSplashPage({
    Key key,
    String refresh,
  }) =>
      push<dynamic>(
        Routes.splashPage,
        arguments: SplashPageArguments(key: key, refresh: refresh),
      );

  Future<dynamic> pushLoginScreen() => push<dynamic>(Routes.loginScreen);

  Future<dynamic> pushPinCodeVerificationScreen({
    @required String phoneNumber,
  }) =>
      push<dynamic>(
        Routes.pinCodeVerificationScreen,
        arguments: PinCodeVerificationScreenArguments(phoneNumber: phoneNumber),
      );

  Future<dynamic> pushFitnessAppHomeScreen({
    Key key,
    int msgPageTabIndex,
  }) =>
      push<dynamic>(
        Routes.fitnessAppHomeScreen,
        arguments: FitnessAppHomeScreenArguments(
            key: key, msgPageTabIndex: msgPageTabIndex),
      );

  Future<dynamic> pushMessageChat({
    Key key,
    String contactId,
    String headImg,
    String contactName,
  }) =>
      push<dynamic>(
        Routes.messageChat,
        arguments: MessageChatArguments(
            key: key,
            contactId: contactId,
            headImg: headImg,
            contactName: contactName),
      );

  Future<dynamic> pushContactsRemarks({
    Key key,
    String phone,
    String contactAvatar,
    String contactName,
    String contactId,
  }) =>
      push<dynamic>(
        Routes.contactsRemarks,
        arguments: ContactsRemarksArguments(
            key: key,
            phone: phone,
            contactAvatar: contactAvatar,
            contactName: contactName,
            contactId: contactId),
      );

  Future<dynamic> pushSalesmanDetails({
    Key key,
    ProcessBean processBean,
  }) =>
      push<dynamic>(
        Routes.salesmanDetails,
        arguments: SalesmanDetailsArguments(key: key, processBean: processBean),
      );

  Future<dynamic> pushManagerDetails({
    Key key,
    ProcessBean processBean,
  }) =>
      push<dynamic>(
        Routes.managerDetails,
        arguments: ManagerDetailsArguments(key: key, processBean: processBean),
      );

  Future<dynamic> pushUploadImgPreview({
    Key key,
    File img,
  }) =>
      push<dynamic>(
        Routes.uploadImgPreview,
        arguments: UploadImgPreviewArguments(key: key, img: img),
      );

  Future<dynamic> pushCustomerDetails({
    Key key,
    Map<String, dynamic> listData,
  }) =>
      push<dynamic>(
        Routes.customerDetails,
        arguments: CustomerDetailsArguments(key: key, listData: listData),
      );

  Future<dynamic> pushNewFollowUp({
    Key key,
  }) =>
      push<dynamic>(
        Routes.newFollowUp,
        arguments: NewFollowUpArguments(key: key),
      );

  Future<dynamic> pushAiCard() => push<dynamic>(Routes.aiCard);

  Future<dynamic> pushCustomerChat() => push<dynamic>(Routes.customerChat);

  Future<dynamic> pushPerfectInformation() =>
      push<dynamic>(Routes.perfectInformation);

  Future<dynamic> pushSuggestFeedback() =>
      push<dynamic>(Routes.suggestFeedback);

  Future<dynamic> pushGuestPhone() => push<dynamic>(Routes.guestPhone);

  Future<dynamic> pushMineOrder() => push<dynamic>(Routes.mineOrder);

  Future<dynamic> pushOwnershipSchemePage({
    Key key,
  }) =>
      push<dynamic>(
        Routes.ownershipSchemePage,
        arguments: OwnershipSchemePageArguments(key: key),
      );

  Future<dynamic> pushMineAchievement() =>
      push<dynamic>(Routes.mineAchievement);

  Future<dynamic> pushNotFollowUp() => push<dynamic>(Routes.notFollowUp);

  Future<dynamic> pushOverdueInThreeDays() =>
      push<dynamic>(Routes.overdueInThreeDays);

  Future<dynamic> pushToFollowToday() => push<dynamic>(Routes.toFollowToday);

  Future<dynamic> pushUploadNetImgPreview({
    Key key,
    String img,
  }) =>
      push<dynamic>(
        Routes.uploadNetImgPreview,
        arguments: UploadNetImgPreviewArguments(key: key, img: img),
      );

  Future<dynamic> pushMineSettingPage({
    Key key,
  }) =>
      push<dynamic>(
        Routes.mineSettingPage,
        arguments: MineSettingPageArguments(key: key),
      );

  Future<dynamic> pushRemindDetailsView({
    Key key,
    String phone,
    String tenantId,
  }) =>
      push<dynamic>(
        Routes.remindDetailsView,
        arguments: RemindDetailsViewArguments(
            key: key, phone: phone, tenantId: tenantId),
      );

  Future<dynamic> pushHouseingSelesControlScreen() =>
      push<dynamic>(Routes.houseingSelesControlScreen);

  Future<dynamic> pushProcessedScreen() =>
      push<dynamic>(Routes.processedScreen);

  Future<dynamic> pushNeedToDeal({
    Key key,
    List<dynamic> listData,
    String type,
    String mineTitle,
    Map<String, dynamic> jumpProcessed,
  }) =>
      push<dynamic>(
        Routes.needToDeal,
        arguments: NeedToDealArguments(
            key: key,
            listData: listData,
            type: type,
            mineTitle: mineTitle,
            jumpProcessed: jumpProcessed),
      );

  Future<dynamic> pushFollowUp({
    Key key,
  }) =>
      push<dynamic>(
        Routes.followUp,
        arguments: FollowUpArguments(key: key),
      );

  Future<dynamic> pushRemindList() => push<dynamic>(Routes.remindList);

  Future<dynamic> pushMessagePage({
    Key key,
    int msgPageTabIndex,
  }) =>
      push<dynamic>(
        Routes.messagePage,
        arguments:
            MessagePageArguments(key: key, msgPageTabIndex: msgPageTabIndex),
      );

  Future<dynamic> pushProcessHousePage({
    Key key,
    Map<String, dynamic> listData,
  }) =>
      push<dynamic>(
        Routes.processHousePage,
        arguments: ProcessHousePageArguments(key: key, listData: listData),
      );

  Future<dynamic> pushAppWidget() => push<dynamic>(Routes.appWidget);

  Future<dynamic> pushLoginUserInfoPage() =>
      push<dynamic>(Routes.loginUserInfoPage);

  Future<dynamic> pushAboutUs() => push<dynamic>(Routes.aboutUs);

  Future<dynamic> pushAboutUsIntroduce() =>
      push<dynamic>(Routes.aboutUsIntroduce);

  Future<dynamic> pushWechatPage() => push<dynamic>(Routes.wechatPage);

  Future<dynamic> pushWechatHouseDetails({
    Key key,
    Map<String, dynamic> affData,
    Map<String, dynamic> map,
  }) =>
      push<dynamic>(
        Routes.wechatHouseDetails,
        arguments:
            WechatHouseDetailsArguments(key: key, affData: affData, map: map),
      );

  Future<dynamic> pushWechatNews({
    Key key,
    Map<String, dynamic> affData,
  }) =>
      push<dynamic>(
        Routes.wechatNews,
        arguments: WechatNewsArguments(key: key, affData: affData),
      );

  Future<dynamic> pushWechatSetcomment({
    Key key,
    Map<String, dynamic> affData,
  }) =>
      push<dynamic>(
        Routes.wechatSetcomment,
        arguments: WechatSetcommentArguments(key: key, affData: affData),
      );

  Future<dynamic> pushWechatQuestionsDetails({
    Key key,
    Map<String, dynamic> map,
    Map<String, dynamic> affData,
  }) =>
      push<dynamic>(
        Routes.wechatQuestionsDetails,
        arguments: WechatQuestionsDetailsArguments(
            key: key, map: map, affData: affData),
      );

  Future<dynamic> pushWechatHomeScreen({
    Key key,
    Map<String, dynamic> affData,
    int msgPageTabIndex,
  }) =>
      push<dynamic>(
        Routes.wechatHomeScreen,
        arguments: WechatHomeScreenArguments(
            key: key, affData: affData, msgPageTabIndex: msgPageTabIndex),
      );

  Future<dynamic> pushWechatHouseInfo({
    Key key,
    Map<String, dynamic> affData,
  }) =>
      push<dynamic>(
        Routes.wechatHouseInfo,
        arguments: WechatHouseInfoArguments(key: key, affData: affData),
      );

  Future<dynamic> pushWechatRecommHouse({
    Key key,
    Map<String, dynamic> affData,
  }) =>
      push<dynamic>(
        Routes.wechatRecommHouse,
        arguments: WechatRecommHouseArguments(key: key, affData: affData),
      );

  Future<dynamic> pushWechatSalesman({
    Key key,
    Map<String, dynamic> affData,
  }) =>
      push<dynamic>(
        Routes.wechatSalesman,
        arguments: WechatSalesmanArguments(key: key, affData: affData),
      );

  Future<dynamic> pushWechatComment({
    Key key,
    Map<String, dynamic> affData,
  }) =>
      push<dynamic>(
        Routes.wechatComment,
        arguments: WechatCommentArguments(key: key, affData: affData),
      );

  Future<dynamic> pushWechatQuestions({
    Key key,
    Map<String, dynamic> affData,
  }) =>
      push<dynamic>(
        Routes.wechatQuestions,
        arguments: WechatQuestionsArguments(key: key, affData: affData),
      );

  Future<dynamic> pushWechatPicture({
    Key key,
    Map<String, dynamic> affData,
  }) =>
      push<dynamic>(
        Routes.wechatPicture,
        arguments: WechatPictureArguments(key: key, affData: affData),
      );

  Future<dynamic> pushWechatSetPicture() =>
      push<dynamic>(Routes.wechatSetPicture);

  Future<dynamic> pushWechatCommentDetails({
    Key key,
    Map<String, dynamic> map,
  }) =>
      push<dynamic>(
        Routes.wechatCommentDetails,
        arguments: WechatCommentDetailsArguments(key: key, map: map),
      );

  Future<dynamic> pushWechatFollowHouse() =>
      push<dynamic>(Routes.wechatFollowHouse);

  Future<dynamic> pushWechatMineComment() =>
      push<dynamic>(Routes.wechatMineComment);

  Future<dynamic> pushWechatMineQuestions() =>
      push<dynamic>(Routes.wechatMineQuestions);

  Future<dynamic> pushWechatMinePicture() =>
      push<dynamic>(Routes.wechatMinePicture);

  Future<dynamic> pushWechatMineCustomer() =>
      push<dynamic>(Routes.wechatMineCustomer);

  Future<dynamic> pushWechatFissionCustomer() =>
      push<dynamic>(Routes.wechatFissionCustomer);

  Future<dynamic> pushWechatPictureDetails({
    Key key,
    Map<String, dynamic> map,
    Map<String, dynamic> affData,
  }) =>
      push<dynamic>(
        Routes.wechatPictureDetails,
        arguments:
            WechatPictureDetailsArguments(key: key, map: map, affData: affData),
      );

  Future<dynamic> pushWechatNoticePage({
    @required Map<String, Object> platData,
  }) =>
      push<dynamic>(
        Routes.wechatNoticePage,
        arguments: WechatNoticePageArguments(platData: platData),
      );

  Future<dynamic> pushWechatNewsInformation({
    Key key,
    String url,
  }) =>
      push<dynamic>(
        Routes.wechatNewsInformation,
        arguments: WechatNewsInformationArguments(key: key, url: url),
      );

  Future<dynamic> pushWechatAddInformation() =>
      push<dynamic>(Routes.wechatAddInformation);

  Future<dynamic> pushWechatRecommendPage() =>
      push<dynamic>(Routes.wechatRecommendPage);

  Future<dynamic> pushMaps({
    @required dynamic affData,
  }) =>
      push<dynamic>(
        Routes.maps,
        arguments: MapsArguments(affData: affData),
      );
}

/// ************************************************************************
/// Arguments holder classes
/// *************************************************************************

/// SplashPage arguments holder class
class SplashPageArguments {
  final Key key;
  final String refresh;
  SplashPageArguments({this.key, this.refresh});
}

/// PinCodeVerificationScreen arguments holder class
class PinCodeVerificationScreenArguments {
  final String phoneNumber;
  PinCodeVerificationScreenArguments({@required this.phoneNumber});
}

/// FitnessAppHomeScreen arguments holder class
class FitnessAppHomeScreenArguments {
  final Key key;
  final int msgPageTabIndex;
  FitnessAppHomeScreenArguments({this.key, this.msgPageTabIndex});
}

/// MessageChat arguments holder class
class MessageChatArguments {
  final Key key;
  final String contactId;
  final String headImg;
  final String contactName;
  MessageChatArguments(
      {this.key, this.contactId, this.headImg, this.contactName});
}

/// ContactsRemarks arguments holder class
class ContactsRemarksArguments {
  final Key key;
  final String phone;
  final String contactAvatar;
  final String contactName;
  final String contactId;
  ContactsRemarksArguments(
      {this.key,
      this.phone,
      this.contactAvatar,
      this.contactName,
      this.contactId});
}

/// SalesmanDetails arguments holder class
class SalesmanDetailsArguments {
  final Key key;
  final ProcessBean processBean;
  SalesmanDetailsArguments({this.key, this.processBean});
}

/// ManagerDetails arguments holder class
class ManagerDetailsArguments {
  final Key key;
  final ProcessBean processBean;
  ManagerDetailsArguments({this.key, this.processBean});
}

/// UploadImgPreview arguments holder class
class UploadImgPreviewArguments {
  final Key key;
  final File img;
  UploadImgPreviewArguments({this.key, this.img});
}

/// CustomerDetails arguments holder class
class CustomerDetailsArguments {
  final Key key;
  final Map<String, dynamic> listData;
  CustomerDetailsArguments({this.key, this.listData});
}

/// NewFollowUp arguments holder class
class NewFollowUpArguments {
  final Key key;
  NewFollowUpArguments({this.key});
}

/// OwnershipSchemePage arguments holder class
class OwnershipSchemePageArguments {
  final Key key;
  OwnershipSchemePageArguments({this.key});
}

/// UploadNetImgPreview arguments holder class
class UploadNetImgPreviewArguments {
  final Key key;
  final String img;
  UploadNetImgPreviewArguments({this.key, this.img});
}

/// MineSettingPage arguments holder class
class MineSettingPageArguments {
  final Key key;
  MineSettingPageArguments({this.key});
}

/// RemindDetailsView arguments holder class
class RemindDetailsViewArguments {
  final Key key;
  final String phone;
  final String tenantId;
  RemindDetailsViewArguments({this.key, this.phone, this.tenantId});
}

/// NeedToDeal arguments holder class
class NeedToDealArguments {
  final Key key;
  final List<dynamic> listData;
  final String type;
  final String mineTitle;
  final Map<String, dynamic> jumpProcessed;
  NeedToDealArguments(
      {this.key, this.listData, this.type, this.mineTitle, this.jumpProcessed});
}

/// FollowUp arguments holder class
class FollowUpArguments {
  final Key key;
  FollowUpArguments({this.key});
}

/// MessagePage arguments holder class
class MessagePageArguments {
  final Key key;
  final int msgPageTabIndex;
  MessagePageArguments({this.key, this.msgPageTabIndex});
}

/// ProcessHousePage arguments holder class
class ProcessHousePageArguments {
  final Key key;
  final Map<String, dynamic> listData;
  ProcessHousePageArguments({this.key, this.listData});
}

/// WechatHouseDetails arguments holder class
class WechatHouseDetailsArguments {
  final Key key;
  final Map<String, dynamic> affData;
  final Map<String, dynamic> map;
  WechatHouseDetailsArguments({this.key, this.affData, this.map});
}

/// WechatNews arguments holder class
class WechatNewsArguments {
  final Key key;
  final Map<String, dynamic> affData;
  WechatNewsArguments({this.key, this.affData});
}

/// WechatSetcomment arguments holder class
class WechatSetcommentArguments {
  final Key key;
  final Map<String, dynamic> affData;
  WechatSetcommentArguments({this.key, this.affData});
}

/// WechatQuestionsDetails arguments holder class
class WechatQuestionsDetailsArguments {
  final Key key;
  final Map<String, dynamic> map;
  final Map<String, dynamic> affData;
  WechatQuestionsDetailsArguments({this.key, this.map, this.affData});
}

/// WechatHomeScreen arguments holder class
class WechatHomeScreenArguments {
  final Key key;
  final Map<String, dynamic> affData;
  final int msgPageTabIndex;
  WechatHomeScreenArguments({this.key, this.affData, this.msgPageTabIndex});
}

/// WechatHouseInfo arguments holder class
class WechatHouseInfoArguments {
  final Key key;
  final Map<String, dynamic> affData;
  WechatHouseInfoArguments({this.key, this.affData});
}

/// WechatRecommHouse arguments holder class
class WechatRecommHouseArguments {
  final Key key;
  final Map<String, dynamic> affData;
  WechatRecommHouseArguments({this.key, this.affData});
}

/// WechatSalesman arguments holder class
class WechatSalesmanArguments {
  final Key key;
  final Map<String, dynamic> affData;
  WechatSalesmanArguments({this.key, this.affData});
}

/// WechatComment arguments holder class
class WechatCommentArguments {
  final Key key;
  final Map<String, dynamic> affData;
  WechatCommentArguments({this.key, this.affData});
}

/// WechatQuestions arguments holder class
class WechatQuestionsArguments {
  final Key key;
  final Map<String, dynamic> affData;
  WechatQuestionsArguments({this.key, this.affData});
}

/// WechatPicture arguments holder class
class WechatPictureArguments {
  final Key key;
  final Map<String, dynamic> affData;
  WechatPictureArguments({this.key, this.affData});
}

/// WechatCommentDetails arguments holder class
class WechatCommentDetailsArguments {
  final Key key;
  final Map<String, dynamic> map;
  WechatCommentDetailsArguments({this.key, this.map});
}

/// WechatPictureDetails arguments holder class
class WechatPictureDetailsArguments {
  final Key key;
  final Map<String, dynamic> map;
  final Map<String, dynamic> affData;
  WechatPictureDetailsArguments({this.key, this.map, this.affData});
}

/// WechatNoticePage arguments holder class
class WechatNoticePageArguments {
  final Map<String, Object> platData;
  WechatNoticePageArguments({@required this.platData});
}

/// WechatNewsInformation arguments holder class
class WechatNewsInformationArguments {
  final Key key;
  final String url;
  WechatNewsInformationArguments({this.key, this.url});
}

/// Maps arguments holder class
class MapsArguments {
  final dynamic affData;
  MapsArguments({@required this.affData});
}
