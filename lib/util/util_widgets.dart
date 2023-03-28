//Util widgets
import 'dart:ui';

import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/material.dart';

import '../model/results.dart';

class CustomMovieCard extends StatelessWidget {
  const CustomMovieCard({super.key, required this.result});
  final Results result;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            height: MediaQuery.of(context).size.height / 2.1,
            width: MediaQuery.of(context).size.width / 1.1,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.fitHeight,
                image: NetworkImage(
                  result.multimedia!.src.toString(),
                ),
              ),
              color: Colors.black38,
              borderRadius: BorderRadius.circular(15),
            ),
          ),
          InkWell(
            onTap: () => Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => SafeArea(
                      child: Scaffold(
                        appBar: AppBar(
                            leading: IconButton(
                              icon:
                                  const Icon(Icons.arrow_back_ios_new_rounded),
                              onPressed: () => Navigator.of(context).pop(),
                            ),
                            iconTheme: Theme.of(context).appBarTheme.iconTheme),
                        body: CustomMovieBody(
                          result: result,
                        ),
                      ),
                    ))),
            child: SizedBox(
              width: double.infinity,
              height: MediaQuery.of(context).size.height / 12,
              child: ClipRRect(
                borderRadius:
                    const BorderRadius.vertical(bottom: Radius.circular(15)),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 22, sigmaY: 22),
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              result.displayTitle.toString(),
                              textAlign: TextAlign.left,
                              style: Theme.of(context).textTheme.labelLarge,
                            ),
                            Text(
                              result.byline.toString(),
                              textAlign: TextAlign.left,
                              style: Theme.of(context).textTheme.labelMedium,
                            ),
                          ],
                        ),
                        Text(
                            DateFormat.yMMMd().format(DateTime.parse(
                                result.publicationDate.toString())),
                            style: Theme.of(context).textTheme.labelSmall)
                      ],
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class CustomMovieBody extends StatelessWidget {
  const CustomMovieBody({super.key, required this.result});
  final Results result;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 30.0, right: 30, top: 25),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Flexible(
              child: Text(
                result.headline.toString(),
                textAlign: TextAlign.center,
                softWrap: true,
                style: Theme.of(context).textTheme.headline5,
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Text(
              result.summaryShort.toString(),
              softWrap: true,
              textAlign: TextAlign.justify,
            ),
            const SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                    'Updated: ${DateFormat.yMMMd().format(DateTime.parse(result.dateUpdated.toString()))}',
                    style: Theme.of(context).textTheme.bodySmall),
                Text(
                    result.openingDate == null
                        ? ''
                        : 'Opening: ${DateFormat.yMMMd().format(DateTime.parse(result.openingDate.toString()))}',
                    style: Theme.of(context).textTheme.bodySmall),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            TextButton.icon(
              icon: const Icon(Icons.read_more),
              onPressed: () {
                final uri = Uri.parse(result.link!.url.toString());
                launchUrl(
                  uri,
                );
              },
              label: Text(result.link!.suggestedLinkText.toString()),
            )
          ],
        ),
      ),
    );
  }
}
