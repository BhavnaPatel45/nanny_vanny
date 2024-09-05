import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/homepage_controller.dart';

class HomePageView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final HomePageController controller = Get.find<HomePageController>();
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          actions: [
            Builder(
              builder: (BuildContext context) {
                return Padding(
                  padding: EdgeInsets.only(right: 30, top: 20),
                  child: IconButton(
                    onPressed: () {
                      Scaffold.of(context).openEndDrawer();
                    },
                    icon: Image.asset('assets/menu_icon.png', height: 15),
                  ),
                );
              },
            ),
          ],
        ),
        endDrawer: Drawer(child:ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      backgroundImage:
                          AssetImage('assets/profile_picture2.png'),
                      radius: 30,
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Emily Cyrus',
                      style: TextStyle(
                        fontFamily: 'AlegreyaSans',
                        fontWeight: FontWeight.w700,
                        fontSize: 20,
                        color: Color(0xffE36DA6),
                      ),
                    ),
                  ],
                ),
              ),
              ListView.builder(
                shrinkWrap: true,
                physics:
                    NeverScrollableScrollPhysics(), // To prevent scrolling inside the drawer
                itemCount: controller.drawerList.length,
                itemBuilder: (context, index) {
                  final item = controller.drawerList[index];
                  return Column(
                    children: [
                      ListTile(
                        title: Text(
                          item['title'] ?? '',
                          style: TextStyle(
                            fontFamily: 'AlegreyaSans',
                            fontWeight: FontWeight.w500,
                            fontSize: 18,
                            color: Color(0xff262F71),
                          ),
                        ),
                      ),
                      const Divider(thickness: 0.5),
                    ],
                  );
                },
              ),
            ],
          )
        ),
        bottomNavigationBar: BottomNavigationBar(
            currentIndex: 0,
            items: [
              BottomNavigationBarItem(
                icon: Image.asset('assets/icon1.png', height: 38, 
                width: 38
                ),
                label: ''
              ),
              BottomNavigationBarItem(
                icon: Image.asset('assets/icon2.png', height: 38, 
                width: 38),
               label: ''
              ),
              BottomNavigationBarItem(
                icon: Image.asset('assets/icon3.png', height: 38, 
                width: 38),
                 label: ''
              ),
              BottomNavigationBarItem(
                icon: Image.asset('assets/icon4.png', height: 38, 
                width: 38),
                 label: ''
              ),
            ],),
        body: Obx(() {
          if (controller.isLoading.value) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (controller.bookingList.isEmpty &&
              controller.packagesList.isEmpty) {
            return Center(
              child: Text(
                'No bookings or packages available.',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey.shade600,
                ),
              ),
            );
          }
          return SingleChildScrollView(
              child: Padding(
                  padding: EdgeInsets.only(left: 30, right: 30),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            const SizedBox(
                              height: 53,
                              width: 53,
                              child: CircleAvatar(
                                backgroundImage:
                                    AssetImage('assets/profile_picture.png'),
                              ),
                            ),
                            const SizedBox(width: 10),
                            RichText(
                              text: const TextSpan(
                                children: [
                                  TextSpan(
                                    text: 'Welcome\n',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontFamily: 'AlegreyaSans',
                                      fontWeight: FontWeight.w700,
                                      color: Color(0xff5C5C5C),
                                    ),
                                  ),
                                  TextSpan(
                                    text: 'Emily Cyrus',
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontFamily: 'AlegreyaSans',
                                      fontWeight: FontWeight.w700,
                                      color: Color(0xffE36DA6),
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 50,
                        ),
                        SizedBox(
                          child: Stack(
                            clipBehavior: Clip.none,
                            children: [
                              Container(
                                height: 170,
                                padding: const EdgeInsets.all(30),
                                decoration: BoxDecoration(
                                  color: Color(0xffF5B5CF),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          const Padding(
                                            padding: EdgeInsets.only(top: 20),
                                            child: const Text(
                                              'Nanny And\nBabysitting Services',
                                              style: TextStyle(
                                                fontSize: 18,
                                                fontFamily: 'AlegreyaSans',
                                                fontWeight: FontWeight.w700,
                                                color: Color(0xff262F71),
                                              ),
                                            ),
                                          ),
                                          const SizedBox(height: 10),
                                          SizedBox(
                                            width: 105,
                                            height: 25,
                                            child: ElevatedButton(
                                              onPressed: () {},
                                              style: ElevatedButton.styleFrom(
                                                backgroundColor:
                                                    Color(0xff262F71),
                                              ),
                                              child: const Text(
                                                'Book Now',
                                                style: TextStyle(
                                                  fontSize: 14,
                                                  fontFamily: 'AlegreyaSans',
                                                  // fontWeight: FontWeight.w700,
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Positioned(
                                left: 10,
                                top: -55,
                                child: Image.asset(
                                  'assets/nanny.png',
                                  fit: BoxFit.cover,
                                  width: 380,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const Text(
                          "Your Current Booking",
                          style: TextStyle(
                            fontSize: 20,
                            fontFamily: 'AlegreyaSans',
                            fontWeight: FontWeight.w700,
                            color: Color(0xff262F71),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),

                        // final booking = controller.bookingList.first;
                        Container(
                            padding: const EdgeInsets.all(15),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(8),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.1),
                                  blurRadius: 10,
                                  offset: const Offset(0, 5),
                                ),
                              ],
                            ),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Text(
                                        "One Day Package",
                                        style: TextStyle(
                                          color: Color(0xffE36DA6),
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                          fontFamily: 'AlegreyaSans',
                                        ),
                                      ),
                                      SizedBox(
                                        height: 25,
                                        width: 80,
                                        child: ElevatedButton(
                                          onPressed: () {},
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor: Color(0xffE36DA6),
                                          ),
                                          child: const Text(
                                            'Start',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 14,
                                              fontWeight: FontWeight.w500,
                                              fontFamily: 'AlegreyaSans',
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),

                                  const Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.only(top: 10),
                                            child: Text("From",
                                                style: TextStyle(
                                                  color: Color(0xff5C5C5C),
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w400,
                                                  fontFamily: 'AlegreyaSans',
                                                )),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        width: 130,
                                      ),
                                      Row(
                                        children: [
                                          Padding(
                                              padding: EdgeInsets.only(top: 10),
                                              child: Text("To",
                                                  style: TextStyle(
                                                    color: Color(0xff5C5C5C),
                                                    fontSize: 15,
                                                    fontWeight: FontWeight.w400,
                                                    fontFamily: 'AlegreyaSans',
                                                  )))
                                        ],
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Image.asset(
                                            'assets/calendar.png',
                                            color: Color(0xffE36DA6),
                                            height: 13,
                                            width: 13,
                                            fit: BoxFit.cover,
                                          ),
                                          const SizedBox(width: 5),
                                          Text(
                                            '${controller.bookingList.first.fromDate}',
                                            style: const TextStyle(
                                              fontSize: 16,
                                              color: Color(0xff5C5C5C),
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(
                                        width: 60,
                                      ),
                                      Row(
                                        children: [
                                          Image.asset(
                                            'assets/calendar.png',
                                            color: Color(0xffE36DA6),
                                            height: 13,
                                            width: 13,
                                            fit: BoxFit.cover,
                                          ),
                                          const SizedBox(width: 5),
                                          Text(
                                            '${controller.bookingList.first.toDate}',
                                            style: const TextStyle(
                                              fontSize: 16,
                                              color: Color(0xff5C5C5C),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),

                                  //
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Image.asset(
                                            'assets/clock.png',
                                            color: Color(0xffE36DA6),
                                            height: 13,
                                            width: 13,
                                            fit: BoxFit.cover,
                                          ),
                                          const SizedBox(width: 5),
                                          Text(
                                            '${controller.bookingList.first.fromTime}',
                                            style: const TextStyle(
                                              fontSize: 16,
                                              color: Color(0xff5C5C5C),
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(
                                        width: 95,
                                      ),
                                      Row(
                                        children: [
                                          Image.asset(
                                            'assets/clock.png',
                                            color: Color(0xffE36DA6),
                                            height: 13,
                                            width: 13,
                                            fit: BoxFit.cover,
                                          ),
                                          const SizedBox(width: 5),
                                          Text(
                                            '${controller.bookingList.first.toTime}',
                                            style: const TextStyle(
                                              fontSize: 16,
                                              color: Color(0xff5C5C5C),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 10),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                        child: SizedBox(
                                          height: 30,
                                          child: ElevatedButton.icon(
                                            onPressed: () {},
                                            style: ElevatedButton.styleFrom(
                                              backgroundColor:
                                                  Color(0xff262F71),
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          20.0)),
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 0),
                                            ),
                                            icon: const Icon(
                                              Icons.star_border,
                                              color: Colors.white,
                                              size: 16.0,
                                            ),
                                            label: const Text(
                                              'Rate Us',
                                              style: TextStyle(
                                                fontSize: 10.0,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 8,
                                      ),
                                      Expanded(
                                        child: SizedBox(
                                          height: 30,
                                          child: ElevatedButton.icon(
                                            onPressed: () {},
                                            style: ElevatedButton.styleFrom(
                                              backgroundColor:
                                                  Color(0xff262F71),
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          20.0)),
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 0),
                                            ),
                                            icon: const Icon(
                                              Icons.location_on,
                                              color: Colors.white,
                                              size: 16.0,
                                            ),
                                            label: const Text(
                                              'Geolocation',
                                              style: TextStyle(
                                                fontSize: 10.0,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 8,
                                      ),
                                      Expanded(
                                        child: SizedBox(
                                          height: 30,
                                          child: ElevatedButton.icon(
                                            onPressed: () {},
                                            style: ElevatedButton.styleFrom(
                                              backgroundColor:
                                                  Color(0xff262F71),
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          20.0)),
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 0),
                                            ),
                                            icon: const Icon(
                                              Icons.mic,
                                              color: Colors.white,
                                              size: 16.0,
                                            ),
                                            label: const Text(
                                              'Survillence',
                                              style: TextStyle(
                                                fontSize: 10.0,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  )
                                ])),

                        const SizedBox(
                          height: 15,
                        ),
                        const Text(
                          'Packages',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                            fontFamily: 'AlegreyaSans',
                            color: Color(0xff262F71),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        ListView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: controller.packagesList.length,
                          itemBuilder: (context, index) {
                            var package = controller.packagesList[index];
                            return Card(
                                color: index % 2 == 0
                                    ? Colors.pink.shade100
                                    : Colors.blue.shade100,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(4),
                                ),
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.all(12),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Image.asset('assets/calendar2.png'),
                                          SizedBox(
                                            width: 105,
                                            height: 25,
                                            child: ElevatedButton(
                                              onPressed: () {},
                                              style: ElevatedButton.styleFrom(
                                                backgroundColor:
                                                    Color(0xffE36DA6),
                                              ),
                                              child: const Text(
                                                'Book Now',
                                                style: TextStyle(
                                                  fontSize: 14,
                                                  fontFamily: 'AlegreyaSans',
                                                  // fontWeight: FontWeight.w700,
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                        padding: EdgeInsets.only(
                                            left: 12, right: 12),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              '${package.title}',
                                              style: const TextStyle(
                                                  fontSize: 16,
                                                  fontFamily: 'AlegreyaSans',
                                                  color: Color(0xff262F71),
                                                  fontWeight: FontWeight.w500),
                                            ),
                                            Text(
                                              '₹ ${package.price}',
                                              style: const TextStyle(
                                                  fontSize: 16,
                                                  fontFamily: 'AlegreyaSans',
                                                  fontWeight: FontWeight.w700,
                                                  color: Color(0xff262F71)),
                                            )
                                          ],
                                        )),
                                    Padding(
                                        padding: const EdgeInsets.only(
                                            left: 12,
                                            right: 12,
                                            top: 4,
                                            bottom: 5),
                                        child: Row(
                                          children: [
                                            Expanded(
                                                child: Text(
                                              '${package.desc}',
                                              style: const TextStyle(
                                                  fontSize: 12,
                                                  fontFamily: 'AlegreyaSans',
                                                  color: Color(0xff262F71),
                                                  fontWeight: FontWeight.w400),
                                              overflow: TextOverflow.ellipsis,
                                              maxLines: 2,
                                            )),
                                          ],
                                        )),
                                    const SizedBox(
                                      height: 15,
                                    )
                                  ],
                                ));
                          },
                        )
                      ])));
        }));
  }
}
