abstract class IWxPageFacade {
  Future getplatList();

  Future getListbyTendentId(String tenantId); //get sessionkey

  Future getListByTenantId(String tenantId);

  Future getNotice(Map<String, dynamic> query);

  Future getapartmentlayout(Map<String, dynamic> query);

  Future getNewsinformation(Map<String, dynamic> query);

  Future getAwesomeshooting(Map<String, dynamic> query);

  Future getQuestionsPage(Map<String, dynamic> query);

  Future gettotalviews(String affId);

  Future getReadingReviews(Map<String, dynamic> query);

  Future getTaills(String affId);

  Future getBaseBudding(String affId);

  Future checkphonept(Map<String, dynamic> query);

  Future getProcessDefinition(String tenantIdIn);

  Future sendworkflow(String id, Map<String, dynamic> query);

  Future checkphonebyborker(Map<String, dynamic> query);

  Future apartmentConcerncennel(Map<String, dynamic> query);

  Future getApartmentConcern(Map<String, dynamic> query);

  Future getTopicreply(Map<String, dynamic> query);

  Future commentdazzle(Map<String, dynamic> query);

  Future releasepreviews(Map<String, dynamic> query);

  Future releasedazzle(Map<String, dynamic> query);

  Future releaseprealestate(Map<String, dynamic> query);

  Future goconcern(Map<String, dynamic> query);

  Future mineGetReadingReviews(Map<String, dynamic> query);

  Future mineGetAwesomeshooting(Map<String, dynamic> query);

  Future mineGetQuestionsPage(Map<String, dynamic> query);

  Future mineGetTopicreply(Map<String, dynamic> query);

  Future referrals(Map<String, dynamic> query);

  Future getvistorInfo();

  Future updatevistorInfo(Map<String, dynamic> query);
}
