import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:internship/Models/ContactModel.dart';

class ContactDetail extends StatefulWidget {
  final List<Contacts> contact;
  int index;
  
   ContactDetail({Key? key, required this.index, required this.contact}) : super(key: key);

  @override
  _ContactDetailState createState() => _ContactDetailState();
}

class _ContactDetailState extends State<ContactDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 300,
            width: MediaQuery.of(context).size.width,
            color: Colors.purple,
            child: Center(
              child: Row(
          
                children: [
                  IconButton(
                    onPressed: (){
                      Navigator.pop(context);
                    },
                    icon: Icon(Icons.arrow_back, color: Colors.white,),

                     ),
                  SizedBox(width: 90),
                  Column(
                    mainAxisAlignment:  MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 120,
                        width: 120,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.purple.shade400

                        ),
                        child: Center(
                          child: Text(
                            widget.contact[widget.index].Name.substring(0,1), style: TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                              fontWeight: FontWeight.w600
                          ),
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(widget.contact[widget.index].Name, style: TextStyle(color: Colors.white, fontSize: 20),)
                    ],
                  ),


                ],
              ),
            ),

          ),
          ListTile(
            leading: Icon(Icons.email),
            title: Text(widget.contact[widget.index].Email),
          ),
          Divider(color: Colors.grey.shade400,),
          ListTile(
            leading: Icon(Icons.call),
             title: Text(widget.contact[widget.index].PhoneNo),
          ),
          Divider(color: Colors.grey.shade400,),

        ],
      ),
    );
  }
}
