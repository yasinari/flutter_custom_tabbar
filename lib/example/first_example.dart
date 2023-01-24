import 'package:flutter/material.dart';
import 'package:flutter_custom_tabbar/custom_tabbar.dart';

class FirstExample extends StatefulWidget {
  const FirstExample({super.key});

  @override
  State<FirstExample> createState() => _FirstExampleState();
}

class _FirstExampleState extends State<FirstExample> {
  final _firstExampleFeatures = _FirstExampleFeatures();

  TabBarLocation _tabBarLocation = TabBarLocation.top;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [_appBarActionButton()],
      ),
      body: Column(
        children: [
          CustomTabBar(
            tabBarItems: _firstExampleFeatures.tabBarItems,
            tabViewItems: _firstExampleFeatures.tabViewItems,
            tabBarLocation: _tabBarLocation,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
            tabBarItemHeight: MediaQuery.of(context).size.height * 0.08,
            tabViewItemHeight: MediaQuery.of(context).size.height * 0.75,
          )
        ],
      ),
    );
  }

  IconButton _appBarActionButton() {
    return IconButton(
        onPressed: () {
          setState(() {
            if (_tabBarLocation == TabBarLocation.top) {
              setState(() {
                _tabBarLocation = TabBarLocation.bottom;
              });
            } else {
              setState(() {
                _tabBarLocation = TabBarLocation.top;
              });
            }
          });
        },
        icon: AnimatedCrossFade(
            firstChild: const Icon(Icons.arrow_circle_down_outlined),
            secondChild: const Icon(Icons.arrow_circle_up_outlined),
            crossFadeState: _tabBarLocation == TabBarLocation.top
                ? CrossFadeState.showFirst
                : CrossFadeState.showSecond,
            duration: const Duration(milliseconds: 200)));
  }
}

class ExampleListView extends StatelessWidget {
  const ExampleListView({super.key});

  final _itemCount = 20;
  final _title = "Lorem ipsum dolor sit amet, consectetur adipiscing elit,";
  final _subTitle =
      "sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco ";
  final _itemExtent = 100.0;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: _itemCount,
      itemExtent: _itemExtent,
      itemBuilder: (context, index) {
        return ListTile(
          leading: const FlutterLogo(),
          title: Text(_title),
          subtitle: Text(
            _subTitle,
            maxLines: 2,
          ),
        );
      },
    );
  }
}

class _FirstExampleFeatures {
  final List<String> tabBarItems = [
    "First",
    "Second",
    "Third",
  ];

  final List<Widget> tabViewItems = [
    const ExampleListView(),
    const ExampleListView(),
    const ExampleListView()
  ];
}
