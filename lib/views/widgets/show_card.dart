import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cached_network_image/cached_network_image.dart';

class ShowCard extends StatelessWidget {
  final String title;
  final String rating;
  final String duration;
  final String thumbnailUrl;
  final String summary;
  final String fullImage;
  const ShowCard({Key? key,
    required this.title,
    required this.duration,
    required this.rating,
    required this.thumbnailUrl,
    required this.summary,
    required this.fullImage,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    CachedNetworkImage.logLevel = CacheManagerLogLevel.debug;
    return SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 11, vertical: 5),
          width: double.infinity,
          height: (MediaQuery.of(context).size.width * 0.32015) * 1.45,
          decoration: BoxDecoration(
            //color: Color(0xff525151),
            //color: Color(0xff3d3d3d),
            color: Colors.grey[800],
            borderRadius: BorderRadius.circular(6),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.4),
                offset: const Offset(
                  0.0,
                  7.0,
                ),
                blurRadius: 8.0,
                spreadRadius: -6.0,
              ),
            ],
          ),
          child: Row(
            children: [
              Container(
                //color: Colors.blue,
                margin: const EdgeInsets.symmetric(horizontal: 7, vertical: 7),
                width: MediaQuery.of(context).size.width * 0.32015,
                height: double.infinity,
                child: Material(
                  color: Colors.transparent,
                  child: Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(6),
                        child: Image(
                          image: CachedNetworkImageProvider(thumbnailUrl),
                          fit: BoxFit.cover,
                          width: double.infinity,
                          height: double.infinity,
                        ),
                      ),
                      Material(
                        color: Colors.transparent,
                        child: InkWell(
                          splashColor: const Color(0x20EEEEEE),
                          highlightColor: const Color(0x35EEEEEE),
                          borderRadius: BorderRadius.circular(6),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => DetailsPage(title: title, summary: summary, fullImage: fullImage,)),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                  flex: 1,
                  child: Column(
                    children:[
                      Align(
                        alignment: Alignment.center,
                        child: Container (
                          //color: Colors.red,//debug
                          margin: const EdgeInsets.fromLTRB(2, 8, 0, 5),
                          width: double.infinity,
                          child: Text(
                            title,
                            style: GoogleFonts.roboto(
                                textStyle: const TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 21,
                                )
                            ),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            textAlign: TextAlign.left,
                          ),
                        ),

                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Container (
                          //color: Colors.amberAccent,
                          margin: const EdgeInsets.fromLTRB(3, 2, 10, 7),
                          width: double.infinity,
                          //color: Colors.red,
                          child: Text(
                            summary,
                            style: GoogleFonts.roboto(
                                textStyle: const TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14.5,
                                )
                            ),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 4,
                            textAlign: TextAlign.left,
                          ),
                        ),

                      ),
                      const Spacer(),
                      Align(
                        alignment: Alignment.bottomLeft,
                        child: Container(
                          //color: Colors.greenAccent,
                          margin: const EdgeInsets.fromLTRB(1, 0, 7, 0),
                          width: double.infinity,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 7),
                                margin: const EdgeInsets.fromLTRB(0, 0, 0, 7),
                                decoration: BoxDecoration(
                                  color: Colors.black.withOpacity(0.4),
                                  borderRadius: BorderRadius.circular(6),
                                ),
                                child: Row(
                                  children: [
                                    const Icon(
                                      Icons.star,
                                      color: Colors.yellow,
                                      size: 18,
                                    ),
                                    const SizedBox(width: 7),
                                    Text(rating),
                                  ],
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 7),
                                margin: const EdgeInsets.fromLTRB(0, 0, 0, 7),
                                decoration: BoxDecoration(
                                  color: Colors.black.withOpacity(0.4),
                                  borderRadius: BorderRadius.circular(6),
                                ),
                                child: Row(
                                  children: [
                                    const Icon(
                                      Icons.schedule,
                                      color: Colors.blue,
                                      size: 18,
                                    ),
                                    const SizedBox(width: 7),
                                    Text(duration),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),

                      ),
                    ],
                  ),
              )

            ],
          ),
        ),
    );
  }
}

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
      body: Column(
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
                  textStyle: TextStyle(
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
      )
    );
  }
}