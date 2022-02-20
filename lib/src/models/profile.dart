class Profile {
  final String memberID;
  final String market;

  Profile({this.memberID, this.market});

  factory Profile.fromJson(Map<String, dynamic> json) {
    return Profile(
      memberID: json['memberID'],
      market: json['market'],
    );
  }
}