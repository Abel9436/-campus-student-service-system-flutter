import 'package:flutter/material.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:servisify/pages/loginn.dart';
import 'package:servisify/pages/student_pages/laundary_serviece.dart';
import 'package:servisify/pages/student_pages/side_hussle.dart';
import 'package:servisify/pages/student_pages/student_food_dash_board.dart';
import 'package:servisify/users_page/user-students-page.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({super.key});

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  final List<String> items = [
    'Food Delivary',
    'Loundary',
    'Side Hustle Opportunities',
  ];
  final List<String> profiles = [
    'Profile',
    'Orders',
    'NOtification',
    'Logout',
  ];
  String? selectedValue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: Image.asset('assets/menu-removebg-preview.png'),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            );
          },
        ),
        iconTheme: IconThemeData(color: Color.fromARGB(255, 177, 177, 177)),
        backgroundColor: Colors.black,
      ),
      drawer: Drawer(
        width: MediaQuery.of(context).size.width / 4.9,
        child: Padding(
          padding: const EdgeInsets.all(0),
          child: ListView(
            children: [
              DrawerHeader(
                decoration:
                    BoxDecoration(color: Color.fromARGB(255, 54, 52, 52)),
                child: Column(
                  children: [
                    Center(
                      child: CircleAvatar(
                        backgroundImage: AssetImage('assets/OIP.jpg'),
                      ),
                    ),
                    Text(
                      'data',
                      style: TextStyle(color: Colors.white),
                    )
                  ],
                ),
              ),
              ListTile(
                tileColor: Color.fromARGB(255, 187, 185, 185),
                onTap: () {},
                iconColor: const Color.fromARGB(255, 255, 255, 255),
                hoverColor: Color.fromARGB(255, 153, 221, 233),
                shape: BeveledRectangleBorder(
                    borderRadius: BorderRadius.circular(8)),
                leading: Icon(color: Colors.black, Icons.update),
                title: Text('Update Profile'),
              ),
              SizedBox(
                height: 10,
              ),
              ListTile(
                tileColor: Color.fromARGB(255, 187, 185, 185),
                onTap: () {},
                iconColor: const Color.fromARGB(255, 255, 255, 255),
                hoverColor: Color.fromARGB(255, 153, 221, 233),
                shape: BeveledRectangleBorder(
                    borderRadius: BorderRadius.circular(8)),
                leading: Icon(Icons.wallet, color: Colors.black),
                title: Text('Integrate Wallet'),
              ),
              SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
        backgroundColor: Color.fromARGB(255, 111, 111, 111),
      ),
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.only(left: 20, top: 20),
        child: Container(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 200.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      DropdownButtonHideUnderline(
                        child: DropdownButton2<String>(
                          isExpanded: true,
                          hint: const Row(
                            children: [
                              Icon(
                                Icons.list,
                                size: 16,
                                color: Color.fromARGB(255, 255, 255, 255),
                              ),
                              SizedBox(
                                width: 4,
                              ),
                              Expanded(
                                child: Text(
                                  'Select Serviece',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromARGB(255, 255, 255, 255),
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                          items: items
                              .map((String item) => DropdownMenuItem<String>(
                                    value: item,
                                    child: Text(
                                      item,
                                      style: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ))
                              .toList(),
                          value: selectedValue,
                          onChanged: (String? value) {
                            setState(() {
                              selectedValue = value;
                              if (selectedValue == 'Loundary') {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const LaundaryServiece()),
                                );
                              }
                              if (selectedValue == 'Food Delivary') {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => FoodDelivary()),
                                );
                              }
                              if (selectedValue ==
                                  'Side Hustle Opportunities') {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => SideHustles()),
                                );
                              }
                            });
                          },
                          buttonStyleData: ButtonStyleData(
                            height: 50,
                            width: 160,
                            padding: const EdgeInsets.only(left: 14, right: 14),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(14),
                              border: Border.all(
                                color: Color.fromARGB(182, 255, 255, 255),
                              ),
                              color: Color.fromARGB(255, 107, 167, 179),
                            ),
                            elevation: 2,
                          ),
                          iconStyleData: const IconStyleData(
                            icon: Icon(
                              Icons.arrow_drop_down_circle_outlined,
                            ),
                            iconSize: 14,
                            iconEnabledColor:
                                Color.fromARGB(255, 255, 255, 255),
                            iconDisabledColor: Colors.grey,
                          ),
                          dropdownStyleData: DropdownStyleData(
                            maxHeight: 200,
                            width: 200,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(14),
                              color: const Color.fromARGB(255, 111, 110, 110),
                            ),
                            offset: const Offset(-20, 0),
                            scrollbarTheme: ScrollbarThemeData(
                              radius: const Radius.circular(40),
                              thickness: MaterialStateProperty.all<double>(6),
                              thumbVisibility:
                                  MaterialStateProperty.all<bool>(true),
                            ),
                          ),
                          menuItemStyleData: const MenuItemStyleData(
                            height: 40,
                            padding: EdgeInsets.only(left: 14, right: 14),
                          ),
                        ),
                      ),
                      TextButton(
                          onPressed: () {},
                          child: Text('About Us',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold))),
                      TextButton(
                          onPressed: () {},
                          child: Text('Contact US',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold))),
                      Column(
                        children: [
                          CircleAvatar(
                            child: Text('A'),
                            backgroundColor: Color.fromARGB(255, 5, 198, 215),
                          ),
                          DropdownButtonHideUnderline(
                            child: DropdownButton2<String>(
                              isExpanded: true,
                              hint: const Row(
                                children: [
                                  Icon(
                                    Icons.account_circle,
                                    size: 20,
                                    color: Color.fromARGB(255, 255, 255, 255),
                                  ),
                                  SizedBox(
                                    width: 4,
                                  ),
                                  Expanded(
                                    child: Text(
                                      'Profile',
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                        color:
                                            Color.fromARGB(255, 255, 255, 255),
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ],
                              ),
                              items: profiles
                                  .map(
                                      (String item) => DropdownMenuItem<String>(
                                            value: item,
                                            child: Text(
                                              item,
                                              style: const TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white,
                                              ),
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ))
                                  .toList(),
                              value: selectedValue,
                              onChanged: (String? value) {
                                setState(() {
                                  selectedValue = value;
                                  if (selectedValue == 'Loundary') {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const LaundaryServiece()),
                                    );
                                  }
                                  if (selectedValue == 'Food Delivary') {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => FoodDelivary()),
                                    );
                                  }
                                  if (selectedValue ==
                                      'Side Hustle Opportunities') {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => SideHustles()),
                                    );
                                  }
                                });
                              },
                              buttonStyleData: ButtonStyleData(
                                height: 50,
                                width: 160,
                                padding:
                                    const EdgeInsets.only(left: 14, right: 14),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(14),
                                  border: Border.all(
                                    color: Color.fromARGB(182, 255, 255, 255),
                                  ),
                                  color: Color.fromARGB(255, 107, 167, 179),
                                ),
                                elevation: 2,
                              ),
                              iconStyleData: const IconStyleData(
                                icon: Icon(
                                  Icons.arrow_drop_down_circle_outlined,
                                ),
                                iconSize: 14,
                                iconEnabledColor:
                                    Color.fromARGB(255, 255, 255, 255),
                                iconDisabledColor: Colors.grey,
                              ),
                              dropdownStyleData: DropdownStyleData(
                                maxHeight: 200,
                                width: 200,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(14),
                                  color:
                                      const Color.fromARGB(255, 111, 110, 110),
                                ),
                                offset: const Offset(-20, 0),
                                scrollbarTheme: ScrollbarThemeData(
                                  radius: const Radius.circular(40),
                                  thickness:
                                      MaterialStateProperty.all<double>(6),
                                  thumbVisibility:
                                      MaterialStateProperty.all<bool>(true),
                                ),
                              ),
                              menuItemStyleData: const MenuItemStyleData(
                                height: 40,
                                padding: EdgeInsets.only(left: 14, right: 14),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 200.0),
                  child: Text(
                    'Your Profile',
                    style: TextStyle(
                        color: const Color.fromARGB(255, 255, 255, 255),
                        fontSize: 35),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Padding(
                    padding: const EdgeInsets.all(50),
                    child: Container(
                      height: MediaQuery.of(context).size.height / 1.1,
                      width: MediaQuery.of(context).size.width / 1.5,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 106, 106, 106),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(70.0),
                        child: Column(
                          children: [
                            Center(
                              child: Text(
                                'Update Profile',
                                style: TextStyle(
                                    color: const Color.fromARGB(
                                        255, 255, 255, 255),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 25),
                              ),
                            ),
                            SizedBox(
                              height: 60,
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: TextField(
                                    style: TextStyle(color: Colors.white),
                                    decoration: InputDecoration(
                                      hintText: 'Enter Your Full name',
                                      border: OutlineInputBorder(),
                                      filled: true,
                                      fillColor:
                                          Color.fromARGB(255, 156, 156, 156),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 30,
                                ),
                                Expanded(
                                  child: TextField(
                                    style: TextStyle(color: Colors.white),
                                    decoration: InputDecoration(
                                      hintText: 'Enter Your Email',
                                      border: OutlineInputBorder(),
                                      filled: true,
                                      fillColor:
                                          Color.fromARGB(255, 156, 156, 156),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 40),
                            Row(
                              children: [
                                Expanded(
                                  child: TextField(
                                    style: TextStyle(color: Colors.white),
                                    decoration: InputDecoration(
                                      hintText: 'Enter Your Phone Number(+251)',
                                      border: OutlineInputBorder(),
                                      filled: true,
                                      fillColor:
                                          Color.fromARGB(255, 156, 156, 156),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 30,
                                ),
                                Expanded(
                                  child: TextField(
                                    style: TextStyle(color: Colors.white),
                                    decoration: InputDecoration(
                                      hintText: 'Enter Your Dorm Room Number',
                                      border: OutlineInputBorder(),
                                      filled: true,
                                      fillColor:
                                          Color.fromARGB(255, 156, 156, 156),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 40),
                            Row(
                              children: [
                                Expanded(
                                  child: TextField(
                                    style: TextStyle(color: Colors.white),
                                    decoration: InputDecoration(
                                      hintText: 'Enter Your ID',
                                      border: OutlineInputBorder(),
                                      filled: true,
                                      fillColor:
                                          Color.fromARGB(255, 156, 156, 156),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 30,
                                ),
                                Expanded(
                                  child: TextField(
                                    style: TextStyle(color: Colors.white),
                                    decoration: InputDecoration(
                                      hintText: 'Enter Your Block Number',
                                      border: OutlineInputBorder(),
                                      filled: true,
                                      fillColor: const Color.fromARGB(
                                          255, 156, 156, 156),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Row(
                              children: [
                                Text('In Which Dormitary You Are ?',
                                    style: TextStyle(
                                        color: const Color.fromARGB(
                                            255, 255, 255, 255),
                                        fontSize: 15)),
                              ],
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            TextButton(
                              onPressed: () {},
                              child: Container(
                                child: Center(
                                    child: Text(
                                  'Update',
                                  style: TextStyle(
                                      color: const Color.fromARGB(
                                          255, 255, 255, 255),
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                )),
                                width: 300,
                                height: 60,
                                decoration: BoxDecoration(
                                    color: Color.fromARGB(255, 99, 174, 189),
                                    borderRadius: BorderRadius.circular(10)),
                              ),
                            )
                          ],
                        ),
                      ),
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}