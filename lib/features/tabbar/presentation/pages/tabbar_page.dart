import 'package:flutter/material.dart';

class TabbarPage extends StatefulWidget {
  const TabbarPage({Key? key}) : super(key: key);

  @override
  _TabbarPageState createState() => _TabbarPageState();
}

class _TabbarPageState extends State<TabbarPage> with TickerProviderStateMixin{
  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }
  late final _tabController = TabController(length: 3, vsync: this);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("TabBar View"),),
      body: SafeArea(
        child: Column(
          children: [
            Container(height: 50,
            color: Colors.grey,),
            Container(
              child: Align(
                alignment: Alignment.centerLeft,
                child: TabBar(
                  controller: _tabController,
                  //isScrollable: true,
                  labelColor: Colors.deepOrange,
                  indicatorColor: Colors.blue,
                  unselectedLabelColor: Colors.grey,
                  labelPadding: const EdgeInsets.only(left: 20,right: 20),
                  padding: const EdgeInsets.only(bottom: 10,),
                  indicator: const CircleTabIndicator(color: Colors.deepOrange,radius: 4),
                  tabs: const [
                    Tab(text: "Tab 1",),
                    Tab(text: "Tab 2",),
                    Tab(text: "Tab 3",)
                  ],
                ),
              ),
            ),
            Expanded(
              child: SizedBox(
                // height: 400,
                width: double.maxFinite,
                child:  TabBarView(
                  controller: _tabController,
                  children:  [
                    SingleChildScrollView(
                      child: Container(
                        height: 800,
                          color: Colors.blue,
                          child: const Center(child: Text("Tab 1 Data"))),
                    ),
                    SingleChildScrollView(
                      child: Container(
                        height: 1500,
                          color: Colors.blueGrey,
                          child: const Center(child: Text("Tab 2 Data"))),
                    ),
                    const Center(child: Text("Tab 3 Data")),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

///***********************Circle indicator -start**********
class CircleTabIndicator extends Decoration {
  final Color color;
  final double radius;

  const CircleTabIndicator({required this.color, required this.radius});
  //override createBoxPainter
  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    return CirclePainter(radius: radius, color: color);
  }
}

class CirclePainter extends BoxPainter {
  final double radius;
  late Color color;
  CirclePainter({required this.radius,required this.color});
  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration cfg) {
    late Paint _paint;
    _paint = Paint()..color = color;
    _paint = _paint..isAntiAlias = true;
    final Offset circleOffset = offset + Offset(cfg.size!.width/2,cfg.size!.height-radius);
    canvas.drawCircle(circleOffset, radius, _paint);
  }}
///***********************Circle indicator -end************
