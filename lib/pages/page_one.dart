import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class ItemOne extends StatefulWidget {
  @override
  _ItemOneState createState() => _ItemOneState();
}

class _ItemOneState extends State<ItemOne> {
  Future getPostOne()async{
    var firestore = Firestore.instance;
    QuerySnapshot snap = await firestore.collection("ItemOne").getDocuments();
    return snap.documents;
  }

  Future <Null> getRefreshOne()async{
    await Future.delayed(Duration(seconds: 3));
    setState(() {
      getPostOne();
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: getPostOne(),
        builder: (context, snapshot) {
          if(snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: (CircularProgressIndicator()));
          }
          else {
            return(RefreshIndicator(
              onRefresh: getRefreshOne,
              child: ListView.builder(itemCount: snapshot.data.length,
                itemBuilder: (context, index) {
                var ourdata = snapshot.data[index];
                return Container(
                  height: 250.0,
                  margin: EdgeInsets.all(10.0),
                  child: Card(
                    elevation: 10.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20.0),
                            child: Image.network(ourdata.data['img'],
                            fit: BoxFit.cover,
                            height: MediaQuery.of(context).size.width,),
                          ),
                        ),
                        SizedBox(width: 5.0),
                        Expanded(
                            flex: 2,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  child: Text(ourdata.data['title'],
                                  style: TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold
                                  ),
                                  ),
                                ),
                                SizedBox(height: 10.0),
                                Container(
                                  child: Text(ourdata.data['des'],
                                    textAlign: TextAlign.justify,
                                  maxLines: 5,
                                    style: TextStyle(
                                      fontSize: 15.0,
                                    ),
                                  ),
                                ),
                                SizedBox(height: 5.0,),
                                Align(
                                  alignment: Alignment.bottomRight,
                                  child: InkWell(
                                    onTap: (){
                                      customDialouge(context,
                                        ourdata.data['img'],
                                        ourdata.data['title'],
                                        ourdata.data['des'],
                                      );
                                    },
                                    child: Container(
                                      margin: EdgeInsets.all(10.0),
                                      padding: EdgeInsets.all(10.0),
                                      decoration: BoxDecoration(
                                        color: Colors.teal,
                                        borderRadius: BorderRadius.circular(20.0)
                                      ),
                                      child: Text(
                                        'ViewDetails',
                                        textAlign: TextAlign.justify,
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 20.0,
                                          fontWeight: FontWeight.bold,

                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                        ),
                      ],
                    ),
                  ),
                );
                }
              ),
            ));
          }
        },
      ),
    );

  }
  customDialouge(BuildContext context, String img, String title, String des) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: Container(
            height: MediaQuery.of(context).size.height/1,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Colors.teal, Colors.amber, Colors.red]
              ),
            ),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    height: 150.0,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20.0),
                      child: Image.network(img,
                      height: 100.0,
                      width: MediaQuery.of(context).size.width,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(height: 10.0,),
                  Container(
                    margin: EdgeInsets.all(10.0),
                    child: Text(
                      title,
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.white,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                  SizedBox(height: 10.0,),
                  Container(
                    margin: EdgeInsets.all(10.0),
                    child: Text(
                      des,
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                          fontSize: 15.0,
                          color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      }
    );
  }
}
