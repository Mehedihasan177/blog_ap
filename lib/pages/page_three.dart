import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
class ItemThree extends StatefulWidget {
  @override
  _ItemThreeState createState() => _ItemThreeState();
}

class _ItemThreeState extends State<ItemThree> {
  Future getPostThree()async{
    var firestore = Firestore.instance;
    QuerySnapshot snap = await firestore.collection("GridData").getDocuments();
    return snap.documents;
  }

  Future <Null> getRefreshThree()async{
    await Future.delayed(Duration(seconds: 3));
    setState(() {
      getPostThree();
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: getPostThree(),
        builder: (context, snapshot) {
          if(snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          else {
            return RefreshIndicator(
              onRefresh: getRefreshThree,
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
                itemCount: snapshot.data.length,
                itemBuilder: (context, index){
                  var ourData = snapshot.data[index];
                  return Card(
                    elevation: 10.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: InkWell(
                      onTap: (){
                        customeDialouge(context, ourData.data['img']);
                      },
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20.0),
                        child: Image.network(ourData.data['img'], fit: BoxFit.cover,),
                      ),
                    ),
                  );
                },
              ),
            );
          }
        },
      ),
    );
  }
  customeDialouge(BuildContext context, String img) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: Container(
            height: MediaQuery.of(context).size.height/2,
            width: MediaQuery.of(context).size.width,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: Image.network(img, fit: BoxFit.cover,),
            ),
          ),
        );
      },
    );
  }
}
