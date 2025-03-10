import 'package:timeago/timeago.dart' as timeago;

String calculateDateDifference({required String publishedAt}) {
  // Convert the string to DateTime
  DateTime publishedDate = DateTime.parse(publishedAt);

  // Get the current date/time
  DateTime currentTime = DateTime.now();

  // Calculate the difference in hours
  Duration difference = currentTime.difference(publishedDate);

  // If the difference is less than 24 hours, display hours ago
  if (difference.inHours < 24) {
    // Show the exact number of hours ago
    if (difference.inHours == 1) {
      return "1 hour ago";
    } else {
      return "${difference.inHours} hours ago";
    }
  }
  // If the difference is between 24 hours and 48 hours, display 'a day ago'
  else if (difference.inDays == 1) {
    return "a day ago";
  }
  // If the difference is more than 1 day, display days ago
  else {
    return "${difference.inDays} days ago";
  }
}







// import 'package:timeago/timeago.dart' as timeago;

// String calculateDateDifference(String publishedAt) {
//   //This will convert String data to the DateTime data type
//   DateTime publishedDate = DateTime.parse(publishedAt);

//   //now getting correct datetime  to calculate the difference
//   DateTime currentTime = DateTime.now();

//     //aba yesle chai directly aajako din ra news published bhayeko din ko 
//     //date difference calculate garera directly kati din agadi ho teti days ago bhanera reply dinxa.


//   return timeago.format(publishedDate);
// }
