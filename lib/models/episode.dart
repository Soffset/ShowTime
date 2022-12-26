class Episode {
  final int id;
  final String name;
  final int number;
  final String summary;
  final String image;
  Episode({
    required this.id,
    required this.name,
    required this.number,
    required this.summary,
    required this.image,
  });
  static String placeholderImg = 'https://cinemaone.net/images/movie_placeholder.png';

  factory Episode.fromJson(dynamic json) {
    return Episode(
      id: json['id'],
      name: json['name'],
      number: json['number'],
      summary: formatString(checkString(json['summary'])),
      image: json['image'] != null ? json['image']['medium'] : placeholderImg,
    );
  }

  static List<Episode> showsFromSnapshot(List snapshot) {
    return snapshot.map((data) {
      return Episode.fromJson(data);
    }).toList();
  }

  static String formatString(String str){
    String formatted = str;
    formatted = formatted.replaceAll ("<p>", "").replaceAll ("</p>", "");
    formatted = formatted.replaceAll ("<b>", "").replaceAll ("</b>", "");
    formatted = formatted.replaceAll ("<i>", "").replaceAll ("</i>", "");
    return formatted;
  }
  static String checkString(str){
    if(str == null) {
      return 'none';
    } else{
      return str.toString();
    }
  }
}