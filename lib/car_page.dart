import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shrine/model/car_license_plate.dart';

class CarPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    CarLicensePlate? carLicensePlate = CarLicensePlate(
        category: Category.accessories,
        id: 0,
        licensePlate: 'Vagabond sack',
        totalTimeParked: 120,
        timeCheckIn: 5,
        price: 45.000,
        imagePath: 'assets/cookiemint.jpg');
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
                children: <Widget>[_buildCard(carLicensePlate)],
              )),
          const SizedBox(height: 15.0)
        ],
      ),
    );
  }

  Widget _buildCard(CarLicensePlate? car) {
    return Padding(
        padding:
            const EdgeInsets.only(top: 5.0, bottom: 5.0, left: 5.0, right: 5.0),
        child: InkWell(
            onTap: () {},
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
                      tag: car?.imagePath ?? "",
                      child: Container(
                          height: 150.0,
                          width: 150.0,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(car?.imagePath ?? ""),
                                  fit: BoxFit.contain)))),
                  const SizedBox(height: 25.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(width: 10.0),
                      Text(car?.licensePlate ?? " ",
                          style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF575E67),
                              fontFamily: 'Varela',
                              fontSize: 16.0)),
                      Text("${car?.totalTimeParked.toString()}h" ?? "0",
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
