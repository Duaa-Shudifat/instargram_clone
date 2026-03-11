import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'Authorization.dart';
import 'main_page.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return ProfilePage();
  }
}

class ProfilePage extends StatelessWidget {
  ProfilePage({super.key});

  // Widget with Story
  Widget storyWithBorder(
      String imagePath,
      String name,
      String borderIcon, {
        double borderSize = 70,
        double imageSize = 30,
      }) {
    return SizedBox(
      width: borderSize,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              SvgPicture.asset(
                borderIcon,
                width: borderSize,
                height: borderSize,
              ),
              Container(
                width: imageSize,
                height: imageSize,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: AssetImage(imagePath),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 5),
          Text(
            name,
            style: TextStyle(fontSize: borderSize * 0.18),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  // Grid of Post
  Widget gridImage(String image) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(image),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  final List<Map<String, dynamic>> menuItems = [
    {
      "icon": SvgPicture.asset("icons/archive.svg", width: 22, height: 22),
      "title": "Archive"
    },
    {
      "icon": SvgPicture.asset("icons/your_activity.svg", width: 20, height: 20),
      "title": "Your Activity"
    },
    {
      "icon": SvgPicture.asset("icons/nametag.svg", width: 22, height: 22),
      "title": "Nametag"
    },
    {
      "icon": SvgPicture.asset("icons/save_d.svg", width: 22, height: 22),
      "title": "Saved"
    },
    {
      "icon": SvgPicture.asset("icons/close_friends.svg", width: 22, height: 22),
      "title": "Close Friends"
    },
    {
      "icon": SvgPicture.asset("icons/discover_people.svg", width: 22, height: 22),
      "title": "Discover People"
    },
    {
      "icon": SvgPicture.asset("icons/open_facebook.svg", width: 22, height: 22),
      "title": "Open Facebook"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // APPBAR
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
        centerTitle: true,
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset("icons/lock.svg", width: 15, height: 15),
            const SizedBox(width: 2),
            const Text(
              "jacob_w",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(width: 5),
            SvgPicture.asset("icons/arrow.svg", width: 8, height: 8),
          ],
        ),
        actions: [
          Builder(
            builder: (context) => IconButton(
              icon: SvgPicture.asset("icons/Menu.svg", width: 20, height: 20),
              onPressed: () {
                Scaffold.of(context).openEndDrawer();
              },
            ),
          ),
        ],
      ),

      // DRAWER
      endDrawer: Drawer(
        child: SafeArea(
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.all(20),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Jacob West",
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: ListView(
                  children: menuItems.map((item) {
                    return ListTile(
                      leading: item["icon"],
                      title: Text(item["title"]),
                      onTap: () {},
                    );
                  }).toList(),
                ),
              ),
              const Divider(),
              ListTile(
                leading: SvgPicture.asset("icons/logout.svg", width: 22, height: 22),
                title: const Text("Logout"),
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Authorization(),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),

      // BODY
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                children: [
                  storyWithBorder(
                    "images/img1.png",
                    "",
                    "icons/Oval.svg",
                    borderSize: 90,
                    imageSize: 80,
                  ),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: const [
                        Column(
                          children: [
                            Text(
                              "54",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text("Posts"),
                          ],
                        ),
                        Column(
                          children: [
                            Text(
                              "834",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text("Followers"),
                          ],
                        ),
                        Column(
                          children: [
                            Text(
                              "162",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text("Following"),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // BIO
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Jacob West",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 2),
                    RichText(
                      text: TextSpan(
                        children: [
                          const TextSpan(
                            text: "Digital goodies designer ",
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.black,
                            ),
                          ),
                          TextSpan(
                            text: "@pixsellz",
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.blue,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 2),
                    const Text(
                      "Everything is designed.",
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 10),

            // EDIT PROFILE
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: SizedBox(
                width: double.infinity,
                height: 36,
                child: OutlinedButton(
                  onPressed: () {},
                  style: OutlinedButton.styleFrom(
                    backgroundColor: Colors.white,
                    side: const BorderSide(color: Colors.grey, width: 1.2),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                  ),
                  child: const Text(
                    "Edit Profile",
                    style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),

            // STORIES
            SizedBox(
              height: 100,
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 10),
                children: [
                  storyWithBorder("images/add.png", "New", "icons/Oval.svg", borderSize: 70, imageSize: 60),
                  const SizedBox(width: 10),
                  storyWithBorder("images/your_story1.png", "Friends", "icons/Oval.svg", borderSize: 70, imageSize:60),
                  const SizedBox(width: 10),
                  storyWithBorder("images/your_story2.png", "Sport", "icons/Oval.svg", borderSize: 70, imageSize:60),
                  const SizedBox(width: 10),
                  storyWithBorder("images/your_story3.png", "Design", "icons/Oval.svg", borderSize: 70, imageSize:60),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // TABS
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset("icons/grid.svg", width: 20, height: 20),
                    SizedBox(width: 150),
                    SvgPicture.asset("icons/person.svg", width: 20, height: 20),
                  ],
                ),
                const SizedBox(height: 10),
              ],
            ),

            // GRID POSTS
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 2),
              child: GridView.count(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                crossAxisCount: 3,
                crossAxisSpacing: 2,
                mainAxisSpacing: 2,
                children: [
                  gridImage("images/posta.png"),
                  gridImage("images/postb.png"),
                  gridImage("images/postc.png"),
                  gridImage("images/postd.png"),
                  gridImage("images/poste.png"),
                  gridImage("images/postf.png"),
                  gridImage("images/posti.png"),
                  gridImage("images/posth.png"),
                  gridImage("images/postg.png"),
                ],
              ),
            ),
          ],
        ),
      ),

      // BOTTOM NAVIGATION
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          if (index == 0) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const MainPage(),
              ),
            );
          }
        },
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset("icons/home1.svg", width: 25, height: 25),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset("icons/search.svg", width: 50, height: 50),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset("icons/add1.svg", width: 25, height: 25),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset("icons/like.svg", width: 25, height: 25),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Image.asset("images/profile.png", width: 120, height: 50),
            label: "",
          ),
        ],
      ),
    );
  }
}