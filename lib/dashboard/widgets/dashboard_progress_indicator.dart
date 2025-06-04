import 'package:flutter/material.dart';
import 'package:timelines/timelines.dart';

class DashboardProgressIndicator extends StatelessWidget {
  final double progress = 0.2;
  static const Color _primaryColor = Color(0xFF4E46B4);
  final List<String> steps = [
    'New',
    'Contacted',
    'Nurturing',
    'Unqualified',
    'Qualified',
  ];

  final int currentStep = 2; // Index of current step

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.only(left: 30, right: 30),
      child: Column(
        children: [
          SizedBox(
            height: 90,
            width: size.width,
            child: Timeline.tileBuilder(
              scrollDirection: Axis.horizontal,
              builder: TimelineTileBuilder.connected(
                connectionDirection: ConnectionDirection.before,
                itemCount: steps.length,
                indicatorBuilder: (context, index) {
                  if (index < currentStep) {
                    // ✅ Completed
                    return const DotIndicator(
                      size: 20,
                      color: Color.fromRGBO(78, 70, 180, 1),
                      child: Icon(Icons.check, color: Colors.white, size: 10),
                    );
                  }
                  else if (index == currentStep) {
                    // 🟠 Current
                    return  OutlinedDotIndicator(
                      borderWidth: 1,
                      size: 20,
                      color: const Color.fromRGBO(78, 70, 180, 1),
                      child: Center(child: Container(
                        decoration: BoxDecoration(
                            color:const Color.fromRGBO(78, 70, 180, 1),
                          borderRadius: BorderRadius.circular(size.width)
                        ),
                        width: 5,height: 5,)),
                    );
                  } else {
                    // ⚪ Upcoming
                    return OutlinedDotIndicator(
                      size: 20,
                      color: Colors.grey.shade400,
                      borderWidth: 1,
                    );
                  }
                },
                connectorBuilder: (context, index, _) {
                  if (index < currentStep) {
                    return const SolidLineConnector(color: Color.fromRGBO(78, 70, 180, 1),);
                  } else {
                    return const SolidLineConnector(color: Colors.grey);
                  }
                },
                contentsBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    steps[index],
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.labelSmall,
                  ),
                ),
              ),
            ),
          ),
          Row(
            children: [
              const SizedBox(width: 8,),
              Expanded(
                child: LinearProgressIndicator(
                  value: progress, // from 0.0 to 1.0
                  backgroundColor: _primaryColor.withOpacity(0.3),
                  color: _primaryColor,
                  minHeight: 3,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
