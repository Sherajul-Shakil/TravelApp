import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travel_app_master/core/network_helper/network_helper.dart';
import 'package:travel_app_master/screens/navigation.dart';

import 'home/welcome.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  NetworkHelper networkHelper = Get.put(NetworkHelper());
  @override
  void initState() {
    Timer(
        const Duration(seconds: 5),
        () => Navigator.push(
            context,
            MaterialPageRoute(
                builder: (_) => networkHelper.userToken.isEmpty
                    ? const Welcome()
                    : const NavigationScreen())));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: Container(
          padding: const EdgeInsets.only(bottom: 10),
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/sback.png"), fit: BoxFit.cover)),
          child: Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SizedBox(),
                  Image.asset(
                    "assets/travel_logo.png",
                    scale: 0.5,
                  ),
                  const Text(
                    "Travel Made Simple",
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
