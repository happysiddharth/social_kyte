import 'followersTimeStamp.dart';

class ParticularUser {
  String name;
  String id;
  int followersCount;
  int followingCount;
  String bio;
  List<FollowersTimeStamp> followersData;

  ParticularUser({
    this.id,
    this.name,
    this.followersCount,
    this.followersData,
    this.followingCount,
    this.bio,
  });
}
