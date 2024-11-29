import 'package:flixtrip/AppPages/HomaPage.dart';
import 'package:flixtrip/AppPages/Info.dart';
import 'package:flixtrip/controller/cardController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomdetailsPage extends StatelessWidget {

  final String bText;
  final String nText;
  final String iText;
  //final String sText;
  final String pText;
  final person = Get.put(cardController());

   CustomdetailsPage({super.key,  required this.bText, required this.nText, required this.iText, required this.pText});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: IconButton(icon:Icon(Icons.arrow_back), color: Colors.black,onPressed: (){
            Get.to(HomePage());

          },),
          actions: [
            Padding(
              padding: EdgeInsets.all(10),
              child: Row(
                children: [
                  Text("4.5", style: TextStyle(color: Colors.black)),
                  Icon(Icons.star, color: Colors.orange),
                ],
              ),
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Image Carousel
                Container(
                  height: 200,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      Image.asset(pText,fit: BoxFit.cover,),
                      //Image.asset('assets/images/zyl2.jpg',fit: BoxFit.cover,),
                     // Image.asset('assets/controller3.png'),
                    ],
                  ),
                ),
                SizedBox(height: 20),
            
                // Product Title
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      nText,
                      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                   // Text(sText)
                  ],
                ),
            
                // Product Description
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Text(
                    iText,
            
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
            
                // See More Detail Link
                TextButton(
                  onPressed: () {},
                  child: Text("See More Detail"),
                ),
            
                SizedBox(height: 20),
            
                // Color Options
            
            
                SizedBox(height: 20),
            
                // Quantity Selector
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Book Seat For ", style: TextStyle(fontSize: 18)),
                        Obx(

                           () {
                            return Row(
                              children: [
                                IconButton(
                                  icon: Icon(Icons.remove),
                                  onPressed: () {
                                    person.dicPerson();
                                  },
                                ),
                                Text(person.person.value.toString(), style: TextStyle(fontSize: 18)),
                                IconButton(
                                  icon: Icon(Icons.add),
                                  onPressed: () {
                                    person.addPerson();
                                  },
                                ),
                              ],
                            );
                          }
                        ),
                      ],
                    ),
                    SizedBox(height: 5,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Total Cost", style: TextStyle(fontSize: 18)),
                        Row(
                          children: [

                            Text("${bText}Only/ per Person", style: TextStyle(fontSize: 18)),

                          ],
                        ),
                      ],
                    ),
                  ],
                ),
            
                SizedBox(height: 20),
            
                // Add to Cart Button
                Center(
                  child: SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orange,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      onPressed: () {
                        person.price.value = bText;
                        Get.to(InfoPage());
                      },
                      child: Text("Book Now",style: TextStyle(color: Colors.black,fontSize: 16),),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),

    );
  }
}

class ColorOption extends StatelessWidget {
  final Color color;
  ColorOption(this.color);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.0),
      child: CircleAvatar(
        backgroundColor: color,
        radius: 15,
      ),
    );
  }
}

