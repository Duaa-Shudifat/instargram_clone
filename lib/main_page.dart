import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'profile.dart';

void main() {
  runApp(const MainPage());
}

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isLiked = false;

  List<bool> likedPosts = [false, false];

  // Story Widget
  Widget story(String image, String name, {bool live = false, bool isYourStory = false}) {
    return Column(
      children: [
        Stack(
          children: [
            Container(
              padding: const EdgeInsets.all(2),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: isYourStory
                    ? null
                    : const LinearGradient(
                  colors: [Colors.red, Colors.orange, Colors.purple],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: CircleAvatar(
                radius: 32,
                backgroundColor: Colors.transparent,
                child: CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage(image),
                ),
              ),
            ),
            if (live)
              Positioned(
                bottom: -3,
                left: 20,
                child: SvgPicture.asset(
                  "icons/Live1.svg",
                  width: 22,
                  height: 22,
                ),
              ),
            if (isYourStory)
              Positioned(
                bottom: 0,
                right: 0,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.white, width: 2),
                  ),
                  child: const Icon(
                    Icons.add,
                    size: 24,
                    color: Colors.white,
                  ),
                ),
              ),
          ],
        ),
        const SizedBox(height: 5),
        SizedBox(
          width: 60,
          child: Text(
            name,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 12),
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }

  // Post Widget  index
  Widget post(List<String> images, int index) {
    PageController controller = PageController();
    int currentPage = 0;

    return StatefulBuilder(builder: (context, setState) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const ListTile(
            leading: CircleAvatar(
              backgroundImage: AssetImage("images/img1.png"),
            ),
            title: Text(
              "joshua_l",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text("Tokyo, Japan"),
            trailing: Icon(Icons.more_horiz),
          ),
          Stack(
            children: [
              AspectRatio(
                aspectRatio: 1,
                child: PageView.builder(
                  controller: controller,
                  itemCount: images.length,
                  onPageChanged: (page) {
                    setState(() {
                      currentPage = page;
                    });
                  },
                  itemBuilder: (context, idx) {
                    return Image.asset(
                      images[idx],
                      fit: BoxFit.cover,
                      width: double.infinity,
                    );
                  },
                ),
              ),
              if (images.length > 1)
                Positioned(
                  top: 10,
                  right: 10,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.black54,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      "${currentPage + 1}/${images.length}",
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
            ],
          ),


          const SizedBox(height: 10),

          // Action buttons

          Row(
            children: [
              const SizedBox(width: 25
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    likedPosts[index] = !likedPosts[index];
                  });
                },
                child: SizedBox(
                  width: 30,
                  height: 30,
                  child: FittedBox(
                    fit: BoxFit.contain,
                    child: SvgPicture.asset(
                      likedPosts[index] ? "icons/like_filled.svg" : "icons/like.svg",
                    ),
                  ),
                ),
              ),

              const SizedBox(width: 20),
              SvgPicture.asset("icons/Comment.svg", width: 20, height: 25),
              const SizedBox(width: 25),
              SvgPicture.asset("icons/msg.svg", width: 20, height: 20),
              const Spacer(),
              SvgPicture.asset("icons/Save.svg", width: 25, height: 25),
              const SizedBox(width: 10),
            ],
          ),

          Padding(
            padding: const EdgeInsets.all(10),
            child: Text(
              likedPosts[index] ? "Liked by you and 44,686 others" : "Liked by craig_love and 44,686 others",
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              "joshua_l The game in Japan was amazing and I want to share some photos",
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: Text(
              "2 hours ago",
              style: TextStyle(color: Colors.grey, fontSize: 12),
            ),
          ),
          const SizedBox(height: 20),
        ],
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.all(14),
          child: SvgPicture.asset("icons/camera.svg", width: 16, height: 16),
        ),
        centerTitle: true,
        actions: [
          Stack(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: SvgPicture.asset("icons/live.svg"),
              ),
              const Positioned(
                right: 9,
                top: 3,
                child: CircleAvatar(
                  radius: 4,
                  backgroundColor: Colors.red,
                ),
              )
            ],
          ),
          const SizedBox(width: 10),
          Padding(
            padding: const EdgeInsets.only(right: 15),
            child: SvgPicture.asset("icons/msg.svg"),
          ),
        ],
      ),
      body: ListView(
        children: [
          const SizedBox(height: 10),
          // Stories
          SizedBox(
            height: 100,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                const SizedBox(width: 30),
                story("images/img1.png", "Your Story", isYourStory: true),
                const SizedBox(width: 30),
                story("images/img2.png", "karennne", live: true),
                const SizedBox(width: 15),
                story("images/img3.png", "zackjohn"),
                const SizedBox(width: 15),
                story("images/img4.png", "kieron_d"),
                const SizedBox(width: 15),
                story("images/img5.png", "craig"),
              ],
            ),
          ),
          const Divider(),
          // Posts index
          post(["images/post2.png", "images/post2.png", "images/post2.png"], 0),
          post(["images/post1.png"], 1),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          if (index == 4) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Profile()),
            );
          }
        },
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset("icons/home.svg", width: 50, height: 50),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset("icons/search.svg", width: 50, height: 50),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset("icons/add.svg", width: 20, height: 20),
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
