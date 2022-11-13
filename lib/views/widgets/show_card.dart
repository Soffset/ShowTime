import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ShowCard extends StatelessWidget {
  final String title;
  final String rating;
  final String duration;
  final String thumbnailUrl;
  final String summary;
  const ShowCard({Key? key,
    required this.title,
    required this.duration,
    required this.rating,
    required this.thumbnailUrl,
    required this.summary
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height/4.15,
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            color: const Color(0xff48495B),
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
                  margin: const EdgeInsets.symmetric(horizontal: 7, vertical: 7),
                  width: MediaQuery.of(context).size.width/3.2,
                  height: MediaQuery.of(context).size.height,
                  child:
                  ClipRRect(
                      borderRadius: BorderRadius.circular(6),
                      child: Image(
                          image: NetworkImage(thumbnailUrl),
                          fit: BoxFit.fill
                      )
                  )
              ),
              Expanded(
                  flex: 1,
                  child: Container(
                    //color: Colors.greenAccent,
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
                  ),
              )

            ],
          ),
        ),
    );

  }
}