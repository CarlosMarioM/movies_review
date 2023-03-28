import 'package:flutter/material.dart';
import '../util/util_widgets.dart';
import '../model/review.dart';
import '../util/api.dart';
import 'body.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  ApiCalls calls = ApiCalls();
  List<Widget> movies = [];
  Widget body = CircularProgressIndicator(
    strokeWidth: 5,
    backgroundColor: Colors.black54,
    color: Colors.grey[400],
  );


  @override
  void initState() {
    super.initState();
    calls
        .getReviews()
        .then((value) => _addResults(value))
        .onError((error, stackTrace) {
      body = const Text("Can't pull any new \n review, try again later");
      setState(() {});
    }).timeout(
      const Duration(seconds: 10),
      onTimeout: () => setState(() {
        body = const Text("The connection took too long, try again later");
      }),
    );
  }

  _addResults(Reviews reviews) {
    for (var item in reviews.results!) {
      movies.add(
        SizedBox(
          width: MediaQuery.of(context).size.width / 1.1,
          height: MediaQuery.of(context).size.width / 1,
          child: Column(
            children: [
              CustomMovieCard(
                result: item,
              ),
              CustomMovieBody(result: item)
            ],
          ),
        ),
      );
    }
    body = Body(movies: movies);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(widget.title),
        ),
        body: Center(
          child: body,
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showAboutDialog(
                context: context,
                children: [const Center(child: Text("Thank you for your time"))]);
          },
          tooltip: 'Search',
          child: Icon(
            Icons.search,
            color: Theme.of(context).iconTheme.color,
          ),
        ),
      ),
    );
  }
}
