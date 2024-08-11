// ignore_for_file: unnecessary_, prefer_const_literals_to_create_immutables, prefer_const_constructors, avoid_print, await_only_futures

import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'package:practice/core/theme/colors.dart';


import 'package:practice/feature/profile/edit_user_profile.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final url = "http://192.168.1.66:3002/api/userProfile";
  Map<String, dynamic>? profileData;

  Future<void> fetchProfileData() async {
    final prefs = await SharedPreferences.getInstance();
    String? token = await prefs.getString('token');
    if (token == null) {
      return;
    }
    final response = await http.get(
      Uri.parse(url),
      headers: {
        'Authorization': 'Bearer $token',
      },
    );
    print(response.toString());

    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body) as Map<String, dynamic>;

      print('request successful: $jsonData');
      setState(() {
        profileData = jsonData;
      });

      print('request successful: ${profileData?['user']['name']}');
    } else {
      print('request failed:${response.statusCode}');
    }
  }

  // Future fetchProfileData() async {
  //   try {
  //     final response = await http.get(
  //       Uri.parse(url),
  //     );
  //     print(response.body);
  //     final jsonData = jsonDecode(response.body) as Map<String, dynamic>;

  //     setState(() {
  //       profileData = jsonData;
  //     });
  //     print(response.body);
  //   } catch (e) {
  //     throw Exception(e);
  //   }
  // }

  @override
  void initState() {
    super.initState();
    fetchProfileData();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: buttonColor,
        elevation: 0,
        title: Text(
          'Profile',
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          IconButton(
            onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => EditUserProfile(),
                )),
            icon: Icon(
              Icons.edit_outlined,
              color: Colors.white,
            ),
          ),
        ],
      ),
      // body: Column(
      //   children: [
      //     Container(
      //       width: double.infinity,
      //       color: buttonColor,
      //       child: Column(
      //         children: [
      //           CircleAvatar(
      //             radius: 60,
      //             backgroundImage: AssetImage('assets/images/prof.png'),
      //           ),
      //           SizedBox(height: 8),
      //           Text(
      //             profileData?['name'] ?? 'name',
      //           ),
      //         ],
      //       ),
      //     ),
      //     Gap(23),
      //     ProfileItem(
      //         title: 'Name', value: profileData?['user']['name'] ?? 'name'),
      //     ProfileItem(
      //         title: 'Location',
      //         value: profileData?['user']['location'] ?? 'location'),
      //     ProfileItem(
      //         title: 'Email', value: profileData?['user']['email'] ?? 'email'),
      //     ProfileItem(
      //         title: 'Contact',
      //         value: profileData?['user']['contact'] ?? 'contact'),
      //   ],
      // ),

      body: Column(
        children: [
          Container(
            width: double.infinity,
            color: buttonColor,
            child: Column(
              children: [
                CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage('assets/images/prof.png'),
                ),
                SizedBox(height: 8),
                Text(
                  profileData?['user']['name'] ?? 'name',
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Container(
              // height: 200,
              width: size.width,
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  DataTable(
                      dividerThickness: 1,
                      headingRowHeight: 0,
                      columnSpacing: 80,
                      columns: [
                        DataColumn(label: Text('')),
                        DataColumn(label: Text(''))
                      ],
                      rows: [
                        DataRow(cells: [
                          DataCell(
                            Text('Name'),
                          ),
                          DataCell(
                            Text(profileData?['user']['name'] ?? 'name'),
                          )
                        ]),
                        DataRow(cells: [
                          DataCell(
                            Text('Email'),
                          ),
                          DataCell(
                            Text(profileData?['user']['email'] ?? 'email'),
                          )
                        ]),
                        DataRow(cells: [
                          DataCell(
                            Text('Contact'),
                          ),
                          DataCell(
                            Text(profileData?['user']['contact'] ?? 'contact'),
                          )
                        ]),
                        DataRow(cells: [
                          DataCell(
                            Text('Location'),
                          ),
                          DataCell(
                            Text(
                                profileData?['user']['location'] ?? 'location'),
                          )
                        ])
                      ])
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
