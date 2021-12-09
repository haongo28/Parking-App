import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:parking_app/screens/detail.dart';

import '../model/car_license_plate.dart';

class CarPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    CarLicensePlate? carLicensePlate = CarLicensePlate(
        category: Category.accessories,
        id: 0,
        licensePlate: '90-B2\n99999',
        totalTimeParked: 12,
        timeCheckIn: 5,
        price: 45.000,
        imagePath: 'assets/bienso.jpeg');
    return Scaffold(
      backgroundColor: Color(0xFFFCFAF8),
      body: ListView(
        children: <Widget>[
          SizedBox(height: 15.0),
          Container(
              padding: EdgeInsets.only(right: 15.0),
              width: MediaQuery.of(context).size.width - 30.0,
              height: MediaQuery.of(context).size.height - 50.0,
              child: GridView.count(
                crossAxisCount: 2,
                primary: false,
                crossAxisSpacing: 10.0,
                mainAxisSpacing: 15.0,
                childAspectRatio: 0.8,
                children: <Widget>[_buildCard(context, carLicensePlate)],
              )),
          const SizedBox(height: 15.0)
        ],
      ),
    );
  }

  Widget _buildCard(BuildContext context, CarLicensePlate? carLicensePlate) {
    return Padding(
        padding:
            const EdgeInsets.only(top: 5.0, bottom: 5.0, left: 5.0, right: 5.0),
        child: InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        DetailScreen(carLicensePlate: carLicensePlate)),
              );
            },
            child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          spreadRadius: 3.0,
                          blurRadius: 5.0)
                    ],
                    color: Colors.white),
                child: Column(children: [
                  Hero(
                      tag: carLicensePlate?.imagePath ?? "",
                      child: Container(
                          height: 150.0,
                          width: 150.0,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(
                                      carLicensePlate?.imagePath ?? ""),
                                  fit: BoxFit.contain)))),
                  const SizedBox(height: 25.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(width: 10.0),
                      Flexible(
                        child: Text(carLicensePlate?.licensePlate ?? " ",
                            style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF575E67),
                                fontFamily: 'Varela',
                                fontSize: 16.0)),
                      ),
                      Text("${carLicensePlate?.totalTimeParked.toString()}h",
                          style: const TextStyle(
                              color: Color(0xFFCC8053),
                              fontFamily: 'Varela',
                              fontSize: 15.0)),
                      SizedBox(width: 10.0),
                    ],
                  ),
                ]))));
  }
}
