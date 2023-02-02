import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';



class NavDrawer extends StatefulWidget {
  const NavDrawer({
    super.key,

  });

  @override
  _NavDrawerState createState() => _NavDrawerState();
}

class _NavDrawerState extends State<NavDrawer> {
   late SharedPreferences sharedPreferences;
  TextEditingController _controller1 = TextEditingController();
  TextEditingController _controller2 = TextEditingController();

  var formKey = GlobalKey<FormState>();
  var mySharedPrefences;
  late bool switchStateme1;
  bool switchState1 = false;
  late bool switchStateme2;
  bool switchState2 = false;
  @override
  void initState() {
    // checkbuttonStatus();
    setState(() {

    });
    super.initState();
    SharedPreferences.getInstance().then((sf) {
      mySharedPrefences = sf;
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
   // checkbuttonStatus2();
    return Drawer(
      key: formKey,
      child: Container(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(

              child: Text(
                ' menu',
                style: TextStyle(color: Colors.white, fontSize: 25),
              ),
              decoration: BoxDecoration(
                  color: Colors.green,
                  image: DecorationImage(
                      fit: BoxFit.fill,
                      image: AssetImage('assets/image/cover.jpg'))),
            ),
            ListTile(
              leading: Icon(Icons.text_format),
              title: Text('Create New Notpad',
                  style: TextStyle(
                    color:  Colors.white,
                    fontSize: 15,
                  )),
              onTap: () {
                //   Navigator.pushNamed(context, "/Stok_name_search");
              },
              //onTap: () => {},
            ),

            ListTile(
              leading: Icon(Icons.search),
              title: Text('Search Notpad',style: TextStyle(
                color: Colors.white  ,
                fontSize: 15,
              )),
              onTap: ()  {
                Navigator.pushNamed(context, "/Siparis_satis_screen");
              },
              // onTap: () => {Navigator.of(context).pop()},
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Ayarlar',
                  style: TextStyle(
                    color:  Colors.white,
                    fontSize: 15,
                  )),
              onTap: () {
                Navigator.pushNamed(context, "/setting");
              },
              //  onTap: () => {Navigator.of(context).pop()},
            ),
            Padding(
              padding: const EdgeInsets.only(top:40),
              child: Divider(
                height: 15.0,
                thickness: 1.5,
                indent: 30.0,
                endIndent: 20.0,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 6),
              child: SwitchListTile(
                value: switchState1 == null ? switchState1 : switchState1,
                // value: aa,

                onChanged: (deger) {
                  setState(() {
                    // debugPrint("Anlasma onaylandı : $deger");

                 //   Aliskontorol(deger);
                    switchState1 = deger;
                  });
                },
                title: Text("Open Password Page"),
                subtitle: TextFormField(
                  decoration: new InputDecoration(
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
                  ),
                  enabled: false,
                  controller: _controller1,
                  style: TextStyle(fontSize: 14),
                  textAlignVertical: TextAlignVertical.top,
                  onFieldSubmitted: (String anlik1) {},
                ),

                secondary: Icon(Icons.admin_panel_settings),
              ),
            ),


          ],
        ),
      ),
    );
  }



}
