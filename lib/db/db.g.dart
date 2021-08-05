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
  final bool isPasgar;
  final int order;
  BroFa2Do(
      {required this.id,
      required this.name,
      required this.stdValue,
      required this.isFormula,
      this.formula,
      required this.isPasgar,
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
      isPasgar: const BoolType()
          .mapFromDatabaseResponse(data['${effectivePrefix}is_pasgar'])!,
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
    map['is_pasgar'] = Variable<bool>(isPasgar);
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
      isPasgar: Value(isPasgar),
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
      isPasgar: serializer.fromJson<bool>(json['is_pasgar']),
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
      'is_pasgar': serializer.toJson<bool>(isPasgar),
      'order': serializer.toJson<int>(order),
    };
  }

  BroFa2Do copyWith(
          {int? id,
          String? name,
          String? stdValue,
          bool? isFormula,
          String? formula,
          bool? isPasgar,
          int? order}) =>
      BroFa2Do(
        id: id ?? this.id,
        name: name ?? this.name,
        stdValue: stdValue ?? this.stdValue,
        isFormula: isFormula ?? this.isFormula,
        formula: formula ?? this.formula,
        isPasgar: isPasgar ?? this.isPasgar,
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
          ..write('isPasgar: $isPasgar, ')
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
              $mrjc(
                  isFormula.hashCode,
                  $mrjc(formula.hashCode,
                      $mrjc(isPasgar.hashCode, order.hashCode)))))));
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is BroFa2Do &&
          other.id == this.id &&
          other.name == this.name &&
          other.stdValue == this.stdValue &&
          other.isFormula == this.isFormula &&
          other.formula == this.formula &&
          other.isPasgar == this.isPasgar &&
          other.order == this.order);
}

class BroFa2DoTbCompanion extends UpdateCompanion<BroFa2Do> {
  final Value<int> id;
  final Value<String> name;
  final Value<String> stdValue;
  final Value<bool> isFormula;
  final Value<String?> formula;
  final Value<bool> isPasgar;
  final Value<int> order;
  const BroFa2DoTbCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.stdValue = const Value.absent(),
    this.isFormula = const Value.absent(),
    this.formula = const Value.absent(),
    this.isPasgar = const Value.absent(),
    this.order = const Value.absent(),
  });
  BroFa2DoTbCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required String stdValue,
    required bool isFormula,
    this.formula = const Value.absent(),
    required bool isPasgar,
    required int order,
  })  : name = Value(name),
        stdValue = Value(stdValue),
        isFormula = Value(isFormula),
        isPasgar = Value(isPasgar),
        order = Value(order);
  static Insertable<BroFa2Do> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? stdValue,
    Expression<bool>? isFormula,
    Expression<String?>? formula,
    Expression<bool>? isPasgar,
    Expression<int>? order,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (stdValue != null) 'std_value': stdValue,
      if (isFormula != null) 'is_formula': isFormula,
      if (formula != null) 'formula': formula,
      if (isPasgar != null) 'is_pasgar': isPasgar,
      if (order != null) 'order': order,
    });
  }

  BroFa2DoTbCompanion copyWith(
      {Value<int>? id,
      Value<String>? name,
      Value<String>? stdValue,
      Value<bool>? isFormula,
      Value<String?>? formula,
      Value<bool>? isPasgar,
      Value<int>? order}) {
    return BroFa2DoTbCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      stdValue: stdValue ?? this.stdValue,
      isFormula: isFormula ?? this.isFormula,
      formula: formula ?? this.formula,
      isPasgar: isPasgar ?? this.isPasgar,
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
    if (isPasgar.present) {
      map['is_pasgar'] = Variable<bool>(isPasgar.value);
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
          ..write('isPasgar: $isPasgar, ')
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
  final VerificationMeta _isPasgarMeta = const VerificationMeta('isPasgar');
  late final GeneratedColumn<bool?> isPasgar = GeneratedColumn<bool?>(
      'is_pasgar', aliasedName, false,
      typeName: 'INTEGER',
      requiredDuringInsert: true,
      defaultConstraints: 'CHECK (is_pasgar IN (0, 1))');
  final VerificationMeta _orderMeta = const VerificationMeta('order');
  late final GeneratedColumn<int?> order = GeneratedColumn<int?>(
      'order', aliasedName, false,
      typeName: 'INTEGER', requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [id, name, stdValue, isFormula, formula, isPasgar, order];
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
    if (data.containsKey('is_pasgar')) {
      context.handle(_isPasgarMeta,
          isPasgar.isAcceptableOrUnknown(data['is_pasgar']!, _isPasgarMeta));
    } else if (isInserting) {
      context.missing(_isPasgarMeta);
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
        broFa2VisitPmImgTb
      ];
}
