import 'package:flutter/material.dart';
import 'package:flutter_covid_19_tracker_app/View/world_states.dart';
import 'package:pie_chart/pie_chart.dart';

class DetailScreen extends StatefulWidget {
  String image;
  String name;
  int totalCases, totalDeaths,totalRecoverd,active,critical,todayRecoverd,test;

  DetailScreen(
      {required this.image,
       required this.name,
       required this.totalCases,
       required this.totalDeaths,
       required this.totalRecoverd,
       required this.active,
        required this.critical,
        required this.todayRecoverd,
       required this.test
   });

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  final colorlist=<Color>[
    const Color(0xff4285F4),
    const Color(0xff1aa260),
    const Color(0xffde5246),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.name),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          PieChart(
            dataMap:{
              "Total":double.parse(widget.totalCases.toString()) ,
              "Recover":double.parse(widget.todayRecoverd.toString()),
              "Daths":double.parse(widget.totalDeaths.toString())
            },
            chartValuesOptions: const ChartValuesOptions(
                showChartValuesInPercentage: true
            ),
            chartRadius: MediaQuery.of(context).size.width /3.2,
            legendOptions:const LegendOptions(
                legendPosition: LegendPosition.left
            ),
            animationDuration:const Duration(milliseconds: 1200),
            chartType: ChartType.ring,
            colorList: colorlist,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * .06,
          ),
          Stack(
            alignment: Alignment.topCenter,
            children: [
              Padding(
                padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * .067),
                child: Card(
                  child: Column(
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height * .06,
                      ),
                      ReusableRow(title: 'Cases', value: widget.totalCases.toString()),
                      ReusableRow(title: 'Active', value: widget.active.toString()),
                      ReusableRow(title: 'Tests', value: widget.test.toString()),
                      ReusableRow(title: 'Deaths', value: widget.totalDeaths.toString()),
                      ReusableRow(title: 'Critical', value: widget.critical.toString()),
                      ReusableRow(title: 'Recovered', value: widget.todayRecoverd.toString()),
                    ],
                  ),
                ),
              ),
              CircleAvatar(
                radius: 50,
                backgroundImage: NetworkImage(widget.image),
              )
            ],
          )
        ],
      ),
    );
  }
}
