import 'package:flutter/material.dart';

import '../../constants/font_registery.dart';
import '../../constants/global_variable.dart';
import '../../responsive/responsive.dart';

class WorkOrdersScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Responsive(
      mobile: buildGridView(context, 2),
      tablet: buildGridView(context, 3),
      desktop: buildGridView(context, 4),
    );
  }

  Widget buildGridView(BuildContext context, int crossAxisCount) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.all(GlobalVariables.defaultPadding),
            child: Headings(
              heading: 'WORK ORDERS STATUS',
              subHeading: '',
            ),
          ),
          SizedBox(height: GlobalVariables.defaultPadding),
          Expanded(
            child: GridView.builder(
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: crossAxisCount,
                crossAxisSpacing: GlobalVariables.defaultPadding,
                mainAxisSpacing: GlobalVariables.defaultPadding,
              ),
              itemCount: 4,
              itemBuilder: (context, index) => WorkOrderCard(),
            ),
          ),
        ],
      ),
    );
  }
}

class WorkOrderCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(GlobalVariables.defaultPadding),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Work Order #123',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'Status: In Progress',
              style: TextStyle(
                color: Colors.grey,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'Assigned To: John Doe',
            ),
          ],
        ),
      ),
    );
  }
}

class AssetsScreen extends StatelessWidget {
  const AssetsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Assets Screen',
        style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
