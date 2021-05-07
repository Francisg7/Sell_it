class User {
  ///In this class,
  ///getters get data from the firebase variable, update the local object and return the object value
  ///Setters get data from the app(due to user interaction) Updates the firebase variable, then updates the local variable and finally returns the local variable

  ///To do test on each methods

  String id;
  String firstName;
  String lastName;
  var image;
  double rating;
  String lastSeen;
  bool isActive = false;

  String getId() {
    /// id = get data from firebase
    /// String id
    return this.id = id;
  }

  bool checkId(String checkId) {
    /// id = get data from firebase
    /// String id
    return id == checkId;
  }

  String getFirstName() {
    /// firstName = get data from firebase
    /// String firstName
    return this.firstName = firstName;
  }

  String getLastName() {
    ///  = get data from firebase
    ///  String lastName
    return this.lastName = lastName;
  }

  getImage() {
    ///  = get data from firebase
    ///  var image
    return this.image = image;
  }

  double getRating() {
    ///  = get data from firebase
    ///  double rating
    return this.rating = rating;
  }

  String getLastSeen() {
    ///  = get data from firebase
    ///  String lastSeen
    return this.lastSeen = lastSeen;
  }

  bool getIsActive() {
    ///  = get data from firebase
    ///  bool isActive
    return this.isActive = isActive;
  }

  String setId(String id) {
    /// id = get data from firebase
    return this.id = id;
  }

  String setFirstName(String firstName) {
    /// firstName = get data from firebase
    return this.firstName = firstName;
  }

  String setLastName(String lastName) {
    /// lastName = get data from firebase
    return this.lastName = lastName;
  }

  /*var*/ setImage(var image) {
    /// image = get data from firebase
    return this.image = image;
  }

  double setRating(double rating) {
    /// rating = get data from firebase
    return this.rating = rating;
  }

  String setLastSeen(String lastSeen) {
    /// lastName = get data from firebase
    return this.lastSeen = lastSeen;
  }

  bool setIsActive(bool isActive) {
    /// isActive = get data from firebase
    return this.isActive = isActive;
  }

  User(String id, String firstName, String lastName, double rating,
      String lastSeen, bool isActive, String image) {
    setId(id);
    setFirstName(firstName);
    setLastName(lastName);
    setRating(rating);
    setLastSeen(lastSeen);
    setIsActive(isActive);
    setImage(image);
  }

  User.fromUser(String id) {
    checkId(id);
    getFirstName();
    getLastName();
    getRating();
    getLastSeen();
    getIsActive();
  }
}

/*
List sampleUsers = [
  User(id)
]
*/
