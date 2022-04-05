import 'package:flutter/material.dart';
import 'package:owlnews/constant/utils.dart';

class ViewPage extends StatefulWidget {
  final String author;
  final String title;
  final String description;
  final String urlToImage;
  final String content;

  const ViewPage({
    required this.author,
    required this.title,
    required this.description,
    required this.urlToImage,
    required this.content,
    Key? key,
  }) : super(key: key);

  @override
  _ViewPageState createState() => _ViewPageState();
}

class _ViewPageState extends State<ViewPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: Colors.white,
        elevation: 0.3,
        title: Text(
          'Detail',
          style: poppinsbold12.copyWith(color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.white10),
                      borderRadius: BorderRadius.circular(20)),
                  padding: const EdgeInsets.all(8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height * 0.24,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: NetworkImage(widget.urlToImage))),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        widget.title,
                        style: poppinsTitle,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        widget.author,
                        style: poppinsLight,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        widget.content,
                        style: poppinsDesc.copyWith(color: Colors.black),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
