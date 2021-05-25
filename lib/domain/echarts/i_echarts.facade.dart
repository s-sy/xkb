abstract class IEchartsFacade {
  Future getPie();

  Future getDuration(int duration, int portion);

  Future getFastreport(
      int mineDuration, int minePortion, String mineId, int leaderweek);
}
