import 'dart:async';
import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:health_app/ui/views/main_view/home_view/shared_grideview_view.dart';

import '../../../shared/custom_widget/Custom_Text.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {

  ScrollController _scrollController = ScrollController();
  Timer? _timer;
  int _currentIndex = 0;
  List<String> trt = [];
  List<String> TextHealthy = [];

  List<int> randomImageIndex=[];
  List<int> generateUniqueRandomNumber() {
    var random = Random();
    while (randomImageIndex.length < 3) {
      var randomNumber = random.nextInt(17);
      if (!randomImageIndex.contains(randomNumber)) {
        randomImageIndex.add(randomNumber);
      }
    }
    return randomImageIndex;
  }

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  bool isFlipCard = false;
  int isListFlipBackCard = 0;

  @override
  Widget build(BuildContext context) {
    return  ListView(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 40, bottom: 10, top: 0),
          child:
          NeumorphicText(
            'The news of healthy',
            textAlign: TextAlign.start,
            style: NeumorphicStyle(
              depth: 4, //customize depth here
              color: Colors.black54, //customize color here
            ),
            textStyle: NeumorphicTextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal:20),
          child: Neumorphic(
            style: NeumorphicStyle(
                depth: -10,
                intensity:5,
                boxShape: NeumorphicBoxShape.beveled(BorderRadius.circular(10))
            ),
            padding: EdgeInsets.symmetric(horizontal:5, vertical: 10),
            child: SingleChildScrollView(
              controller: _scrollController,
              scrollDirection: Axis.horizontal,
              child: SizedBox(
                height: 220,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  physics: const BouncingScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: 3,
                  addAutomaticKeepAlives: true,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 15),
                      child: Row(mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              width: 300,
                              height: 300,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage("images/pic${generateUniqueRandomNumber()[index]}.jpg"),
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                          ]),
                    );
                  },
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        SharedGridviewView(
          text: TextHealthy[0][0],
          listOfText: CustomText(
            colorText:  Colors.black54,
            fontSizeText: 20,
            text: TextHealthy[0][1],
          ),
        ),
        SharedGridviewView(
          text: TextHealthy[1][0],
          listOfText: CustomText(
            colorText:  Colors.black54,
            fontSizeText: 20,
            text: TextHealthy[1][1],
          ),
        ),
        SharedGridviewView(
          text: TextHealthy[2][0],
          listOfText: CustomText(
            colorText: Colors.black54,
            fontSizeText: 20,
            text: TextHealthy[2][1],
          ),
        ),
        SharedGridviewView(
          text: TextHealthy[3][0],
          listOfText: CustomText(
            colorText: Colors.black54,
            fontSizeText: 20,
            text: TextHealthy[3][1],
          ),
        ),
        SharedGridviewView(
          text: TextHealthy[4][0],
          listOfText: CustomText(
            colorText: Colors.black54,
            fontSizeText: 20,
            text: TextHealthy[4][1],
          ),
        ),


      ],
    );

  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 4), (timer) {
      if (_currentIndex < randomImageIndex.length - 1) {
        _currentIndex++;
      } else {
        _currentIndex = 0;
      }
      _scrollController.animateTo(
        _currentIndex * 300.0,
        duration: const Duration(seconds: 1),
        curve: Curves.easeOutCirc,
      );
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}

