import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:internship/Models/ContactModel.dart';
import 'package:internship/task-2/contact_detail_screen.dart';


class ContactScreen extends StatefulWidget {
  const ContactScreen({Key? key}) : super(key: key);

  @override
  _ContactScreenState createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
  var _scaffoldKey = new GlobalKey<ScaffoldState>();
  TextEditingController textEditingController=TextEditingController();
   static  List<Contacts> _list = [
    Contacts('laiba', 'laiba@gmail.com', "032345567"),
    Contacts('Hira', 'Hira@gmail.com', "032389678"),
    Contacts('Naiha', 'Naiha@gmail.com', '024678098'),
    Contacts('Razzaq', 'Razzaq@gmail.com', '043567987'),
    Contacts('laiba', 'laiba@gmail.com', '032345567'),
    Contacts('Hira', 'Hira@gmail.com', '0323890678'),
    Contacts('Naiha', 'Naiha@gmail.com', '024678098'),
    Contacts('Razzaq', 'Razzaq@gmail.com', '043567987'),
  ];
   List<Contacts> _founduser =[];
   @override
  void initState() {
    // TODO: implement initState
     _founduser=_list;
    super.initState();
  }
    void _runfilter(String enterKeyword){
     List<Contacts> result=[];
     if(enterKeyword.isEmpty){
       result=_list;

    }else{
       result=_list.where((user) => user.Name.toLowerCase().contains(enterKeyword.toLowerCase())).toList();
     }
     setState(() {
       _founduser=result;
     });
    }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: new AppDrawer(
      ),
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(

        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text('Main', style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w600
        ),),
        leading: IconButton(
          onPressed: () {
           _scaffoldKey.currentState?.openDrawer();
          },
          icon: const Icon(Icons.menu, color: Colors.purple,
            size: 20,),
        ),
        actions: [

          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.lock_outline_rounded, color: Colors.purple,
              size: 20,),
          )
        ],


      ),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.all(20),
            width: MediaQuery
                .of(context)
                .size
                .width,
            height: 50,
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.purple,

              ),
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,

            ),
            child: TextField(
              controller: textEditingController,
              onChanged: (value) => _runfilter(value),
              cursorColor: Colors.black,
              showCursor: true,
              decoration: InputDecoration(
                  hintText: 'Search',
                  contentPadding: EdgeInsets.only(top: 20),

                  prefixIcon: Icon(Icons.search, color: Colors.purple,),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide.none
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide.none
                  )

              ),

            ),
          ),
          Expanded(child: ListView.builder(
              itemCount: _founduser.length,
              itemBuilder: (context, index) {
                return Card(
                  elevation: 10,
                  margin: EdgeInsets.only(left: 20, right: 20),
                  color: Colors.white,
                  child: Container(

                    padding: EdgeInsets.all(10),
                    height: 100,
                    child: Row(

                      children: [
                        Container(
                          height: 60,
                          width: 60,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.purple,

                          ),
                          child: Center(child: Text(
                            _founduser[index].Name.substring(0, 1),
                            style: TextStyle(color: Colors.white),)),

                        ),
                        SizedBox(width: 20),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(_founduser[index].Name,
                              style: TextStyle(color: Colors.black,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16
                              ),

                            ),
                            SizedBox(height: 5),

                            Text(_founduser[index].PhoneNo)
                          ],
                        ),
                        SizedBox(width: 50),
                        PopupMenuButton(
                            child: Icon(Icons.more_vert,

                            ),
                            itemBuilder: (context) {
                              return [
                                PopupMenuItem(child:

                                ListTile(
                                  onTap: () {
                                    Navigator.push(context, MaterialPageRoute(builder: (_)=>ContactDetail(index: index, contact: _list,)));
                                  },
                                  trailing: Icon(Icons.edit),
                                  title: Text("Edit"),
                                )
                                ),
                                PopupMenuItem(child: ListTile(
                                  trailing: Icon(Icons.delete),
                                  title: Text("Delete"),
                                ))
                              ];
                            }
                        ),

                        SizedBox(width: 10),
                        IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.call,)
                          , color: Colors.purple,),


                      ],
                    ),
                  ),
                );
              }))
        ],
      ),
    );
  }
}
class AppDrawer extends StatefulWidget {
  @override
  _AppDrawerState createState() => new _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      child: new Drawer(
        child: Container(
          color: Colors.purple,
          child: ListView(
            padding: EdgeInsets.all(10.0),
            children: [
              ListTile(
                leading: Icon(Icons.home, color: Colors.white,),
                title: Text('Home',style: TextStyle(color: Colors.white),),
              ),
              ListTile(
                leading: Icon(Icons.person, color: Colors.white,),
                title: Text('Profile',style: TextStyle(color: Colors.white),),
              ),
              ListTile(
                leading: Icon(Icons.phone, color: Colors.white,),
                title: Text('Contact',style: TextStyle(color: Colors.white),),
              ),
              ListTile(
                leading: Icon(Icons.settings, color: Colors.white,),
                title: Text('Setting',style: TextStyle(color: Colors.white),),
              ),
              ListTile(
                leading: Icon(Icons.help_outline, color: Colors.white,),
                title: Text('Help',style: TextStyle(color: Colors.white),),
              ),
            ],
          ),
        ),
      ),
    );
  }
}