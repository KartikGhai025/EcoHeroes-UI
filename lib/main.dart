
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}
class LearningModule {
  final String title;
  final String description;

  LearningModule({required this.title, required this.description});
}

class Initiative {
  final String title;
  final String description;

  Initiative({required this.title, required this.description});
}

class Challenge {
  final String title;
  final String description;
  final IconData icon;

  Challenge({required this.title, required this.description, required this.icon});
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'EcoHeroes',
      theme: ThemeData(
        primarySwatch: Colors.green,
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: AppBarTheme(
          elevation: 0,
          backgroundColor: Colors.transparent,
          titleTextStyle: TextStyle(
            fontSize: 24,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(),
        '/learningModules': (context) => LearningModulesPage(),
        '/challenges': (context) => ChallengesRewardsScreen(),
        '/ecotracker': (context) => EcoTrackerScreen(),
        '/community': (context) => CommunityEngagementScreen(),
        '/localInitiatives': (context) => LocalInitiativesScreen(),
        '/resources': (context) => EducationalResourcesScreen(),
        '/competitions': (context) => CompetitionsPage(),
      },
    );
  }
}

class ChallengesRewardsScreen extends StatelessWidget {
  final List<Challenge> challenges = [
    Challenge(
      title: 'Challenge 1',
      description: 'Description for Challenge 1',
      icon: Icons.star,
    ),
    Challenge(
      title: 'Challenge 2',
      description: 'Description for Challenge 2',
      icon: Icons.favorite,
    ),
    Challenge(
      title: 'Challenge 3',
      description: 'Description for Challenge 3',
      icon: Icons.thumb_up,
    ),
    // Add more challenges...
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Challenges and Rewards'),
      ),
      body: ListView.builder(
        itemCount: challenges.length,
        itemBuilder: (context, index) {
          final challenge = challenges[index];
          return Padding(
            padding: EdgeInsets.all(16),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: ListTile(
                leading: Icon(
                  challenge.icon,
                  size: 32,
                  color: Colors.green,
                ),
                title: Text(
                  challenge.title,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                subtitle: Text(challenge.description),
                onTap: () {
                  // Perform any action when a challenge is tapped
                  print('Tapped on ${challenge.title}');
                },
              ),
            ),
          );
        },
      ),
    );
  }
}

class LearningModulesPage extends StatefulWidget {
  @override
  _LearningModulesPageState createState() => _LearningModulesPageState();
}

class _LearningModulesPageState extends State<LearningModulesPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final List<LearningModule> learningModules = [
    LearningModule(
      title: 'Module 1',
      description: 'This is the description for Module 1',
    ),
    LearningModule(
      title: 'Module 2',
      description: 'This is the description for Module 2',
    ),
    LearningModule(
      title: 'Module 3',
      description: 'This is the description for Module 3',
    ),
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: learningModules.length, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Learning Modules'),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.lightGreen.shade100,
              Colors.lightGreen,
            ],
          ),
        ),
        child: Column(
          children: [
            SizedBox(height: 16),
            TabBar(
              controller: _tabController,
              indicatorColor: Colors.green,
              labelColor: Colors.green,
              unselectedLabelColor: Colors.black,
              isScrollable: true,
              tabs: learningModules
                  .map((module) => Tab(
                text: module.title,
              ))
                  .toList(),
            ),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: learningModules
                    .map((module) => _buildModuleCard(module))
                    .toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildModuleCard(LearningModule module) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        elevation: 4,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              module.title,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),
            Text(
              module.description,
              style: TextStyle(fontSize: 18),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

class EcoTrackerScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('EcoTracker'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'EcoTracker',
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 16),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TrackerBox(
                    icon: Icons.eco,
                    title: 'Energy',
                    data: '25 kWh',
                    status: true,
                  ),
                  TrackerBox(
                    icon: Icons.waves,
                    title: 'Water',
                    data: '100 L',
                    status: false,
                  ),
                ],
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              child: Text('Start Tracking'),
              onPressed: () {
                // Start tracking logic
              },
            ),
          ],
        ),
      ),
    );
  }
}

class TrackerBox extends StatefulWidget {
  final IconData icon;
  final String title;
  final String data;
  final bool status;

  TrackerBox({
    required this.icon,
    required this.title,
    required this.data,
    required this.status,
  });

  @override
  _TrackerBoxState createState() => _TrackerBoxState();
}

class _TrackerBoxState extends State<TrackerBox> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      duration: Duration(seconds: 1),
      vsync: this,
    )..repeat(reverse: true);

    _animation = Tween<double>(begin: 0.0, end: 1.0).animate(_animationController);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, child) {
        return Transform.scale(
          scale: 1.0 - (_animation.value * 0.1),
          child: Container(
            width: 160,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color(0xFF61A4F1),
                  Color(0xFF8BCBF7),
                ],
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.3),
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  widget.icon,
                  color: Colors.white,
                  size: 48,
                ),
                SizedBox(height: 8),
                Text(
                  widget.title,
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
                SizedBox(height: 8),
                Text(
                  widget.data,
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
                ),
                SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      widget.status ? Icons.check : Icons.close,
                      color: widget.status ? Colors.green : Colors.red,
                      size: 16,
                    ),
                    SizedBox(width: 4),
                    Text(
                      widget.status ? 'Active' : 'Inactive',
                      style: TextStyle(fontSize: 12, color: Colors.white),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class EducationalResourcesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Educational Resources'),
      ),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          _buildResourceCard(
            icon: Icons.library_books,
            title: 'Textbooks',
            description: 'Access a wide range of textbooks for different subjects.',
            onTap: () {
              // Handle textbook tap
            },
          ),
          SizedBox(height: 16.0),
          _buildResourceCard(
            icon: Icons.video_library,
            title: 'Video Tutorials',
            description: 'Watch educational videos covering various topics.',
            onTap: () {
              // Handle video tutorials tap
            },
          ),
          SizedBox(height: 16.0),
          _buildResourceCard(
            icon: Icons.collections_bookmark,
            title: 'Articles',
            description: 'Read informative articles on different subjects.',
            onTap: () {
              // Handle articles tap
            },
          ),
          SizedBox(height: 16.0),
          _buildResourceCard(
            icon: Icons.brush,
            title: 'Interactive Learning',
            description: 'Engage in interactive learning activities and games.',
            onTap: () {
              // Handle interactive learning tap
            },
          ),
          SizedBox(height: 16.0),
          _buildResourceCard(
            icon: Icons.attach_file,
            title: 'Downloads',
            description: 'Download additional study materials and resources.',
            onTap: () {
              // Handle downloads tap
            },
          ),
        ],
      ),
    );
  }

  Widget _buildResourceCard({
    required IconData icon,
    required String title,
    required String description,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        elevation: 2.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Row(
            children: [
              Icon(icon, size: 40.0, color: Colors.blue),
              SizedBox(width: 16.0),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8.0),
                    Text(
                      description,
                      style: TextStyle(
                        fontSize: 14.0,
                        color: Colors.grey[600],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CompetitionsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Challenges and Competitions'),
      ),
      body: Center(
        child: Text(
          'Challenges and Competitions',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('EcoHeroes'),
      ),
      body: Stack(
        children: [
          CustomPaint(
            painter: BackgroundPainter(),
            child: Container(),
          ),
          ListView(
            children: [
              Padding(
                padding: EdgeInsets.all(16),
                child: Text(
                  'Welcome to EcoHeroes!',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    shadows: [
                      Shadow(
                        offset: Offset(2, 2),
                        blurRadius: 3,
                        color: Colors.black.withOpacity(0.3),
                      ),
                    ],
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              GridView.count(
                padding: EdgeInsets.symmetric(horizontal: 16 ,vertical: 25),
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                crossAxisCount: 2,
                shrinkWrap: true,
                physics: ScrollPhysics(),
                children: [
                  HomeGridItem(
                    icon: Icons.book,
                    title: 'Learning Modules',
                    onTap: () {
                      Navigator.pushNamed(context, '/learningModules');
                    },
                  ),
                  HomeGridItem(
                    icon: Icons.emoji_events,
                    title: 'Challenges and Rewards',
                    onTap: () {
                      Navigator.pushNamed(context, '/challenges');
                    },
                  ),
                  HomeGridItem(
                    icon: Icons.track_changes,
                    title: 'EcoTracker',
                    onTap: () {
                      Navigator.pushNamed(context, '/ecotracker');
                    },
                  ),
                  HomeGridItem(
                    icon: Icons.people,
                    title: 'Community Engagement',
                    onTap: () {
                      Navigator.pushNamed(context, '/community');
                    },
                  ),
                  HomeGridItem(
                    icon: Icons.location_on,
                    title: 'Local Initiatives',
                    onTap: () {
                      Navigator.pushNamed(context, '/localInitiatives');
                    },
                  ),
                  HomeGridItem(
                    icon: Icons.library_books,
                    title: 'Educational Resources',
                    onTap: () {
                      Navigator.pushNamed(context, '/resources');
                    },
                  ),
                  // HomeGridItem(
                  //   icon: Icons.star,
                  //   title: 'Challenges and Competitions',
                  //   onTap: () {
                  //     Navigator.pushNamed(context, '/challengesCompetitions');
                  //   },
                  // ),
                  // Add more grid items...
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class HomeGridItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;

  HomeGridItem({required this.icon, required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        elevation: 4,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 48,
              color: Colors.green,
            ),
            SizedBox(height: 8),
            Text(
              title,
              style: TextStyle(fontSize: 16),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

class BackgroundPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.green
      ..style = PaintingStyle.fill;

    final path = Path()
      ..moveTo(size.width * 0.2, 0)
      ..quadraticBezierTo(
          size.width * 0.3, size.height * 0.1, size.width * 0.5, size.height * 0.05)
      ..quadraticBezierTo(
          size.width * 0.7, size.height * 0.0, size.width * 0.8, size.height * 0.2)
      ..lineTo(size.width, size.height * 0.7)
      ..lineTo(size.width, 0)
      ..close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

class CommunityEngagementScreen extends StatefulWidget {
  @override
  _CommunityEngagementScreenState createState() =>
      _CommunityEngagementScreenState();
}

class _CommunityEngagementScreenState extends State<CommunityEngagementScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(seconds: 4),
      vsync: this,
    );
    _animationController.repeat(reverse: true);
    _animation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Community Engagement'),
      ),
      body: Stack(
        children: [
          CustomPaint(
            painter: BackgroundPainterCommunity(animation: _animation),
            size: MediaQuery.of(context).size,
          ),
          ListView(
            children: [
              ListTile(
                leading: Icon(Icons.calendar_today),
                title: Text('Upcoming Events'),
                onTap: () {
                  // Handle upcoming events tap
                },
              ),
              ListTile(
                leading: Icon(Icons.people),
                title: Text('Volunteer Opportunities'),
                onTap: () {
                  // Handle volunteer opportunities tap
                },
              ),
              ListTile(
                leading: Icon(Icons.forum),
                title: Text('Community Forums'),
                onTap: () {
                  // Handle community forums tap
                },
              ),
              ListTile(
                leading: Icon(Icons.stars),
                title: Text('Community Achievements'),
                onTap: () {
                  // Handle community achievements tap
                },
              ),
              ListTile(
                leading: Icon(Icons.chat_bubble),
                title: Text('Chat Room'),
                onTap: () {
                  // Handle chat room tap
                },
              ),
              ListTile(
                leading: Icon(Icons.share),
                title: Text('Share Feedback'),
                onTap: () {
                  // Handle share feedback tap
                },
              ),
              ListTile(
                leading: Icon(Icons.people_outline),
                title: Text('Community Members'),
                onTap: () {
                  // Handle community members tap
                },
              ),
              ListTile(
                leading: Icon(Icons.favorite),
                title: Text('Support Causes'),
                onTap: () {
                  // Handle support causes tap
                },
              ),
            ],
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people),
            label: 'Community',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}

class BackgroundPainterCommunity extends CustomPainter {
  late final Animation<double> animation;
BackgroundPainterCommunity({required this.animation});

  @override
  void paint(Canvas canvas, Size size) {
    final double midX = size.width * 0.5;
    final double midY = size.height * 0.5;
    final double maxRadius = size.width * 0.6;

    final double waveRadius = maxRadius * animation.value;
    final double alpha = waveRadius * 0.3;

    final Paint paint = Paint()
      ..color = Colors.blue.withOpacity(0.5)
      ..style = PaintingStyle.fill;

    canvas.save();

    canvas.translate(midX, midY);

    canvas.drawCircle(Offset(0, 0), waveRadius,
        paint..color = Colors.blue);
    canvas.drawCircle(
        Offset(0, 0),
        waveRadius - 30,
        paint..color = Colors.blue.withOpacity(0.6));
    canvas.drawCircle(
        Offset(0, 0),
        waveRadius - 60,
        paint..color = Colors.blue.withOpacity(0.3));

    final path = Path()
      ..moveTo(-size.width, midY)
      ..lineTo(-size.width, size.height)
      ..lineTo(size.width, size.height)
      ..lineTo(size.width, midY)
      ..quadraticBezierTo(0, midY + alpha, -size.width, midY)
      ..close();

    canvas.drawPath(
        path,
        paint
          ..color = Colors.blue.withOpacity(0.2)
          ..style = PaintingStyle.fill);

    canvas.restore();
  }

  @override
  bool shouldRepaint(BackgroundPainterCommunity oldDelegate) => true;

  @override
  bool shouldRebuildSemantics(BackgroundPainterCommunity oldDelegate) => false;
}

class LocalInitiativesScreen extends StatefulWidget {
  @override
  _LocalInitiativesScreenState createState() => _LocalInitiativesScreenState();
}

class _LocalInitiativesScreenState extends State<LocalInitiativesScreen> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );

    _animation = Tween<double>(begin: 0, end: 1).animate(_animationController);

    _animationController.repeat(reverse: true);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.greenAccent,
      appBar: AppBar(
        leading: BackButton(color: Colors.transparent,),
        title: Text('Local Initiatives'),
      ),

      body: AnimatedBuilder(
        animation: _animationController,
        builder: (context, child) {
          return CustomPaint(
            painter: InitiativesBackgroundPainter(animationValue: _animation.value),
            child: ListView.builder(
              itemCount: 10, // Replace with your actual data
              itemBuilder: (context, index) {
                return Container(
                  height: 200,
                  margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Center(
                    child: Text(
                      'Initiative $index',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}

class InitiativesBackgroundPainter extends CustomPainter {
  final double animationValue;

  InitiativesBackgroundPainter({required this.animationValue});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();
    paint.color = Colors.blue.withOpacity(0.5);

    final path = Path();
    path.moveTo(0, size.height * 0.3);
    path.quadraticBezierTo(
      size.width * 0.25,
      size.height * (0.3 - animationValue),
      size.width * 0.5,
      size.height * 0.3,
    );
    path.quadraticBezierTo(
      size.width * 0.75,
      size.height * (0.3 + animationValue),
      size.width,
      size.height * 0.3,
    );
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}