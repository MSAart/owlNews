import 'package:flutter/material.dart';
import 'package:owlnews/constant/utils.dart';
import 'package:owlnews/views/view_page.dart';

class BlogTile extends StatefulWidget {
  final String imageUrl, title, desc, url, content, author;

  const BlogTile(
      {required this.imageUrl,
      required this.title,
      required this.desc,
      required this.url,
      required this.content,
      required this.author,
      Key? key})
      : super(key: key);

  @override
  State<BlogTile> createState() => _BlogTileState();
}

class _BlogTileState extends State<BlogTile> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ViewPage(
                    author: widget.author,
                    title: widget.title,
                    description: widget.desc,
                    urlToImage: widget.imageUrl,
                    content: widget.content)));
      },
      child: Card(
        child: Container(
          padding: const EdgeInsets.all(8),
          child: Column(
            children: [
              ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(
                    widget.imageUrl,
                    errorBuilder: (context, object, trace) {
                      return Image.asset(
                        'assets/images/no_image.png',
                        height: 100,
                      );
                    },
                  )),
              Text(
                widget.title,
                style: poppinsTitle,
              ),
              Text(
                widget.desc,
                style: poppinsDesc.copyWith(color: Colors.grey),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
