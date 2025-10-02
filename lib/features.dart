import 'package:TaskFlow/components/Materialbuttonauth.dart';
import 'package:flutter/material.dart';
import 'package:TaskFlow/components/Materialbuttonstart.dart';
import 'package:TaskFlow/components/containerstartpages.dart';
import 'package:TaskFlow/components/featuressentence.dart';

class Features extends StatefulWidget {
  @override
  _FeaturesState createState() => _FeaturesState();
}

class _FeaturesState extends State<Features> {
  PageController controller = PageController();
  int currentPage = 0;
  void nextPage() {
    setState(() {
      currentPage++;
    });
    controller.animateToPage(
      currentPage,
      duration: Duration(milliseconds: 400),
      curve: Curves.easeInQuad,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children: [
          Column(
            children: [
              Container(
                height: 820,
                child: PageView(
                  physics: NeverScrollableScrollPhysics(),
                  controller: controller,
                  children: [
                    Column(
                      children: [
                        Image.asset("images/image.png", fit: BoxFit.fill),
                        Text(
                          "All-in-One Task Management",
                          style: TextStyle(
                            fontSize: 26,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        Container(height: 30),
                        FeaturesSentence(text: "Organize tasks effortlessly."),
                        Container(height: 20),
                        FeaturesSentence(
                          text: "Manage projects with your team.",
                        ),
                        Container(height: 20),
                        FeaturesSentence(
                          text: "Get AI-powered task Suggestions.",
                        ),
                        Container(height: 40),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ContainerStartPages(color: Colors.blue),
                            ContainerStartPages(color: Colors.grey[300]!),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 35,
                            vertical: 20,
                          ),
                          child: MaterialButtonStart(
                            onPressed: () {
                              nextPage();
                            },
                            title: "Explore features    ",
                            icon: Icons.arrow_forward,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset(
                          height: 400,
                          "images/continue.png",
                          fit: BoxFit.cover,
                        ),
                        Text(
                          " Your Productivity, Our Priority",
                          style: TextStyle(
                            fontSize: 26,
                            fontWeight: FontWeight.w700,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        Container(height: 10),
                        FeaturesSentence(
                          text: "We help you achieve your goals .",
                        ),
                        Container(height: 20),
                        FeaturesSentence(text: "with powerful tools."),
                        Container(height: 20),
                        FeaturesSentence(
                          text: "Your data is secure and always ",
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 30),
                          child: Text(
                            "accessible.",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                        Container(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ContainerStartPages(color: Colors.grey[300]!),
                            ContainerStartPages(color: Colors.blue),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 30),
                          child: Container(
                            width: 600,
                            child: MaterialButtonAuth(
                              onPressed: () {
                                Navigator.of(context).pushNamed('authpage');
                              },
                              title: "Continue",
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
