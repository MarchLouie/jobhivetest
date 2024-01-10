import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class PostView extends StatefulWidget {
  final String userName;
  final DateTime timePublished;
  final String postTitle;
  final String postContent;

  PostView({
    required this.userName,
    required this.timePublished,
    required this.postTitle,
    required this.postContent,
  });

  @override
  _PostViewState createState() => _PostViewState();
}

class _PostViewState extends State<PostView> {
  bool showAllContent = false;
  bool isLiked = false;

  @override
  Widget build(BuildContext context) {
    String formattedTime = DateFormat.yMMMMd().add_jm().format(widget.timePublished);

    return Card(
      margin: EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => UserProfilePage(userName: widget.userName),
                ),
              );
            },
            child: ListTile(
              leading: CircleAvatar(
                backgroundImage: Image.asset('assets/image/jobhivee.png').image,
              ),
              title: Text(widget.userName),
              subtitle: Row(
                children: [
                  // Globe Icon
                  Icon(
                    Icons.public,
                    size: 16.0,
                    color: Colors.grey, // You can adjust the color to your preference
                  ),
                  SizedBox(width: 4.0), // Add a small space between the icon and the time
                  Text(formattedTime),
                ],
              ),
            ),
          ),

          Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  widget.postTitle,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0,
                  ),
                ),

                SizedBox(height: 9.4),

                Text(
                  showAllContent
                      ? widget.postContent
                      : (widget.postContent.length > 200
                      ? '${widget.postContent.substring(0, 200)}...'
                      : widget.postContent),
                ),

                TextButton(
                  onPressed: () {
                    setState(() {
                      showAllContent = !showAllContent;
                    });
                  },
                  child: Text(
                    showAllContent ? 'See Less' : 'See More',
                    style: TextStyle(color: Colors.black), // Set the text color to black
                  ),
                ),
              ],
            ),
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              IconButton(
                icon: Icon(Icons.thumb_up, color: isLiked ? Colors.blue : null),
                onPressed: () {
                  setState(() {
                    isLiked = !isLiked;
                  });
                },
              ),
              IconButton(
                icon: Icon(Icons.thumb_down),
                onPressed: () {
                  // Handle dislike button tap
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class UserProfilePage extends StatelessWidget {
  final String userName;

  UserProfilePage({required this.userName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile: $userName'),
      ),
      body: Center(
        child: Text('User Profile Page for $userName'),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Scaffold(
      appBar: AppBar(
        title: Text('Post Page'),
        backgroundColor: Colors.black54,
        elevation: 0, // Remove the default shadow
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Colors.black45, Colors.amberAccent], // Define the gradient colors
            ),
          ),
        ),
      ),
      body: PostView(
        userName: 'Jobhive North America',
        timePublished: DateTime.now(),
        postTitle: 'Flutter Post Example',
        postContent:
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur vestibulum molestie sem non commodo. Sed mollis risus ut efficitur elementum. Integer placerat viverra ex ut convallis. Sed eros mi, iaculis sed urna at, accumsan sollicitudin quam. Vestibulum pharetra commodo purus vitae pharetra. Vivamus pellentesque massa eget venenatis varius. Suspendisse porttitor lacus mattis, vulputate ipsum quis, porta urna. Phasellus ultricies odio vel sodales fringilla. Etiam felis velit, tempus in nunc eu, vulputate scelerisque est. Mauris at convallis sem. Cras at felis mollis, vehicula felis ut, ultricies lectus. Morbi imperdiet facilisis dapibus. Maecenas non urna quis elit accumsan aliquet ut ac risus. Vestibulum finibus ante eget aliquam pharetra.',
      ),
    ),
  ));
}
