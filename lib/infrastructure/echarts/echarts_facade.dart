import 'package:injectable/injectable.dart';
import 'package:flutter_ui/domain/echarts/i_echarts.facade.dart';
import 'package:flutter_ui/infrastructure/datasources/echarts_data_source.dart';

@LazySingleton(as: IEchartsFacade)
class EchartsFacade implements IEchartsFacade {
  EchartsDataSource echartsDataSource;
  EchartsFacade(this.echartsDataSource);

  @override
  Future getPie() async {
    var res = await echartsDataSource.getPie();
    return Future.value(res);
  }

  @override
  Future getDuration(int duration, int portion) async {
    var res = await echartsDataSource.getDuration(duration, portion);
    return Future.value(res);
  }

  @override
  Future getFastreport(
      int mineDuration, int minePortion, String mineId, int leaderweek) async {
    var res = await echartsDataSource.getFastreport(
        mineDuration, minePortion, mineId, leaderweek);
    return Future.value(res);
  }
}
