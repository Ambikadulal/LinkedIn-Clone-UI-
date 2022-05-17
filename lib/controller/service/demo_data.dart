import '../../models/post_list.dart';
import '../../models/user.dart';

class Data {
  static final List<UserPostModel> postList = [
    UserPostModel(
        name: "Profile 1",
        profileUrl: "assets/post1.jpg",
        headline: "HR Executive ",
        tags: " #learning #New #AboutFlower #linkedin ",
        description:
            "A flower, sometimes known as a bloom or blossom, is the reproductive structure found in flowering plants (plants of the division Angiospermae).",
        isVideoPost: false,
        comments: "100",
        video: "",
        isOnline: false,
        image: "assets/post1.jpg",
        likes: "800"),
    UserPostModel(
        name: "Profile 2",
        profileUrl: "assets/post2.jpg",
        headline: "Full Stack Developer | Freelancer",
        tags: "#DevFestival #GDG #GDE",
        description:
            "Without the sweat, toil and sacrifices of our heroes, we wouldn’t have this bright day that we celebrate today.",
        isVideoPost: false,
        comments: "1k",
        video: "",
        isOnline: true,
        image: "assets/post2.jpg",
        likes: "20k"),
    UserPostModel(
        name: "Profile 3",
        profileUrl: "assets/post3.jpg",
        headline: "Logo Designer | Freelancer |",
        tags: "#datascience #machinelearning #programming #python #dart",
        description: "Google, Stack Overflow are your saviors :)",
        isVideoPost: false,
        comments: "100",
        video: "",
        isOnline: true,
        image: "assets/post3.jpg",
        likes: "230"),
  ];
  static final userProfile = UserModel(
      headline: "Android & IOS Mobile Application flutter developer | Freelancer",
      profileUrl: "assets/profile.jpg",
      name: "ABC ",
      connections: "1,837",
      viewProfile: "300");
}
