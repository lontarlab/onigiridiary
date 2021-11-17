import 'package:flutter/material.dart';

class DiaryScreen extends StatelessWidget {
  const DiaryScreen({Key? key}) : super(key: key);

  Widget _buildListDiary() {
    return Card(
      color: Colors.amber[50],
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Container(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              children: [
                Image.asset(
                  'assets/images/onigiri_diary_senang.png',
                  width: 60,
                ),
                const Text(
                  'Senang',
                  style: TextStyle(
                    color: Colors.pink,
                  ),
                ),
                Row(
                  children: [
                    Icon(
                      Icons.star,
                      color: Colors.yellow[700],
                    ),
                    Icon(
                      Icons.star,
                      color: Colors.yellow[700],
                    ),
                    Icon(
                      Icons.star,
                      color: Colors.yellow[700],
                    ),
                  ],
                )
              ],
            ),
            const SizedBox(width: 8.0),
            Expanded(
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                      vertical: 3.0,
                      horizontal: 8.0,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.purple[400],
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    child: Row(
                      children: const [
                        Text(
                          'Waktu',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(width: 16.0),
                        Expanded(
                          child: Text(
                            ': 2020-12-03 14:26:59',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 5.0),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      vertical: 3.0,
                      horizontal: 8.0,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.purple[100],
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    child: Row(
                      children: [
                        Text(
                          'Waktu',
                          style: TextStyle(
                            color: Colors.purple[700],
                          ),
                        ),
                        const SizedBox(width: 16.0),
                        Expanded(
                          child: Text(
                            ': 2020-12-03 14:26:59',
                            style: TextStyle(
                              color: Colors.purple[800],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 5.0),
                  const Text(
                    'floatingActionButtonLocation: FloatingActionButtonLocation.endFloat, floatingActionButton: FloatingActionButton( child: const Icon(Icons.add),',
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: Colors.pink,
                      fontFamily: 'IndieFlower',
                      fontSize: 18,
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(
              'assets/images/onigiri_diary_bg.png',
            ),
          ),
        ),
        child: StreamBuilder(
          builder: (_, snapshot) {
            return ListView.builder(
              padding: const EdgeInsets.all(8.0),
              itemCount: 10,
              itemBuilder: (_, index) {
                return _buildListDiary();
              },
            );
          },
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.pink[200],
        child: const Icon(Icons.add),
        onPressed: () {},
      ),
    );
  }
}
