import 'package:covid_app_tracker/Model/World_states_model.dart';
import 'package:covid_app_tracker/Services/states_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:pie_chart/pie_chart.dart';

class WorldStatsScreen extends StatefulWidget {
  const WorldStatsScreen({Key? key}): super(key: key);

  @override
  State<WorldStatsScreen> createState() => _WorldStatsScreenState();
}

class _WorldStatsScreenState extends State<WorldStatsScreen> with TickerProviderStateMixin {


  late final AnimationController _animationController =
  AnimationController(duration: const Duration(seconds: 3), vsync: this)
    ..repeat();

  @override
  void dispose()
  {
    super.dispose();
    _animationController.dispose();
  }

  final colorList = <Color>[
    const Color(0xff4285F4),
    const Color(0xff1aa260),
    const Color(0xffde5246)
  ];

  @override
  Widget build(BuildContext context) {

    StatesServices statesServices = StatesServices();

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              SizedBox(height: MediaQuery.of(context).size.height * 0.01),
              FutureBuilder<WorldStatesModel>(
                future: StatesServices().fetchWorldStatesRecord(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return SpinKitFadingCircle(
                      color: Colors.white,
                      size: 50,
                      controller: _animationController,
                    );
                  } else if (snapshot.hasError || snapshot.data == null) {
                    return Text('Error fetching data'); // Handle error
                  } else {
                    // Data is available, create the PieChart
                    return Column(
                      children: [
                        PieChart(
                          dataMap: {
                            "Total": double.parse(snapshot.data!.hospitalized.toString()),
                            "Recovered": double.parse(snapshot.data!.recovered.toString() ?? '0'),
                            "Deaths": double.parse(snapshot.data!.death.toString() ?? '0'),
                          },
                          chartValuesOptions: const ChartValuesOptions(
                            showChartValues: true,
                            chartValueStyle: TextStyle(
                              fontSize: 16, // Adjust the font size as needed
                            ),
                          ),
                          chartRadius: MediaQuery.of(context).size.width / 3.2,
                          legendOptions: const LegendOptions(
                            legendPosition: LegendPosition.left,
                          ),
                          animationDuration: const Duration(milliseconds: 1200),
                          chartType: ChartType.ring,
                          colorList: colorList,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: MediaQuery.of(context).size.height * 0.06),
                          child: Card(
                            child: Column(
                              children: [
                                ReusableRow(title: 'Total', value: '200'),
                                ReusableRow(title: 'Total', value: '200'),
                                ReusableRow(title: 'Total', value: '200'),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          height: 50,
                          decoration: BoxDecoration(
                            color: const Color(0xff1aa260),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: const Center(
                            child: Text('Track Countries'),
                          ),
                        )
                      ],
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
    //   Scaffold(
    //   body: SafeArea(
    //     child: Padding(
    //       padding: const EdgeInsets.all(15.0),
    //       child: Column(
    //         children: [
    //           SizedBox(height: MediaQuery.of(context).size.height * 0.01,),
    //           FutureBuilder(builder: (context, AsyncSnapshot<WorldStatesModel> snapshot) {
    //             if(snapshot.hasData){
    //               return Expanded(
    //                   flex: 1,
    //                   child: SpinKitFadingCircle(
    //                     color: Colors.white,
    //                     size: 50,
    //                     controller: _animationController,
    //                   ),
    //               );
    //
    //             }else{
    //               return Column(
    //                 children: [
    //                   PieChart(
    //                     dataMap: {
    //                       "Total": double.parse(snapshot.data?.hospitalized.toString() ?? '0'),
    //                       "Recovered": double.parse(snapshot.data?.recovered.toString() ?? '0'),
    //                       "Deaths": double.parse(snapshot.data?.death.toString() ?? '0'),
    //                     },
    //                     // chartValuesOptions: const ChartValuesOptions(
    //                     //   showChartValuesInPercentage: true
    //                     // ),
    //                     chartRadius: MediaQuery.of(context).size.width/3.2,
    //
    //                     legendOptions: const LegendOptions(
    //                         legendPosition: LegendPosition.left
    //                     ),
    //                     animationDuration: const Duration(milliseconds: 1200),
    //                     chartType: ChartType.ring,
    //                     colorList: colorList,
    //                   ),
    //                   Padding(
    //                     padding: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.height * 0.06),
    //                     child: Card(
    //                       child: Column(
    //                         children: [
    //                           ReusableRow(title: 'Total', value: '200'),
    //                           ReusableRow(title: 'Total', value: '200'),
    //                           ReusableRow(title: 'Total', value: '200'),
    //                         ],
    //                       ),
    //                     ),
    //                   ),
    //                   Container(
    //                     height: 50,
    //                     decoration: BoxDecoration(
    //                       color: const Color(0xff1aa260),
    //                       borderRadius: BorderRadius.circular(10),
    //                     ),
    //                     child: const Center(
    //                       child: Text('Track Countries'),
    //                     ),
    //                   )
    //                 ],
    //               );
    //             }
    //           }, future: statesServices.fetchWorldStatesRecord(),),
    //         ],
    //       ),
    //     ),
    //   ),
    // );
  }
}

class ReusableRow extends StatelessWidget {
  String title, value;
   ReusableRow({Key? key, required this.title, required this.value}) : super(key:key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, left: 10, right: 10, bottom: 10),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(title),
              Text(value),
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          const Divider()
        ],
      ),
    );
  }
}

