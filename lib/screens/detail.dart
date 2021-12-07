import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({Key? key}) : super(key: key);

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
          decoration: const BoxDecoration(
            image: DecorationImage (image: AssetImage
              ("assets/bienso.jpeg"), fit:
            BoxFit.contain),
          ),
          child: SafeArea(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children:  <Widget>[
                IconButton(
                  icon: const Icon(Icons.arrow_back),
                  color: Colors.black,
                  onPressed: () {  },
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
                Text("90 - B2\n 99999", style: TextStyle(
                    fontSize: 45,
                    fontWeight: FontWeight.bold
                ),
                ),
                SizedBox(height: 20,),
                Text("Check-in at 7PM", style: TextStyle(
                  fontSize: 25,
                ),
                ),
                SizedBox(height: 10,),
                Text("Total time: 2 hours", style: TextStyle(
                  fontSize: 25,
                ),
                ),
                SizedBox(height: 10,),
                Text("10 dollars", style: TextStyle(
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
