import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:note_app/components/drawer.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          title: Text(
            'Notes',
            style: TextStyle(
              fontSize: MediaQuery.of(context).size.height * 0.035,
              fontFamily: 'QuickSand-Bold',
              color: Theme.of(context).colorScheme.inversePrimary,
            ),
          ),
          backgroundColor: Colors.transparent,
          iconTheme: IconThemeData(
              color: Theme.of(context).colorScheme.inversePrimary, size: 25),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: Icon(
            Icons.add_rounded,
            color: Colors.white,
            size: 40,
          ),
          backgroundColor: Theme.of(context).colorScheme.tertiary,
          shape: CircleBorder(),
        ),
        drawer: DrawerMenu(),
        body: Builder(
            builder: (context) => SingleChildScrollView(
                  child: Center(
                    child: dashBoardContent(),
                  ),
                )));
  }

  dashBoardContent() {
    return Column(
      children: [
        Container(
          height: MediaQuery.of(context).size.height * 0.3,
          width: MediaQuery.of(context).size.width * 0.8,
          child: Slidable(
            startActionPane: ActionPane(motion: DrawerMotion(), children: [
              SlidableAction(
                onPressed: (context) {},
                backgroundColor: Colors.amber,
                icon: Icons.ac_unit_rounded,
                borderRadius: BorderRadius.circular(15),
              )
            ]),
            child: Center(
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                height: MediaQuery.of(context).size.height * 0.3,
                width: MediaQuery.of(context).size.width * 0.8,
                decoration: BoxDecoration(
                    color: Colors.amber,
                    borderRadius: BorderRadius.circular(15)),
              ),
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(vertical: 5),
          height: MediaQuery.of(context).size.height * 0.3,
          width: MediaQuery.of(context).size.width * 0.8,
          decoration: BoxDecoration(
              color: Colors.amber, borderRadius: BorderRadius.circular(15)),
        ),
        Container(
          margin: EdgeInsets.symmetric(vertical: 5),
          height: MediaQuery.of(context).size.height * 0.3,
          width: MediaQuery.of(context).size.width * 0.8,
          decoration: BoxDecoration(
              color: Colors.amber, borderRadius: BorderRadius.circular(15)),
        ),
      ],
    );
  }
}
