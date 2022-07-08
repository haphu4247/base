import 'package:hive/hive.dart';

import '../type_id.dart';

part 'user_role.g.dart';

@HiveType(typeId: TypeID.type2)
enum UserRole {
  @HiveField(0)
  normal,
  @HiveField(1)
  admin,
  @HiveField(2)
  supper,
}
