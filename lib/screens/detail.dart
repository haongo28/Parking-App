import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:parking_app/model/car_license_plate.dart';

class DetailScreen extends StatefulWidget {
  final CarLicensePlate? carLicensePlate;

  const DetailScreen({required this.carLicensePlate});

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: getBody(),
    );
  }

  Widget getBody(){
    var size = MediaQuery.of(context).size;
    return SingleChildScrollView(child: Stack(
      children: <Widget>[
        Container(
          width: double.infinity,
          height: size.height*0.5,
          decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage
              (widget.carLicensePlate?.imagePath ?? ""), fit:
            BoxFit.contain),
          ),
          child: SafeArea(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children:  <Widget>[
                IconButton(
                  icon: const Icon(Icons.arrow_back),
                  color: Colors.black,
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ),
        ),
        Container (
          margin: EdgeInsets.only(top: size.height* 0.45),
          width: double.infinity,
          height: size.height*0.9,
          decoration: BoxDecoration(
              color: Colors.black12,
              borderRadius: BorderRadius.circular(50)
          ),
          child: Padding(
            padding: const EdgeInsets.all(30),
            child: Column(
              children:<Widget> [
                Container(
                  width: 150,
                  height: 7,
                  decoration: BoxDecoration(
                      color: Colors.deepOrangeAccent,
                      borderRadius: BorderRadius.circular(10)

                  ),
                ),
                SizedBox(height:20,),
                Text(
                  widget.carLicensePlate?.licensePlate ?? "", style: TextStyle(
                    fontSize: 45,
                    fontWeight: FontWeight.bold
                ),
                ),
                SizedBox(height: 20,),
                Text("${widget.carLicensePlate?.timeCheckIn.toString()}h",
                  style: TextStyle(
                    fontSize: 25,
                  ),
                ),
                SizedBox(height: 10,),
                Text("${widget.carLicensePlate?.totalTimeParked.toString()}h",
                  style: TextStyle(
                    fontSize: 25,
                  ),
                ),
                SizedBox(height: 10,),
                Text("${widget.carLicensePlate?.price.toString()} dollars",
                  style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    ),);
  }
}
