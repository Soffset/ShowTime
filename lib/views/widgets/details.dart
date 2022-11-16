import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cached_network_image/cached_network_image.dart';

class DetailsPage extends StatelessWidget {
  final String title;
  final String summary;
  final String fullImage;
  const DetailsPage({
    Key? key,
    required this.title,
    required this.summary,
    required this.fullImage,
  }) : super(key: key);

  final Color textBlack = const Color(0xff3a3a3a);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              pinned: true,
              expandedHeight: 280.0,
              flexibleSpace: FlexibleSpaceBar(
                centerTitle: false,
                titlePadding: EdgeInsets.fromLTRB(20, 0, 0, 10),
                background: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.70), BlendMode.multiply),
                      image: CachedNetworkImageProvider(fullImage),
                      fit: BoxFit.cover,
                      alignment: Alignment.topLeft,
                    ),
                  ),
                ),
                title: Align(
                  alignment: Alignment.bottomLeft,
                  child: Container(
                    child: Text(
                      title,
                      style: const TextStyle(
                        color: Colors.white,
                      ),

                    ),
                  ),
                ),

              ),
            ),
            SliverToBoxAdapter(
              child: Container(
                //color: Colors.greenAccent,
                width: MediaQuery.of(context).size.width,
                //margin: const EdgeInsets.fromLTRB(17, 20, 17, 20),
                child: Container(
                  color: Colors.red,
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Container(
                //color: Colors.greenAccent,
                width: MediaQuery.of(context).size.width,
                //margin: const EdgeInsets.fromLTRB(18, 20, 18, 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: const EdgeInsets.fromLTRB(18, 20, 18, 9),
                      child: const Text(
                        'Summary',
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          height: 1.2,
                          fontSize: 18,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.fromLTRB(18,0,18,20),
                      child: Text(
                        summary,
                        style: const TextStyle(
                          fontWeight: FontWeight.w400,
                          height: 1.2,
                          fontSize: 14,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),

                  ],
                ),
              ),
            ),
          ],
        ),

        /*Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height/2.5,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                image: DecorationImage(
                  colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.35), BlendMode.multiply),
                  image: CachedNetworkImageProvider(fullImage),
                  fit: BoxFit.cover,
                  alignment: Alignment.topLeft,
                ),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              child: Text(
                title,
                style: GoogleFonts.roboto(
                    textStyle: const TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 32,
                      //color: textBlack,
                    )
                ),
                overflow: TextOverflow.ellipsis,
                maxLines: 4,
                textAlign: TextAlign.left,
              ),
            ),
            Container(
              color: Colors.greenAccent,
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.fromLTRB(10, 0, 10, 10),
              child: Text(
                summary,
                style: GoogleFonts.roboto(
                  textStyle: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 20,
                    color: textBlack,
                  ),
                ),
                textAlign: TextAlign.left,
              ),
            ),
            Expanded(child: Container(
              color: Colors.blue,
              child: ElevatedButton (onPressed: (){ Navigator.pop(context); }, child: const Text('back'),),
            ),
            ),
          ],
        ),*/
    );
  }
}