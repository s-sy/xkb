abstract class ICoustomerFacade {
  Future getCoustomerList(Map<String, dynamic> query);

  Future executionWithoutdelay(Map<String, dynamic> query);

  Future gethistory(Map<String, dynamic> query);
  Future gethistorydata(Map<String, dynamic> query);

  Future getMultipleCustomer(String phone, Map<String, dynamic> query);

  Future getPersonnelList(String affId);
}
