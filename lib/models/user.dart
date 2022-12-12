/* 
User class that contains all attributes of a user of the app.
A user only has an id associated with their login through
firebase auth.
 */

class AppUser {
  // User Instances
  final String? uid;

  AppUser({this.uid});
}
