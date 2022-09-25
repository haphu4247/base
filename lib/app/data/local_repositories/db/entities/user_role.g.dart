// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_role.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserRoleAdapter extends TypeAdapter<UserRole> {
  @override
  final int typeId = 2;

  @override
  UserRole read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return UserRole.normal;
      case 1:
        return UserRole.admin;
      case 2:
        return UserRole.supper;
      default:
        return UserRole.normal;
    }
  }

  @override
  void write(BinaryWriter writer, UserRole obj) {
    switch (obj) {
      case UserRole.normal:
        writer.writeByte(0);
        break;
      case UserRole.admin:
        writer.writeByte(1);
        break;
      case UserRole.supper:
        writer.writeByte(2);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserRoleAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
