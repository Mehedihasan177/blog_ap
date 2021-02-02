import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class ItemTwo extends StatelessWidget {
  final title = TextStyle(fontSize:20.0,fontWeight: FontWeight.bold,);
  final subTitle = TextStyle(fontSize: 16.0, color: Colors.grey );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              createImage(),
              createTitle(),
              createIcon(),
              createDes(),


            ],
          ),
        ),
      ),

    );
  }
  Widget createImage(){
    return Image(
      image: NetworkImage('https://media-cdn.tripadvisor.com/media/photo-s/09/bd/d1/fc/sajek.jpg'),

    );


  }
  Widget createTitle(){
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0,vertical: 25.0),
      child: Row(

        children: [

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Sajek Valley",style: title,),
                Text('Rangamati District.', style: subTitle ,),
              ],
            ),
          ),

          Icon(Icons.star,size: 30.0,color:Colors.red,),
          Text('41',style: (TextStyle(fontSize: 20.0)),),
        ],
      ),
    );
  }

  Widget createIcon(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        createExtraIcon(Icons.call,'Call'),
        createExtraIcon(Icons.near_me,'Route'),
        createExtraIcon(Icons.share,'Share'),

      ],

    );

  }
  Widget createExtraIcon(IconData icon,String text ){
    return Column(
      children: [
        Icon(icon,color: Colors.blue,size: 30.0,),
        Text(text,style: TextStyle(color: Colors.blue,fontSize: 15.0),),
      ],
    );


  }
  Widget createDes(){
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30.0,vertical: 20.0),
      child: Text("Sajek is a union located in the north of Chittagong Hill Tracts. It's under Baghaichori Upazila in Rangamati hill district, it is situated 67 kilometres (42 mi) north-east from Khagrachhari town and 95 kilometres (59 mi) north from Rangamati city. The border of Bangladesh and Mizoram of India is 8 kilometres (5.0 mi) east from Sajek.[3]",
        textAlign: TextAlign.justify,

      ),
    );
  }
}
