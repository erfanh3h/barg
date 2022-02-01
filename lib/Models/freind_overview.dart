import '../Controllers/global.dart';

class FriendOverviewModel {
  final int id;
  final String guid, name;

  FriendOverviewModel({
    required this.id,
    required this.guid,
    required this.name,
  });

  factory FriendOverviewModel.fromJson(Map datas) {
    return FriendOverviewModel(
      id: datas['id'],
      guid: GlobalEntity.dataFilter(datas['guid']),
      name: GlobalEntity.dataFilter(datas['name']),
    );
  }
}
