abstract class IHouseFacade {
  Future<Map<String, dynamic>> getListData(dynamic a, dynamic b, dynamic c);
  Future<List<dynamic>> getHouseq();

  Future getReferrals(Map<String, dynamic> activeData);
  Future<List<dynamic>> getProcessDefinition(Map<String, dynamic> query);

  Future controlPrecess(String processId, Map<String, dynamic> data);
  Future updateRemarks(Map<String, dynamic> data);
  Future updataHousing(Map<String, dynamic> data);
  Future changeHouse(Map<String, dynamic> formdata);
}
