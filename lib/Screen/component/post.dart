import 'package:flutter/material.dart';
import 'package:my_blog/Screen/component/add_post.dart';

class PostScreen extends StatefulWidget {
  const PostScreen({Key? key}) : super(key: key);

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Post'),
        centerTitle: true,
        actions: [
          InkWell(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => AddPost()));
            },
              child: Icon(Icons.add),
          ),
          SizedBox(
            width: 20.0,
          ),
        ],
      ),
    );
  }
}
