class Follower {
  String id;
  String userId;
  String profilePic;
  String followerId;
  String followerUserName;
  DateTime timeOfFollower;
  Follower(
      {this.id,
      this.followerId,
      this.followerUserName,
      this.timeOfFollower,
      this.profilePic,
      this.userId});
}
