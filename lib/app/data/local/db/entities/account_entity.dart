import 'package:base/app/data/local/db/entities/user_role.dart';
import 'package:base/app/data/local/db/type_id.dart';
import 'package:hive/hive.dart';

import '../../../../base/base_entity.dart';

part 'account_entity.g.dart';

@HiveType(typeId: TypeID.type0)
class AccountEntity extends BaseEntity<AccountEntity> {
  @HiveField(0)
  int id = 1;
  @HiveField(1)
  String firstName;
  @HiveField(2)
  String lastName;
  @HiveField(3)
  UserRole userRole;
  @HiveField(4)
  DateTime createdAt;

  AccountEntity({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.userRole,
    required this.createdAt,
  });
}
