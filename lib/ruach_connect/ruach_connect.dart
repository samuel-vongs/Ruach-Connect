import 'package:fintech_app/ruach_connect/music_screen.dart';
import 'package:fintech_app/ruach_connect/prayer_charge.dart';
import 'package:fintech_app/ruach_connect/sounds_screen.dart';
import 'package:fintech_app/screens/edit_profile.dart';
import 'package:fintech_app/services/auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class RuachConnectScreen extends StatefulWidget {
  const RuachConnectScreen({super.key});

  @override
  State<RuachConnectScreen> createState() => _RuachConnectScreenState();
}

class _RuachConnectScreenState extends State<RuachConnectScreen> {
  int _selectedIndex = 0; // For bottom navigation bar

  // Bottom navigation bar items
  static const List<Widget> _widgetOptions = <Widget>[
    HomeContent(), // Main home content
    SoundsScreen(), // Replace with dynamic userId
    MusicScreen(),
    PrayerCharge(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    Provider.of<User?>(context);

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: _widgetOptions.elementAt(_selectedIndex),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.grey.shade800,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.surround_sound),
              label: 'Sounds',
            ),
            BottomNavigationBarItem(
              icon: Icon(FontAwesomeIcons.music),
              label: 'Music',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.power),
              label: 'Prayer chants',
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.deepOrange,
          unselectedItemColor: Colors.grey.shade500,
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}

class HomeContent extends StatefulWidget {
  const HomeContent({super.key});

  @override
  _HomeContentState createState() => _HomeContentState();
}

class _HomeContentState extends State<HomeContent>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  Map<String, String>? userData;

  Future<void> fetchUserData() async {
    final authService = Provider.of<AuthService>(context, listen: false);
    final userDetails = await authService.fetchCredentialsFromFirestore();
    if (userDetails != null) {
      setState(() {
        userData = userDetails;
      });
    }
  }

  final _advancedDrawerController = AdvancedDrawerController();

  @override
  void initState() {
    super.initState();
    fetchUserData();
    _tabController = TabController(length: 2, vsync: this);
    _tabController.addListener(() {
      if (_tabController.indexIsChanging) {
        resetInputs();
      }
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void resetInputs() {
    setState(() {});
  }

  List<Map<String, String>> sermons = [
    {
      'title': 'Separated Unto God - 2024',
      'preacher': 'Apostle Arome Osayi',
      'likes': '4',
      'plays': '1',
      'downloads': '2',
    },
    {
      'title': 'Exploring God',
      'preacher': 'Apostle Arome Osayi',
      'likes': '6',
      'plays': '1',
      'downloads': '7',
    },
    {
      'title': 'Ways of Altars',
      'preacher': 'Apostle Arome Osayi',
      'likes': '7',
      'plays': '1',
      'downloads': '3',
    },
    {
      'title': 'Exploring God',
      'preacher': 'Apostle Arome Osayi',
      'likes': '6',
      'plays': '1',
      'downloads': '7',
    },
    {
      'title': 'Ways of Altars',
      'preacher': 'Apostle Arome Osayi',
      'likes': '7',
      'plays': '1',
      'downloads': '3',
    },
    {
      'title': 'Exploring God',
      'preacher': 'Apostle Arome Osayi',
      'likes': '6',
      'plays': '1',
      'downloads': '7',
    },
    {
      'title': 'Ways of Altars',
      'preacher': 'Apostle Arome Osayi',
      'likes': '7',
      'plays': '1',
      'downloads': '3',
    },
    {
      'title': 'Exploring God',
      'preacher': 'Apostle Arome Osayi',
      'likes': '6',
      'plays': '1',
      'downloads': '7',
    },
    {
      'title': 'Ways of Altars',
      'preacher': 'Apostle Arome Osayi',
      'likes': '7',
      'plays': '1',
      'downloads': '3',
    },
    {
      'title': 'Exploring God',
      'preacher': 'Apostle Arome Osayi',
      'likes': '6',
      'plays': '1',
      'downloads': '7',
    },
    {
      'title': 'Ways of Altars',
      'preacher': 'Apostle Arome Osayi',
      'likes': '7',
      'plays': '1',
      'downloads': '3',
    },
    // Add more sermons here...
  ];

  List<Map<String, String>> preachers = [
    {
      'preacher': 'Apostle Arome Osayi',
      'number': '908',
    },
    {
      'preacher': 'Apostle Benjamin Borno',
      'number': '708',
    },
    {
      'preacher': 'Apostle Gideon Odoma',
      'number': '890',
    },
  ];

  @override
  Widget build(BuildContext context) {
    Provider.of<User?>(context);

    return SafeArea(
      child: AdvancedDrawer(
        backdrop: Container(
          color: Colors.grey.shade900,
        ),
        drawer: Drawer(
          backgroundColor: Colors.black,
          child: Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipOval(
                      clipBehavior: Clip.hardEdge,
                      child: Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: Colors.deepOrange,
                            width: 2,
                          ),
                          image: DecorationImage(
                            image: AssetImage(
                              'assets/header.jpg',
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Samuel Vongs',
                      style: GoogleFonts.roboto().copyWith(
                          fontSize: 14,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'User name',
                      style: GoogleFonts.roboto().copyWith(
                        fontSize: 14,
                        color: Colors.grey.shade500,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Text(
                          '0 ',
                          style: GoogleFonts.roboto().copyWith(
                              fontSize: 14,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'Following',
                          style: GoogleFonts.roboto().copyWith(
                            fontSize: 12,
                            color: Colors.grey.shade500,
                          ),
                        ),
                        SizedBox(
                          width: 30,
                        ),
                        Text(
                          '0 ',
                          style: GoogleFonts.roboto().copyWith(
                              fontSize: 14,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'Followers',
                          style: GoogleFonts.roboto().copyWith(
                            fontSize: 12,
                            color: Colors.grey.shade500,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Divider(
                color: Colors.grey.shade900,
                height: 2,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, '/user-profile');
                      },
                      child: Row(
                        children: [
                          Icon(
                            Icons.person_2_outlined,
                            color: Colors.grey.shade500,
                            size: 30,
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Text(
                            'Profile',
                            style: GoogleFonts.roboto().copyWith(
                                fontSize: 14,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, '/notifications');
                      },
                      child: Row(
                        children: [
                          Icon(
                            Icons.link,
                            color: Colors.grey.shade500,
                            size: 30,
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Text(
                            'Copy Profile Link',
                            style: GoogleFonts.roboto().copyWith(
                                fontSize: 14,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    GestureDetector(
                      onTap: _navigateToEditProfile,
                      child: Row(
                        children: [
                          Icon(
                            Icons.edit,
                            color: Colors.grey.shade500,
                            size: 30,
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Text(
                            'Edit Profile',
                            style: GoogleFonts.roboto().copyWith(
                                fontSize: 14,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, '/settings');
                      },
                      child: Row(
                        children: [
                          Icon(
                            Icons.settings,
                            color: Colors.grey.shade500,
                            size: 30,
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Text(
                            'Settings',
                            style: GoogleFonts.roboto().copyWith(
                                fontSize: 14,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, '/notifications');
                      },
                      child: Row(
                        children: [
                          Icon(
                            Icons.person_add,
                            color: Colors.grey.shade500,
                            size: 30,
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Text(
                            'Invite Friends',
                            style: GoogleFonts.roboto().copyWith(
                                fontSize: 14,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Divider(
                color: Colors.grey.shade900,
                height: 2,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, '/user-profile');
                      },
                      child: Row(
                        children: [
                          Icon(
                            Icons.wallet,
                            color: Colors.grey.shade500,
                            size: 30,
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Text(
                            'Wallet',
                            style: GoogleFonts.roboto().copyWith(
                                fontSize: 14,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, '/notifications');
                      },
                      child: Row(
                        children: [
                          Icon(
                            Icons.person_add_alt,
                            color: Colors.grey.shade500,
                            size: 30,
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Text(
                            'Community',
                            style: GoogleFonts.roboto().copyWith(
                                fontSize: 14,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    GestureDetector(
                      onTap: _navigateToEditProfile,
                      child: Row(
                        children: [
                          Icon(
                            Icons.file_download,
                            color: Colors.grey.shade500,
                            size: 30,
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Text(
                            'Download Manager',
                            style: GoogleFonts.roboto().copyWith(
                                fontSize: 14,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, '/settings');
                      },
                      child: Row(
                        children: [
                          Icon(
                            Icons.room_service,
                            color: Colors.grey.shade500,
                            size: 30,
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Text(
                            'Customer Support',
                            style: GoogleFonts.roboto().copyWith(
                                fontSize: 14,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Divider(
                color: Colors.grey.shade900,
                height: 2,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, '/user-profile');
                      },
                      child: Row(
                        children: [
                          Icon(
                            Icons.support,
                            color: Colors.grey.shade500,
                            size: 30,
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Text(
                            'Support our Work',
                            style: GoogleFonts.roboto().copyWith(
                                fontSize: 14,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Center(
                      child: Text(
                        'Vongsmusik.org',
                        style: GoogleFonts.roboto().copyWith(
                          fontSize: 8,
                          color: Colors.grey.shade500,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        child: Scaffold(
          backgroundColor: Colors.black,
          appBar: AppBar(
            automaticallyImplyLeading: false,
            toolbarHeight: 80,
            flexibleSpace: Container(
              height: 80,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    'assets/header.jpg',
                  ),
                  fit: BoxFit.cover,
                ),
              ),
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {
                      drawerControl();
                    },
                    icon: Icon(
                      Icons.menu,
                      size: 30,
                      color: Colors.white,
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            'Hi,',
                            style: GoogleFonts.roboto().copyWith(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            userData?['userName'] ?? 'Sammy',
                            style: GoogleFonts.roboto().copyWith(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            '!',
                            style: GoogleFonts.roboto().copyWith(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      Text(
                        'Good morning',
                        style: GoogleFonts.roboto().copyWith(
                          fontSize: 14,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            actions: [
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.search,
                  size: 30,
                  color: Colors.white,
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.message,
                  size: 30,
                  color: Colors.white,
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.notifications_none,
                  size: 30,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Quick links',
                    style: GoogleFonts.roboto().copyWith(
                        fontSize: 14,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  SingleChildScrollView(
                    physics: BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        ElevatedButton.icon(
                          style: ElevatedButton.styleFrom(
                            minimumSize: Size(50, 40),
                            backgroundColor: Colors.grey.shade900,
                            shape: ContinuousRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(16))),
                          ),
                          onPressed: () {},
                          label: Text(
                            'Recent Downloads',
                            style: GoogleFonts.roboto().copyWith(
                              fontSize: 14,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          icon: Icon(
                            Icons.download_rounded,
                            color: Colors.green,
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        ElevatedButton.icon(
                          style: ElevatedButton.styleFrom(
                            minimumSize: Size(50, 40),
                            backgroundColor: Colors.grey.shade900,
                            shape: ContinuousRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(16))),
                          ),
                          onPressed: () {},
                          label: Text(
                            'Upload Sermons',
                            style: GoogleFonts.roboto().copyWith(
                              fontSize: 14,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          icon: Icon(
                            Icons.upload_rounded,
                            color: Colors.yellowAccent,
                          ),
                        ),
                      ],
                    ),
                  ),
                  DefaultTabController(
                    length: 2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TabBar(
                          labelPadding: EdgeInsets.symmetric(horizontal: 10),
                          tabAlignment: TabAlignment.center,
                          dividerColor: Colors.transparent,
                          labelStyle: GoogleFonts.roboto().copyWith(
                            fontSize: 12,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                          physics: BouncingScrollPhysics(),
                          controller: _tabController,
                          indicatorColor: Colors.deepOrange,
                          labelColor: Colors.white,
                          unselectedLabelColor: Colors.grey.shade500,
                          tabs: [
                            Tab(
                              text: 'New Sermons',
                            ),
                            Tab(
                              text: 'Favourite Preachers',
                            ),
                          ],
                        ),
                        SizedBox(height: 20),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 1.3,
                          child: TabBarView(
                            controller: _tabController,
                            children: [
                              ListView.builder(
                                physics: NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemCount: sermons.length,
                                itemBuilder: (context, index) {
                                  return buildNewSermons(
                                    sermons[index]['title'] ?? '',
                                    sermons[index]['preacher'] ?? '',
                                    sermons[index]['likes'] ?? '',
                                    sermons[index]['plays'] ?? '',
                                    sermons[index]['downloads'] ?? '',
                                    Icons.play_circle_fill,
                                    Icons.favorite,
                                    Icons.download_rounded,
                                    Icons.play_arrow,
                                    Icons.more_vert,
                                  );
                                },
                              ),
                              Column(
                                children: [
                                  ListView.builder(
                                    physics: NeverScrollableScrollPhysics(),
                                    shrinkWrap: true,
                                    itemCount: preachers.length,
                                    itemBuilder: (context, index) {
                                      return buildFavouritePreachers(
                                        preachers[index]['preacher'] ?? '',
                                        preachers[index]['number'] ?? '',
                                        ' Sermons',
                                        '  |  ',
                                        Icons.play_circle_fill,
                                      );
                                    },
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  ElevatedButton.icon(
                                    iconAlignment: IconAlignment.end,
                                    onPressed: () {},
                                    label: Text(
                                      'Add More Preachers',
                                      style: GoogleFonts.roboto().copyWith(
                                          fontSize: 12,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    icon: Icon(
                                      FontAwesomeIcons.plus,
                                      color: Colors.white,
                                    ),
                                    style: ElevatedButton.styleFrom(
                                      minimumSize: Size(double.infinity, 50),
                                      backgroundColor: Colors.deepOrange,
                                      shape: ContinuousRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(16)),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildNewSermons(
    String label,
    String label2,
    String label3,
    String label4,
    String label5,
    IconData icon,
    IconData icon2,
    IconData icon3,
    IconData icon4,
    IconData icon5,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          Card(
            clipBehavior: Clip.hardEdge,
            shape: ContinuousRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(16))),
            child: Container(
              height: 70,
              width: 70,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/header.jpg'),
                      fit: BoxFit.cover)),
            ),
          ),
          SizedBox(
            width: 3,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  label,
                  style: GoogleFonts.roboto().copyWith(
                    fontSize: 11,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  softWrap: true,
                  textAlign: TextAlign.start,
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  label2,
                  style: GoogleFonts.roboto().copyWith(
                    fontSize: 10,
                    color: Colors.grey.shade500,
                  ),
                ),
                SizedBox(
                  height: 7,
                ),
                Row(
                  children: [
                    Icon(
                      icon2,
                      size: 16,
                      color: Colors.grey.shade500,
                    ),
                    Text(
                      label3,
                      style: GoogleFonts.roboto().copyWith(
                        fontSize: 10,
                        color: Colors.grey.shade500,
                      ),
                    ),
                    SizedBox(
                      width: 30,
                    ),
                    Icon(
                      icon3,
                      size: 16,
                      color: Colors.grey.shade500,
                    ),
                    Text(
                      label4,
                      style: GoogleFonts.roboto().copyWith(
                        fontSize: 10,
                        color: Colors.grey.shade500,
                      ),
                    ),
                    SizedBox(
                      width: 30,
                    ),
                    Icon(
                      icon4,
                      size: 16,
                      color: Colors.grey.shade500,
                    ),
                    Text(
                      label5,
                      style: GoogleFonts.roboto().copyWith(
                        fontSize: 10,
                        color: Colors.grey.shade500,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(
              icon,
              size: 35,
              color: Colors.deepOrange,
            ),
          ),
          Icon(
            icon5,
            size: 30,
            color: Colors.white,
          ),
        ],
      ),
    );
  }

  Widget buildFavouritePreachers(
    String label,
    String label2,
    String label3,
    String label4,
    IconData icon,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        children: [
          Row(
            children: [
              ClipOval(
                child: Image.asset(
                  'assets/header.jpg',
                  fit: BoxFit.cover,
                  height: 70,
                  width: 70,
                ),
              ),
              SizedBox(
                width: 5,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      label,
                      style: GoogleFonts.roboto().copyWith(
                        fontSize: 11,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      softWrap: true,
                      textAlign: TextAlign.start,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        Text(
                          label2,
                          style: GoogleFonts.roboto().copyWith(
                            fontSize: 10,
                            color: Colors.deepOrange,
                          ),
                        ),
                        Text(
                          label3,
                          style: GoogleFonts.roboto().copyWith(
                            fontSize: 10,
                            color: Colors.grey.shade500,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(
                  icon,
                  size: 35,
                  color: Colors.deepOrange,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void drawerControl() {
    _advancedDrawerController.showDrawer();
  }

  void _navigateToEditProfile() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => EditProfileScreen(
          onProfileUpdated: () {
            fetchUserData();
          },
        ),
      ),
    );
  }
}
