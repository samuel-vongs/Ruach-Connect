import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MusicScreen extends StatefulWidget {
  const MusicScreen({super.key});

  @override
  State<MusicScreen> createState() => _MusicScreenState();
}

class _MusicScreenState extends State<MusicScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  @override
  void initState() {
    super.initState();
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
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.black,
          body: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            child: Column(
              children: [
                Text(
                  'Suggested Artists',
                  style: GoogleFonts.roboto().copyWith(
                      fontSize: 14,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 20,
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  physics: BouncingScrollPhysics(),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        children: [
                          ClipOval(
                            child: Image.asset(
                              'assets/header.jpg',
                              fit: BoxFit.cover,
                              height: 70,
                              width: 70,
                            ),
                          ),
                          Text(
                            'Worship Sounds',
                            style: GoogleFonts.roboto().copyWith(
                              fontSize: 10,
                              color: Colors.white,
                            ),
                            maxLines: 2,
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Column(
                        children: [
                          ClipOval(
                            child: Image.asset(
                              'assets/header.jpg',
                              fit: BoxFit.cover,
                              height: 70,
                              width: 70,
                            ),
                          ),
                          Text(
                            'Beats',
                            style: GoogleFonts.roboto().copyWith(
                              fontSize: 10,
                              color: Colors.white,
                            ),
                            maxLines: 2,
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Column(
                        children: [
                          ClipOval(
                            child: Image.asset(
                              'assets/header.jpg',
                              fit: BoxFit.cover,
                              height: 70,
                              width: 70,
                            ),
                          ),
                          Text(
                            'Beats',
                            style: GoogleFonts.roboto().copyWith(
                              fontSize: 10,
                              color: Colors.white,
                            ),
                            maxLines: 2,
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Column(
                        children: [
                          ClipOval(
                            child: Image.asset(
                              'assets/header.jpg',
                              fit: BoxFit.cover,
                              height: 70,
                              width: 70,
                            ),
                          ),
                          Text(
                            'Beats',
                            style: GoogleFonts.roboto().copyWith(
                              fontSize: 10,
                              color: Colors.white,
                            ),
                            maxLines: 2,
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Column(
                        children: [
                          ClipOval(
                            child: Image.asset(
                              'assets/header.jpg',
                              fit: BoxFit.cover,
                              height: 70,
                              width: 70,
                            ),
                          ),
                          Text(
                            'Beats',
                            style: GoogleFonts.roboto().copyWith(
                              fontSize: 10,
                              color: Colors.white,
                            ),
                            maxLines: 2,
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Column(
                        children: [
                          ClipOval(
                            child: Image.asset(
                              'assets/header.jpg',
                              fit: BoxFit.cover,
                              height: 70,
                              width: 70,
                            ),
                          ),
                          Text(
                            'Loops',
                            style: GoogleFonts.roboto().copyWith(
                              fontSize: 10,
                              color: Colors.white,
                            ),
                            maxLines: 2,
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Column(
                        children: [
                          ClipOval(
                            child: Image.asset(
                              'assets/header.jpg',
                              fit: BoxFit.cover,
                              height: 70,
                              width: 70,
                            ),
                          ),
                          Text(
                            'Instrumental',
                            style: GoogleFonts.roboto().copyWith(
                              fontSize: 10,
                              color: Colors.white,
                            ),
                            maxLines: 2,
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(16),
                        ),
                      ),
                      hintText: 'Search for sounds..',
                      prefixIcon: Icon(
                        Icons.search,
                        size: 30,
                        color: Colors.white,
                      ),
                      filled: true,
                      fillColor: Colors.grey.shade900),
                  style: GoogleFonts.roboto().copyWith(
                    fontSize: 14,
                    color: Colors.white,
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
                            text: 'Latest',
                          ),
                          Tab(
                            text: 'Browse by Categories',
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
                                return buildLatest(
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
                                    return buildBrowseByCategories(
                                      preachers[index]['preacher'] ?? '',
                                      preachers[index]['number'] ?? '',
                                      ' Sermons',
                                      '  |  ',
                                      Icons.play_circle_fill,
                                    );
                                  },
                                ),
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
    );
  }

  Widget buildLatest(
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

  Widget buildBrowseByCategories(
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
}
