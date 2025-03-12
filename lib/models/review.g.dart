// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'review.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ReviewAdapter extends TypeAdapter<Review> {
  @override
  final int typeId = 0;

  @override
  Review read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Review(
      exhibitionName: fields[0] as String,
      reviewerName: fields[1] as String,
      comment: fields[2] as String,
      rating: fields[3] as int,
      likes: fields[4] as int,
    );
  }

  @override
  void write(BinaryWriter writer, Review obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.exhibitionName)
      ..writeByte(1)
      ..write(obj.reviewerName)
      ..writeByte(2)
      ..write(obj.comment)
      ..writeByte(3)
      ..write(obj.rating)
      ..writeByte(4)
      ..write(obj.likes);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ReviewAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
