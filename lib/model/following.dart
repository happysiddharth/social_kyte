class Following {
  String id;
  String userId;
  String profilePic;
  String followerId;
  String followerUserName;
  DateTime timeOfFollower;
  Following(
      {this.id,
      this.followerId,
      this.followerUserName,
      this.timeOfFollower,
      this.profilePic,
      this.userId});
}
