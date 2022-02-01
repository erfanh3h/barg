import '../Controllers/global.dart';
import 'freind_overview.dart';

class UserModel {
  final String guid,
      balance,
      picture,
      eyeColor,
      name,
      company,
      gender,
      email,
      phone,
      address,
      about,
      registered,
      greeting,
      favoriteFruit;
  final bool isOwner;
  final int age;
  final double latitude, longitude;
  final List<String> tags;
  final List<FriendOverviewModel> friends;
  UserModel({
    required this.guid,
    required this.balance,
    required this.picture,
    required this.eyeColor,
    required this.name,
    required this.company,
    required this.gender,
    required this.email,
    required this.phone,
    required this.address,
    required this.about,
    required this.registered,
    required this.greeting,
    required this.favoriteFruit,
    required this.isOwner,
    required this.age,
    required this.latitude,
    required this.longitude,
    required this.tags,
    required this.friends,
  });

  factory UserModel.fromJson(Map datas) {
    final DateTime registerDate =
        DateTime.parse((datas['registered'].toString().split(' ')[0]));
    List<String> tags = [];
    try {
      datas['tags'].forEach((tag) => tags.add(tag));
    } catch (_) {}

    List<FriendOverviewModel> friends = [];
    try {
      datas['friends'].forEach((friendJson) =>
          friends.add(FriendOverviewModel.fromJson(friendJson)));
    } catch (_) {}
    return UserModel(
      guid: GlobalEntity.dataFilter(datas['guid']),
      balance: GlobalEntity.dataFilter(datas['balance']),
      picture: GlobalEntity.dataFilter(datas['picture']),
      eyeColor: GlobalEntity.dataFilter(datas['eyeColor']),
      name: GlobalEntity.dataFilter(datas['name']),
      company: GlobalEntity.dataFilter(datas['company']),
      gender: GlobalEntity.dataFilter(datas['gender']),
      email: GlobalEntity.dataFilter(datas['email']),
      phone: GlobalEntity.dataFilter(datas['phone']),
      address: GlobalEntity.dataFilter(datas['address']),
      about: GlobalEntity.dataFilter(datas['about']),
      registered: '${registerDate.hour}:${registerDate.minute}',
      greeting: GlobalEntity.dataFilter(datas['greeting']),
      favoriteFruit: GlobalEntity.dataFilter(datas['favoriteFruit']),
      isOwner: datas['isOwner'],
      age: datas['age'],
      latitude: datas['latitude'],
      longitude: datas['longitude'],
      tags: tags,
      friends: friends,
    );
  }
}

