import 'package:flutter/material.dart';

class imagePage extends StatelessWidget{
  final String imageUrl;
  const imagePage({super.key,
    required this.imageUrl,
  });
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          AppBar(
            backgroundColor: Colors.black,
            actions: [
              IconButton(
                alignment: Alignment.centerRight,
                icon: const Icon(
                  Icons.close,
                ),
                onPressed: () { Navigator.pop(context); },
                color: Theme.of(context).appBarTheme.actionsIconTheme?.color,
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image(
                image: NetworkImage(
                  imageUrl,
                ),
                fit: BoxFit.cover,
                loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
                  if (loadingProgress == null) return child;
                  return Center(
                    child: CircularProgressIndicator(
                      value: loadingProgress.expectedTotalBytes != null ? loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes! : null,
                    ),
                  );
                },
              ),
            ],
          ),
        ],
      ),
    );
    // TODO: implement build
    throw UnimplementedError();
  }

}