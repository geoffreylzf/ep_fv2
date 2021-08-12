// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'db.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class Company extends DataClass implements Insertable<Company> {
  final int id;
  final String companyCode;
  final String companyName;
  Company(
      {required this.id, required this.companyCode, required this.companyName});
  factory Company.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return Company(
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      companyCode: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}company_code'])!,
      companyName: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}company_name'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['company_code'] = Variable<String>(companyCode);
    map['company_name'] = Variable<String>(companyName);
    return map;
  }

  CompanyTbCompanion toCompanion(bool nullToAbsent) {
    return CompanyTbCompanion(
      id: Value(id),
      companyCode: Value(companyCode),
      companyName: Value(companyName),
    );
  }

  factory Company.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return Company(
      id: serializer.fromJson<int>(json['id']),
      companyCode: serializer.fromJson<String>(json['company_code']),
      companyName: serializer.fromJson<String>(json['company_name']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'company_code': serializer.toJson<String>(companyCode),
      'company_name': serializer.toJson<String>(companyName),
    };
  }

  Company copyWith({int? id, String? companyCode, String? companyName}) =>
      Company(
        id: id ?? this.id,
        companyCode: companyCode ?? this.companyCode,
        companyName: companyName ?? this.companyName,
      );
  @override
  String toString() {
    return (StringBuffer('Company(')
          ..write('id: $id, ')
          ..write('companyCode: $companyCode, ')
          ..write('companyName: $companyName')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf(
      $mrjc(id.hashCode, $mrjc(companyCode.hashCode, companyName.hashCode)));
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Company &&
          other.id == this.id &&
          other.companyCode == this.companyCode &&
          other.companyName == this.companyName);
}

class CompanyTbCompanion extends UpdateCompanion<Company> {
  final Value<int> id;
  final Value<String> companyCode;
  final Value<String> companyName;
  const CompanyTbCompanion({
    this.id = const Value.absent(),
    this.companyCode = const Value.absent(),
    this.companyName = const Value.absent(),
  });
  CompanyTbCompanion.insert({
    this.id = const Value.absent(),
    required String companyCode,
    required String companyName,
  })  : companyCode = Value(companyCode),
        companyName = Value(companyName);
  static Insertable<Company> custom({
    Expression<int>? id,
    Expression<String>? companyCode,
    Expression<String>? companyName,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (companyCode != null) 'company_code': companyCode,
      if (companyName != null) 'company_name': companyName,
    });
  }

  CompanyTbCompanion copyWith(
      {Value<int>? id,
      Value<String>? companyCode,
      Value<String>? companyName}) {
    return CompanyTbCompanion(
      id: id ?? this.id,
      companyCode: companyCode ?? this.companyCode,
      companyName: companyName ?? this.companyName,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (companyCode.present) {
      map['company_code'] = Variable<String>(companyCode.value);
    }
    if (companyName.present) {
      map['company_name'] = Variable<String>(companyName.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CompanyTbCompanion(')
          ..write('id: $id, ')
          ..write('companyCode: $companyCode, ')
          ..write('companyName: $companyName')
          ..write(')'))
        .toString();
  }
}

class $CompanyTbTable extends CompanyTb
    with TableInfo<$CompanyTbTable, Company> {
  final GeneratedDatabase _db;
  final String? _alias;
  $CompanyTbTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  late final GeneratedColumn<int?> id = GeneratedColumn<int?>(
      'id', aliasedName, false,
      typeName: 'INTEGER',
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _companyCodeMeta =
      const VerificationMeta('companyCode');
  late final GeneratedColumn<String?> companyCode = GeneratedColumn<String?>(
      'company_code', aliasedName, false,
      typeName: 'TEXT', requiredDuringInsert: true);
  final VerificationMeta _companyNameMeta =
      const VerificationMeta('companyName');
  late final GeneratedColumn<String?> companyName = GeneratedColumn<String?>(
      'company_name', aliasedName, false,
      typeName: 'TEXT', requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, companyCode, companyName];
  @override
  String get aliasedName => _alias ?? 'company';
  @override
  String get actualTableName => 'company';
  @override
  VerificationContext validateIntegrity(Insertable<Company> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('company_code')) {
      context.handle(
          _companyCodeMeta,
          companyCode.isAcceptableOrUnknown(
              data['company_code']!, _companyCodeMeta));
    } else if (isInserting) {
      context.missing(_companyCodeMeta);
    }
    if (data.containsKey('company_name')) {
      context.handle(
          _companyNameMeta,
          companyName.isAcceptableOrUnknown(
              data['company_name']!, _companyNameMeta));
    } else if (isInserting) {
      context.missing(_companyNameMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Company map(Map<String, dynamic> data, {String? tablePrefix}) {
    return Company.fromData(data, _db,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $CompanyTbTable createAlias(String alias) {
    return $CompanyTbTable(_db, alias);
  }
}

class Location extends DataClass implements Insertable<Location> {
  final int id;
  final String locationCode;
  final String locationName;
  final int companyId;
  Location(
      {required this.id,
      required this.locationCode,
      required this.locationName,
      required this.companyId});
  factory Location.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return Location(
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      locationCode: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}location_code'])!,
      locationName: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}location_name'])!,
      companyId: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}company_id'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['location_code'] = Variable<String>(locationCode);
    map['location_name'] = Variable<String>(locationName);
    map['company_id'] = Variable<int>(companyId);
    return map;
  }

  LocationTbCompanion toCompanion(bool nullToAbsent) {
    return LocationTbCompanion(
      id: Value(id),
      locationCode: Value(locationCode),
      locationName: Value(locationName),
      companyId: Value(companyId),
    );
  }

  factory Location.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return Location(
      id: serializer.fromJson<int>(json['id']),
      locationCode: serializer.fromJson<String>(json['location_code']),
      locationName: serializer.fromJson<String>(json['location_name']),
      companyId: serializer.fromJson<int>(json['company']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'location_code': serializer.toJson<String>(locationCode),
      'location_name': serializer.toJson<String>(locationName),
      'company': serializer.toJson<int>(companyId),
    };
  }

  Location copyWith(
          {int? id,
          String? locationCode,
          String? locationName,
          int? companyId}) =>
      Location(
        id: id ?? this.id,
        locationCode: locationCode ?? this.locationCode,
        locationName: locationName ?? this.locationName,
        companyId: companyId ?? this.companyId,
      );
  @override
  String toString() {
    return (StringBuffer('Location(')
          ..write('id: $id, ')
          ..write('locationCode: $locationCode, ')
          ..write('locationName: $locationName, ')
          ..write('companyId: $companyId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      id.hashCode,
      $mrjc(locationCode.hashCode,
          $mrjc(locationName.hashCode, companyId.hashCode))));
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Location &&
          other.id == this.id &&
          other.locationCode == this.locationCode &&
          other.locationName == this.locationName &&
          other.companyId == this.companyId);
}

class LocationTbCompanion extends UpdateCompanion<Location> {
  final Value<int> id;
  final Value<String> locationCode;
  final Value<String> locationName;
  final Value<int> companyId;
  const LocationTbCompanion({
    this.id = const Value.absent(),
    this.locationCode = const Value.absent(),
    this.locationName = const Value.absent(),
    this.companyId = const Value.absent(),
  });
  LocationTbCompanion.insert({
    this.id = const Value.absent(),
    required String locationCode,
    required String locationName,
    required int companyId,
  })  : locationCode = Value(locationCode),
        locationName = Value(locationName),
        companyId = Value(companyId);
  static Insertable<Location> custom({
    Expression<int>? id,
    Expression<String>? locationCode,
    Expression<String>? locationName,
    Expression<int>? companyId,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (locationCode != null) 'location_code': locationCode,
      if (locationName != null) 'location_name': locationName,
      if (companyId != null) 'company_id': companyId,
    });
  }

  LocationTbCompanion copyWith(
      {Value<int>? id,
      Value<String>? locationCode,
      Value<String>? locationName,
      Value<int>? companyId}) {
    return LocationTbCompanion(
      id: id ?? this.id,
      locationCode: locationCode ?? this.locationCode,
      locationName: locationName ?? this.locationName,
      companyId: companyId ?? this.companyId,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (locationCode.present) {
      map['location_code'] = Variable<String>(locationCode.value);
    }
    if (locationName.present) {
      map['location_name'] = Variable<String>(locationName.value);
    }
    if (companyId.present) {
      map['company_id'] = Variable<int>(companyId.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('LocationTbCompanion(')
          ..write('id: $id, ')
          ..write('locationCode: $locationCode, ')
          ..write('locationName: $locationName, ')
          ..write('companyId: $companyId')
          ..write(')'))
        .toString();
  }
}

class $LocationTbTable extends LocationTb
    with TableInfo<$LocationTbTable, Location> {
  final GeneratedDatabase _db;
  final String? _alias;
  $LocationTbTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  late final GeneratedColumn<int?> id = GeneratedColumn<int?>(
      'id', aliasedName, false,
      typeName: 'INTEGER',
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _locationCodeMeta =
      const VerificationMeta('locationCode');
  late final GeneratedColumn<String?> locationCode = GeneratedColumn<String?>(
      'location_code', aliasedName, false,
      typeName: 'TEXT', requiredDuringInsert: true);
  final VerificationMeta _locationNameMeta =
      const VerificationMeta('locationName');
  late final GeneratedColumn<String?> locationName = GeneratedColumn<String?>(
      'location_name', aliasedName, false,
      typeName: 'TEXT', requiredDuringInsert: true);
  final VerificationMeta _companyIdMeta = const VerificationMeta('companyId');
  late final GeneratedColumn<int?> companyId = GeneratedColumn<int?>(
      'company_id', aliasedName, false,
      typeName: 'INTEGER', requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [id, locationCode, locationName, companyId];
  @override
  String get aliasedName => _alias ?? 'location';
  @override
  String get actualTableName => 'location';
  @override
  VerificationContext validateIntegrity(Insertable<Location> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('location_code')) {
      context.handle(
          _locationCodeMeta,
          locationCode.isAcceptableOrUnknown(
              data['location_code']!, _locationCodeMeta));
    } else if (isInserting) {
      context.missing(_locationCodeMeta);
    }
    if (data.containsKey('location_name')) {
      context.handle(
          _locationNameMeta,
          locationName.isAcceptableOrUnknown(
              data['location_name']!, _locationNameMeta));
    } else if (isInserting) {
      context.missing(_locationNameMeta);
    }
    if (data.containsKey('company_id')) {
      context.handle(_companyIdMeta,
          companyId.isAcceptableOrUnknown(data['company_id']!, _companyIdMeta));
    } else if (isInserting) {
      context.missing(_companyIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Location map(Map<String, dynamic> data, {String? tablePrefix}) {
    return Location.fromData(data, _db,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $LocationTbTable createAlias(String alias) {
    return $LocationTbTable(_db, alias);
  }
}

class LocHouse extends DataClass implements Insertable<LocHouse> {
  final int id;
  final int locationId;
  final int houseNo;
  LocHouse({required this.id, required this.locationId, required this.houseNo});
  factory LocHouse.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return LocHouse(
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      locationId: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}location_id'])!,
      houseNo: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}house_no'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['location_id'] = Variable<int>(locationId);
    map['house_no'] = Variable<int>(houseNo);
    return map;
  }

  LocHouseTbCompanion toCompanion(bool nullToAbsent) {
    return LocHouseTbCompanion(
      id: Value(id),
      locationId: Value(locationId),
      houseNo: Value(houseNo),
    );
  }

  factory LocHouse.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return LocHouse(
      id: serializer.fromJson<int>(json['id']),
      locationId: serializer.fromJson<int>(json['location']),
      houseNo: serializer.fromJson<int>(json['house_no']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'location': serializer.toJson<int>(locationId),
      'house_no': serializer.toJson<int>(houseNo),
    };
  }

  LocHouse copyWith({int? id, int? locationId, int? houseNo}) => LocHouse(
        id: id ?? this.id,
        locationId: locationId ?? this.locationId,
        houseNo: houseNo ?? this.houseNo,
      );
  @override
  String toString() {
    return (StringBuffer('LocHouse(')
          ..write('id: $id, ')
          ..write('locationId: $locationId, ')
          ..write('houseNo: $houseNo')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      $mrjf($mrjc(id.hashCode, $mrjc(locationId.hashCode, houseNo.hashCode)));
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is LocHouse &&
          other.id == this.id &&
          other.locationId == this.locationId &&
          other.houseNo == this.houseNo);
}

class LocHouseTbCompanion extends UpdateCompanion<LocHouse> {
  final Value<int> id;
  final Value<int> locationId;
  final Value<int> houseNo;
  const LocHouseTbCompanion({
    this.id = const Value.absent(),
    this.locationId = const Value.absent(),
    this.houseNo = const Value.absent(),
  });
  LocHouseTbCompanion.insert({
    this.id = const Value.absent(),
    required int locationId,
    required int houseNo,
  })  : locationId = Value(locationId),
        houseNo = Value(houseNo);
  static Insertable<LocHouse> custom({
    Expression<int>? id,
    Expression<int>? locationId,
    Expression<int>? houseNo,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (locationId != null) 'location_id': locationId,
      if (houseNo != null) 'house_no': houseNo,
    });
  }

  LocHouseTbCompanion copyWith(
      {Value<int>? id, Value<int>? locationId, Value<int>? houseNo}) {
    return LocHouseTbCompanion(
      id: id ?? this.id,
      locationId: locationId ?? this.locationId,
      houseNo: houseNo ?? this.houseNo,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (locationId.present) {
      map['location_id'] = Variable<int>(locationId.value);
    }
    if (houseNo.present) {
      map['house_no'] = Variable<int>(houseNo.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('LocHouseTbCompanion(')
          ..write('id: $id, ')
          ..write('locationId: $locationId, ')
          ..write('houseNo: $houseNo')
          ..write(')'))
        .toString();
  }
}

class $LocHouseTbTable extends LocHouseTb
    with TableInfo<$LocHouseTbTable, LocHouse> {
  final GeneratedDatabase _db;
  final String? _alias;
  $LocHouseTbTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  late final GeneratedColumn<int?> id = GeneratedColumn<int?>(
      'id', aliasedName, false,
      typeName: 'INTEGER',
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _locationIdMeta = const VerificationMeta('locationId');
  late final GeneratedColumn<int?> locationId = GeneratedColumn<int?>(
      'location_id', aliasedName, false,
      typeName: 'INTEGER', requiredDuringInsert: true);
  final VerificationMeta _houseNoMeta = const VerificationMeta('houseNo');
  late final GeneratedColumn<int?> houseNo = GeneratedColumn<int?>(
      'house_no', aliasedName, false,
      typeName: 'INTEGER', requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, locationId, houseNo];
  @override
  String get aliasedName => _alias ?? 'loc_house';
  @override
  String get actualTableName => 'loc_house';
  @override
  VerificationContext validateIntegrity(Insertable<LocHouse> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('location_id')) {
      context.handle(
          _locationIdMeta,
          locationId.isAcceptableOrUnknown(
              data['location_id']!, _locationIdMeta));
    } else if (isInserting) {
      context.missing(_locationIdMeta);
    }
    if (data.containsKey('house_no')) {
      context.handle(_houseNoMeta,
          houseNo.isAcceptableOrUnknown(data['house_no']!, _houseNoMeta));
    } else if (isInserting) {
      context.missing(_houseNoMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  LocHouse map(Map<String, dynamic> data, {String? tablePrefix}) {
    return LocHouse.fromData(data, _db,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $LocHouseTbTable createAlias(String alias) {
    return $LocHouseTbTable(_db, alias);
  }
}

class BroFa2Do extends DataClass implements Insertable<BroFa2Do> {
  final int id;
  final String name;
  final String stdValue;
  final bool isFormula;
  final String? formula;
  final int order;
  BroFa2Do(
      {required this.id,
      required this.name,
      required this.stdValue,
      required this.isFormula,
      this.formula,
      required this.order});
  factory BroFa2Do.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return BroFa2Do(
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      name: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}name'])!,
      stdValue: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}std_value'])!,
      isFormula: const BoolType()
          .mapFromDatabaseResponse(data['${effectivePrefix}is_formula'])!,
      formula: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}formula']),
      order: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}order'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['std_value'] = Variable<String>(stdValue);
    map['is_formula'] = Variable<bool>(isFormula);
    if (!nullToAbsent || formula != null) {
      map['formula'] = Variable<String?>(formula);
    }
    map['order'] = Variable<int>(order);
    return map;
  }

  BroFa2DoTbCompanion toCompanion(bool nullToAbsent) {
    return BroFa2DoTbCompanion(
      id: Value(id),
      name: Value(name),
      stdValue: Value(stdValue),
      isFormula: Value(isFormula),
      formula: formula == null && nullToAbsent
          ? const Value.absent()
          : Value(formula),
      order: Value(order),
    );
  }

  factory BroFa2Do.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return BroFa2Do(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      stdValue: serializer.fromJson<String>(json['std_value']),
      isFormula: serializer.fromJson<bool>(json['is_formula']),
      formula: serializer.fromJson<String?>(json['formula']),
      order: serializer.fromJson<int>(json['order']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'std_value': serializer.toJson<String>(stdValue),
      'is_formula': serializer.toJson<bool>(isFormula),
      'formula': serializer.toJson<String?>(formula),
      'order': serializer.toJson<int>(order),
    };
  }

  BroFa2Do copyWith(
          {int? id,
          String? name,
          String? stdValue,
          bool? isFormula,
          String? formula,
          int? order}) =>
      BroFa2Do(
        id: id ?? this.id,
        name: name ?? this.name,
        stdValue: stdValue ?? this.stdValue,
        isFormula: isFormula ?? this.isFormula,
        formula: formula ?? this.formula,
        order: order ?? this.order,
      );
  @override
  String toString() {
    return (StringBuffer('BroFa2Do(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('stdValue: $stdValue, ')
          ..write('isFormula: $isFormula, ')
          ..write('formula: $formula, ')
          ..write('order: $order')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      id.hashCode,
      $mrjc(
          name.hashCode,
          $mrjc(
              stdValue.hashCode,
              $mrjc(isFormula.hashCode,
                  $mrjc(formula.hashCode, order.hashCode))))));
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is BroFa2Do &&
          other.id == this.id &&
          other.name == this.name &&
          other.stdValue == this.stdValue &&
          other.isFormula == this.isFormula &&
          other.formula == this.formula &&
          other.order == this.order);
}

class BroFa2DoTbCompanion extends UpdateCompanion<BroFa2Do> {
  final Value<int> id;
  final Value<String> name;
  final Value<String> stdValue;
  final Value<bool> isFormula;
  final Value<String?> formula;
  final Value<int> order;
  const BroFa2DoTbCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.stdValue = const Value.absent(),
    this.isFormula = const Value.absent(),
    this.formula = const Value.absent(),
    this.order = const Value.absent(),
  });
  BroFa2DoTbCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required String stdValue,
    required bool isFormula,
    this.formula = const Value.absent(),
    required int order,
  })  : name = Value(name),
        stdValue = Value(stdValue),
        isFormula = Value(isFormula),
        order = Value(order);
  static Insertable<BroFa2Do> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? stdValue,
    Expression<bool>? isFormula,
    Expression<String?>? formula,
    Expression<int>? order,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (stdValue != null) 'std_value': stdValue,
      if (isFormula != null) 'is_formula': isFormula,
      if (formula != null) 'formula': formula,
      if (order != null) 'order': order,
    });
  }

  BroFa2DoTbCompanion copyWith(
      {Value<int>? id,
      Value<String>? name,
      Value<String>? stdValue,
      Value<bool>? isFormula,
      Value<String?>? formula,
      Value<int>? order}) {
    return BroFa2DoTbCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      stdValue: stdValue ?? this.stdValue,
      isFormula: isFormula ?? this.isFormula,
      formula: formula ?? this.formula,
      order: order ?? this.order,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (stdValue.present) {
      map['std_value'] = Variable<String>(stdValue.value);
    }
    if (isFormula.present) {
      map['is_formula'] = Variable<bool>(isFormula.value);
    }
    if (formula.present) {
      map['formula'] = Variable<String?>(formula.value);
    }
    if (order.present) {
      map['order'] = Variable<int>(order.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('BroFa2DoTbCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('stdValue: $stdValue, ')
          ..write('isFormula: $isFormula, ')
          ..write('formula: $formula, ')
          ..write('order: $order')
          ..write(')'))
        .toString();
  }
}

class $BroFa2DoTbTable extends BroFa2DoTb
    with TableInfo<$BroFa2DoTbTable, BroFa2Do> {
  final GeneratedDatabase _db;
  final String? _alias;
  $BroFa2DoTbTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  late final GeneratedColumn<int?> id = GeneratedColumn<int?>(
      'id', aliasedName, false,
      typeName: 'INTEGER',
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _nameMeta = const VerificationMeta('name');
  late final GeneratedColumn<String?> name = GeneratedColumn<String?>(
      'name', aliasedName, false,
      typeName: 'TEXT', requiredDuringInsert: true);
  final VerificationMeta _stdValueMeta = const VerificationMeta('stdValue');
  late final GeneratedColumn<String?> stdValue = GeneratedColumn<String?>(
      'std_value', aliasedName, false,
      typeName: 'TEXT', requiredDuringInsert: true);
  final VerificationMeta _isFormulaMeta = const VerificationMeta('isFormula');
  late final GeneratedColumn<bool?> isFormula = GeneratedColumn<bool?>(
      'is_formula', aliasedName, false,
      typeName: 'INTEGER',
      requiredDuringInsert: true,
      defaultConstraints: 'CHECK (is_formula IN (0, 1))');
  final VerificationMeta _formulaMeta = const VerificationMeta('formula');
  late final GeneratedColumn<String?> formula = GeneratedColumn<String?>(
      'formula', aliasedName, true,
      typeName: 'TEXT', requiredDuringInsert: false);
  final VerificationMeta _orderMeta = const VerificationMeta('order');
  late final GeneratedColumn<int?> order = GeneratedColumn<int?>(
      'order', aliasedName, false,
      typeName: 'INTEGER', requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [id, name, stdValue, isFormula, formula, order];
  @override
  String get aliasedName => _alias ?? 'bro_fa2_do';
  @override
  String get actualTableName => 'bro_fa2_do';
  @override
  VerificationContext validateIntegrity(Insertable<BroFa2Do> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('std_value')) {
      context.handle(_stdValueMeta,
          stdValue.isAcceptableOrUnknown(data['std_value']!, _stdValueMeta));
    } else if (isInserting) {
      context.missing(_stdValueMeta);
    }
    if (data.containsKey('is_formula')) {
      context.handle(_isFormulaMeta,
          isFormula.isAcceptableOrUnknown(data['is_formula']!, _isFormulaMeta));
    } else if (isInserting) {
      context.missing(_isFormulaMeta);
    }
    if (data.containsKey('formula')) {
      context.handle(_formulaMeta,
          formula.isAcceptableOrUnknown(data['formula']!, _formulaMeta));
    }
    if (data.containsKey('order')) {
      context.handle(
          _orderMeta, order.isAcceptableOrUnknown(data['order']!, _orderMeta));
    } else if (isInserting) {
      context.missing(_orderMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  BroFa2Do map(Map<String, dynamic> data, {String? tablePrefix}) {
    return BroFa2Do.fromData(data, _db,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $BroFa2DoTbTable createAlias(String alias) {
    return $BroFa2DoTbTable(_db, alias);
  }
}

class BroFa2Fo extends DataClass implements Insertable<BroFa2Fo> {
  final int id;
  final String name;
  final bool isNumber;
  final bool isFormula;
  final String? formula;
  final bool isSelection;
  final bool isAllowPhoto;
  final int order;
  BroFa2Fo(
      {required this.id,
      required this.name,
      required this.isNumber,
      required this.isFormula,
      this.formula,
      required this.isSelection,
      required this.isAllowPhoto,
      required this.order});
  factory BroFa2Fo.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return BroFa2Fo(
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      name: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}name'])!,
      isNumber: const BoolType()
          .mapFromDatabaseResponse(data['${effectivePrefix}is_number'])!,
      isFormula: const BoolType()
          .mapFromDatabaseResponse(data['${effectivePrefix}is_formula'])!,
      formula: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}formula']),
      isSelection: const BoolType()
          .mapFromDatabaseResponse(data['${effectivePrefix}is_selection'])!,
      isAllowPhoto: const BoolType()
          .mapFromDatabaseResponse(data['${effectivePrefix}is_allow_photo'])!,
      order: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}order'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['is_number'] = Variable<bool>(isNumber);
    map['is_formula'] = Variable<bool>(isFormula);
    if (!nullToAbsent || formula != null) {
      map['formula'] = Variable<String?>(formula);
    }
    map['is_selection'] = Variable<bool>(isSelection);
    map['is_allow_photo'] = Variable<bool>(isAllowPhoto);
    map['order'] = Variable<int>(order);
    return map;
  }

  BroFa2FoTbCompanion toCompanion(bool nullToAbsent) {
    return BroFa2FoTbCompanion(
      id: Value(id),
      name: Value(name),
      isNumber: Value(isNumber),
      isFormula: Value(isFormula),
      formula: formula == null && nullToAbsent
          ? const Value.absent()
          : Value(formula),
      isSelection: Value(isSelection),
      isAllowPhoto: Value(isAllowPhoto),
      order: Value(order),
    );
  }

  factory BroFa2Fo.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return BroFa2Fo(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      isNumber: serializer.fromJson<bool>(json['is_number']),
      isFormula: serializer.fromJson<bool>(json['is_formula']),
      formula: serializer.fromJson<String?>(json['formula']),
      isSelection: serializer.fromJson<bool>(json['is_selection']),
      isAllowPhoto: serializer.fromJson<bool>(json['is_allow_photo']),
      order: serializer.fromJson<int>(json['order']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'is_number': serializer.toJson<bool>(isNumber),
      'is_formula': serializer.toJson<bool>(isFormula),
      'formula': serializer.toJson<String?>(formula),
      'is_selection': serializer.toJson<bool>(isSelection),
      'is_allow_photo': serializer.toJson<bool>(isAllowPhoto),
      'order': serializer.toJson<int>(order),
    };
  }

  BroFa2Fo copyWith(
          {int? id,
          String? name,
          bool? isNumber,
          bool? isFormula,
          String? formula,
          bool? isSelection,
          bool? isAllowPhoto,
          int? order}) =>
      BroFa2Fo(
        id: id ?? this.id,
        name: name ?? this.name,
        isNumber: isNumber ?? this.isNumber,
        isFormula: isFormula ?? this.isFormula,
        formula: formula ?? this.formula,
        isSelection: isSelection ?? this.isSelection,
        isAllowPhoto: isAllowPhoto ?? this.isAllowPhoto,
        order: order ?? this.order,
      );
  @override
  String toString() {
    return (StringBuffer('BroFa2Fo(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('isNumber: $isNumber, ')
          ..write('isFormula: $isFormula, ')
          ..write('formula: $formula, ')
          ..write('isSelection: $isSelection, ')
          ..write('isAllowPhoto: $isAllowPhoto, ')
          ..write('order: $order')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      id.hashCode,
      $mrjc(
          name.hashCode,
          $mrjc(
              isNumber.hashCode,
              $mrjc(
                  isFormula.hashCode,
                  $mrjc(
                      formula.hashCode,
                      $mrjc(isSelection.hashCode,
                          $mrjc(isAllowPhoto.hashCode, order.hashCode))))))));
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is BroFa2Fo &&
          other.id == this.id &&
          other.name == this.name &&
          other.isNumber == this.isNumber &&
          other.isFormula == this.isFormula &&
          other.formula == this.formula &&
          other.isSelection == this.isSelection &&
          other.isAllowPhoto == this.isAllowPhoto &&
          other.order == this.order);
}

class BroFa2FoTbCompanion extends UpdateCompanion<BroFa2Fo> {
  final Value<int> id;
  final Value<String> name;
  final Value<bool> isNumber;
  final Value<bool> isFormula;
  final Value<String?> formula;
  final Value<bool> isSelection;
  final Value<bool> isAllowPhoto;
  final Value<int> order;
  const BroFa2FoTbCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.isNumber = const Value.absent(),
    this.isFormula = const Value.absent(),
    this.formula = const Value.absent(),
    this.isSelection = const Value.absent(),
    this.isAllowPhoto = const Value.absent(),
    this.order = const Value.absent(),
  });
  BroFa2FoTbCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required bool isNumber,
    required bool isFormula,
    this.formula = const Value.absent(),
    required bool isSelection,
    required bool isAllowPhoto,
    required int order,
  })  : name = Value(name),
        isNumber = Value(isNumber),
        isFormula = Value(isFormula),
        isSelection = Value(isSelection),
        isAllowPhoto = Value(isAllowPhoto),
        order = Value(order);
  static Insertable<BroFa2Fo> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<bool>? isNumber,
    Expression<bool>? isFormula,
    Expression<String?>? formula,
    Expression<bool>? isSelection,
    Expression<bool>? isAllowPhoto,
    Expression<int>? order,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (isNumber != null) 'is_number': isNumber,
      if (isFormula != null) 'is_formula': isFormula,
      if (formula != null) 'formula': formula,
      if (isSelection != null) 'is_selection': isSelection,
      if (isAllowPhoto != null) 'is_allow_photo': isAllowPhoto,
      if (order != null) 'order': order,
    });
  }

  BroFa2FoTbCompanion copyWith(
      {Value<int>? id,
      Value<String>? name,
      Value<bool>? isNumber,
      Value<bool>? isFormula,
      Value<String?>? formula,
      Value<bool>? isSelection,
      Value<bool>? isAllowPhoto,
      Value<int>? order}) {
    return BroFa2FoTbCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      isNumber: isNumber ?? this.isNumber,
      isFormula: isFormula ?? this.isFormula,
      formula: formula ?? this.formula,
      isSelection: isSelection ?? this.isSelection,
      isAllowPhoto: isAllowPhoto ?? this.isAllowPhoto,
      order: order ?? this.order,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (isNumber.present) {
      map['is_number'] = Variable<bool>(isNumber.value);
    }
    if (isFormula.present) {
      map['is_formula'] = Variable<bool>(isFormula.value);
    }
    if (formula.present) {
      map['formula'] = Variable<String?>(formula.value);
    }
    if (isSelection.present) {
      map['is_selection'] = Variable<bool>(isSelection.value);
    }
    if (isAllowPhoto.present) {
      map['is_allow_photo'] = Variable<bool>(isAllowPhoto.value);
    }
    if (order.present) {
      map['order'] = Variable<int>(order.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('BroFa2FoTbCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('isNumber: $isNumber, ')
          ..write('isFormula: $isFormula, ')
          ..write('formula: $formula, ')
          ..write('isSelection: $isSelection, ')
          ..write('isAllowPhoto: $isAllowPhoto, ')
          ..write('order: $order')
          ..write(')'))
        .toString();
  }
}

class $BroFa2FoTbTable extends BroFa2FoTb
    with TableInfo<$BroFa2FoTbTable, BroFa2Fo> {
  final GeneratedDatabase _db;
  final String? _alias;
  $BroFa2FoTbTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  late final GeneratedColumn<int?> id = GeneratedColumn<int?>(
      'id', aliasedName, false,
      typeName: 'INTEGER',
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _nameMeta = const VerificationMeta('name');
  late final GeneratedColumn<String?> name = GeneratedColumn<String?>(
      'name', aliasedName, false,
      typeName: 'TEXT', requiredDuringInsert: true);
  final VerificationMeta _isNumberMeta = const VerificationMeta('isNumber');
  late final GeneratedColumn<bool?> isNumber = GeneratedColumn<bool?>(
      'is_number', aliasedName, false,
      typeName: 'INTEGER',
      requiredDuringInsert: true,
      defaultConstraints: 'CHECK (is_number IN (0, 1))');
  final VerificationMeta _isFormulaMeta = const VerificationMeta('isFormula');
  late final GeneratedColumn<bool?> isFormula = GeneratedColumn<bool?>(
      'is_formula', aliasedName, false,
      typeName: 'INTEGER',
      requiredDuringInsert: true,
      defaultConstraints: 'CHECK (is_formula IN (0, 1))');
  final VerificationMeta _formulaMeta = const VerificationMeta('formula');
  late final GeneratedColumn<String?> formula = GeneratedColumn<String?>(
      'formula', aliasedName, true,
      typeName: 'TEXT', requiredDuringInsert: false);
  final VerificationMeta _isSelectionMeta =
      const VerificationMeta('isSelection');
  late final GeneratedColumn<bool?> isSelection = GeneratedColumn<bool?>(
      'is_selection', aliasedName, false,
      typeName: 'INTEGER',
      requiredDuringInsert: true,
      defaultConstraints: 'CHECK (is_selection IN (0, 1))');
  final VerificationMeta _isAllowPhotoMeta =
      const VerificationMeta('isAllowPhoto');
  late final GeneratedColumn<bool?> isAllowPhoto = GeneratedColumn<bool?>(
      'is_allow_photo', aliasedName, false,
      typeName: 'INTEGER',
      requiredDuringInsert: true,
      defaultConstraints: 'CHECK (is_allow_photo IN (0, 1))');
  final VerificationMeta _orderMeta = const VerificationMeta('order');
  late final GeneratedColumn<int?> order = GeneratedColumn<int?>(
      'order', aliasedName, false,
      typeName: 'INTEGER', requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        name,
        isNumber,
        isFormula,
        formula,
        isSelection,
        isAllowPhoto,
        order
      ];
  @override
  String get aliasedName => _alias ?? 'bro_fa2_fo';
  @override
  String get actualTableName => 'bro_fa2_fo';
  @override
  VerificationContext validateIntegrity(Insertable<BroFa2Fo> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('is_number')) {
      context.handle(_isNumberMeta,
          isNumber.isAcceptableOrUnknown(data['is_number']!, _isNumberMeta));
    } else if (isInserting) {
      context.missing(_isNumberMeta);
    }
    if (data.containsKey('is_formula')) {
      context.handle(_isFormulaMeta,
          isFormula.isAcceptableOrUnknown(data['is_formula']!, _isFormulaMeta));
    } else if (isInserting) {
      context.missing(_isFormulaMeta);
    }
    if (data.containsKey('formula')) {
      context.handle(_formulaMeta,
          formula.isAcceptableOrUnknown(data['formula']!, _formulaMeta));
    }
    if (data.containsKey('is_selection')) {
      context.handle(
          _isSelectionMeta,
          isSelection.isAcceptableOrUnknown(
              data['is_selection']!, _isSelectionMeta));
    } else if (isInserting) {
      context.missing(_isSelectionMeta);
    }
    if (data.containsKey('is_allow_photo')) {
      context.handle(
          _isAllowPhotoMeta,
          isAllowPhoto.isAcceptableOrUnknown(
              data['is_allow_photo']!, _isAllowPhotoMeta));
    } else if (isInserting) {
      context.missing(_isAllowPhotoMeta);
    }
    if (data.containsKey('order')) {
      context.handle(
          _orderMeta, order.isAcceptableOrUnknown(data['order']!, _orderMeta));
    } else if (isInserting) {
      context.missing(_orderMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  BroFa2Fo map(Map<String, dynamic> data, {String? tablePrefix}) {
    return BroFa2Fo.fromData(data, _db,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $BroFa2FoTbTable createAlias(String alias) {
    return $BroFa2FoTbTable(_db, alias);
  }
}

class BroFa2FoSelection extends DataClass
    implements Insertable<BroFa2FoSelection> {
  final int id;
  final int broFa2FoId;
  final String name;
  final int order;
  BroFa2FoSelection(
      {required this.id,
      required this.broFa2FoId,
      required this.name,
      required this.order});
  factory BroFa2FoSelection.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return BroFa2FoSelection(
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      broFa2FoId: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}bro_fa2_fo_id'])!,
      name: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}name'])!,
      order: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}order'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['bro_fa2_fo_id'] = Variable<int>(broFa2FoId);
    map['name'] = Variable<String>(name);
    map['order'] = Variable<int>(order);
    return map;
  }

  BroFa2FoSelectionTbCompanion toCompanion(bool nullToAbsent) {
    return BroFa2FoSelectionTbCompanion(
      id: Value(id),
      broFa2FoId: Value(broFa2FoId),
      name: Value(name),
      order: Value(order),
    );
  }

  factory BroFa2FoSelection.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return BroFa2FoSelection(
      id: serializer.fromJson<int>(json['id']),
      broFa2FoId: serializer.fromJson<int>(json['bro_fa2_fo']),
      name: serializer.fromJson<String>(json['name']),
      order: serializer.fromJson<int>(json['order']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'bro_fa2_fo': serializer.toJson<int>(broFa2FoId),
      'name': serializer.toJson<String>(name),
      'order': serializer.toJson<int>(order),
    };
  }

  BroFa2FoSelection copyWith(
          {int? id, int? broFa2FoId, String? name, int? order}) =>
      BroFa2FoSelection(
        id: id ?? this.id,
        broFa2FoId: broFa2FoId ?? this.broFa2FoId,
        name: name ?? this.name,
        order: order ?? this.order,
      );
  @override
  String toString() {
    return (StringBuffer('BroFa2FoSelection(')
          ..write('id: $id, ')
          ..write('broFa2FoId: $broFa2FoId, ')
          ..write('name: $name, ')
          ..write('order: $order')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(id.hashCode,
      $mrjc(broFa2FoId.hashCode, $mrjc(name.hashCode, order.hashCode))));
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is BroFa2FoSelection &&
          other.id == this.id &&
          other.broFa2FoId == this.broFa2FoId &&
          other.name == this.name &&
          other.order == this.order);
}

class BroFa2FoSelectionTbCompanion extends UpdateCompanion<BroFa2FoSelection> {
  final Value<int> id;
  final Value<int> broFa2FoId;
  final Value<String> name;
  final Value<int> order;
  const BroFa2FoSelectionTbCompanion({
    this.id = const Value.absent(),
    this.broFa2FoId = const Value.absent(),
    this.name = const Value.absent(),
    this.order = const Value.absent(),
  });
  BroFa2FoSelectionTbCompanion.insert({
    this.id = const Value.absent(),
    required int broFa2FoId,
    required String name,
    required int order,
  })  : broFa2FoId = Value(broFa2FoId),
        name = Value(name),
        order = Value(order);
  static Insertable<BroFa2FoSelection> custom({
    Expression<int>? id,
    Expression<int>? broFa2FoId,
    Expression<String>? name,
    Expression<int>? order,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (broFa2FoId != null) 'bro_fa2_fo_id': broFa2FoId,
      if (name != null) 'name': name,
      if (order != null) 'order': order,
    });
  }

  BroFa2FoSelectionTbCompanion copyWith(
      {Value<int>? id,
      Value<int>? broFa2FoId,
      Value<String>? name,
      Value<int>? order}) {
    return BroFa2FoSelectionTbCompanion(
      id: id ?? this.id,
      broFa2FoId: broFa2FoId ?? this.broFa2FoId,
      name: name ?? this.name,
      order: order ?? this.order,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (broFa2FoId.present) {
      map['bro_fa2_fo_id'] = Variable<int>(broFa2FoId.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (order.present) {
      map['order'] = Variable<int>(order.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('BroFa2FoSelectionTbCompanion(')
          ..write('id: $id, ')
          ..write('broFa2FoId: $broFa2FoId, ')
          ..write('name: $name, ')
          ..write('order: $order')
          ..write(')'))
        .toString();
  }
}

class $BroFa2FoSelectionTbTable extends BroFa2FoSelectionTb
    with TableInfo<$BroFa2FoSelectionTbTable, BroFa2FoSelection> {
  final GeneratedDatabase _db;
  final String? _alias;
  $BroFa2FoSelectionTbTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  late final GeneratedColumn<int?> id = GeneratedColumn<int?>(
      'id', aliasedName, false,
      typeName: 'INTEGER',
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _broFa2FoIdMeta = const VerificationMeta('broFa2FoId');
  late final GeneratedColumn<int?> broFa2FoId = GeneratedColumn<int?>(
      'bro_fa2_fo_id', aliasedName, false,
      typeName: 'INTEGER', requiredDuringInsert: true);
  final VerificationMeta _nameMeta = const VerificationMeta('name');
  late final GeneratedColumn<String?> name = GeneratedColumn<String?>(
      'name', aliasedName, false,
      typeName: 'TEXT', requiredDuringInsert: true);
  final VerificationMeta _orderMeta = const VerificationMeta('order');
  late final GeneratedColumn<int?> order = GeneratedColumn<int?>(
      'order', aliasedName, false,
      typeName: 'INTEGER', requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, broFa2FoId, name, order];
  @override
  String get aliasedName => _alias ?? 'bro_fa2_fo_selection';
  @override
  String get actualTableName => 'bro_fa2_fo_selection';
  @override
  VerificationContext validateIntegrity(Insertable<BroFa2FoSelection> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('bro_fa2_fo_id')) {
      context.handle(
          _broFa2FoIdMeta,
          broFa2FoId.isAcceptableOrUnknown(
              data['bro_fa2_fo_id']!, _broFa2FoIdMeta));
    } else if (isInserting) {
      context.missing(_broFa2FoIdMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('order')) {
      context.handle(
          _orderMeta, order.isAcceptableOrUnknown(data['order']!, _orderMeta));
    } else if (isInserting) {
      context.missing(_orderMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  BroFa2FoSelection map(Map<String, dynamic> data, {String? tablePrefix}) {
    return BroFa2FoSelection.fromData(data, _db,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $BroFa2FoSelectionTbTable createAlias(String alias) {
    return $BroFa2FoSelectionTbTable(_db, alias);
  }
}

class BroFa2Ma extends DataClass implements Insertable<BroFa2Ma> {
  final int id;
  final String name;
  final int order;
  BroFa2Ma({required this.id, required this.name, required this.order});
  factory BroFa2Ma.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return BroFa2Ma(
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      name: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}name'])!,
      order: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}order'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['order'] = Variable<int>(order);
    return map;
  }

  BroFa2MaTbCompanion toCompanion(bool nullToAbsent) {
    return BroFa2MaTbCompanion(
      id: Value(id),
      name: Value(name),
      order: Value(order),
    );
  }

  factory BroFa2Ma.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return BroFa2Ma(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      order: serializer.fromJson<int>(json['order']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'order': serializer.toJson<int>(order),
    };
  }

  BroFa2Ma copyWith({int? id, String? name, int? order}) => BroFa2Ma(
        id: id ?? this.id,
        name: name ?? this.name,
        order: order ?? this.order,
      );
  @override
  String toString() {
    return (StringBuffer('BroFa2Ma(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('order: $order')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      $mrjf($mrjc(id.hashCode, $mrjc(name.hashCode, order.hashCode)));
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is BroFa2Ma &&
          other.id == this.id &&
          other.name == this.name &&
          other.order == this.order);
}

class BroFa2MaTbCompanion extends UpdateCompanion<BroFa2Ma> {
  final Value<int> id;
  final Value<String> name;
  final Value<int> order;
  const BroFa2MaTbCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.order = const Value.absent(),
  });
  BroFa2MaTbCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required int order,
  })  : name = Value(name),
        order = Value(order);
  static Insertable<BroFa2Ma> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<int>? order,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (order != null) 'order': order,
    });
  }

  BroFa2MaTbCompanion copyWith(
      {Value<int>? id, Value<String>? name, Value<int>? order}) {
    return BroFa2MaTbCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      order: order ?? this.order,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (order.present) {
      map['order'] = Variable<int>(order.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('BroFa2MaTbCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('order: $order')
          ..write(')'))
        .toString();
  }
}

class $BroFa2MaTbTable extends BroFa2MaTb
    with TableInfo<$BroFa2MaTbTable, BroFa2Ma> {
  final GeneratedDatabase _db;
  final String? _alias;
  $BroFa2MaTbTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  late final GeneratedColumn<int?> id = GeneratedColumn<int?>(
      'id', aliasedName, false,
      typeName: 'INTEGER',
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _nameMeta = const VerificationMeta('name');
  late final GeneratedColumn<String?> name = GeneratedColumn<String?>(
      'name', aliasedName, false,
      typeName: 'TEXT', requiredDuringInsert: true);
  final VerificationMeta _orderMeta = const VerificationMeta('order');
  late final GeneratedColumn<int?> order = GeneratedColumn<int?>(
      'order', aliasedName, false,
      typeName: 'INTEGER', requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, name, order];
  @override
  String get aliasedName => _alias ?? 'bro_fa2_ma';
  @override
  String get actualTableName => 'bro_fa2_ma';
  @override
  VerificationContext validateIntegrity(Insertable<BroFa2Ma> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('order')) {
      context.handle(
          _orderMeta, order.isAcceptableOrUnknown(data['order']!, _orderMeta));
    } else if (isInserting) {
      context.missing(_orderMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  BroFa2Ma map(Map<String, dynamic> data, {String? tablePrefix}) {
    return BroFa2Ma.fromData(data, _db,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $BroFa2MaTbTable createAlias(String alias) {
    return $BroFa2MaTbTable(_db, alias);
  }
}

class BroFa2Pm extends DataClass implements Insertable<BroFa2Pm> {
  final int id;
  final String name;
  final bool isAllowPhoto;
  final int order;
  BroFa2Pm(
      {required this.id,
      required this.name,
      required this.isAllowPhoto,
      required this.order});
  factory BroFa2Pm.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return BroFa2Pm(
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      name: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}name'])!,
      isAllowPhoto: const BoolType()
          .mapFromDatabaseResponse(data['${effectivePrefix}is_allow_photo'])!,
      order: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}order'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['is_allow_photo'] = Variable<bool>(isAllowPhoto);
    map['order'] = Variable<int>(order);
    return map;
  }

  BroFa2PmTbCompanion toCompanion(bool nullToAbsent) {
    return BroFa2PmTbCompanion(
      id: Value(id),
      name: Value(name),
      isAllowPhoto: Value(isAllowPhoto),
      order: Value(order),
    );
  }

  factory BroFa2Pm.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return BroFa2Pm(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      isAllowPhoto: serializer.fromJson<bool>(json['is_allow_photo']),
      order: serializer.fromJson<int>(json['order']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'is_allow_photo': serializer.toJson<bool>(isAllowPhoto),
      'order': serializer.toJson<int>(order),
    };
  }

  BroFa2Pm copyWith({int? id, String? name, bool? isAllowPhoto, int? order}) =>
      BroFa2Pm(
        id: id ?? this.id,
        name: name ?? this.name,
        isAllowPhoto: isAllowPhoto ?? this.isAllowPhoto,
        order: order ?? this.order,
      );
  @override
  String toString() {
    return (StringBuffer('BroFa2Pm(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('isAllowPhoto: $isAllowPhoto, ')
          ..write('order: $order')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(id.hashCode,
      $mrjc(name.hashCode, $mrjc(isAllowPhoto.hashCode, order.hashCode))));
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is BroFa2Pm &&
          other.id == this.id &&
          other.name == this.name &&
          other.isAllowPhoto == this.isAllowPhoto &&
          other.order == this.order);
}

class BroFa2PmTbCompanion extends UpdateCompanion<BroFa2Pm> {
  final Value<int> id;
  final Value<String> name;
  final Value<bool> isAllowPhoto;
  final Value<int> order;
  const BroFa2PmTbCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.isAllowPhoto = const Value.absent(),
    this.order = const Value.absent(),
  });
  BroFa2PmTbCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required bool isAllowPhoto,
    required int order,
  })  : name = Value(name),
        isAllowPhoto = Value(isAllowPhoto),
        order = Value(order);
  static Insertable<BroFa2Pm> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<bool>? isAllowPhoto,
    Expression<int>? order,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (isAllowPhoto != null) 'is_allow_photo': isAllowPhoto,
      if (order != null) 'order': order,
    });
  }

  BroFa2PmTbCompanion copyWith(
      {Value<int>? id,
      Value<String>? name,
      Value<bool>? isAllowPhoto,
      Value<int>? order}) {
    return BroFa2PmTbCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      isAllowPhoto: isAllowPhoto ?? this.isAllowPhoto,
      order: order ?? this.order,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (isAllowPhoto.present) {
      map['is_allow_photo'] = Variable<bool>(isAllowPhoto.value);
    }
    if (order.present) {
      map['order'] = Variable<int>(order.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('BroFa2PmTbCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('isAllowPhoto: $isAllowPhoto, ')
          ..write('order: $order')
          ..write(')'))
        .toString();
  }
}

class $BroFa2PmTbTable extends BroFa2PmTb
    with TableInfo<$BroFa2PmTbTable, BroFa2Pm> {
  final GeneratedDatabase _db;
  final String? _alias;
  $BroFa2PmTbTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  late final GeneratedColumn<int?> id = GeneratedColumn<int?>(
      'id', aliasedName, false,
      typeName: 'INTEGER',
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _nameMeta = const VerificationMeta('name');
  late final GeneratedColumn<String?> name = GeneratedColumn<String?>(
      'name', aliasedName, false,
      typeName: 'TEXT', requiredDuringInsert: true);
  final VerificationMeta _isAllowPhotoMeta =
      const VerificationMeta('isAllowPhoto');
  late final GeneratedColumn<bool?> isAllowPhoto = GeneratedColumn<bool?>(
      'is_allow_photo', aliasedName, false,
      typeName: 'INTEGER',
      requiredDuringInsert: true,
      defaultConstraints: 'CHECK (is_allow_photo IN (0, 1))');
  final VerificationMeta _orderMeta = const VerificationMeta('order');
  late final GeneratedColumn<int?> order = GeneratedColumn<int?>(
      'order', aliasedName, false,
      typeName: 'INTEGER', requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, name, isAllowPhoto, order];
  @override
  String get aliasedName => _alias ?? 'bro_fa2_pm';
  @override
  String get actualTableName => 'bro_fa2_pm';
  @override
  VerificationContext validateIntegrity(Insertable<BroFa2Pm> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('is_allow_photo')) {
      context.handle(
          _isAllowPhotoMeta,
          isAllowPhoto.isAcceptableOrUnknown(
              data['is_allow_photo']!, _isAllowPhotoMeta));
    } else if (isInserting) {
      context.missing(_isAllowPhotoMeta);
    }
    if (data.containsKey('order')) {
      context.handle(
          _orderMeta, order.isAcceptableOrUnknown(data['order']!, _orderMeta));
    } else if (isInserting) {
      context.missing(_orderMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  BroFa2Pm map(Map<String, dynamic> data, {String? tablePrefix}) {
    return BroFa2Pm.fromData(data, _db,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $BroFa2PmTbTable createAlias(String alias) {
    return $BroFa2PmTbTable(_db, alias);
  }
}

class BroFa2Routine extends DataClass implements Insertable<BroFa2Routine> {
  final int id;
  final String name;
  final String? formula;
  final int order;
  BroFa2Routine(
      {required this.id,
      required this.name,
      this.formula,
      required this.order});
  factory BroFa2Routine.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return BroFa2Routine(
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      name: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}name'])!,
      formula: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}formula']),
      order: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}order'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || formula != null) {
      map['formula'] = Variable<String?>(formula);
    }
    map['order'] = Variable<int>(order);
    return map;
  }

  BroFa2RoutineTbCompanion toCompanion(bool nullToAbsent) {
    return BroFa2RoutineTbCompanion(
      id: Value(id),
      name: Value(name),
      formula: formula == null && nullToAbsent
          ? const Value.absent()
          : Value(formula),
      order: Value(order),
    );
  }

  factory BroFa2Routine.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return BroFa2Routine(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      formula: serializer.fromJson<String?>(json['formula']),
      order: serializer.fromJson<int>(json['order']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'formula': serializer.toJson<String?>(formula),
      'order': serializer.toJson<int>(order),
    };
  }

  BroFa2Routine copyWith(
          {int? id, String? name, String? formula, int? order}) =>
      BroFa2Routine(
        id: id ?? this.id,
        name: name ?? this.name,
        formula: formula ?? this.formula,
        order: order ?? this.order,
      );
  @override
  String toString() {
    return (StringBuffer('BroFa2Routine(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('formula: $formula, ')
          ..write('order: $order')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(id.hashCode,
      $mrjc(name.hashCode, $mrjc(formula.hashCode, order.hashCode))));
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is BroFa2Routine &&
          other.id == this.id &&
          other.name == this.name &&
          other.formula == this.formula &&
          other.order == this.order);
}

class BroFa2RoutineTbCompanion extends UpdateCompanion<BroFa2Routine> {
  final Value<int> id;
  final Value<String> name;
  final Value<String?> formula;
  final Value<int> order;
  const BroFa2RoutineTbCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.formula = const Value.absent(),
    this.order = const Value.absent(),
  });
  BroFa2RoutineTbCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    this.formula = const Value.absent(),
    required int order,
  })  : name = Value(name),
        order = Value(order);
  static Insertable<BroFa2Routine> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String?>? formula,
    Expression<int>? order,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (formula != null) 'formula': formula,
      if (order != null) 'order': order,
    });
  }

  BroFa2RoutineTbCompanion copyWith(
      {Value<int>? id,
      Value<String>? name,
      Value<String?>? formula,
      Value<int>? order}) {
    return BroFa2RoutineTbCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      formula: formula ?? this.formula,
      order: order ?? this.order,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (formula.present) {
      map['formula'] = Variable<String?>(formula.value);
    }
    if (order.present) {
      map['order'] = Variable<int>(order.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('BroFa2RoutineTbCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('formula: $formula, ')
          ..write('order: $order')
          ..write(')'))
        .toString();
  }
}

class $BroFa2RoutineTbTable extends BroFa2RoutineTb
    with TableInfo<$BroFa2RoutineTbTable, BroFa2Routine> {
  final GeneratedDatabase _db;
  final String? _alias;
  $BroFa2RoutineTbTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  late final GeneratedColumn<int?> id = GeneratedColumn<int?>(
      'id', aliasedName, false,
      typeName: 'INTEGER',
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _nameMeta = const VerificationMeta('name');
  late final GeneratedColumn<String?> name = GeneratedColumn<String?>(
      'name', aliasedName, false,
      typeName: 'TEXT', requiredDuringInsert: true);
  final VerificationMeta _formulaMeta = const VerificationMeta('formula');
  late final GeneratedColumn<String?> formula = GeneratedColumn<String?>(
      'formula', aliasedName, true,
      typeName: 'TEXT', requiredDuringInsert: false);
  final VerificationMeta _orderMeta = const VerificationMeta('order');
  late final GeneratedColumn<int?> order = GeneratedColumn<int?>(
      'order', aliasedName, false,
      typeName: 'INTEGER', requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, name, formula, order];
  @override
  String get aliasedName => _alias ?? 'bro_fa2_routine';
  @override
  String get actualTableName => 'bro_fa2_routine';
  @override
  VerificationContext validateIntegrity(Insertable<BroFa2Routine> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('formula')) {
      context.handle(_formulaMeta,
          formula.isAcceptableOrUnknown(data['formula']!, _formulaMeta));
    }
    if (data.containsKey('order')) {
      context.handle(
          _orderMeta, order.isAcceptableOrUnknown(data['order']!, _orderMeta));
    } else if (isInserting) {
      context.missing(_orderMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  BroFa2Routine map(Map<String, dynamic> data, {String? tablePrefix}) {
    return BroFa2Routine.fromData(data, _db,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $BroFa2RoutineTbTable createAlias(String alias) {
    return $BroFa2RoutineTbTable(_db, alias);
  }
}

class BroFa2Visit extends DataClass implements Insertable<BroFa2Visit> {
  final int id;
  final int companyId;
  final int locationId;
  final String visitDate;
  final int age;
  final int? docObservationBirdQty;
  final int? postMortemBirdQty;
  final String timestamp;
  final String uuid;
  final bool isDelete;
  final bool isUpload;
  BroFa2Visit(
      {required this.id,
      required this.companyId,
      required this.locationId,
      required this.visitDate,
      required this.age,
      this.docObservationBirdQty,
      this.postMortemBirdQty,
      required this.timestamp,
      required this.uuid,
      required this.isDelete,
      required this.isUpload});
  factory BroFa2Visit.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return BroFa2Visit(
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      companyId: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}company_id'])!,
      locationId: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}location_id'])!,
      visitDate: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}visit_date'])!,
      age: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}age'])!,
      docObservationBirdQty: const IntType().mapFromDatabaseResponse(
          data['${effectivePrefix}doc_observation_bird_qty']),
      postMortemBirdQty: const IntType().mapFromDatabaseResponse(
          data['${effectivePrefix}post_mortem_bird_qty']),
      timestamp: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}timestamp'])!,
      uuid: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}uuid'])!,
      isDelete: const BoolType()
          .mapFromDatabaseResponse(data['${effectivePrefix}is_delete'])!,
      isUpload: const BoolType()
          .mapFromDatabaseResponse(data['${effectivePrefix}is_upload'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['company_id'] = Variable<int>(companyId);
    map['location_id'] = Variable<int>(locationId);
    map['visit_date'] = Variable<String>(visitDate);
    map['age'] = Variable<int>(age);
    if (!nullToAbsent || docObservationBirdQty != null) {
      map['doc_observation_bird_qty'] = Variable<int?>(docObservationBirdQty);
    }
    if (!nullToAbsent || postMortemBirdQty != null) {
      map['post_mortem_bird_qty'] = Variable<int?>(postMortemBirdQty);
    }
    map['timestamp'] = Variable<String>(timestamp);
    map['uuid'] = Variable<String>(uuid);
    map['is_delete'] = Variable<bool>(isDelete);
    map['is_upload'] = Variable<bool>(isUpload);
    return map;
  }

  BroFa2VisitTbCompanion toCompanion(bool nullToAbsent) {
    return BroFa2VisitTbCompanion(
      id: Value(id),
      companyId: Value(companyId),
      locationId: Value(locationId),
      visitDate: Value(visitDate),
      age: Value(age),
      docObservationBirdQty: docObservationBirdQty == null && nullToAbsent
          ? const Value.absent()
          : Value(docObservationBirdQty),
      postMortemBirdQty: postMortemBirdQty == null && nullToAbsent
          ? const Value.absent()
          : Value(postMortemBirdQty),
      timestamp: Value(timestamp),
      uuid: Value(uuid),
      isDelete: Value(isDelete),
      isUpload: Value(isUpload),
    );
  }

  factory BroFa2Visit.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return BroFa2Visit(
      id: serializer.fromJson<int>(json['id']),
      companyId: serializer.fromJson<int>(json['company']),
      locationId: serializer.fromJson<int>(json['location']),
      visitDate: serializer.fromJson<String>(json['visit_date']),
      age: serializer.fromJson<int>(json['age']),
      docObservationBirdQty:
          serializer.fromJson<int?>(json['doc_observation_bird_qty']),
      postMortemBirdQty:
          serializer.fromJson<int?>(json['post_mortem_bird_qty']),
      timestamp: serializer.fromJson<String>(json['timestamp']),
      uuid: serializer.fromJson<String>(json['uuid']),
      isDelete: serializer.fromJson<bool>(json['is_delete']),
      isUpload: serializer.fromJson<bool>(json['is_upload']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'company': serializer.toJson<int>(companyId),
      'location': serializer.toJson<int>(locationId),
      'visit_date': serializer.toJson<String>(visitDate),
      'age': serializer.toJson<int>(age),
      'doc_observation_bird_qty':
          serializer.toJson<int?>(docObservationBirdQty),
      'post_mortem_bird_qty': serializer.toJson<int?>(postMortemBirdQty),
      'timestamp': serializer.toJson<String>(timestamp),
      'uuid': serializer.toJson<String>(uuid),
      'is_delete': serializer.toJson<bool>(isDelete),
      'is_upload': serializer.toJson<bool>(isUpload),
    };
  }

  BroFa2Visit copyWith(
          {int? id,
          int? companyId,
          int? locationId,
          String? visitDate,
          int? age,
          int? docObservationBirdQty,
          int? postMortemBirdQty,
          String? timestamp,
          String? uuid,
          bool? isDelete,
          bool? isUpload}) =>
      BroFa2Visit(
        id: id ?? this.id,
        companyId: companyId ?? this.companyId,
        locationId: locationId ?? this.locationId,
        visitDate: visitDate ?? this.visitDate,
        age: age ?? this.age,
        docObservationBirdQty:
            docObservationBirdQty ?? this.docObservationBirdQty,
        postMortemBirdQty: postMortemBirdQty ?? this.postMortemBirdQty,
        timestamp: timestamp ?? this.timestamp,
        uuid: uuid ?? this.uuid,
        isDelete: isDelete ?? this.isDelete,
        isUpload: isUpload ?? this.isUpload,
      );
  @override
  String toString() {
    return (StringBuffer('BroFa2Visit(')
          ..write('id: $id, ')
          ..write('companyId: $companyId, ')
          ..write('locationId: $locationId, ')
          ..write('visitDate: $visitDate, ')
          ..write('age: $age, ')
          ..write('docObservationBirdQty: $docObservationBirdQty, ')
          ..write('postMortemBirdQty: $postMortemBirdQty, ')
          ..write('timestamp: $timestamp, ')
          ..write('uuid: $uuid, ')
          ..write('isDelete: $isDelete, ')
          ..write('isUpload: $isUpload')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      id.hashCode,
      $mrjc(
          companyId.hashCode,
          $mrjc(
              locationId.hashCode,
              $mrjc(
                  visitDate.hashCode,
                  $mrjc(
                      age.hashCode,
                      $mrjc(
                          docObservationBirdQty.hashCode,
                          $mrjc(
                              postMortemBirdQty.hashCode,
                              $mrjc(
                                  timestamp.hashCode,
                                  $mrjc(
                                      uuid.hashCode,
                                      $mrjc(isDelete.hashCode,
                                          isUpload.hashCode)))))))))));
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is BroFa2Visit &&
          other.id == this.id &&
          other.companyId == this.companyId &&
          other.locationId == this.locationId &&
          other.visitDate == this.visitDate &&
          other.age == this.age &&
          other.docObservationBirdQty == this.docObservationBirdQty &&
          other.postMortemBirdQty == this.postMortemBirdQty &&
          other.timestamp == this.timestamp &&
          other.uuid == this.uuid &&
          other.isDelete == this.isDelete &&
          other.isUpload == this.isUpload);
}

class BroFa2VisitTbCompanion extends UpdateCompanion<BroFa2Visit> {
  final Value<int> id;
  final Value<int> companyId;
  final Value<int> locationId;
  final Value<String> visitDate;
  final Value<int> age;
  final Value<int?> docObservationBirdQty;
  final Value<int?> postMortemBirdQty;
  final Value<String> timestamp;
  final Value<String> uuid;
  final Value<bool> isDelete;
  final Value<bool> isUpload;
  const BroFa2VisitTbCompanion({
    this.id = const Value.absent(),
    this.companyId = const Value.absent(),
    this.locationId = const Value.absent(),
    this.visitDate = const Value.absent(),
    this.age = const Value.absent(),
    this.docObservationBirdQty = const Value.absent(),
    this.postMortemBirdQty = const Value.absent(),
    this.timestamp = const Value.absent(),
    this.uuid = const Value.absent(),
    this.isDelete = const Value.absent(),
    this.isUpload = const Value.absent(),
  });
  BroFa2VisitTbCompanion.insert({
    this.id = const Value.absent(),
    required int companyId,
    required int locationId,
    required String visitDate,
    required int age,
    this.docObservationBirdQty = const Value.absent(),
    this.postMortemBirdQty = const Value.absent(),
    this.timestamp = const Value.absent(),
    this.uuid = const Value.absent(),
    this.isDelete = const Value.absent(),
    this.isUpload = const Value.absent(),
  })  : companyId = Value(companyId),
        locationId = Value(locationId),
        visitDate = Value(visitDate),
        age = Value(age);
  static Insertable<BroFa2Visit> custom({
    Expression<int>? id,
    Expression<int>? companyId,
    Expression<int>? locationId,
    Expression<String>? visitDate,
    Expression<int>? age,
    Expression<int?>? docObservationBirdQty,
    Expression<int?>? postMortemBirdQty,
    Expression<String>? timestamp,
    Expression<String>? uuid,
    Expression<bool>? isDelete,
    Expression<bool>? isUpload,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (companyId != null) 'company_id': companyId,
      if (locationId != null) 'location_id': locationId,
      if (visitDate != null) 'visit_date': visitDate,
      if (age != null) 'age': age,
      if (docObservationBirdQty != null)
        'doc_observation_bird_qty': docObservationBirdQty,
      if (postMortemBirdQty != null) 'post_mortem_bird_qty': postMortemBirdQty,
      if (timestamp != null) 'timestamp': timestamp,
      if (uuid != null) 'uuid': uuid,
      if (isDelete != null) 'is_delete': isDelete,
      if (isUpload != null) 'is_upload': isUpload,
    });
  }

  BroFa2VisitTbCompanion copyWith(
      {Value<int>? id,
      Value<int>? companyId,
      Value<int>? locationId,
      Value<String>? visitDate,
      Value<int>? age,
      Value<int?>? docObservationBirdQty,
      Value<int?>? postMortemBirdQty,
      Value<String>? timestamp,
      Value<String>? uuid,
      Value<bool>? isDelete,
      Value<bool>? isUpload}) {
    return BroFa2VisitTbCompanion(
      id: id ?? this.id,
      companyId: companyId ?? this.companyId,
      locationId: locationId ?? this.locationId,
      visitDate: visitDate ?? this.visitDate,
      age: age ?? this.age,
      docObservationBirdQty:
          docObservationBirdQty ?? this.docObservationBirdQty,
      postMortemBirdQty: postMortemBirdQty ?? this.postMortemBirdQty,
      timestamp: timestamp ?? this.timestamp,
      uuid: uuid ?? this.uuid,
      isDelete: isDelete ?? this.isDelete,
      isUpload: isUpload ?? this.isUpload,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (companyId.present) {
      map['company_id'] = Variable<int>(companyId.value);
    }
    if (locationId.present) {
      map['location_id'] = Variable<int>(locationId.value);
    }
    if (visitDate.present) {
      map['visit_date'] = Variable<String>(visitDate.value);
    }
    if (age.present) {
      map['age'] = Variable<int>(age.value);
    }
    if (docObservationBirdQty.present) {
      map['doc_observation_bird_qty'] =
          Variable<int?>(docObservationBirdQty.value);
    }
    if (postMortemBirdQty.present) {
      map['post_mortem_bird_qty'] = Variable<int?>(postMortemBirdQty.value);
    }
    if (timestamp.present) {
      map['timestamp'] = Variable<String>(timestamp.value);
    }
    if (uuid.present) {
      map['uuid'] = Variable<String>(uuid.value);
    }
    if (isDelete.present) {
      map['is_delete'] = Variable<bool>(isDelete.value);
    }
    if (isUpload.present) {
      map['is_upload'] = Variable<bool>(isUpload.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('BroFa2VisitTbCompanion(')
          ..write('id: $id, ')
          ..write('companyId: $companyId, ')
          ..write('locationId: $locationId, ')
          ..write('visitDate: $visitDate, ')
          ..write('age: $age, ')
          ..write('docObservationBirdQty: $docObservationBirdQty, ')
          ..write('postMortemBirdQty: $postMortemBirdQty, ')
          ..write('timestamp: $timestamp, ')
          ..write('uuid: $uuid, ')
          ..write('isDelete: $isDelete, ')
          ..write('isUpload: $isUpload')
          ..write(')'))
        .toString();
  }
}

class $BroFa2VisitTbTable extends BroFa2VisitTb
    with TableInfo<$BroFa2VisitTbTable, BroFa2Visit> {
  final GeneratedDatabase _db;
  final String? _alias;
  $BroFa2VisitTbTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  late final GeneratedColumn<int?> id = GeneratedColumn<int?>(
      'id', aliasedName, false,
      typeName: 'INTEGER',
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _companyIdMeta = const VerificationMeta('companyId');
  late final GeneratedColumn<int?> companyId = GeneratedColumn<int?>(
      'company_id', aliasedName, false,
      typeName: 'INTEGER', requiredDuringInsert: true);
  final VerificationMeta _locationIdMeta = const VerificationMeta('locationId');
  late final GeneratedColumn<int?> locationId = GeneratedColumn<int?>(
      'location_id', aliasedName, false,
      typeName: 'INTEGER', requiredDuringInsert: true);
  final VerificationMeta _visitDateMeta = const VerificationMeta('visitDate');
  late final GeneratedColumn<String?> visitDate = GeneratedColumn<String?>(
      'visit_date', aliasedName, false,
      typeName: 'TEXT', requiredDuringInsert: true);
  final VerificationMeta _ageMeta = const VerificationMeta('age');
  late final GeneratedColumn<int?> age = GeneratedColumn<int?>(
      'age', aliasedName, false,
      typeName: 'INTEGER', requiredDuringInsert: true);
  final VerificationMeta _docObservationBirdQtyMeta =
      const VerificationMeta('docObservationBirdQty');
  late final GeneratedColumn<int?> docObservationBirdQty =
      GeneratedColumn<int?>('doc_observation_bird_qty', aliasedName, true,
          typeName: 'INTEGER', requiredDuringInsert: false);
  final VerificationMeta _postMortemBirdQtyMeta =
      const VerificationMeta('postMortemBirdQty');
  late final GeneratedColumn<int?> postMortemBirdQty = GeneratedColumn<int?>(
      'post_mortem_bird_qty', aliasedName, true,
      typeName: 'INTEGER', requiredDuringInsert: false);
  final VerificationMeta _timestampMeta = const VerificationMeta('timestamp');
  late final GeneratedColumn<String?> timestamp = GeneratedColumn<String?>(
      'timestamp', aliasedName, false,
      typeName: 'TEXT',
      requiredDuringInsert: false,
      clientDefault: () =>
          DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now()));
  final VerificationMeta _uuidMeta = const VerificationMeta('uuid');
  late final GeneratedColumn<String?> uuid = GeneratedColumn<String?>(
      'uuid', aliasedName, false,
      typeName: 'TEXT',
      requiredDuringInsert: false,
      clientDefault: () => Uuid().v4().replaceAll('-', ''));
  final VerificationMeta _isDeleteMeta = const VerificationMeta('isDelete');
  late final GeneratedColumn<bool?> isDelete = GeneratedColumn<bool?>(
      'is_delete', aliasedName, false,
      typeName: 'INTEGER',
      requiredDuringInsert: false,
      defaultConstraints: 'CHECK (is_delete IN (0, 1))',
      defaultValue: const Constant(false));
  final VerificationMeta _isUploadMeta = const VerificationMeta('isUpload');
  late final GeneratedColumn<bool?> isUpload = GeneratedColumn<bool?>(
      'is_upload', aliasedName, false,
      typeName: 'INTEGER',
      requiredDuringInsert: false,
      defaultConstraints: 'CHECK (is_upload IN (0, 1))',
      defaultValue: const Constant(false));
  @override
  List<GeneratedColumn> get $columns => [
        id,
        companyId,
        locationId,
        visitDate,
        age,
        docObservationBirdQty,
        postMortemBirdQty,
        timestamp,
        uuid,
        isDelete,
        isUpload
      ];
  @override
  String get aliasedName => _alias ?? 'bro_fa2_visit';
  @override
  String get actualTableName => 'bro_fa2_visit';
  @override
  VerificationContext validateIntegrity(Insertable<BroFa2Visit> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('company_id')) {
      context.handle(_companyIdMeta,
          companyId.isAcceptableOrUnknown(data['company_id']!, _companyIdMeta));
    } else if (isInserting) {
      context.missing(_companyIdMeta);
    }
    if (data.containsKey('location_id')) {
      context.handle(
          _locationIdMeta,
          locationId.isAcceptableOrUnknown(
              data['location_id']!, _locationIdMeta));
    } else if (isInserting) {
      context.missing(_locationIdMeta);
    }
    if (data.containsKey('visit_date')) {
      context.handle(_visitDateMeta,
          visitDate.isAcceptableOrUnknown(data['visit_date']!, _visitDateMeta));
    } else if (isInserting) {
      context.missing(_visitDateMeta);
    }
    if (data.containsKey('age')) {
      context.handle(
          _ageMeta, age.isAcceptableOrUnknown(data['age']!, _ageMeta));
    } else if (isInserting) {
      context.missing(_ageMeta);
    }
    if (data.containsKey('doc_observation_bird_qty')) {
      context.handle(
          _docObservationBirdQtyMeta,
          docObservationBirdQty.isAcceptableOrUnknown(
              data['doc_observation_bird_qty']!, _docObservationBirdQtyMeta));
    }
    if (data.containsKey('post_mortem_bird_qty')) {
      context.handle(
          _postMortemBirdQtyMeta,
          postMortemBirdQty.isAcceptableOrUnknown(
              data['post_mortem_bird_qty']!, _postMortemBirdQtyMeta));
    }
    if (data.containsKey('timestamp')) {
      context.handle(_timestampMeta,
          timestamp.isAcceptableOrUnknown(data['timestamp']!, _timestampMeta));
    }
    if (data.containsKey('uuid')) {
      context.handle(
          _uuidMeta, uuid.isAcceptableOrUnknown(data['uuid']!, _uuidMeta));
    }
    if (data.containsKey('is_delete')) {
      context.handle(_isDeleteMeta,
          isDelete.isAcceptableOrUnknown(data['is_delete']!, _isDeleteMeta));
    }
    if (data.containsKey('is_upload')) {
      context.handle(_isUploadMeta,
          isUpload.isAcceptableOrUnknown(data['is_upload']!, _isUploadMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  BroFa2Visit map(Map<String, dynamic> data, {String? tablePrefix}) {
    return BroFa2Visit.fromData(data, _db,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $BroFa2VisitTbTable createAlias(String alias) {
    return $BroFa2VisitTbTable(_db, alias);
  }
}

class BroFa2VisitHouse extends DataClass
    implements Insertable<BroFa2VisitHouse> {
  final int id;
  final int broFa2VisitId;
  final int houseNo;
  BroFa2VisitHouse(
      {required this.id, required this.broFa2VisitId, required this.houseNo});
  factory BroFa2VisitHouse.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return BroFa2VisitHouse(
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      broFa2VisitId: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}bro_fa2_visit_id'])!,
      houseNo: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}house_no'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['bro_fa2_visit_id'] = Variable<int>(broFa2VisitId);
    map['house_no'] = Variable<int>(houseNo);
    return map;
  }

  BroFa2VisitHouseTbCompanion toCompanion(bool nullToAbsent) {
    return BroFa2VisitHouseTbCompanion(
      id: Value(id),
      broFa2VisitId: Value(broFa2VisitId),
      houseNo: Value(houseNo),
    );
  }

  factory BroFa2VisitHouse.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return BroFa2VisitHouse(
      id: serializer.fromJson<int>(json['id']),
      broFa2VisitId: serializer.fromJson<int>(json['bro_fa2_visit']),
      houseNo: serializer.fromJson<int>(json['house_no']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'bro_fa2_visit': serializer.toJson<int>(broFa2VisitId),
      'house_no': serializer.toJson<int>(houseNo),
    };
  }

  BroFa2VisitHouse copyWith({int? id, int? broFa2VisitId, int? houseNo}) =>
      BroFa2VisitHouse(
        id: id ?? this.id,
        broFa2VisitId: broFa2VisitId ?? this.broFa2VisitId,
        houseNo: houseNo ?? this.houseNo,
      );
  @override
  String toString() {
    return (StringBuffer('BroFa2VisitHouse(')
          ..write('id: $id, ')
          ..write('broFa2VisitId: $broFa2VisitId, ')
          ..write('houseNo: $houseNo')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf(
      $mrjc(id.hashCode, $mrjc(broFa2VisitId.hashCode, houseNo.hashCode)));
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is BroFa2VisitHouse &&
          other.id == this.id &&
          other.broFa2VisitId == this.broFa2VisitId &&
          other.houseNo == this.houseNo);
}

class BroFa2VisitHouseTbCompanion extends UpdateCompanion<BroFa2VisitHouse> {
  final Value<int> id;
  final Value<int> broFa2VisitId;
  final Value<int> houseNo;
  const BroFa2VisitHouseTbCompanion({
    this.id = const Value.absent(),
    this.broFa2VisitId = const Value.absent(),
    this.houseNo = const Value.absent(),
  });
  BroFa2VisitHouseTbCompanion.insert({
    this.id = const Value.absent(),
    required int broFa2VisitId,
    required int houseNo,
  })  : broFa2VisitId = Value(broFa2VisitId),
        houseNo = Value(houseNo);
  static Insertable<BroFa2VisitHouse> custom({
    Expression<int>? id,
    Expression<int>? broFa2VisitId,
    Expression<int>? houseNo,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (broFa2VisitId != null) 'bro_fa2_visit_id': broFa2VisitId,
      if (houseNo != null) 'house_no': houseNo,
    });
  }

  BroFa2VisitHouseTbCompanion copyWith(
      {Value<int>? id, Value<int>? broFa2VisitId, Value<int>? houseNo}) {
    return BroFa2VisitHouseTbCompanion(
      id: id ?? this.id,
      broFa2VisitId: broFa2VisitId ?? this.broFa2VisitId,
      houseNo: houseNo ?? this.houseNo,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (broFa2VisitId.present) {
      map['bro_fa2_visit_id'] = Variable<int>(broFa2VisitId.value);
    }
    if (houseNo.present) {
      map['house_no'] = Variable<int>(houseNo.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('BroFa2VisitHouseTbCompanion(')
          ..write('id: $id, ')
          ..write('broFa2VisitId: $broFa2VisitId, ')
          ..write('houseNo: $houseNo')
          ..write(')'))
        .toString();
  }
}

class $BroFa2VisitHouseTbTable extends BroFa2VisitHouseTb
    with TableInfo<$BroFa2VisitHouseTbTable, BroFa2VisitHouse> {
  final GeneratedDatabase _db;
  final String? _alias;
  $BroFa2VisitHouseTbTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  late final GeneratedColumn<int?> id = GeneratedColumn<int?>(
      'id', aliasedName, false,
      typeName: 'INTEGER',
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _broFa2VisitIdMeta =
      const VerificationMeta('broFa2VisitId');
  late final GeneratedColumn<int?> broFa2VisitId = GeneratedColumn<int?>(
      'bro_fa2_visit_id', aliasedName, false,
      typeName: 'INTEGER', requiredDuringInsert: true);
  final VerificationMeta _houseNoMeta = const VerificationMeta('houseNo');
  late final GeneratedColumn<int?> houseNo = GeneratedColumn<int?>(
      'house_no', aliasedName, false,
      typeName: 'INTEGER', requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, broFa2VisitId, houseNo];
  @override
  String get aliasedName => _alias ?? 'bro_fa2_visit_house';
  @override
  String get actualTableName => 'bro_fa2_visit_house';
  @override
  VerificationContext validateIntegrity(Insertable<BroFa2VisitHouse> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('bro_fa2_visit_id')) {
      context.handle(
          _broFa2VisitIdMeta,
          broFa2VisitId.isAcceptableOrUnknown(
              data['bro_fa2_visit_id']!, _broFa2VisitIdMeta));
    } else if (isInserting) {
      context.missing(_broFa2VisitIdMeta);
    }
    if (data.containsKey('house_no')) {
      context.handle(_houseNoMeta,
          houseNo.isAcceptableOrUnknown(data['house_no']!, _houseNoMeta));
    } else if (isInserting) {
      context.missing(_houseNoMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  BroFa2VisitHouse map(Map<String, dynamic> data, {String? tablePrefix}) {
    return BroFa2VisitHouse.fromData(data, _db,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $BroFa2VisitHouseTbTable createAlias(String alias) {
    return $BroFa2VisitHouseTbTable(_db, alias);
  }
}

class BroFa2VisitFo extends DataClass implements Insertable<BroFa2VisitFo> {
  final int id;
  final int broFa2VisitId;
  final int broFa2FoId;
  final String answer;
  final int? broFa2FoSelectionId;
  final String comment;
  final String action;
  final String remark;
  BroFa2VisitFo(
      {required this.id,
      required this.broFa2VisitId,
      required this.broFa2FoId,
      required this.answer,
      this.broFa2FoSelectionId,
      required this.comment,
      required this.action,
      required this.remark});
  factory BroFa2VisitFo.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return BroFa2VisitFo(
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      broFa2VisitId: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}bro_fa2_visit_id'])!,
      broFa2FoId: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}bro_fa2_fo_id'])!,
      answer: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}answer'])!,
      broFa2FoSelectionId: const IntType().mapFromDatabaseResponse(
          data['${effectivePrefix}bro_fa2_fo_selection_id']),
      comment: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}comment'])!,
      action: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}action'])!,
      remark: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}remark'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['bro_fa2_visit_id'] = Variable<int>(broFa2VisitId);
    map['bro_fa2_fo_id'] = Variable<int>(broFa2FoId);
    map['answer'] = Variable<String>(answer);
    if (!nullToAbsent || broFa2FoSelectionId != null) {
      map['bro_fa2_fo_selection_id'] = Variable<int?>(broFa2FoSelectionId);
    }
    map['comment'] = Variable<String>(comment);
    map['action'] = Variable<String>(action);
    map['remark'] = Variable<String>(remark);
    return map;
  }

  BroFa2VisitFoTbCompanion toCompanion(bool nullToAbsent) {
    return BroFa2VisitFoTbCompanion(
      id: Value(id),
      broFa2VisitId: Value(broFa2VisitId),
      broFa2FoId: Value(broFa2FoId),
      answer: Value(answer),
      broFa2FoSelectionId: broFa2FoSelectionId == null && nullToAbsent
          ? const Value.absent()
          : Value(broFa2FoSelectionId),
      comment: Value(comment),
      action: Value(action),
      remark: Value(remark),
    );
  }

  factory BroFa2VisitFo.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return BroFa2VisitFo(
      id: serializer.fromJson<int>(json['id']),
      broFa2VisitId: serializer.fromJson<int>(json['bro_fa2_visit']),
      broFa2FoId: serializer.fromJson<int>(json['bro_fa2_fo']),
      answer: serializer.fromJson<String>(json['answer']),
      broFa2FoSelectionId:
          serializer.fromJson<int?>(json['bro_fa2_fo_selection']),
      comment: serializer.fromJson<String>(json['comment']),
      action: serializer.fromJson<String>(json['action']),
      remark: serializer.fromJson<String>(json['remark']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'bro_fa2_visit': serializer.toJson<int>(broFa2VisitId),
      'bro_fa2_fo': serializer.toJson<int>(broFa2FoId),
      'answer': serializer.toJson<String>(answer),
      'bro_fa2_fo_selection': serializer.toJson<int?>(broFa2FoSelectionId),
      'comment': serializer.toJson<String>(comment),
      'action': serializer.toJson<String>(action),
      'remark': serializer.toJson<String>(remark),
    };
  }

  BroFa2VisitFo copyWith(
          {int? id,
          int? broFa2VisitId,
          int? broFa2FoId,
          String? answer,
          int? broFa2FoSelectionId,
          String? comment,
          String? action,
          String? remark}) =>
      BroFa2VisitFo(
        id: id ?? this.id,
        broFa2VisitId: broFa2VisitId ?? this.broFa2VisitId,
        broFa2FoId: broFa2FoId ?? this.broFa2FoId,
        answer: answer ?? this.answer,
        broFa2FoSelectionId: broFa2FoSelectionId ?? this.broFa2FoSelectionId,
        comment: comment ?? this.comment,
        action: action ?? this.action,
        remark: remark ?? this.remark,
      );
  @override
  String toString() {
    return (StringBuffer('BroFa2VisitFo(')
          ..write('id: $id, ')
          ..write('broFa2VisitId: $broFa2VisitId, ')
          ..write('broFa2FoId: $broFa2FoId, ')
          ..write('answer: $answer, ')
          ..write('broFa2FoSelectionId: $broFa2FoSelectionId, ')
          ..write('comment: $comment, ')
          ..write('action: $action, ')
          ..write('remark: $remark')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      id.hashCode,
      $mrjc(
          broFa2VisitId.hashCode,
          $mrjc(
              broFa2FoId.hashCode,
              $mrjc(
                  answer.hashCode,
                  $mrjc(
                      broFa2FoSelectionId.hashCode,
                      $mrjc(comment.hashCode,
                          $mrjc(action.hashCode, remark.hashCode))))))));
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is BroFa2VisitFo &&
          other.id == this.id &&
          other.broFa2VisitId == this.broFa2VisitId &&
          other.broFa2FoId == this.broFa2FoId &&
          other.answer == this.answer &&
          other.broFa2FoSelectionId == this.broFa2FoSelectionId &&
          other.comment == this.comment &&
          other.action == this.action &&
          other.remark == this.remark);
}

class BroFa2VisitFoTbCompanion extends UpdateCompanion<BroFa2VisitFo> {
  final Value<int> id;
  final Value<int> broFa2VisitId;
  final Value<int> broFa2FoId;
  final Value<String> answer;
  final Value<int?> broFa2FoSelectionId;
  final Value<String> comment;
  final Value<String> action;
  final Value<String> remark;
  const BroFa2VisitFoTbCompanion({
    this.id = const Value.absent(),
    this.broFa2VisitId = const Value.absent(),
    this.broFa2FoId = const Value.absent(),
    this.answer = const Value.absent(),
    this.broFa2FoSelectionId = const Value.absent(),
    this.comment = const Value.absent(),
    this.action = const Value.absent(),
    this.remark = const Value.absent(),
  });
  BroFa2VisitFoTbCompanion.insert({
    this.id = const Value.absent(),
    required int broFa2VisitId,
    required int broFa2FoId,
    required String answer,
    this.broFa2FoSelectionId = const Value.absent(),
    required String comment,
    required String action,
    required String remark,
  })  : broFa2VisitId = Value(broFa2VisitId),
        broFa2FoId = Value(broFa2FoId),
        answer = Value(answer),
        comment = Value(comment),
        action = Value(action),
        remark = Value(remark);
  static Insertable<BroFa2VisitFo> custom({
    Expression<int>? id,
    Expression<int>? broFa2VisitId,
    Expression<int>? broFa2FoId,
    Expression<String>? answer,
    Expression<int?>? broFa2FoSelectionId,
    Expression<String>? comment,
    Expression<String>? action,
    Expression<String>? remark,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (broFa2VisitId != null) 'bro_fa2_visit_id': broFa2VisitId,
      if (broFa2FoId != null) 'bro_fa2_fo_id': broFa2FoId,
      if (answer != null) 'answer': answer,
      if (broFa2FoSelectionId != null)
        'bro_fa2_fo_selection_id': broFa2FoSelectionId,
      if (comment != null) 'comment': comment,
      if (action != null) 'action': action,
      if (remark != null) 'remark': remark,
    });
  }

  BroFa2VisitFoTbCompanion copyWith(
      {Value<int>? id,
      Value<int>? broFa2VisitId,
      Value<int>? broFa2FoId,
      Value<String>? answer,
      Value<int?>? broFa2FoSelectionId,
      Value<String>? comment,
      Value<String>? action,
      Value<String>? remark}) {
    return BroFa2VisitFoTbCompanion(
      id: id ?? this.id,
      broFa2VisitId: broFa2VisitId ?? this.broFa2VisitId,
      broFa2FoId: broFa2FoId ?? this.broFa2FoId,
      answer: answer ?? this.answer,
      broFa2FoSelectionId: broFa2FoSelectionId ?? this.broFa2FoSelectionId,
      comment: comment ?? this.comment,
      action: action ?? this.action,
      remark: remark ?? this.remark,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (broFa2VisitId.present) {
      map['bro_fa2_visit_id'] = Variable<int>(broFa2VisitId.value);
    }
    if (broFa2FoId.present) {
      map['bro_fa2_fo_id'] = Variable<int>(broFa2FoId.value);
    }
    if (answer.present) {
      map['answer'] = Variable<String>(answer.value);
    }
    if (broFa2FoSelectionId.present) {
      map['bro_fa2_fo_selection_id'] =
          Variable<int?>(broFa2FoSelectionId.value);
    }
    if (comment.present) {
      map['comment'] = Variable<String>(comment.value);
    }
    if (action.present) {
      map['action'] = Variable<String>(action.value);
    }
    if (remark.present) {
      map['remark'] = Variable<String>(remark.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('BroFa2VisitFoTbCompanion(')
          ..write('id: $id, ')
          ..write('broFa2VisitId: $broFa2VisitId, ')
          ..write('broFa2FoId: $broFa2FoId, ')
          ..write('answer: $answer, ')
          ..write('broFa2FoSelectionId: $broFa2FoSelectionId, ')
          ..write('comment: $comment, ')
          ..write('action: $action, ')
          ..write('remark: $remark')
          ..write(')'))
        .toString();
  }
}

class $BroFa2VisitFoTbTable extends BroFa2VisitFoTb
    with TableInfo<$BroFa2VisitFoTbTable, BroFa2VisitFo> {
  final GeneratedDatabase _db;
  final String? _alias;
  $BroFa2VisitFoTbTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  late final GeneratedColumn<int?> id = GeneratedColumn<int?>(
      'id', aliasedName, false,
      typeName: 'INTEGER',
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _broFa2VisitIdMeta =
      const VerificationMeta('broFa2VisitId');
  late final GeneratedColumn<int?> broFa2VisitId = GeneratedColumn<int?>(
      'bro_fa2_visit_id', aliasedName, false,
      typeName: 'INTEGER', requiredDuringInsert: true);
  final VerificationMeta _broFa2FoIdMeta = const VerificationMeta('broFa2FoId');
  late final GeneratedColumn<int?> broFa2FoId = GeneratedColumn<int?>(
      'bro_fa2_fo_id', aliasedName, false,
      typeName: 'INTEGER', requiredDuringInsert: true);
  final VerificationMeta _answerMeta = const VerificationMeta('answer');
  late final GeneratedColumn<String?> answer = GeneratedColumn<String?>(
      'answer', aliasedName, false,
      typeName: 'TEXT', requiredDuringInsert: true);
  final VerificationMeta _broFa2FoSelectionIdMeta =
      const VerificationMeta('broFa2FoSelectionId');
  late final GeneratedColumn<int?> broFa2FoSelectionId = GeneratedColumn<int?>(
      'bro_fa2_fo_selection_id', aliasedName, true,
      typeName: 'INTEGER', requiredDuringInsert: false);
  final VerificationMeta _commentMeta = const VerificationMeta('comment');
  late final GeneratedColumn<String?> comment = GeneratedColumn<String?>(
      'comment', aliasedName, false,
      typeName: 'TEXT', requiredDuringInsert: true);
  final VerificationMeta _actionMeta = const VerificationMeta('action');
  late final GeneratedColumn<String?> action = GeneratedColumn<String?>(
      'action', aliasedName, false,
      typeName: 'TEXT', requiredDuringInsert: true);
  final VerificationMeta _remarkMeta = const VerificationMeta('remark');
  late final GeneratedColumn<String?> remark = GeneratedColumn<String?>(
      'remark', aliasedName, false,
      typeName: 'TEXT', requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        broFa2VisitId,
        broFa2FoId,
        answer,
        broFa2FoSelectionId,
        comment,
        action,
        remark
      ];
  @override
  String get aliasedName => _alias ?? 'bro_fa2_visit_fo';
  @override
  String get actualTableName => 'bro_fa2_visit_fo';
  @override
  VerificationContext validateIntegrity(Insertable<BroFa2VisitFo> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('bro_fa2_visit_id')) {
      context.handle(
          _broFa2VisitIdMeta,
          broFa2VisitId.isAcceptableOrUnknown(
              data['bro_fa2_visit_id']!, _broFa2VisitIdMeta));
    } else if (isInserting) {
      context.missing(_broFa2VisitIdMeta);
    }
    if (data.containsKey('bro_fa2_fo_id')) {
      context.handle(
          _broFa2FoIdMeta,
          broFa2FoId.isAcceptableOrUnknown(
              data['bro_fa2_fo_id']!, _broFa2FoIdMeta));
    } else if (isInserting) {
      context.missing(_broFa2FoIdMeta);
    }
    if (data.containsKey('answer')) {
      context.handle(_answerMeta,
          answer.isAcceptableOrUnknown(data['answer']!, _answerMeta));
    } else if (isInserting) {
      context.missing(_answerMeta);
    }
    if (data.containsKey('bro_fa2_fo_selection_id')) {
      context.handle(
          _broFa2FoSelectionIdMeta,
          broFa2FoSelectionId.isAcceptableOrUnknown(
              data['bro_fa2_fo_selection_id']!, _broFa2FoSelectionIdMeta));
    }
    if (data.containsKey('comment')) {
      context.handle(_commentMeta,
          comment.isAcceptableOrUnknown(data['comment']!, _commentMeta));
    } else if (isInserting) {
      context.missing(_commentMeta);
    }
    if (data.containsKey('action')) {
      context.handle(_actionMeta,
          action.isAcceptableOrUnknown(data['action']!, _actionMeta));
    } else if (isInserting) {
      context.missing(_actionMeta);
    }
    if (data.containsKey('remark')) {
      context.handle(_remarkMeta,
          remark.isAcceptableOrUnknown(data['remark']!, _remarkMeta));
    } else if (isInserting) {
      context.missing(_remarkMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  BroFa2VisitFo map(Map<String, dynamic> data, {String? tablePrefix}) {
    return BroFa2VisitFo.fromData(data, _db,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $BroFa2VisitFoTbTable createAlias(String alias) {
    return $BroFa2VisitFoTbTable(_db, alias);
  }
}

class BroFa2VisitFoImg extends DataClass
    implements Insertable<BroFa2VisitFoImg> {
  final int id;
  final int broFa2VisitFoId;
  final String path;

  /// This field is use to store the id of picture upload,
  /// after that upload to server by using this id
  final int? serverId;
  BroFa2VisitFoImg(
      {required this.id,
      required this.broFa2VisitFoId,
      required this.path,
      this.serverId});
  factory BroFa2VisitFoImg.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return BroFa2VisitFoImg(
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      broFa2VisitFoId: const IntType().mapFromDatabaseResponse(
          data['${effectivePrefix}bro_fa2_visit_fo_id'])!,
      path: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}path'])!,
      serverId: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}server_id']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['bro_fa2_visit_fo_id'] = Variable<int>(broFa2VisitFoId);
    map['path'] = Variable<String>(path);
    if (!nullToAbsent || serverId != null) {
      map['server_id'] = Variable<int?>(serverId);
    }
    return map;
  }

  BroFa2VisitFoImgTbCompanion toCompanion(bool nullToAbsent) {
    return BroFa2VisitFoImgTbCompanion(
      id: Value(id),
      broFa2VisitFoId: Value(broFa2VisitFoId),
      path: Value(path),
      serverId: serverId == null && nullToAbsent
          ? const Value.absent()
          : Value(serverId),
    );
  }

  factory BroFa2VisitFoImg.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return BroFa2VisitFoImg(
      id: serializer.fromJson<int>(json['id']),
      broFa2VisitFoId: serializer.fromJson<int>(json['bro_fa2_visit_fo']),
      path: serializer.fromJson<String>(json['path']),
      serverId: serializer.fromJson<int?>(json['bro_fa2_visit_img_path']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'bro_fa2_visit_fo': serializer.toJson<int>(broFa2VisitFoId),
      'path': serializer.toJson<String>(path),
      'bro_fa2_visit_img_path': serializer.toJson<int?>(serverId),
    };
  }

  BroFa2VisitFoImg copyWith(
          {int? id, int? broFa2VisitFoId, String? path, int? serverId}) =>
      BroFa2VisitFoImg(
        id: id ?? this.id,
        broFa2VisitFoId: broFa2VisitFoId ?? this.broFa2VisitFoId,
        path: path ?? this.path,
        serverId: serverId ?? this.serverId,
      );
  @override
  String toString() {
    return (StringBuffer('BroFa2VisitFoImg(')
          ..write('id: $id, ')
          ..write('broFa2VisitFoId: $broFa2VisitFoId, ')
          ..write('path: $path, ')
          ..write('serverId: $serverId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      id.hashCode,
      $mrjc(
          broFa2VisitFoId.hashCode, $mrjc(path.hashCode, serverId.hashCode))));
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is BroFa2VisitFoImg &&
          other.id == this.id &&
          other.broFa2VisitFoId == this.broFa2VisitFoId &&
          other.path == this.path &&
          other.serverId == this.serverId);
}

class BroFa2VisitFoImgTbCompanion extends UpdateCompanion<BroFa2VisitFoImg> {
  final Value<int> id;
  final Value<int> broFa2VisitFoId;
  final Value<String> path;
  final Value<int?> serverId;
  const BroFa2VisitFoImgTbCompanion({
    this.id = const Value.absent(),
    this.broFa2VisitFoId = const Value.absent(),
    this.path = const Value.absent(),
    this.serverId = const Value.absent(),
  });
  BroFa2VisitFoImgTbCompanion.insert({
    this.id = const Value.absent(),
    required int broFa2VisitFoId,
    required String path,
    this.serverId = const Value.absent(),
  })  : broFa2VisitFoId = Value(broFa2VisitFoId),
        path = Value(path);
  static Insertable<BroFa2VisitFoImg> custom({
    Expression<int>? id,
    Expression<int>? broFa2VisitFoId,
    Expression<String>? path,
    Expression<int?>? serverId,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (broFa2VisitFoId != null) 'bro_fa2_visit_fo_id': broFa2VisitFoId,
      if (path != null) 'path': path,
      if (serverId != null) 'server_id': serverId,
    });
  }

  BroFa2VisitFoImgTbCompanion copyWith(
      {Value<int>? id,
      Value<int>? broFa2VisitFoId,
      Value<String>? path,
      Value<int?>? serverId}) {
    return BroFa2VisitFoImgTbCompanion(
      id: id ?? this.id,
      broFa2VisitFoId: broFa2VisitFoId ?? this.broFa2VisitFoId,
      path: path ?? this.path,
      serverId: serverId ?? this.serverId,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (broFa2VisitFoId.present) {
      map['bro_fa2_visit_fo_id'] = Variable<int>(broFa2VisitFoId.value);
    }
    if (path.present) {
      map['path'] = Variable<String>(path.value);
    }
    if (serverId.present) {
      map['server_id'] = Variable<int?>(serverId.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('BroFa2VisitFoImgTbCompanion(')
          ..write('id: $id, ')
          ..write('broFa2VisitFoId: $broFa2VisitFoId, ')
          ..write('path: $path, ')
          ..write('serverId: $serverId')
          ..write(')'))
        .toString();
  }
}

class $BroFa2VisitFoImgTbTable extends BroFa2VisitFoImgTb
    with TableInfo<$BroFa2VisitFoImgTbTable, BroFa2VisitFoImg> {
  final GeneratedDatabase _db;
  final String? _alias;
  $BroFa2VisitFoImgTbTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  late final GeneratedColumn<int?> id = GeneratedColumn<int?>(
      'id', aliasedName, false,
      typeName: 'INTEGER',
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _broFa2VisitFoIdMeta =
      const VerificationMeta('broFa2VisitFoId');
  late final GeneratedColumn<int?> broFa2VisitFoId = GeneratedColumn<int?>(
      'bro_fa2_visit_fo_id', aliasedName, false,
      typeName: 'INTEGER', requiredDuringInsert: true);
  final VerificationMeta _pathMeta = const VerificationMeta('path');
  late final GeneratedColumn<String?> path = GeneratedColumn<String?>(
      'path', aliasedName, false,
      typeName: 'TEXT', requiredDuringInsert: true);
  final VerificationMeta _serverIdMeta = const VerificationMeta('serverId');
  late final GeneratedColumn<int?> serverId = GeneratedColumn<int?>(
      'server_id', aliasedName, true,
      typeName: 'INTEGER', requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [id, broFa2VisitFoId, path, serverId];
  @override
  String get aliasedName => _alias ?? 'bro_fa2_visit_fo_img';
  @override
  String get actualTableName => 'bro_fa2_visit_fo_img';
  @override
  VerificationContext validateIntegrity(Insertable<BroFa2VisitFoImg> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('bro_fa2_visit_fo_id')) {
      context.handle(
          _broFa2VisitFoIdMeta,
          broFa2VisitFoId.isAcceptableOrUnknown(
              data['bro_fa2_visit_fo_id']!, _broFa2VisitFoIdMeta));
    } else if (isInserting) {
      context.missing(_broFa2VisitFoIdMeta);
    }
    if (data.containsKey('path')) {
      context.handle(
          _pathMeta, path.isAcceptableOrUnknown(data['path']!, _pathMeta));
    } else if (isInserting) {
      context.missing(_pathMeta);
    }
    if (data.containsKey('server_id')) {
      context.handle(_serverIdMeta,
          serverId.isAcceptableOrUnknown(data['server_id']!, _serverIdMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  BroFa2VisitFoImg map(Map<String, dynamic> data, {String? tablePrefix}) {
    return BroFa2VisitFoImg.fromData(data, _db,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $BroFa2VisitFoImgTbTable createAlias(String alias) {
    return $BroFa2VisitFoImgTbTable(_db, alias);
  }
}

class BroFa2VisitPm extends DataClass implements Insertable<BroFa2VisitPm> {
  final int id;
  final int broFa2VisitId;
  final int broFa2PmId;
  final String comment;
  final String action;
  final String remark;
  BroFa2VisitPm(
      {required this.id,
      required this.broFa2VisitId,
      required this.broFa2PmId,
      required this.comment,
      required this.action,
      required this.remark});
  factory BroFa2VisitPm.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return BroFa2VisitPm(
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      broFa2VisitId: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}bro_fa2_visit_id'])!,
      broFa2PmId: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}bro_fa2_pm_id'])!,
      comment: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}comment'])!,
      action: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}action'])!,
      remark: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}remark'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['bro_fa2_visit_id'] = Variable<int>(broFa2VisitId);
    map['bro_fa2_pm_id'] = Variable<int>(broFa2PmId);
    map['comment'] = Variable<String>(comment);
    map['action'] = Variable<String>(action);
    map['remark'] = Variable<String>(remark);
    return map;
  }

  BroFa2VisitPmTbCompanion toCompanion(bool nullToAbsent) {
    return BroFa2VisitPmTbCompanion(
      id: Value(id),
      broFa2VisitId: Value(broFa2VisitId),
      broFa2PmId: Value(broFa2PmId),
      comment: Value(comment),
      action: Value(action),
      remark: Value(remark),
    );
  }

  factory BroFa2VisitPm.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return BroFa2VisitPm(
      id: serializer.fromJson<int>(json['id']),
      broFa2VisitId: serializer.fromJson<int>(json['bro_fa2_visit']),
      broFa2PmId: serializer.fromJson<int>(json['bro_fa2_pm']),
      comment: serializer.fromJson<String>(json['comment']),
      action: serializer.fromJson<String>(json['action']),
      remark: serializer.fromJson<String>(json['remark']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'bro_fa2_visit': serializer.toJson<int>(broFa2VisitId),
      'bro_fa2_pm': serializer.toJson<int>(broFa2PmId),
      'comment': serializer.toJson<String>(comment),
      'action': serializer.toJson<String>(action),
      'remark': serializer.toJson<String>(remark),
    };
  }

  BroFa2VisitPm copyWith(
          {int? id,
          int? broFa2VisitId,
          int? broFa2PmId,
          String? comment,
          String? action,
          String? remark}) =>
      BroFa2VisitPm(
        id: id ?? this.id,
        broFa2VisitId: broFa2VisitId ?? this.broFa2VisitId,
        broFa2PmId: broFa2PmId ?? this.broFa2PmId,
        comment: comment ?? this.comment,
        action: action ?? this.action,
        remark: remark ?? this.remark,
      );
  @override
  String toString() {
    return (StringBuffer('BroFa2VisitPm(')
          ..write('id: $id, ')
          ..write('broFa2VisitId: $broFa2VisitId, ')
          ..write('broFa2PmId: $broFa2PmId, ')
          ..write('comment: $comment, ')
          ..write('action: $action, ')
          ..write('remark: $remark')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      id.hashCode,
      $mrjc(
          broFa2VisitId.hashCode,
          $mrjc(
              broFa2PmId.hashCode,
              $mrjc(comment.hashCode,
                  $mrjc(action.hashCode, remark.hashCode))))));
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is BroFa2VisitPm &&
          other.id == this.id &&
          other.broFa2VisitId == this.broFa2VisitId &&
          other.broFa2PmId == this.broFa2PmId &&
          other.comment == this.comment &&
          other.action == this.action &&
          other.remark == this.remark);
}

class BroFa2VisitPmTbCompanion extends UpdateCompanion<BroFa2VisitPm> {
  final Value<int> id;
  final Value<int> broFa2VisitId;
  final Value<int> broFa2PmId;
  final Value<String> comment;
  final Value<String> action;
  final Value<String> remark;
  const BroFa2VisitPmTbCompanion({
    this.id = const Value.absent(),
    this.broFa2VisitId = const Value.absent(),
    this.broFa2PmId = const Value.absent(),
    this.comment = const Value.absent(),
    this.action = const Value.absent(),
    this.remark = const Value.absent(),
  });
  BroFa2VisitPmTbCompanion.insert({
    this.id = const Value.absent(),
    required int broFa2VisitId,
    required int broFa2PmId,
    required String comment,
    required String action,
    required String remark,
  })  : broFa2VisitId = Value(broFa2VisitId),
        broFa2PmId = Value(broFa2PmId),
        comment = Value(comment),
        action = Value(action),
        remark = Value(remark);
  static Insertable<BroFa2VisitPm> custom({
    Expression<int>? id,
    Expression<int>? broFa2VisitId,
    Expression<int>? broFa2PmId,
    Expression<String>? comment,
    Expression<String>? action,
    Expression<String>? remark,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (broFa2VisitId != null) 'bro_fa2_visit_id': broFa2VisitId,
      if (broFa2PmId != null) 'bro_fa2_pm_id': broFa2PmId,
      if (comment != null) 'comment': comment,
      if (action != null) 'action': action,
      if (remark != null) 'remark': remark,
    });
  }

  BroFa2VisitPmTbCompanion copyWith(
      {Value<int>? id,
      Value<int>? broFa2VisitId,
      Value<int>? broFa2PmId,
      Value<String>? comment,
      Value<String>? action,
      Value<String>? remark}) {
    return BroFa2VisitPmTbCompanion(
      id: id ?? this.id,
      broFa2VisitId: broFa2VisitId ?? this.broFa2VisitId,
      broFa2PmId: broFa2PmId ?? this.broFa2PmId,
      comment: comment ?? this.comment,
      action: action ?? this.action,
      remark: remark ?? this.remark,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (broFa2VisitId.present) {
      map['bro_fa2_visit_id'] = Variable<int>(broFa2VisitId.value);
    }
    if (broFa2PmId.present) {
      map['bro_fa2_pm_id'] = Variable<int>(broFa2PmId.value);
    }
    if (comment.present) {
      map['comment'] = Variable<String>(comment.value);
    }
    if (action.present) {
      map['action'] = Variable<String>(action.value);
    }
    if (remark.present) {
      map['remark'] = Variable<String>(remark.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('BroFa2VisitPmTbCompanion(')
          ..write('id: $id, ')
          ..write('broFa2VisitId: $broFa2VisitId, ')
          ..write('broFa2PmId: $broFa2PmId, ')
          ..write('comment: $comment, ')
          ..write('action: $action, ')
          ..write('remark: $remark')
          ..write(')'))
        .toString();
  }
}

class $BroFa2VisitPmTbTable extends BroFa2VisitPmTb
    with TableInfo<$BroFa2VisitPmTbTable, BroFa2VisitPm> {
  final GeneratedDatabase _db;
  final String? _alias;
  $BroFa2VisitPmTbTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  late final GeneratedColumn<int?> id = GeneratedColumn<int?>(
      'id', aliasedName, false,
      typeName: 'INTEGER',
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _broFa2VisitIdMeta =
      const VerificationMeta('broFa2VisitId');
  late final GeneratedColumn<int?> broFa2VisitId = GeneratedColumn<int?>(
      'bro_fa2_visit_id', aliasedName, false,
      typeName: 'INTEGER', requiredDuringInsert: true);
  final VerificationMeta _broFa2PmIdMeta = const VerificationMeta('broFa2PmId');
  late final GeneratedColumn<int?> broFa2PmId = GeneratedColumn<int?>(
      'bro_fa2_pm_id', aliasedName, false,
      typeName: 'INTEGER', requiredDuringInsert: true);
  final VerificationMeta _commentMeta = const VerificationMeta('comment');
  late final GeneratedColumn<String?> comment = GeneratedColumn<String?>(
      'comment', aliasedName, false,
      typeName: 'TEXT', requiredDuringInsert: true);
  final VerificationMeta _actionMeta = const VerificationMeta('action');
  late final GeneratedColumn<String?> action = GeneratedColumn<String?>(
      'action', aliasedName, false,
      typeName: 'TEXT', requiredDuringInsert: true);
  final VerificationMeta _remarkMeta = const VerificationMeta('remark');
  late final GeneratedColumn<String?> remark = GeneratedColumn<String?>(
      'remark', aliasedName, false,
      typeName: 'TEXT', requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [id, broFa2VisitId, broFa2PmId, comment, action, remark];
  @override
  String get aliasedName => _alias ?? 'bro_fa2_visit_pm';
  @override
  String get actualTableName => 'bro_fa2_visit_pm';
  @override
  VerificationContext validateIntegrity(Insertable<BroFa2VisitPm> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('bro_fa2_visit_id')) {
      context.handle(
          _broFa2VisitIdMeta,
          broFa2VisitId.isAcceptableOrUnknown(
              data['bro_fa2_visit_id']!, _broFa2VisitIdMeta));
    } else if (isInserting) {
      context.missing(_broFa2VisitIdMeta);
    }
    if (data.containsKey('bro_fa2_pm_id')) {
      context.handle(
          _broFa2PmIdMeta,
          broFa2PmId.isAcceptableOrUnknown(
              data['bro_fa2_pm_id']!, _broFa2PmIdMeta));
    } else if (isInserting) {
      context.missing(_broFa2PmIdMeta);
    }
    if (data.containsKey('comment')) {
      context.handle(_commentMeta,
          comment.isAcceptableOrUnknown(data['comment']!, _commentMeta));
    } else if (isInserting) {
      context.missing(_commentMeta);
    }
    if (data.containsKey('action')) {
      context.handle(_actionMeta,
          action.isAcceptableOrUnknown(data['action']!, _actionMeta));
    } else if (isInserting) {
      context.missing(_actionMeta);
    }
    if (data.containsKey('remark')) {
      context.handle(_remarkMeta,
          remark.isAcceptableOrUnknown(data['remark']!, _remarkMeta));
    } else if (isInserting) {
      context.missing(_remarkMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  BroFa2VisitPm map(Map<String, dynamic> data, {String? tablePrefix}) {
    return BroFa2VisitPm.fromData(data, _db,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $BroFa2VisitPmTbTable createAlias(String alias) {
    return $BroFa2VisitPmTbTable(_db, alias);
  }
}

class BroFa2VisitPmImg extends DataClass
    implements Insertable<BroFa2VisitPmImg> {
  final int id;
  final int broFa2VisitPmId;
  final String path;

  /// This field is use to store the id of picture upload,
  /// after that upload to server by using this id
  final int? serverId;
  BroFa2VisitPmImg(
      {required this.id,
      required this.broFa2VisitPmId,
      required this.path,
      this.serverId});
  factory BroFa2VisitPmImg.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return BroFa2VisitPmImg(
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      broFa2VisitPmId: const IntType().mapFromDatabaseResponse(
          data['${effectivePrefix}bro_fa2_visit_pm_id'])!,
      path: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}path'])!,
      serverId: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}server_id']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['bro_fa2_visit_pm_id'] = Variable<int>(broFa2VisitPmId);
    map['path'] = Variable<String>(path);
    if (!nullToAbsent || serverId != null) {
      map['server_id'] = Variable<int?>(serverId);
    }
    return map;
  }

  BroFa2VisitPmImgTbCompanion toCompanion(bool nullToAbsent) {
    return BroFa2VisitPmImgTbCompanion(
      id: Value(id),
      broFa2VisitPmId: Value(broFa2VisitPmId),
      path: Value(path),
      serverId: serverId == null && nullToAbsent
          ? const Value.absent()
          : Value(serverId),
    );
  }

  factory BroFa2VisitPmImg.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return BroFa2VisitPmImg(
      id: serializer.fromJson<int>(json['id']),
      broFa2VisitPmId: serializer.fromJson<int>(json['bro_fa2_visit_pm']),
      path: serializer.fromJson<String>(json['path']),
      serverId: serializer.fromJson<int?>(json['bro_fa2_visit_img_path']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'bro_fa2_visit_pm': serializer.toJson<int>(broFa2VisitPmId),
      'path': serializer.toJson<String>(path),
      'bro_fa2_visit_img_path': serializer.toJson<int?>(serverId),
    };
  }

  BroFa2VisitPmImg copyWith(
          {int? id, int? broFa2VisitPmId, String? path, int? serverId}) =>
      BroFa2VisitPmImg(
        id: id ?? this.id,
        broFa2VisitPmId: broFa2VisitPmId ?? this.broFa2VisitPmId,
        path: path ?? this.path,
        serverId: serverId ?? this.serverId,
      );
  @override
  String toString() {
    return (StringBuffer('BroFa2VisitPmImg(')
          ..write('id: $id, ')
          ..write('broFa2VisitPmId: $broFa2VisitPmId, ')
          ..write('path: $path, ')
          ..write('serverId: $serverId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      id.hashCode,
      $mrjc(
          broFa2VisitPmId.hashCode, $mrjc(path.hashCode, serverId.hashCode))));
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is BroFa2VisitPmImg &&
          other.id == this.id &&
          other.broFa2VisitPmId == this.broFa2VisitPmId &&
          other.path == this.path &&
          other.serverId == this.serverId);
}

class BroFa2VisitPmImgTbCompanion extends UpdateCompanion<BroFa2VisitPmImg> {
  final Value<int> id;
  final Value<int> broFa2VisitPmId;
  final Value<String> path;
  final Value<int?> serverId;
  const BroFa2VisitPmImgTbCompanion({
    this.id = const Value.absent(),
    this.broFa2VisitPmId = const Value.absent(),
    this.path = const Value.absent(),
    this.serverId = const Value.absent(),
  });
  BroFa2VisitPmImgTbCompanion.insert({
    this.id = const Value.absent(),
    required int broFa2VisitPmId,
    required String path,
    this.serverId = const Value.absent(),
  })  : broFa2VisitPmId = Value(broFa2VisitPmId),
        path = Value(path);
  static Insertable<BroFa2VisitPmImg> custom({
    Expression<int>? id,
    Expression<int>? broFa2VisitPmId,
    Expression<String>? path,
    Expression<int?>? serverId,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (broFa2VisitPmId != null) 'bro_fa2_visit_pm_id': broFa2VisitPmId,
      if (path != null) 'path': path,
      if (serverId != null) 'server_id': serverId,
    });
  }

  BroFa2VisitPmImgTbCompanion copyWith(
      {Value<int>? id,
      Value<int>? broFa2VisitPmId,
      Value<String>? path,
      Value<int?>? serverId}) {
    return BroFa2VisitPmImgTbCompanion(
      id: id ?? this.id,
      broFa2VisitPmId: broFa2VisitPmId ?? this.broFa2VisitPmId,
      path: path ?? this.path,
      serverId: serverId ?? this.serverId,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (broFa2VisitPmId.present) {
      map['bro_fa2_visit_pm_id'] = Variable<int>(broFa2VisitPmId.value);
    }
    if (path.present) {
      map['path'] = Variable<String>(path.value);
    }
    if (serverId.present) {
      map['server_id'] = Variable<int?>(serverId.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('BroFa2VisitPmImgTbCompanion(')
          ..write('id: $id, ')
          ..write('broFa2VisitPmId: $broFa2VisitPmId, ')
          ..write('path: $path, ')
          ..write('serverId: $serverId')
          ..write(')'))
        .toString();
  }
}

class $BroFa2VisitPmImgTbTable extends BroFa2VisitPmImgTb
    with TableInfo<$BroFa2VisitPmImgTbTable, BroFa2VisitPmImg> {
  final GeneratedDatabase _db;
  final String? _alias;
  $BroFa2VisitPmImgTbTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  late final GeneratedColumn<int?> id = GeneratedColumn<int?>(
      'id', aliasedName, false,
      typeName: 'INTEGER',
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _broFa2VisitPmIdMeta =
      const VerificationMeta('broFa2VisitPmId');
  late final GeneratedColumn<int?> broFa2VisitPmId = GeneratedColumn<int?>(
      'bro_fa2_visit_pm_id', aliasedName, false,
      typeName: 'INTEGER', requiredDuringInsert: true);
  final VerificationMeta _pathMeta = const VerificationMeta('path');
  late final GeneratedColumn<String?> path = GeneratedColumn<String?>(
      'path', aliasedName, false,
      typeName: 'TEXT', requiredDuringInsert: true);
  final VerificationMeta _serverIdMeta = const VerificationMeta('serverId');
  late final GeneratedColumn<int?> serverId = GeneratedColumn<int?>(
      'server_id', aliasedName, true,
      typeName: 'INTEGER', requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [id, broFa2VisitPmId, path, serverId];
  @override
  String get aliasedName => _alias ?? 'bro_fa2_visit_pm_img';
  @override
  String get actualTableName => 'bro_fa2_visit_pm_img';
  @override
  VerificationContext validateIntegrity(Insertable<BroFa2VisitPmImg> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('bro_fa2_visit_pm_id')) {
      context.handle(
          _broFa2VisitPmIdMeta,
          broFa2VisitPmId.isAcceptableOrUnknown(
              data['bro_fa2_visit_pm_id']!, _broFa2VisitPmIdMeta));
    } else if (isInserting) {
      context.missing(_broFa2VisitPmIdMeta);
    }
    if (data.containsKey('path')) {
      context.handle(
          _pathMeta, path.isAcceptableOrUnknown(data['path']!, _pathMeta));
    } else if (isInserting) {
      context.missing(_pathMeta);
    }
    if (data.containsKey('server_id')) {
      context.handle(_serverIdMeta,
          serverId.isAcceptableOrUnknown(data['server_id']!, _serverIdMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  BroFa2VisitPmImg map(Map<String, dynamic> data, {String? tablePrefix}) {
    return BroFa2VisitPmImg.fromData(data, _db,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $BroFa2VisitPmImgTbTable createAlias(String alias) {
    return $BroFa2VisitPmImgTbTable(_db, alias);
  }
}

class BroFa2VisitDo extends DataClass implements Insertable<BroFa2VisitDo> {
  final int id;
  final int broFa2VisitId;
  final int broFa2DoId;
  final String answer;
  final String comment;
  final String action;
  final String remark;
  BroFa2VisitDo(
      {required this.id,
      required this.broFa2VisitId,
      required this.broFa2DoId,
      required this.answer,
      required this.comment,
      required this.action,
      required this.remark});
  factory BroFa2VisitDo.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return BroFa2VisitDo(
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      broFa2VisitId: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}bro_fa2_visit_id'])!,
      broFa2DoId: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}bro_fa2_do_id'])!,
      answer: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}answer'])!,
      comment: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}comment'])!,
      action: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}action'])!,
      remark: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}remark'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['bro_fa2_visit_id'] = Variable<int>(broFa2VisitId);
    map['bro_fa2_do_id'] = Variable<int>(broFa2DoId);
    map['answer'] = Variable<String>(answer);
    map['comment'] = Variable<String>(comment);
    map['action'] = Variable<String>(action);
    map['remark'] = Variable<String>(remark);
    return map;
  }

  BroFa2VisitDoTbCompanion toCompanion(bool nullToAbsent) {
    return BroFa2VisitDoTbCompanion(
      id: Value(id),
      broFa2VisitId: Value(broFa2VisitId),
      broFa2DoId: Value(broFa2DoId),
      answer: Value(answer),
      comment: Value(comment),
      action: Value(action),
      remark: Value(remark),
    );
  }

  factory BroFa2VisitDo.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return BroFa2VisitDo(
      id: serializer.fromJson<int>(json['id']),
      broFa2VisitId: serializer.fromJson<int>(json['bro_fa2_visit']),
      broFa2DoId: serializer.fromJson<int>(json['bro_fa2_do']),
      answer: serializer.fromJson<String>(json['answer']),
      comment: serializer.fromJson<String>(json['comment']),
      action: serializer.fromJson<String>(json['action']),
      remark: serializer.fromJson<String>(json['remark']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'bro_fa2_visit': serializer.toJson<int>(broFa2VisitId),
      'bro_fa2_do': serializer.toJson<int>(broFa2DoId),
      'answer': serializer.toJson<String>(answer),
      'comment': serializer.toJson<String>(comment),
      'action': serializer.toJson<String>(action),
      'remark': serializer.toJson<String>(remark),
    };
  }

  BroFa2VisitDo copyWith(
          {int? id,
          int? broFa2VisitId,
          int? broFa2DoId,
          String? answer,
          String? comment,
          String? action,
          String? remark}) =>
      BroFa2VisitDo(
        id: id ?? this.id,
        broFa2VisitId: broFa2VisitId ?? this.broFa2VisitId,
        broFa2DoId: broFa2DoId ?? this.broFa2DoId,
        answer: answer ?? this.answer,
        comment: comment ?? this.comment,
        action: action ?? this.action,
        remark: remark ?? this.remark,
      );
  @override
  String toString() {
    return (StringBuffer('BroFa2VisitDo(')
          ..write('id: $id, ')
          ..write('broFa2VisitId: $broFa2VisitId, ')
          ..write('broFa2DoId: $broFa2DoId, ')
          ..write('answer: $answer, ')
          ..write('comment: $comment, ')
          ..write('action: $action, ')
          ..write('remark: $remark')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      id.hashCode,
      $mrjc(
          broFa2VisitId.hashCode,
          $mrjc(
              broFa2DoId.hashCode,
              $mrjc(
                  answer.hashCode,
                  $mrjc(comment.hashCode,
                      $mrjc(action.hashCode, remark.hashCode)))))));
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is BroFa2VisitDo &&
          other.id == this.id &&
          other.broFa2VisitId == this.broFa2VisitId &&
          other.broFa2DoId == this.broFa2DoId &&
          other.answer == this.answer &&
          other.comment == this.comment &&
          other.action == this.action &&
          other.remark == this.remark);
}

class BroFa2VisitDoTbCompanion extends UpdateCompanion<BroFa2VisitDo> {
  final Value<int> id;
  final Value<int> broFa2VisitId;
  final Value<int> broFa2DoId;
  final Value<String> answer;
  final Value<String> comment;
  final Value<String> action;
  final Value<String> remark;
  const BroFa2VisitDoTbCompanion({
    this.id = const Value.absent(),
    this.broFa2VisitId = const Value.absent(),
    this.broFa2DoId = const Value.absent(),
    this.answer = const Value.absent(),
    this.comment = const Value.absent(),
    this.action = const Value.absent(),
    this.remark = const Value.absent(),
  });
  BroFa2VisitDoTbCompanion.insert({
    this.id = const Value.absent(),
    required int broFa2VisitId,
    required int broFa2DoId,
    required String answer,
    required String comment,
    required String action,
    required String remark,
  })  : broFa2VisitId = Value(broFa2VisitId),
        broFa2DoId = Value(broFa2DoId),
        answer = Value(answer),
        comment = Value(comment),
        action = Value(action),
        remark = Value(remark);
  static Insertable<BroFa2VisitDo> custom({
    Expression<int>? id,
    Expression<int>? broFa2VisitId,
    Expression<int>? broFa2DoId,
    Expression<String>? answer,
    Expression<String>? comment,
    Expression<String>? action,
    Expression<String>? remark,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (broFa2VisitId != null) 'bro_fa2_visit_id': broFa2VisitId,
      if (broFa2DoId != null) 'bro_fa2_do_id': broFa2DoId,
      if (answer != null) 'answer': answer,
      if (comment != null) 'comment': comment,
      if (action != null) 'action': action,
      if (remark != null) 'remark': remark,
    });
  }

  BroFa2VisitDoTbCompanion copyWith(
      {Value<int>? id,
      Value<int>? broFa2VisitId,
      Value<int>? broFa2DoId,
      Value<String>? answer,
      Value<String>? comment,
      Value<String>? action,
      Value<String>? remark}) {
    return BroFa2VisitDoTbCompanion(
      id: id ?? this.id,
      broFa2VisitId: broFa2VisitId ?? this.broFa2VisitId,
      broFa2DoId: broFa2DoId ?? this.broFa2DoId,
      answer: answer ?? this.answer,
      comment: comment ?? this.comment,
      action: action ?? this.action,
      remark: remark ?? this.remark,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (broFa2VisitId.present) {
      map['bro_fa2_visit_id'] = Variable<int>(broFa2VisitId.value);
    }
    if (broFa2DoId.present) {
      map['bro_fa2_do_id'] = Variable<int>(broFa2DoId.value);
    }
    if (answer.present) {
      map['answer'] = Variable<String>(answer.value);
    }
    if (comment.present) {
      map['comment'] = Variable<String>(comment.value);
    }
    if (action.present) {
      map['action'] = Variable<String>(action.value);
    }
    if (remark.present) {
      map['remark'] = Variable<String>(remark.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('BroFa2VisitDoTbCompanion(')
          ..write('id: $id, ')
          ..write('broFa2VisitId: $broFa2VisitId, ')
          ..write('broFa2DoId: $broFa2DoId, ')
          ..write('answer: $answer, ')
          ..write('comment: $comment, ')
          ..write('action: $action, ')
          ..write('remark: $remark')
          ..write(')'))
        .toString();
  }
}

class $BroFa2VisitDoTbTable extends BroFa2VisitDoTb
    with TableInfo<$BroFa2VisitDoTbTable, BroFa2VisitDo> {
  final GeneratedDatabase _db;
  final String? _alias;
  $BroFa2VisitDoTbTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  late final GeneratedColumn<int?> id = GeneratedColumn<int?>(
      'id', aliasedName, false,
      typeName: 'INTEGER',
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _broFa2VisitIdMeta =
      const VerificationMeta('broFa2VisitId');
  late final GeneratedColumn<int?> broFa2VisitId = GeneratedColumn<int?>(
      'bro_fa2_visit_id', aliasedName, false,
      typeName: 'INTEGER', requiredDuringInsert: true);
  final VerificationMeta _broFa2DoIdMeta = const VerificationMeta('broFa2DoId');
  late final GeneratedColumn<int?> broFa2DoId = GeneratedColumn<int?>(
      'bro_fa2_do_id', aliasedName, false,
      typeName: 'INTEGER', requiredDuringInsert: true);
  final VerificationMeta _answerMeta = const VerificationMeta('answer');
  late final GeneratedColumn<String?> answer = GeneratedColumn<String?>(
      'answer', aliasedName, false,
      typeName: 'TEXT', requiredDuringInsert: true);
  final VerificationMeta _commentMeta = const VerificationMeta('comment');
  late final GeneratedColumn<String?> comment = GeneratedColumn<String?>(
      'comment', aliasedName, false,
      typeName: 'TEXT', requiredDuringInsert: true);
  final VerificationMeta _actionMeta = const VerificationMeta('action');
  late final GeneratedColumn<String?> action = GeneratedColumn<String?>(
      'action', aliasedName, false,
      typeName: 'TEXT', requiredDuringInsert: true);
  final VerificationMeta _remarkMeta = const VerificationMeta('remark');
  late final GeneratedColumn<String?> remark = GeneratedColumn<String?>(
      'remark', aliasedName, false,
      typeName: 'TEXT', requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [id, broFa2VisitId, broFa2DoId, answer, comment, action, remark];
  @override
  String get aliasedName => _alias ?? 'bro_fa2_visit_do';
  @override
  String get actualTableName => 'bro_fa2_visit_do';
  @override
  VerificationContext validateIntegrity(Insertable<BroFa2VisitDo> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('bro_fa2_visit_id')) {
      context.handle(
          _broFa2VisitIdMeta,
          broFa2VisitId.isAcceptableOrUnknown(
              data['bro_fa2_visit_id']!, _broFa2VisitIdMeta));
    } else if (isInserting) {
      context.missing(_broFa2VisitIdMeta);
    }
    if (data.containsKey('bro_fa2_do_id')) {
      context.handle(
          _broFa2DoIdMeta,
          broFa2DoId.isAcceptableOrUnknown(
              data['bro_fa2_do_id']!, _broFa2DoIdMeta));
    } else if (isInserting) {
      context.missing(_broFa2DoIdMeta);
    }
    if (data.containsKey('answer')) {
      context.handle(_answerMeta,
          answer.isAcceptableOrUnknown(data['answer']!, _answerMeta));
    } else if (isInserting) {
      context.missing(_answerMeta);
    }
    if (data.containsKey('comment')) {
      context.handle(_commentMeta,
          comment.isAcceptableOrUnknown(data['comment']!, _commentMeta));
    } else if (isInserting) {
      context.missing(_commentMeta);
    }
    if (data.containsKey('action')) {
      context.handle(_actionMeta,
          action.isAcceptableOrUnknown(data['action']!, _actionMeta));
    } else if (isInserting) {
      context.missing(_actionMeta);
    }
    if (data.containsKey('remark')) {
      context.handle(_remarkMeta,
          remark.isAcceptableOrUnknown(data['remark']!, _remarkMeta));
    } else if (isInserting) {
      context.missing(_remarkMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  BroFa2VisitDo map(Map<String, dynamic> data, {String? tablePrefix}) {
    return BroFa2VisitDo.fromData(data, _db,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $BroFa2VisitDoTbTable createAlias(String alias) {
    return $BroFa2VisitDoTbTable(_db, alias);
  }
}

class BroFa2VisitPasgar extends DataClass
    implements Insertable<BroFa2VisitPasgar> {
  final int id;
  final int broFa2VisitId;
  final int order;
  final bool isChkReflex;
  final bool isChkNavel;
  final bool isChkLegs;
  final bool isChkBeak;
  final bool isChkBelly;
  BroFa2VisitPasgar(
      {required this.id,
      required this.broFa2VisitId,
      required this.order,
      required this.isChkReflex,
      required this.isChkNavel,
      required this.isChkLegs,
      required this.isChkBeak,
      required this.isChkBelly});
  factory BroFa2VisitPasgar.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return BroFa2VisitPasgar(
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      broFa2VisitId: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}bro_fa2_visit_id'])!,
      order: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}order'])!,
      isChkReflex: const BoolType()
          .mapFromDatabaseResponse(data['${effectivePrefix}is_chk_reflex'])!,
      isChkNavel: const BoolType()
          .mapFromDatabaseResponse(data['${effectivePrefix}is_chk_navel'])!,
      isChkLegs: const BoolType()
          .mapFromDatabaseResponse(data['${effectivePrefix}is_chk_legs'])!,
      isChkBeak: const BoolType()
          .mapFromDatabaseResponse(data['${effectivePrefix}is_chk_beak'])!,
      isChkBelly: const BoolType()
          .mapFromDatabaseResponse(data['${effectivePrefix}is_chk_belly'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['bro_fa2_visit_id'] = Variable<int>(broFa2VisitId);
    map['order'] = Variable<int>(order);
    map['is_chk_reflex'] = Variable<bool>(isChkReflex);
    map['is_chk_navel'] = Variable<bool>(isChkNavel);
    map['is_chk_legs'] = Variable<bool>(isChkLegs);
    map['is_chk_beak'] = Variable<bool>(isChkBeak);
    map['is_chk_belly'] = Variable<bool>(isChkBelly);
    return map;
  }

  BroFa2VisitPasgarTbCompanion toCompanion(bool nullToAbsent) {
    return BroFa2VisitPasgarTbCompanion(
      id: Value(id),
      broFa2VisitId: Value(broFa2VisitId),
      order: Value(order),
      isChkReflex: Value(isChkReflex),
      isChkNavel: Value(isChkNavel),
      isChkLegs: Value(isChkLegs),
      isChkBeak: Value(isChkBeak),
      isChkBelly: Value(isChkBelly),
    );
  }

  factory BroFa2VisitPasgar.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return BroFa2VisitPasgar(
      id: serializer.fromJson<int>(json['id']),
      broFa2VisitId: serializer.fromJson<int>(json['bro_fa2_visit']),
      order: serializer.fromJson<int>(json['order']),
      isChkReflex: serializer.fromJson<bool>(json['is_chk_reflex']),
      isChkNavel: serializer.fromJson<bool>(json['is_chk_navel']),
      isChkLegs: serializer.fromJson<bool>(json['is_chk_legs']),
      isChkBeak: serializer.fromJson<bool>(json['is_chk_beak']),
      isChkBelly: serializer.fromJson<bool>(json['is_chk_belly']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'bro_fa2_visit': serializer.toJson<int>(broFa2VisitId),
      'order': serializer.toJson<int>(order),
      'is_chk_reflex': serializer.toJson<bool>(isChkReflex),
      'is_chk_navel': serializer.toJson<bool>(isChkNavel),
      'is_chk_legs': serializer.toJson<bool>(isChkLegs),
      'is_chk_beak': serializer.toJson<bool>(isChkBeak),
      'is_chk_belly': serializer.toJson<bool>(isChkBelly),
    };
  }

  BroFa2VisitPasgar copyWith(
          {int? id,
          int? broFa2VisitId,
          int? order,
          bool? isChkReflex,
          bool? isChkNavel,
          bool? isChkLegs,
          bool? isChkBeak,
          bool? isChkBelly}) =>
      BroFa2VisitPasgar(
        id: id ?? this.id,
        broFa2VisitId: broFa2VisitId ?? this.broFa2VisitId,
        order: order ?? this.order,
        isChkReflex: isChkReflex ?? this.isChkReflex,
        isChkNavel: isChkNavel ?? this.isChkNavel,
        isChkLegs: isChkLegs ?? this.isChkLegs,
        isChkBeak: isChkBeak ?? this.isChkBeak,
        isChkBelly: isChkBelly ?? this.isChkBelly,
      );
  @override
  String toString() {
    return (StringBuffer('BroFa2VisitPasgar(')
          ..write('id: $id, ')
          ..write('broFa2VisitId: $broFa2VisitId, ')
          ..write('order: $order, ')
          ..write('isChkReflex: $isChkReflex, ')
          ..write('isChkNavel: $isChkNavel, ')
          ..write('isChkLegs: $isChkLegs, ')
          ..write('isChkBeak: $isChkBeak, ')
          ..write('isChkBelly: $isChkBelly')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      id.hashCode,
      $mrjc(
          broFa2VisitId.hashCode,
          $mrjc(
              order.hashCode,
              $mrjc(
                  isChkReflex.hashCode,
                  $mrjc(
                      isChkNavel.hashCode,
                      $mrjc(isChkLegs.hashCode,
                          $mrjc(isChkBeak.hashCode, isChkBelly.hashCode))))))));
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is BroFa2VisitPasgar &&
          other.id == this.id &&
          other.broFa2VisitId == this.broFa2VisitId &&
          other.order == this.order &&
          other.isChkReflex == this.isChkReflex &&
          other.isChkNavel == this.isChkNavel &&
          other.isChkLegs == this.isChkLegs &&
          other.isChkBeak == this.isChkBeak &&
          other.isChkBelly == this.isChkBelly);
}

class BroFa2VisitPasgarTbCompanion extends UpdateCompanion<BroFa2VisitPasgar> {
  final Value<int> id;
  final Value<int> broFa2VisitId;
  final Value<int> order;
  final Value<bool> isChkReflex;
  final Value<bool> isChkNavel;
  final Value<bool> isChkLegs;
  final Value<bool> isChkBeak;
  final Value<bool> isChkBelly;
  const BroFa2VisitPasgarTbCompanion({
    this.id = const Value.absent(),
    this.broFa2VisitId = const Value.absent(),
    this.order = const Value.absent(),
    this.isChkReflex = const Value.absent(),
    this.isChkNavel = const Value.absent(),
    this.isChkLegs = const Value.absent(),
    this.isChkBeak = const Value.absent(),
    this.isChkBelly = const Value.absent(),
  });
  BroFa2VisitPasgarTbCompanion.insert({
    this.id = const Value.absent(),
    required int broFa2VisitId,
    required int order,
    this.isChkReflex = const Value.absent(),
    this.isChkNavel = const Value.absent(),
    this.isChkLegs = const Value.absent(),
    this.isChkBeak = const Value.absent(),
    this.isChkBelly = const Value.absent(),
  })  : broFa2VisitId = Value(broFa2VisitId),
        order = Value(order);
  static Insertable<BroFa2VisitPasgar> custom({
    Expression<int>? id,
    Expression<int>? broFa2VisitId,
    Expression<int>? order,
    Expression<bool>? isChkReflex,
    Expression<bool>? isChkNavel,
    Expression<bool>? isChkLegs,
    Expression<bool>? isChkBeak,
    Expression<bool>? isChkBelly,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (broFa2VisitId != null) 'bro_fa2_visit_id': broFa2VisitId,
      if (order != null) 'order': order,
      if (isChkReflex != null) 'is_chk_reflex': isChkReflex,
      if (isChkNavel != null) 'is_chk_navel': isChkNavel,
      if (isChkLegs != null) 'is_chk_legs': isChkLegs,
      if (isChkBeak != null) 'is_chk_beak': isChkBeak,
      if (isChkBelly != null) 'is_chk_belly': isChkBelly,
    });
  }

  BroFa2VisitPasgarTbCompanion copyWith(
      {Value<int>? id,
      Value<int>? broFa2VisitId,
      Value<int>? order,
      Value<bool>? isChkReflex,
      Value<bool>? isChkNavel,
      Value<bool>? isChkLegs,
      Value<bool>? isChkBeak,
      Value<bool>? isChkBelly}) {
    return BroFa2VisitPasgarTbCompanion(
      id: id ?? this.id,
      broFa2VisitId: broFa2VisitId ?? this.broFa2VisitId,
      order: order ?? this.order,
      isChkReflex: isChkReflex ?? this.isChkReflex,
      isChkNavel: isChkNavel ?? this.isChkNavel,
      isChkLegs: isChkLegs ?? this.isChkLegs,
      isChkBeak: isChkBeak ?? this.isChkBeak,
      isChkBelly: isChkBelly ?? this.isChkBelly,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (broFa2VisitId.present) {
      map['bro_fa2_visit_id'] = Variable<int>(broFa2VisitId.value);
    }
    if (order.present) {
      map['order'] = Variable<int>(order.value);
    }
    if (isChkReflex.present) {
      map['is_chk_reflex'] = Variable<bool>(isChkReflex.value);
    }
    if (isChkNavel.present) {
      map['is_chk_navel'] = Variable<bool>(isChkNavel.value);
    }
    if (isChkLegs.present) {
      map['is_chk_legs'] = Variable<bool>(isChkLegs.value);
    }
    if (isChkBeak.present) {
      map['is_chk_beak'] = Variable<bool>(isChkBeak.value);
    }
    if (isChkBelly.present) {
      map['is_chk_belly'] = Variable<bool>(isChkBelly.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('BroFa2VisitPasgarTbCompanion(')
          ..write('id: $id, ')
          ..write('broFa2VisitId: $broFa2VisitId, ')
          ..write('order: $order, ')
          ..write('isChkReflex: $isChkReflex, ')
          ..write('isChkNavel: $isChkNavel, ')
          ..write('isChkLegs: $isChkLegs, ')
          ..write('isChkBeak: $isChkBeak, ')
          ..write('isChkBelly: $isChkBelly')
          ..write(')'))
        .toString();
  }
}

class $BroFa2VisitPasgarTbTable extends BroFa2VisitPasgarTb
    with TableInfo<$BroFa2VisitPasgarTbTable, BroFa2VisitPasgar> {
  final GeneratedDatabase _db;
  final String? _alias;
  $BroFa2VisitPasgarTbTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  late final GeneratedColumn<int?> id = GeneratedColumn<int?>(
      'id', aliasedName, false,
      typeName: 'INTEGER',
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _broFa2VisitIdMeta =
      const VerificationMeta('broFa2VisitId');
  late final GeneratedColumn<int?> broFa2VisitId = GeneratedColumn<int?>(
      'bro_fa2_visit_id', aliasedName, false,
      typeName: 'INTEGER', requiredDuringInsert: true);
  final VerificationMeta _orderMeta = const VerificationMeta('order');
  late final GeneratedColumn<int?> order = GeneratedColumn<int?>(
      'order', aliasedName, false,
      typeName: 'INTEGER', requiredDuringInsert: true);
  final VerificationMeta _isChkReflexMeta =
      const VerificationMeta('isChkReflex');
  late final GeneratedColumn<bool?> isChkReflex = GeneratedColumn<bool?>(
      'is_chk_reflex', aliasedName, false,
      typeName: 'INTEGER',
      requiredDuringInsert: false,
      defaultConstraints: 'CHECK (is_chk_reflex IN (0, 1))',
      defaultValue: const Constant(false));
  final VerificationMeta _isChkNavelMeta = const VerificationMeta('isChkNavel');
  late final GeneratedColumn<bool?> isChkNavel = GeneratedColumn<bool?>(
      'is_chk_navel', aliasedName, false,
      typeName: 'INTEGER',
      requiredDuringInsert: false,
      defaultConstraints: 'CHECK (is_chk_navel IN (0, 1))',
      defaultValue: const Constant(false));
  final VerificationMeta _isChkLegsMeta = const VerificationMeta('isChkLegs');
  late final GeneratedColumn<bool?> isChkLegs = GeneratedColumn<bool?>(
      'is_chk_legs', aliasedName, false,
      typeName: 'INTEGER',
      requiredDuringInsert: false,
      defaultConstraints: 'CHECK (is_chk_legs IN (0, 1))',
      defaultValue: const Constant(false));
  final VerificationMeta _isChkBeakMeta = const VerificationMeta('isChkBeak');
  late final GeneratedColumn<bool?> isChkBeak = GeneratedColumn<bool?>(
      'is_chk_beak', aliasedName, false,
      typeName: 'INTEGER',
      requiredDuringInsert: false,
      defaultConstraints: 'CHECK (is_chk_beak IN (0, 1))',
      defaultValue: const Constant(false));
  final VerificationMeta _isChkBellyMeta = const VerificationMeta('isChkBelly');
  late final GeneratedColumn<bool?> isChkBelly = GeneratedColumn<bool?>(
      'is_chk_belly', aliasedName, false,
      typeName: 'INTEGER',
      requiredDuringInsert: false,
      defaultConstraints: 'CHECK (is_chk_belly IN (0, 1))',
      defaultValue: const Constant(false));
  @override
  List<GeneratedColumn> get $columns => [
        id,
        broFa2VisitId,
        order,
        isChkReflex,
        isChkNavel,
        isChkLegs,
        isChkBeak,
        isChkBelly
      ];
  @override
  String get aliasedName => _alias ?? 'bro_fa2_visit_pasgar';
  @override
  String get actualTableName => 'bro_fa2_visit_pasgar';
  @override
  VerificationContext validateIntegrity(Insertable<BroFa2VisitPasgar> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('bro_fa2_visit_id')) {
      context.handle(
          _broFa2VisitIdMeta,
          broFa2VisitId.isAcceptableOrUnknown(
              data['bro_fa2_visit_id']!, _broFa2VisitIdMeta));
    } else if (isInserting) {
      context.missing(_broFa2VisitIdMeta);
    }
    if (data.containsKey('order')) {
      context.handle(
          _orderMeta, order.isAcceptableOrUnknown(data['order']!, _orderMeta));
    } else if (isInserting) {
      context.missing(_orderMeta);
    }
    if (data.containsKey('is_chk_reflex')) {
      context.handle(
          _isChkReflexMeta,
          isChkReflex.isAcceptableOrUnknown(
              data['is_chk_reflex']!, _isChkReflexMeta));
    }
    if (data.containsKey('is_chk_navel')) {
      context.handle(
          _isChkNavelMeta,
          isChkNavel.isAcceptableOrUnknown(
              data['is_chk_navel']!, _isChkNavelMeta));
    }
    if (data.containsKey('is_chk_legs')) {
      context.handle(
          _isChkLegsMeta,
          isChkLegs.isAcceptableOrUnknown(
              data['is_chk_legs']!, _isChkLegsMeta));
    }
    if (data.containsKey('is_chk_beak')) {
      context.handle(
          _isChkBeakMeta,
          isChkBeak.isAcceptableOrUnknown(
              data['is_chk_beak']!, _isChkBeakMeta));
    }
    if (data.containsKey('is_chk_belly')) {
      context.handle(
          _isChkBellyMeta,
          isChkBelly.isAcceptableOrUnknown(
              data['is_chk_belly']!, _isChkBellyMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  BroFa2VisitPasgar map(Map<String, dynamic> data, {String? tablePrefix}) {
    return BroFa2VisitPasgar.fromData(data, _db,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $BroFa2VisitPasgarTbTable createAlias(String alias) {
    return $BroFa2VisitPasgarTbTable(_db, alias);
  }
}

class BroFa2VisitMa extends DataClass implements Insertable<BroFa2VisitMa> {
  final int id;
  final int broFa2VisitId;
  final int broFa2MaId;
  final String comment;
  final String action;
  final String remark;
  BroFa2VisitMa(
      {required this.id,
      required this.broFa2VisitId,
      required this.broFa2MaId,
      required this.comment,
      required this.action,
      required this.remark});
  factory BroFa2VisitMa.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return BroFa2VisitMa(
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      broFa2VisitId: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}bro_fa2_visit_id'])!,
      broFa2MaId: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}bro_fa2_ma_id'])!,
      comment: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}comment'])!,
      action: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}action'])!,
      remark: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}remark'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['bro_fa2_visit_id'] = Variable<int>(broFa2VisitId);
    map['bro_fa2_ma_id'] = Variable<int>(broFa2MaId);
    map['comment'] = Variable<String>(comment);
    map['action'] = Variable<String>(action);
    map['remark'] = Variable<String>(remark);
    return map;
  }

  BroFa2VisitMaTbCompanion toCompanion(bool nullToAbsent) {
    return BroFa2VisitMaTbCompanion(
      id: Value(id),
      broFa2VisitId: Value(broFa2VisitId),
      broFa2MaId: Value(broFa2MaId),
      comment: Value(comment),
      action: Value(action),
      remark: Value(remark),
    );
  }

  factory BroFa2VisitMa.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return BroFa2VisitMa(
      id: serializer.fromJson<int>(json['id']),
      broFa2VisitId: serializer.fromJson<int>(json['bro_fa2_visit']),
      broFa2MaId: serializer.fromJson<int>(json['bro_fa2_ma']),
      comment: serializer.fromJson<String>(json['comment']),
      action: serializer.fromJson<String>(json['action']),
      remark: serializer.fromJson<String>(json['remark']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'bro_fa2_visit': serializer.toJson<int>(broFa2VisitId),
      'bro_fa2_ma': serializer.toJson<int>(broFa2MaId),
      'comment': serializer.toJson<String>(comment),
      'action': serializer.toJson<String>(action),
      'remark': serializer.toJson<String>(remark),
    };
  }

  BroFa2VisitMa copyWith(
          {int? id,
          int? broFa2VisitId,
          int? broFa2MaId,
          String? comment,
          String? action,
          String? remark}) =>
      BroFa2VisitMa(
        id: id ?? this.id,
        broFa2VisitId: broFa2VisitId ?? this.broFa2VisitId,
        broFa2MaId: broFa2MaId ?? this.broFa2MaId,
        comment: comment ?? this.comment,
        action: action ?? this.action,
        remark: remark ?? this.remark,
      );
  @override
  String toString() {
    return (StringBuffer('BroFa2VisitMa(')
          ..write('id: $id, ')
          ..write('broFa2VisitId: $broFa2VisitId, ')
          ..write('broFa2MaId: $broFa2MaId, ')
          ..write('comment: $comment, ')
          ..write('action: $action, ')
          ..write('remark: $remark')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      id.hashCode,
      $mrjc(
          broFa2VisitId.hashCode,
          $mrjc(
              broFa2MaId.hashCode,
              $mrjc(comment.hashCode,
                  $mrjc(action.hashCode, remark.hashCode))))));
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is BroFa2VisitMa &&
          other.id == this.id &&
          other.broFa2VisitId == this.broFa2VisitId &&
          other.broFa2MaId == this.broFa2MaId &&
          other.comment == this.comment &&
          other.action == this.action &&
          other.remark == this.remark);
}

class BroFa2VisitMaTbCompanion extends UpdateCompanion<BroFa2VisitMa> {
  final Value<int> id;
  final Value<int> broFa2VisitId;
  final Value<int> broFa2MaId;
  final Value<String> comment;
  final Value<String> action;
  final Value<String> remark;
  const BroFa2VisitMaTbCompanion({
    this.id = const Value.absent(),
    this.broFa2VisitId = const Value.absent(),
    this.broFa2MaId = const Value.absent(),
    this.comment = const Value.absent(),
    this.action = const Value.absent(),
    this.remark = const Value.absent(),
  });
  BroFa2VisitMaTbCompanion.insert({
    this.id = const Value.absent(),
    required int broFa2VisitId,
    required int broFa2MaId,
    required String comment,
    required String action,
    required String remark,
  })  : broFa2VisitId = Value(broFa2VisitId),
        broFa2MaId = Value(broFa2MaId),
        comment = Value(comment),
        action = Value(action),
        remark = Value(remark);
  static Insertable<BroFa2VisitMa> custom({
    Expression<int>? id,
    Expression<int>? broFa2VisitId,
    Expression<int>? broFa2MaId,
    Expression<String>? comment,
    Expression<String>? action,
    Expression<String>? remark,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (broFa2VisitId != null) 'bro_fa2_visit_id': broFa2VisitId,
      if (broFa2MaId != null) 'bro_fa2_ma_id': broFa2MaId,
      if (comment != null) 'comment': comment,
      if (action != null) 'action': action,
      if (remark != null) 'remark': remark,
    });
  }

  BroFa2VisitMaTbCompanion copyWith(
      {Value<int>? id,
      Value<int>? broFa2VisitId,
      Value<int>? broFa2MaId,
      Value<String>? comment,
      Value<String>? action,
      Value<String>? remark}) {
    return BroFa2VisitMaTbCompanion(
      id: id ?? this.id,
      broFa2VisitId: broFa2VisitId ?? this.broFa2VisitId,
      broFa2MaId: broFa2MaId ?? this.broFa2MaId,
      comment: comment ?? this.comment,
      action: action ?? this.action,
      remark: remark ?? this.remark,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (broFa2VisitId.present) {
      map['bro_fa2_visit_id'] = Variable<int>(broFa2VisitId.value);
    }
    if (broFa2MaId.present) {
      map['bro_fa2_ma_id'] = Variable<int>(broFa2MaId.value);
    }
    if (comment.present) {
      map['comment'] = Variable<String>(comment.value);
    }
    if (action.present) {
      map['action'] = Variable<String>(action.value);
    }
    if (remark.present) {
      map['remark'] = Variable<String>(remark.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('BroFa2VisitMaTbCompanion(')
          ..write('id: $id, ')
          ..write('broFa2VisitId: $broFa2VisitId, ')
          ..write('broFa2MaId: $broFa2MaId, ')
          ..write('comment: $comment, ')
          ..write('action: $action, ')
          ..write('remark: $remark')
          ..write(')'))
        .toString();
  }
}

class $BroFa2VisitMaTbTable extends BroFa2VisitMaTb
    with TableInfo<$BroFa2VisitMaTbTable, BroFa2VisitMa> {
  final GeneratedDatabase _db;
  final String? _alias;
  $BroFa2VisitMaTbTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  late final GeneratedColumn<int?> id = GeneratedColumn<int?>(
      'id', aliasedName, false,
      typeName: 'INTEGER',
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _broFa2VisitIdMeta =
      const VerificationMeta('broFa2VisitId');
  late final GeneratedColumn<int?> broFa2VisitId = GeneratedColumn<int?>(
      'bro_fa2_visit_id', aliasedName, false,
      typeName: 'INTEGER', requiredDuringInsert: true);
  final VerificationMeta _broFa2MaIdMeta = const VerificationMeta('broFa2MaId');
  late final GeneratedColumn<int?> broFa2MaId = GeneratedColumn<int?>(
      'bro_fa2_ma_id', aliasedName, false,
      typeName: 'INTEGER', requiredDuringInsert: true);
  final VerificationMeta _commentMeta = const VerificationMeta('comment');
  late final GeneratedColumn<String?> comment = GeneratedColumn<String?>(
      'comment', aliasedName, false,
      typeName: 'TEXT', requiredDuringInsert: true);
  final VerificationMeta _actionMeta = const VerificationMeta('action');
  late final GeneratedColumn<String?> action = GeneratedColumn<String?>(
      'action', aliasedName, false,
      typeName: 'TEXT', requiredDuringInsert: true);
  final VerificationMeta _remarkMeta = const VerificationMeta('remark');
  late final GeneratedColumn<String?> remark = GeneratedColumn<String?>(
      'remark', aliasedName, false,
      typeName: 'TEXT', requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [id, broFa2VisitId, broFa2MaId, comment, action, remark];
  @override
  String get aliasedName => _alias ?? 'bro_fa2_visit_ma';
  @override
  String get actualTableName => 'bro_fa2_visit_ma';
  @override
  VerificationContext validateIntegrity(Insertable<BroFa2VisitMa> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('bro_fa2_visit_id')) {
      context.handle(
          _broFa2VisitIdMeta,
          broFa2VisitId.isAcceptableOrUnknown(
              data['bro_fa2_visit_id']!, _broFa2VisitIdMeta));
    } else if (isInserting) {
      context.missing(_broFa2VisitIdMeta);
    }
    if (data.containsKey('bro_fa2_ma_id')) {
      context.handle(
          _broFa2MaIdMeta,
          broFa2MaId.isAcceptableOrUnknown(
              data['bro_fa2_ma_id']!, _broFa2MaIdMeta));
    } else if (isInserting) {
      context.missing(_broFa2MaIdMeta);
    }
    if (data.containsKey('comment')) {
      context.handle(_commentMeta,
          comment.isAcceptableOrUnknown(data['comment']!, _commentMeta));
    } else if (isInserting) {
      context.missing(_commentMeta);
    }
    if (data.containsKey('action')) {
      context.handle(_actionMeta,
          action.isAcceptableOrUnknown(data['action']!, _actionMeta));
    } else if (isInserting) {
      context.missing(_actionMeta);
    }
    if (data.containsKey('remark')) {
      context.handle(_remarkMeta,
          remark.isAcceptableOrUnknown(data['remark']!, _remarkMeta));
    } else if (isInserting) {
      context.missing(_remarkMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  BroFa2VisitMa map(Map<String, dynamic> data, {String? tablePrefix}) {
    return BroFa2VisitMa.fromData(data, _db,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $BroFa2VisitMaTbTable createAlias(String alias) {
    return $BroFa2VisitMaTbTable(_db, alias);
  }
}

class BroFa2VisitMaImg extends DataClass
    implements Insertable<BroFa2VisitMaImg> {
  final int id;
  final int broFa2VisitMaId;
  final String path;

  /// This field is use to store the id of picture upload,
  /// after that upload to server by using this id
  final int? serverId;
  BroFa2VisitMaImg(
      {required this.id,
      required this.broFa2VisitMaId,
      required this.path,
      this.serverId});
  factory BroFa2VisitMaImg.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return BroFa2VisitMaImg(
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      broFa2VisitMaId: const IntType().mapFromDatabaseResponse(
          data['${effectivePrefix}bro_fa2_visit_ma_id'])!,
      path: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}path'])!,
      serverId: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}server_id']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['bro_fa2_visit_ma_id'] = Variable<int>(broFa2VisitMaId);
    map['path'] = Variable<String>(path);
    if (!nullToAbsent || serverId != null) {
      map['server_id'] = Variable<int?>(serverId);
    }
    return map;
  }

  BroFa2VisitMaImgTbCompanion toCompanion(bool nullToAbsent) {
    return BroFa2VisitMaImgTbCompanion(
      id: Value(id),
      broFa2VisitMaId: Value(broFa2VisitMaId),
      path: Value(path),
      serverId: serverId == null && nullToAbsent
          ? const Value.absent()
          : Value(serverId),
    );
  }

  factory BroFa2VisitMaImg.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return BroFa2VisitMaImg(
      id: serializer.fromJson<int>(json['id']),
      broFa2VisitMaId: serializer.fromJson<int>(json['bro_fa2_visit_ma']),
      path: serializer.fromJson<String>(json['path']),
      serverId: serializer.fromJson<int?>(json['bro_fa2_visit_img_path']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'bro_fa2_visit_ma': serializer.toJson<int>(broFa2VisitMaId),
      'path': serializer.toJson<String>(path),
      'bro_fa2_visit_img_path': serializer.toJson<int?>(serverId),
    };
  }

  BroFa2VisitMaImg copyWith(
          {int? id, int? broFa2VisitMaId, String? path, int? serverId}) =>
      BroFa2VisitMaImg(
        id: id ?? this.id,
        broFa2VisitMaId: broFa2VisitMaId ?? this.broFa2VisitMaId,
        path: path ?? this.path,
        serverId: serverId ?? this.serverId,
      );
  @override
  String toString() {
    return (StringBuffer('BroFa2VisitMaImg(')
          ..write('id: $id, ')
          ..write('broFa2VisitMaId: $broFa2VisitMaId, ')
          ..write('path: $path, ')
          ..write('serverId: $serverId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      id.hashCode,
      $mrjc(
          broFa2VisitMaId.hashCode, $mrjc(path.hashCode, serverId.hashCode))));
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is BroFa2VisitMaImg &&
          other.id == this.id &&
          other.broFa2VisitMaId == this.broFa2VisitMaId &&
          other.path == this.path &&
          other.serverId == this.serverId);
}

class BroFa2VisitMaImgTbCompanion extends UpdateCompanion<BroFa2VisitMaImg> {
  final Value<int> id;
  final Value<int> broFa2VisitMaId;
  final Value<String> path;
  final Value<int?> serverId;
  const BroFa2VisitMaImgTbCompanion({
    this.id = const Value.absent(),
    this.broFa2VisitMaId = const Value.absent(),
    this.path = const Value.absent(),
    this.serverId = const Value.absent(),
  });
  BroFa2VisitMaImgTbCompanion.insert({
    this.id = const Value.absent(),
    required int broFa2VisitMaId,
    required String path,
    this.serverId = const Value.absent(),
  })  : broFa2VisitMaId = Value(broFa2VisitMaId),
        path = Value(path);
  static Insertable<BroFa2VisitMaImg> custom({
    Expression<int>? id,
    Expression<int>? broFa2VisitMaId,
    Expression<String>? path,
    Expression<int?>? serverId,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (broFa2VisitMaId != null) 'bro_fa2_visit_ma_id': broFa2VisitMaId,
      if (path != null) 'path': path,
      if (serverId != null) 'server_id': serverId,
    });
  }

  BroFa2VisitMaImgTbCompanion copyWith(
      {Value<int>? id,
      Value<int>? broFa2VisitMaId,
      Value<String>? path,
      Value<int?>? serverId}) {
    return BroFa2VisitMaImgTbCompanion(
      id: id ?? this.id,
      broFa2VisitMaId: broFa2VisitMaId ?? this.broFa2VisitMaId,
      path: path ?? this.path,
      serverId: serverId ?? this.serverId,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (broFa2VisitMaId.present) {
      map['bro_fa2_visit_ma_id'] = Variable<int>(broFa2VisitMaId.value);
    }
    if (path.present) {
      map['path'] = Variable<String>(path.value);
    }
    if (serverId.present) {
      map['server_id'] = Variable<int?>(serverId.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('BroFa2VisitMaImgTbCompanion(')
          ..write('id: $id, ')
          ..write('broFa2VisitMaId: $broFa2VisitMaId, ')
          ..write('path: $path, ')
          ..write('serverId: $serverId')
          ..write(')'))
        .toString();
  }
}

class $BroFa2VisitMaImgTbTable extends BroFa2VisitMaImgTb
    with TableInfo<$BroFa2VisitMaImgTbTable, BroFa2VisitMaImg> {
  final GeneratedDatabase _db;
  final String? _alias;
  $BroFa2VisitMaImgTbTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  late final GeneratedColumn<int?> id = GeneratedColumn<int?>(
      'id', aliasedName, false,
      typeName: 'INTEGER',
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _broFa2VisitMaIdMeta =
      const VerificationMeta('broFa2VisitMaId');
  late final GeneratedColumn<int?> broFa2VisitMaId = GeneratedColumn<int?>(
      'bro_fa2_visit_ma_id', aliasedName, false,
      typeName: 'INTEGER', requiredDuringInsert: true);
  final VerificationMeta _pathMeta = const VerificationMeta('path');
  late final GeneratedColumn<String?> path = GeneratedColumn<String?>(
      'path', aliasedName, false,
      typeName: 'TEXT', requiredDuringInsert: true);
  final VerificationMeta _serverIdMeta = const VerificationMeta('serverId');
  late final GeneratedColumn<int?> serverId = GeneratedColumn<int?>(
      'server_id', aliasedName, true,
      typeName: 'INTEGER', requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [id, broFa2VisitMaId, path, serverId];
  @override
  String get aliasedName => _alias ?? 'bro_fa2_visit_ma_img';
  @override
  String get actualTableName => 'bro_fa2_visit_ma_img';
  @override
  VerificationContext validateIntegrity(Insertable<BroFa2VisitMaImg> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('bro_fa2_visit_ma_id')) {
      context.handle(
          _broFa2VisitMaIdMeta,
          broFa2VisitMaId.isAcceptableOrUnknown(
              data['bro_fa2_visit_ma_id']!, _broFa2VisitMaIdMeta));
    } else if (isInserting) {
      context.missing(_broFa2VisitMaIdMeta);
    }
    if (data.containsKey('path')) {
      context.handle(
          _pathMeta, path.isAcceptableOrUnknown(data['path']!, _pathMeta));
    } else if (isInserting) {
      context.missing(_pathMeta);
    }
    if (data.containsKey('server_id')) {
      context.handle(_serverIdMeta,
          serverId.isAcceptableOrUnknown(data['server_id']!, _serverIdMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  BroFa2VisitMaImg map(Map<String, dynamic> data, {String? tablePrefix}) {
    return BroFa2VisitMaImg.fromData(data, _db,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $BroFa2VisitMaImgTbTable createAlias(String alias) {
    return $BroFa2VisitMaImgTbTable(_db, alias);
  }
}

class BroFa2VisitWeight extends DataClass
    implements Insertable<BroFa2VisitWeight> {
  final int id;
  final int broFa2VisitId;
  final int section;
  final int weight;
  final int qty;
  final String gender;
  BroFa2VisitWeight(
      {required this.id,
      required this.broFa2VisitId,
      required this.section,
      required this.weight,
      required this.qty,
      required this.gender});
  factory BroFa2VisitWeight.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return BroFa2VisitWeight(
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      broFa2VisitId: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}bro_fa2_visit_id'])!,
      section: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}section'])!,
      weight: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}weight'])!,
      qty: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}qty'])!,
      gender: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}gender'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['bro_fa2_visit_id'] = Variable<int>(broFa2VisitId);
    map['section'] = Variable<int>(section);
    map['weight'] = Variable<int>(weight);
    map['qty'] = Variable<int>(qty);
    map['gender'] = Variable<String>(gender);
    return map;
  }

  BroFa2VisitWeightTbCompanion toCompanion(bool nullToAbsent) {
    return BroFa2VisitWeightTbCompanion(
      id: Value(id),
      broFa2VisitId: Value(broFa2VisitId),
      section: Value(section),
      weight: Value(weight),
      qty: Value(qty),
      gender: Value(gender),
    );
  }

  factory BroFa2VisitWeight.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return BroFa2VisitWeight(
      id: serializer.fromJson<int>(json['id']),
      broFa2VisitId: serializer.fromJson<int>(json['bro_fa2_visit']),
      section: serializer.fromJson<int>(json['section']),
      weight: serializer.fromJson<int>(json['weight']),
      qty: serializer.fromJson<int>(json['qty']),
      gender: serializer.fromJson<String>(json['gender']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'bro_fa2_visit': serializer.toJson<int>(broFa2VisitId),
      'section': serializer.toJson<int>(section),
      'weight': serializer.toJson<int>(weight),
      'qty': serializer.toJson<int>(qty),
      'gender': serializer.toJson<String>(gender),
    };
  }

  BroFa2VisitWeight copyWith(
          {int? id,
          int? broFa2VisitId,
          int? section,
          int? weight,
          int? qty,
          String? gender}) =>
      BroFa2VisitWeight(
        id: id ?? this.id,
        broFa2VisitId: broFa2VisitId ?? this.broFa2VisitId,
        section: section ?? this.section,
        weight: weight ?? this.weight,
        qty: qty ?? this.qty,
        gender: gender ?? this.gender,
      );
  @override
  String toString() {
    return (StringBuffer('BroFa2VisitWeight(')
          ..write('id: $id, ')
          ..write('broFa2VisitId: $broFa2VisitId, ')
          ..write('section: $section, ')
          ..write('weight: $weight, ')
          ..write('qty: $qty, ')
          ..write('gender: $gender')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      id.hashCode,
      $mrjc(
          broFa2VisitId.hashCode,
          $mrjc(section.hashCode,
              $mrjc(weight.hashCode, $mrjc(qty.hashCode, gender.hashCode))))));
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is BroFa2VisitWeight &&
          other.id == this.id &&
          other.broFa2VisitId == this.broFa2VisitId &&
          other.section == this.section &&
          other.weight == this.weight &&
          other.qty == this.qty &&
          other.gender == this.gender);
}

class BroFa2VisitWeightTbCompanion extends UpdateCompanion<BroFa2VisitWeight> {
  final Value<int> id;
  final Value<int> broFa2VisitId;
  final Value<int> section;
  final Value<int> weight;
  final Value<int> qty;
  final Value<String> gender;
  const BroFa2VisitWeightTbCompanion({
    this.id = const Value.absent(),
    this.broFa2VisitId = const Value.absent(),
    this.section = const Value.absent(),
    this.weight = const Value.absent(),
    this.qty = const Value.absent(),
    this.gender = const Value.absent(),
  });
  BroFa2VisitWeightTbCompanion.insert({
    this.id = const Value.absent(),
    required int broFa2VisitId,
    required int section,
    required int weight,
    required int qty,
    required String gender,
  })  : broFa2VisitId = Value(broFa2VisitId),
        section = Value(section),
        weight = Value(weight),
        qty = Value(qty),
        gender = Value(gender);
  static Insertable<BroFa2VisitWeight> custom({
    Expression<int>? id,
    Expression<int>? broFa2VisitId,
    Expression<int>? section,
    Expression<int>? weight,
    Expression<int>? qty,
    Expression<String>? gender,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (broFa2VisitId != null) 'bro_fa2_visit_id': broFa2VisitId,
      if (section != null) 'section': section,
      if (weight != null) 'weight': weight,
      if (qty != null) 'qty': qty,
      if (gender != null) 'gender': gender,
    });
  }

  BroFa2VisitWeightTbCompanion copyWith(
      {Value<int>? id,
      Value<int>? broFa2VisitId,
      Value<int>? section,
      Value<int>? weight,
      Value<int>? qty,
      Value<String>? gender}) {
    return BroFa2VisitWeightTbCompanion(
      id: id ?? this.id,
      broFa2VisitId: broFa2VisitId ?? this.broFa2VisitId,
      section: section ?? this.section,
      weight: weight ?? this.weight,
      qty: qty ?? this.qty,
      gender: gender ?? this.gender,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (broFa2VisitId.present) {
      map['bro_fa2_visit_id'] = Variable<int>(broFa2VisitId.value);
    }
    if (section.present) {
      map['section'] = Variable<int>(section.value);
    }
    if (weight.present) {
      map['weight'] = Variable<int>(weight.value);
    }
    if (qty.present) {
      map['qty'] = Variable<int>(qty.value);
    }
    if (gender.present) {
      map['gender'] = Variable<String>(gender.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('BroFa2VisitWeightTbCompanion(')
          ..write('id: $id, ')
          ..write('broFa2VisitId: $broFa2VisitId, ')
          ..write('section: $section, ')
          ..write('weight: $weight, ')
          ..write('qty: $qty, ')
          ..write('gender: $gender')
          ..write(')'))
        .toString();
  }
}

class $BroFa2VisitWeightTbTable extends BroFa2VisitWeightTb
    with TableInfo<$BroFa2VisitWeightTbTable, BroFa2VisitWeight> {
  final GeneratedDatabase _db;
  final String? _alias;
  $BroFa2VisitWeightTbTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  late final GeneratedColumn<int?> id = GeneratedColumn<int?>(
      'id', aliasedName, false,
      typeName: 'INTEGER',
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _broFa2VisitIdMeta =
      const VerificationMeta('broFa2VisitId');
  late final GeneratedColumn<int?> broFa2VisitId = GeneratedColumn<int?>(
      'bro_fa2_visit_id', aliasedName, false,
      typeName: 'INTEGER', requiredDuringInsert: true);
  final VerificationMeta _sectionMeta = const VerificationMeta('section');
  late final GeneratedColumn<int?> section = GeneratedColumn<int?>(
      'section', aliasedName, false,
      typeName: 'INTEGER', requiredDuringInsert: true);
  final VerificationMeta _weightMeta = const VerificationMeta('weight');
  late final GeneratedColumn<int?> weight = GeneratedColumn<int?>(
      'weight', aliasedName, false,
      typeName: 'INTEGER', requiredDuringInsert: true);
  final VerificationMeta _qtyMeta = const VerificationMeta('qty');
  late final GeneratedColumn<int?> qty = GeneratedColumn<int?>(
      'qty', aliasedName, false,
      typeName: 'INTEGER', requiredDuringInsert: true);
  final VerificationMeta _genderMeta = const VerificationMeta('gender');
  late final GeneratedColumn<String?> gender = GeneratedColumn<String?>(
      'gender', aliasedName, false,
      typeName: 'TEXT', requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [id, broFa2VisitId, section, weight, qty, gender];
  @override
  String get aliasedName => _alias ?? 'bro_fa2_visit_weight';
  @override
  String get actualTableName => 'bro_fa2_visit_weight';
  @override
  VerificationContext validateIntegrity(Insertable<BroFa2VisitWeight> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('bro_fa2_visit_id')) {
      context.handle(
          _broFa2VisitIdMeta,
          broFa2VisitId.isAcceptableOrUnknown(
              data['bro_fa2_visit_id']!, _broFa2VisitIdMeta));
    } else if (isInserting) {
      context.missing(_broFa2VisitIdMeta);
    }
    if (data.containsKey('section')) {
      context.handle(_sectionMeta,
          section.isAcceptableOrUnknown(data['section']!, _sectionMeta));
    } else if (isInserting) {
      context.missing(_sectionMeta);
    }
    if (data.containsKey('weight')) {
      context.handle(_weightMeta,
          weight.isAcceptableOrUnknown(data['weight']!, _weightMeta));
    } else if (isInserting) {
      context.missing(_weightMeta);
    }
    if (data.containsKey('qty')) {
      context.handle(
          _qtyMeta, qty.isAcceptableOrUnknown(data['qty']!, _qtyMeta));
    } else if (isInserting) {
      context.missing(_qtyMeta);
    }
    if (data.containsKey('gender')) {
      context.handle(_genderMeta,
          gender.isAcceptableOrUnknown(data['gender']!, _genderMeta));
    } else if (isInserting) {
      context.missing(_genderMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  BroFa2VisitWeight map(Map<String, dynamic> data, {String? tablePrefix}) {
    return BroFa2VisitWeight.fromData(data, _db,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $BroFa2VisitWeightTbTable createAlias(String alias) {
    return $BroFa2VisitWeightTbTable(_db, alias);
  }
}

class BroFa2VisitRoutine extends DataClass
    implements Insertable<BroFa2VisitRoutine> {
  final int id;
  final int broFa2VisitId;
  final int broFa2RoutineId;
  final String comment;
  final String action;
  final String remark;
  BroFa2VisitRoutine(
      {required this.id,
      required this.broFa2VisitId,
      required this.broFa2RoutineId,
      required this.comment,
      required this.action,
      required this.remark});
  factory BroFa2VisitRoutine.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return BroFa2VisitRoutine(
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      broFa2VisitId: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}bro_fa2_visit_id'])!,
      broFa2RoutineId: const IntType().mapFromDatabaseResponse(
          data['${effectivePrefix}bro_fa2_routine_id'])!,
      comment: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}comment'])!,
      action: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}action'])!,
      remark: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}remark'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['bro_fa2_visit_id'] = Variable<int>(broFa2VisitId);
    map['bro_fa2_routine_id'] = Variable<int>(broFa2RoutineId);
    map['comment'] = Variable<String>(comment);
    map['action'] = Variable<String>(action);
    map['remark'] = Variable<String>(remark);
    return map;
  }

  BroFa2VisitRoutineTbCompanion toCompanion(bool nullToAbsent) {
    return BroFa2VisitRoutineTbCompanion(
      id: Value(id),
      broFa2VisitId: Value(broFa2VisitId),
      broFa2RoutineId: Value(broFa2RoutineId),
      comment: Value(comment),
      action: Value(action),
      remark: Value(remark),
    );
  }

  factory BroFa2VisitRoutine.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return BroFa2VisitRoutine(
      id: serializer.fromJson<int>(json['id']),
      broFa2VisitId: serializer.fromJson<int>(json['bro_fa2_visit']),
      broFa2RoutineId: serializer.fromJson<int>(json['bro_fa2_routine']),
      comment: serializer.fromJson<String>(json['comment']),
      action: serializer.fromJson<String>(json['action']),
      remark: serializer.fromJson<String>(json['remark']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'bro_fa2_visit': serializer.toJson<int>(broFa2VisitId),
      'bro_fa2_routine': serializer.toJson<int>(broFa2RoutineId),
      'comment': serializer.toJson<String>(comment),
      'action': serializer.toJson<String>(action),
      'remark': serializer.toJson<String>(remark),
    };
  }

  BroFa2VisitRoutine copyWith(
          {int? id,
          int? broFa2VisitId,
          int? broFa2RoutineId,
          String? comment,
          String? action,
          String? remark}) =>
      BroFa2VisitRoutine(
        id: id ?? this.id,
        broFa2VisitId: broFa2VisitId ?? this.broFa2VisitId,
        broFa2RoutineId: broFa2RoutineId ?? this.broFa2RoutineId,
        comment: comment ?? this.comment,
        action: action ?? this.action,
        remark: remark ?? this.remark,
      );
  @override
  String toString() {
    return (StringBuffer('BroFa2VisitRoutine(')
          ..write('id: $id, ')
          ..write('broFa2VisitId: $broFa2VisitId, ')
          ..write('broFa2RoutineId: $broFa2RoutineId, ')
          ..write('comment: $comment, ')
          ..write('action: $action, ')
          ..write('remark: $remark')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      id.hashCode,
      $mrjc(
          broFa2VisitId.hashCode,
          $mrjc(
              broFa2RoutineId.hashCode,
              $mrjc(comment.hashCode,
                  $mrjc(action.hashCode, remark.hashCode))))));
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is BroFa2VisitRoutine &&
          other.id == this.id &&
          other.broFa2VisitId == this.broFa2VisitId &&
          other.broFa2RoutineId == this.broFa2RoutineId &&
          other.comment == this.comment &&
          other.action == this.action &&
          other.remark == this.remark);
}

class BroFa2VisitRoutineTbCompanion
    extends UpdateCompanion<BroFa2VisitRoutine> {
  final Value<int> id;
  final Value<int> broFa2VisitId;
  final Value<int> broFa2RoutineId;
  final Value<String> comment;
  final Value<String> action;
  final Value<String> remark;
  const BroFa2VisitRoutineTbCompanion({
    this.id = const Value.absent(),
    this.broFa2VisitId = const Value.absent(),
    this.broFa2RoutineId = const Value.absent(),
    this.comment = const Value.absent(),
    this.action = const Value.absent(),
    this.remark = const Value.absent(),
  });
  BroFa2VisitRoutineTbCompanion.insert({
    this.id = const Value.absent(),
    required int broFa2VisitId,
    required int broFa2RoutineId,
    required String comment,
    required String action,
    required String remark,
  })  : broFa2VisitId = Value(broFa2VisitId),
        broFa2RoutineId = Value(broFa2RoutineId),
        comment = Value(comment),
        action = Value(action),
        remark = Value(remark);
  static Insertable<BroFa2VisitRoutine> custom({
    Expression<int>? id,
    Expression<int>? broFa2VisitId,
    Expression<int>? broFa2RoutineId,
    Expression<String>? comment,
    Expression<String>? action,
    Expression<String>? remark,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (broFa2VisitId != null) 'bro_fa2_visit_id': broFa2VisitId,
      if (broFa2RoutineId != null) 'bro_fa2_routine_id': broFa2RoutineId,
      if (comment != null) 'comment': comment,
      if (action != null) 'action': action,
      if (remark != null) 'remark': remark,
    });
  }

  BroFa2VisitRoutineTbCompanion copyWith(
      {Value<int>? id,
      Value<int>? broFa2VisitId,
      Value<int>? broFa2RoutineId,
      Value<String>? comment,
      Value<String>? action,
      Value<String>? remark}) {
    return BroFa2VisitRoutineTbCompanion(
      id: id ?? this.id,
      broFa2VisitId: broFa2VisitId ?? this.broFa2VisitId,
      broFa2RoutineId: broFa2RoutineId ?? this.broFa2RoutineId,
      comment: comment ?? this.comment,
      action: action ?? this.action,
      remark: remark ?? this.remark,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (broFa2VisitId.present) {
      map['bro_fa2_visit_id'] = Variable<int>(broFa2VisitId.value);
    }
    if (broFa2RoutineId.present) {
      map['bro_fa2_routine_id'] = Variable<int>(broFa2RoutineId.value);
    }
    if (comment.present) {
      map['comment'] = Variable<String>(comment.value);
    }
    if (action.present) {
      map['action'] = Variable<String>(action.value);
    }
    if (remark.present) {
      map['remark'] = Variable<String>(remark.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('BroFa2VisitRoutineTbCompanion(')
          ..write('id: $id, ')
          ..write('broFa2VisitId: $broFa2VisitId, ')
          ..write('broFa2RoutineId: $broFa2RoutineId, ')
          ..write('comment: $comment, ')
          ..write('action: $action, ')
          ..write('remark: $remark')
          ..write(')'))
        .toString();
  }
}

class $BroFa2VisitRoutineTbTable extends BroFa2VisitRoutineTb
    with TableInfo<$BroFa2VisitRoutineTbTable, BroFa2VisitRoutine> {
  final GeneratedDatabase _db;
  final String? _alias;
  $BroFa2VisitRoutineTbTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  late final GeneratedColumn<int?> id = GeneratedColumn<int?>(
      'id', aliasedName, false,
      typeName: 'INTEGER',
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _broFa2VisitIdMeta =
      const VerificationMeta('broFa2VisitId');
  late final GeneratedColumn<int?> broFa2VisitId = GeneratedColumn<int?>(
      'bro_fa2_visit_id', aliasedName, false,
      typeName: 'INTEGER', requiredDuringInsert: true);
  final VerificationMeta _broFa2RoutineIdMeta =
      const VerificationMeta('broFa2RoutineId');
  late final GeneratedColumn<int?> broFa2RoutineId = GeneratedColumn<int?>(
      'bro_fa2_routine_id', aliasedName, false,
      typeName: 'INTEGER', requiredDuringInsert: true);
  final VerificationMeta _commentMeta = const VerificationMeta('comment');
  late final GeneratedColumn<String?> comment = GeneratedColumn<String?>(
      'comment', aliasedName, false,
      typeName: 'TEXT', requiredDuringInsert: true);
  final VerificationMeta _actionMeta = const VerificationMeta('action');
  late final GeneratedColumn<String?> action = GeneratedColumn<String?>(
      'action', aliasedName, false,
      typeName: 'TEXT', requiredDuringInsert: true);
  final VerificationMeta _remarkMeta = const VerificationMeta('remark');
  late final GeneratedColumn<String?> remark = GeneratedColumn<String?>(
      'remark', aliasedName, false,
      typeName: 'TEXT', requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [id, broFa2VisitId, broFa2RoutineId, comment, action, remark];
  @override
  String get aliasedName => _alias ?? 'bro_fa2_visit_routine';
  @override
  String get actualTableName => 'bro_fa2_visit_routine';
  @override
  VerificationContext validateIntegrity(Insertable<BroFa2VisitRoutine> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('bro_fa2_visit_id')) {
      context.handle(
          _broFa2VisitIdMeta,
          broFa2VisitId.isAcceptableOrUnknown(
              data['bro_fa2_visit_id']!, _broFa2VisitIdMeta));
    } else if (isInserting) {
      context.missing(_broFa2VisitIdMeta);
    }
    if (data.containsKey('bro_fa2_routine_id')) {
      context.handle(
          _broFa2RoutineIdMeta,
          broFa2RoutineId.isAcceptableOrUnknown(
              data['bro_fa2_routine_id']!, _broFa2RoutineIdMeta));
    } else if (isInserting) {
      context.missing(_broFa2RoutineIdMeta);
    }
    if (data.containsKey('comment')) {
      context.handle(_commentMeta,
          comment.isAcceptableOrUnknown(data['comment']!, _commentMeta));
    } else if (isInserting) {
      context.missing(_commentMeta);
    }
    if (data.containsKey('action')) {
      context.handle(_actionMeta,
          action.isAcceptableOrUnknown(data['action']!, _actionMeta));
    } else if (isInserting) {
      context.missing(_actionMeta);
    }
    if (data.containsKey('remark')) {
      context.handle(_remarkMeta,
          remark.isAcceptableOrUnknown(data['remark']!, _remarkMeta));
    } else if (isInserting) {
      context.missing(_remarkMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  BroFa2VisitRoutine map(Map<String, dynamic> data, {String? tablePrefix}) {
    return BroFa2VisitRoutine.fromData(data, _db,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $BroFa2VisitRoutineTbTable createAlias(String alias) {
    return $BroFa2VisitRoutineTbTable(_db, alias);
  }
}

class Log extends DataClass implements Insertable<Log> {
  final int id;
  final String type;
  final String remark;
  final String timestamp;
  Log(
      {required this.id,
      required this.type,
      required this.remark,
      required this.timestamp});
  factory Log.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return Log(
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      type: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}type'])!,
      remark: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}remark'])!,
      timestamp: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}timestamp'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['type'] = Variable<String>(type);
    map['remark'] = Variable<String>(remark);
    map['timestamp'] = Variable<String>(timestamp);
    return map;
  }

  LogTbCompanion toCompanion(bool nullToAbsent) {
    return LogTbCompanion(
      id: Value(id),
      type: Value(type),
      remark: Value(remark),
      timestamp: Value(timestamp),
    );
  }

  factory Log.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return Log(
      id: serializer.fromJson<int>(json['id']),
      type: serializer.fromJson<String>(json['type']),
      remark: serializer.fromJson<String>(json['remark']),
      timestamp: serializer.fromJson<String>(json['timestamp']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'type': serializer.toJson<String>(type),
      'remark': serializer.toJson<String>(remark),
      'timestamp': serializer.toJson<String>(timestamp),
    };
  }

  Log copyWith({int? id, String? type, String? remark, String? timestamp}) =>
      Log(
        id: id ?? this.id,
        type: type ?? this.type,
        remark: remark ?? this.remark,
        timestamp: timestamp ?? this.timestamp,
      );
  @override
  String toString() {
    return (StringBuffer('Log(')
          ..write('id: $id, ')
          ..write('type: $type, ')
          ..write('remark: $remark, ')
          ..write('timestamp: $timestamp')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(id.hashCode,
      $mrjc(type.hashCode, $mrjc(remark.hashCode, timestamp.hashCode))));
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Log &&
          other.id == this.id &&
          other.type == this.type &&
          other.remark == this.remark &&
          other.timestamp == this.timestamp);
}

class LogTbCompanion extends UpdateCompanion<Log> {
  final Value<int> id;
  final Value<String> type;
  final Value<String> remark;
  final Value<String> timestamp;
  const LogTbCompanion({
    this.id = const Value.absent(),
    this.type = const Value.absent(),
    this.remark = const Value.absent(),
    this.timestamp = const Value.absent(),
  });
  LogTbCompanion.insert({
    this.id = const Value.absent(),
    required String type,
    required String remark,
    this.timestamp = const Value.absent(),
  })  : type = Value(type),
        remark = Value(remark);
  static Insertable<Log> custom({
    Expression<int>? id,
    Expression<String>? type,
    Expression<String>? remark,
    Expression<String>? timestamp,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (type != null) 'type': type,
      if (remark != null) 'remark': remark,
      if (timestamp != null) 'timestamp': timestamp,
    });
  }

  LogTbCompanion copyWith(
      {Value<int>? id,
      Value<String>? type,
      Value<String>? remark,
      Value<String>? timestamp}) {
    return LogTbCompanion(
      id: id ?? this.id,
      type: type ?? this.type,
      remark: remark ?? this.remark,
      timestamp: timestamp ?? this.timestamp,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (type.present) {
      map['type'] = Variable<String>(type.value);
    }
    if (remark.present) {
      map['remark'] = Variable<String>(remark.value);
    }
    if (timestamp.present) {
      map['timestamp'] = Variable<String>(timestamp.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('LogTbCompanion(')
          ..write('id: $id, ')
          ..write('type: $type, ')
          ..write('remark: $remark, ')
          ..write('timestamp: $timestamp')
          ..write(')'))
        .toString();
  }
}

class $LogTbTable extends LogTb with TableInfo<$LogTbTable, Log> {
  final GeneratedDatabase _db;
  final String? _alias;
  $LogTbTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  late final GeneratedColumn<int?> id = GeneratedColumn<int?>(
      'id', aliasedName, false,
      typeName: 'INTEGER',
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _typeMeta = const VerificationMeta('type');
  late final GeneratedColumn<String?> type = GeneratedColumn<String?>(
      'type', aliasedName, false,
      typeName: 'TEXT', requiredDuringInsert: true);
  final VerificationMeta _remarkMeta = const VerificationMeta('remark');
  late final GeneratedColumn<String?> remark = GeneratedColumn<String?>(
      'remark', aliasedName, false,
      typeName: 'TEXT', requiredDuringInsert: true);
  final VerificationMeta _timestampMeta = const VerificationMeta('timestamp');
  late final GeneratedColumn<String?> timestamp = GeneratedColumn<String?>(
      'timestamp', aliasedName, false,
      typeName: 'TEXT',
      requiredDuringInsert: false,
      clientDefault: () =>
          DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now()));
  @override
  List<GeneratedColumn> get $columns => [id, type, remark, timestamp];
  @override
  String get aliasedName => _alias ?? 'log';
  @override
  String get actualTableName => 'log';
  @override
  VerificationContext validateIntegrity(Insertable<Log> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('type')) {
      context.handle(
          _typeMeta, type.isAcceptableOrUnknown(data['type']!, _typeMeta));
    } else if (isInserting) {
      context.missing(_typeMeta);
    }
    if (data.containsKey('remark')) {
      context.handle(_remarkMeta,
          remark.isAcceptableOrUnknown(data['remark']!, _remarkMeta));
    } else if (isInserting) {
      context.missing(_remarkMeta);
    }
    if (data.containsKey('timestamp')) {
      context.handle(_timestampMeta,
          timestamp.isAcceptableOrUnknown(data['timestamp']!, _timestampMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Log map(Map<String, dynamic> data, {String? tablePrefix}) {
    return Log.fromData(data, _db,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $LogTbTable createAlias(String alias) {
    return $LogTbTable(_db, alias);
  }
}

abstract class _$Db extends GeneratedDatabase {
  _$Db(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  late final $CompanyTbTable companyTb = $CompanyTbTable(this);
  late final $LocationTbTable locationTb = $LocationTbTable(this);
  late final $LocHouseTbTable locHouseTb = $LocHouseTbTable(this);
  late final $BroFa2DoTbTable broFa2DoTb = $BroFa2DoTbTable(this);
  late final $BroFa2FoTbTable broFa2FoTb = $BroFa2FoTbTable(this);
  late final $BroFa2FoSelectionTbTable broFa2FoSelectionTb =
      $BroFa2FoSelectionTbTable(this);
  late final $BroFa2MaTbTable broFa2MaTb = $BroFa2MaTbTable(this);
  late final $BroFa2PmTbTable broFa2PmTb = $BroFa2PmTbTable(this);
  late final $BroFa2RoutineTbTable broFa2RoutineTb =
      $BroFa2RoutineTbTable(this);
  late final $BroFa2VisitTbTable broFa2VisitTb = $BroFa2VisitTbTable(this);
  late final $BroFa2VisitHouseTbTable broFa2VisitHouseTb =
      $BroFa2VisitHouseTbTable(this);
  late final $BroFa2VisitFoTbTable broFa2VisitFoTb =
      $BroFa2VisitFoTbTable(this);
  late final $BroFa2VisitFoImgTbTable broFa2VisitFoImgTb =
      $BroFa2VisitFoImgTbTable(this);
  late final $BroFa2VisitPmTbTable broFa2VisitPmTb =
      $BroFa2VisitPmTbTable(this);
  late final $BroFa2VisitPmImgTbTable broFa2VisitPmImgTb =
      $BroFa2VisitPmImgTbTable(this);
  late final $BroFa2VisitDoTbTable broFa2VisitDoTb =
      $BroFa2VisitDoTbTable(this);
  late final $BroFa2VisitPasgarTbTable broFa2VisitPasgarTb =
      $BroFa2VisitPasgarTbTable(this);
  late final $BroFa2VisitMaTbTable broFa2VisitMaTb =
      $BroFa2VisitMaTbTable(this);
  late final $BroFa2VisitMaImgTbTable broFa2VisitMaImgTb =
      $BroFa2VisitMaImgTbTable(this);
  late final $BroFa2VisitWeightTbTable broFa2VisitWeightTb =
      $BroFa2VisitWeightTbTable(this);
  late final $BroFa2VisitRoutineTbTable broFa2VisitRoutineTb =
      $BroFa2VisitRoutineTbTable(this);
  late final $LogTbTable logTb = $LogTbTable(this);
  late final CompanyDao companyDao = CompanyDao(this as Db);
  late final LocationDao locationDao = LocationDao(this as Db);
  late final LocHouseDao locHouseDao = LocHouseDao(this as Db);
  late final BroFa2DoDao broFa2DoDao = BroFa2DoDao(this as Db);
  late final BroFa2FoDao broFa2FoDao = BroFa2FoDao(this as Db);
  late final BroFa2FoSelectionDao broFa2FoSelectionDao =
      BroFa2FoSelectionDao(this as Db);
  late final BroFa2MaDao broFa2MaDao = BroFa2MaDao(this as Db);
  late final BroFa2PmDao broFa2PmDao = BroFa2PmDao(this as Db);
  late final BroFa2RoutineDao broFa2RoutineDao = BroFa2RoutineDao(this as Db);
  late final BroFa2VisitDao broFa2VisitDao = BroFa2VisitDao(this as Db);
  late final BroFa2VisitHouseDao broFa2VisitHouseDao =
      BroFa2VisitHouseDao(this as Db);
  late final BroFa2VisitFoDao broFa2VisitFoDao = BroFa2VisitFoDao(this as Db);
  late final BroFa2VisitFoImgDao broFa2VisitFoImgDao =
      BroFa2VisitFoImgDao(this as Db);
  late final BroFa2VisitPmDao broFa2VisitPmDao = BroFa2VisitPmDao(this as Db);
  late final BroFa2VisitPmImgDao broFa2VisitPmImgDao =
      BroFa2VisitPmImgDao(this as Db);
  late final BroFa2VisitDoDao broFa2VisitDoDao = BroFa2VisitDoDao(this as Db);
  late final BroFa2VisitPasgarDao broFa2VisitPasgarDao =
      BroFa2VisitPasgarDao(this as Db);
  late final BroFa2VisitMaDao broFa2VisitMaDao = BroFa2VisitMaDao(this as Db);
  late final BroFa2VisitMaImgDao broFa2VisitMaImgDao =
      BroFa2VisitMaImgDao(this as Db);
  late final BroFa2VisitWeightDao broFa2VisitWeightDao =
      BroFa2VisitWeightDao(this as Db);
  late final BroFa2VisitRoutineDao broFa2VisitRoutineDao =
      BroFa2VisitRoutineDao(this as Db);
  late final LogDao logDao = LogDao(this as Db);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
        companyTb,
        locationTb,
        locHouseTb,
        broFa2DoTb,
        broFa2FoTb,
        broFa2FoSelectionTb,
        broFa2MaTb,
        broFa2PmTb,
        broFa2RoutineTb,
        broFa2VisitTb,
        broFa2VisitHouseTb,
        broFa2VisitFoTb,
        broFa2VisitFoImgTb,
        broFa2VisitPmTb,
        broFa2VisitPmImgTb,
        broFa2VisitDoTb,
        broFa2VisitPasgarTb,
        broFa2VisitMaTb,
        broFa2VisitMaImgTb,
        broFa2VisitWeightTb,
        broFa2VisitRoutineTb,
        logTb
      ];
}
