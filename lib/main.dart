import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Football Match App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MatchList(),
    );
  }
}

class MatchList extends StatefulWidget {
  @override
  _MatchListState createState() => _MatchListState();
}

class _MatchListState extends State<MatchList> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(250, 250, 250, 250),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 40), // For status bar padding
            Text('Glad to see you,', style: TextStyle(fontSize: 16)),
            Text('Esther Howard!',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            SizedBox(height: 20),
            TextField(
              decoration: InputDecoration(
                hintText: 'Find your favorite club',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                prefixIcon: Icon(Icons.search),
              ),
            ),

            SizedBox(height: 20),
            Text('Live Match',
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(1),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Premier League', style: TextStyle(fontSize: 16)),
                        Text("78'",
                            style: TextStyle(fontSize: 16, color: Colors.red)),
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset('Arsenal_FC..png', height: 60),
                        SizedBox(width: 20),
                        RichText(
                          text: TextSpan(
                            style: TextStyle(
                                fontSize: 26,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                            children: [
                              TextSpan(
                                  text: '2',
                                  style: TextStyle(
                                      color: const Color.fromARGB(
                                          255, 61, 182, 135))),
                              TextSpan(text: ' : '),
                              TextSpan(text: '1'),
                            ],
                          ),
                        ),
                        SizedBox(width: 20),
                        Image.asset('Chelsea_FC.png', height: 60),
                      ],
                    ),
                    SizedBox(height: 10),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => LiveScoreScreen()),
                        );
                      },
                      child: Text('Live'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromARGB(255, 248, 248, 248),
                        side: BorderSide(
                          color: const Color.fromARGB(
                              255, 61, 182, 135), // Set green border color
                          width: 2.0, // Adjust border width (optional)
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        foregroundColor: Color.fromARGB(255, 61, 182, 135),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Finished Match',
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                Icon(Icons.arrow_forward),
              ],
            ),
            SizedBox(height: 10),
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    FinishedMatchCard(
                      league: 'Champions League',
                      team1Logo: 'Juventus_FC.png',
                      team2Logo: 'Paris_Saint-.png',
                      score: '1 : 0',
                    ),
                    SizedBox(width: 10),
                    FinishedMatchCard(
                      league: 'League B',
                      team1Logo: 'Bayern_FC.png',
                      team2Logo: 'Borussia_.png',
                      score: '0 : 2',
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: ''),
          BottomNavigationBarItem(
              icon: Icon(Icons.notifications_outlined), label: ''),
          BottomNavigationBarItem(
              icon: Icon(Icons.person_2_outlined), label: ''),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: const Color.fromARGB(255, 61, 182, 135),
        onTap: _onItemTapped,
      ),
    );
  }
}

class FinishedMatchCard extends StatelessWidget {
  final String league;
  final String team1Logo;
  final String team2Logo;
  final String score;

  const FinishedMatchCard({
    Key? key,
    required this.league,
    required this.team1Logo,
    required this.team2Logo,
    required this.score,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> scores = score.split(' : ');
    int team1Score = int.parse(scores[0]);
    int team2Score = int.parse(scores[1]);

    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(league, style: TextStyle(fontSize: 16)),
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(team1Logo, height: 50),
                SizedBox(
                  width: 30,
                  height: 30,
                ),
                RichText(
                  text: TextSpan(
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                    children: [
                      TextSpan(
                          text: scores[0],
                          style: TextStyle(
                              color: team1Score > team2Score
                                  ? const Color.fromARGB(255, 61, 182, 135)
                                  : Colors.black)),
                      TextSpan(text: ' : '),
                      TextSpan(
                          text: scores[1],
                          style: TextStyle(
                              color: team2Score > team1Score
                                  ? const Color.fromARGB(255, 61, 182, 135)
                                  : Colors.black)),
                    ],
                  ),
                ),
                SizedBox(
                  width: 50,
                  height: 30,
                ),
                Image.asset(team2Logo, height: 50),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class LiveScoreScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text('Champions League'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Yesterday',
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Image.asset(
                      'Juventus_FC.png',
                      width: 60,
                      height: 60,
                    ),
                    Text('Juventus'),
                  ],
                ),
                RichText(
                  text: TextSpan(
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                    children: [
                      TextSpan(
                          text: '2', style: TextStyle(color: Colors.green)),
                      TextSpan(text: ' : '),
                      TextSpan(text: '1'),
                    ],
                  ),
                ),
                Column(
                  children: [
                    Image.asset(
                      'Paris_Saint-.png',
                      width: 60,
                      height: 60,
                    ),
                    Text('Paris S-G'),
                  ],
                ),
              ],
            ),
            SizedBox(height: 30),
            ListTile(
              leading: CircleAvatar(
                backgroundImage: AssetImage(
                  'images.jpeg',
                ),
              ),
              title: Text('Top Player'),
              subtitle: Text('Paulo Dybala'),
            ),
            SizedBox(height: 20),
            Text(
              'Match Stats',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Expanded(
              child: ListView(
                children: [
                  ListTile(
                    title: Text('Shots'),
                    trailing: Text('14'),
                  ),
                  ListTile(
                    title: Text('Shots on target'),
                    trailing: Text('2'),
                  ),
                  ListTile(
                    title: Text('Possession'),
                    trailing: Text('36'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
