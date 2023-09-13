import 'indavidual_graph.dart';

class BarData{
  final double monAmount;
  final double tueAmount;
  final double wedAmount;
  final double thuAmount;
  final double friAmount;
  final double satAmount;
  final double sunAmount;
  List<InduavidualBar> badData =[];
  BarData({required this.monAmount, required this.tueAmount, required this.wedAmount, required this.thuAmount, required this.friAmount, required this.satAmount, required this.sunAmount});
  void InitializeData(){
    badData=[
    InduavidualBar(x: 0, y: sunAmount),
    InduavidualBar(x: 1, y: monAmount),
    InduavidualBar(x: 2, y: tueAmount),
    InduavidualBar(x: 3, y: wedAmount),
    InduavidualBar(x: 4, y: thuAmount),
    InduavidualBar(x: 5, y: friAmount),
    InduavidualBar(x: 6, y: satAmount),
    ];
  }

  


}