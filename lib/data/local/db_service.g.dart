// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'db_service.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class CountriesEntityCompanion extends UpdateCompanion<CountryEntity> {
  final Value<int> id;
  final Value<String> name;
  final Value<String> abbreviation;
  final Value<String> capital;
  final Value<String> currency;
  final Value<String> phone;
  final Value<int?> population;
  final Value<String> flag;
  final Value<String> emblem;
  final Value<String> orthographic;
  const CountriesEntityCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.abbreviation = const Value.absent(),
    this.capital = const Value.absent(),
    this.currency = const Value.absent(),
    this.phone = const Value.absent(),
    this.population = const Value.absent(),
    this.flag = const Value.absent(),
    this.emblem = const Value.absent(),
    this.orthographic = const Value.absent(),
  });
  CountriesEntityCompanion.insert({
    required int id,
    required String name,
    required String abbreviation,
    required String capital,
    required String currency,
    required String phone,
    this.population = const Value.absent(),
    required String flag,
    required String emblem,
    required String orthographic,
  })  : id = Value(id),
        name = Value(name),
        abbreviation = Value(abbreviation),
        capital = Value(capital),
        currency = Value(currency),
        phone = Value(phone),
        flag = Value(flag),
        emblem = Value(emblem),
        orthographic = Value(orthographic);
  static Insertable<CountryEntity> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? abbreviation,
    Expression<String>? capital,
    Expression<String>? currency,
    Expression<String>? phone,
    Expression<int?>? population,
    Expression<String>? flag,
    Expression<String>? emblem,
    Expression<String>? orthographic,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (abbreviation != null) 'abbreviation': abbreviation,
      if (capital != null) 'capital': capital,
      if (currency != null) 'currency': currency,
      if (phone != null) 'phone': phone,
      if (population != null) 'population': population,
      if (flag != null) 'flag': flag,
      if (emblem != null) 'emblem': emblem,
      if (orthographic != null) 'orthographic': orthographic,
    });
  }

  CountriesEntityCompanion copyWith(
      {Value<int>? id,
      Value<String>? name,
      Value<String>? abbreviation,
      Value<String>? capital,
      Value<String>? currency,
      Value<String>? phone,
      Value<int?>? population,
      Value<String>? flag,
      Value<String>? emblem,
      Value<String>? orthographic}) {
    return CountriesEntityCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      abbreviation: abbreviation ?? this.abbreviation,
      capital: capital ?? this.capital,
      currency: currency ?? this.currency,
      phone: phone ?? this.phone,
      population: population ?? this.population,
      flag: flag ?? this.flag,
      emblem: emblem ?? this.emblem,
      orthographic: orthographic ?? this.orthographic,
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
    if (abbreviation.present) {
      map['abbreviation'] = Variable<String>(abbreviation.value);
    }
    if (capital.present) {
      map['capital'] = Variable<String>(capital.value);
    }
    if (currency.present) {
      map['currency'] = Variable<String>(currency.value);
    }
    if (phone.present) {
      map['phone'] = Variable<String>(phone.value);
    }
    if (population.present) {
      map['population'] = Variable<int?>(population.value);
    }
    if (flag.present) {
      map['flag'] = Variable<String>(flag.value);
    }
    if (emblem.present) {
      map['emblem'] = Variable<String>(emblem.value);
    }
    if (orthographic.present) {
      map['orthographic'] = Variable<String>(orthographic.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CountriesEntityCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('abbreviation: $abbreviation, ')
          ..write('capital: $capital, ')
          ..write('currency: $currency, ')
          ..write('phone: $phone, ')
          ..write('population: $population, ')
          ..write('flag: $flag, ')
          ..write('emblem: $emblem, ')
          ..write('orthographic: $orthographic')
          ..write(')'))
        .toString();
  }
}

class $CountriesEntityTable extends CountriesEntity
    with TableInfo<$CountriesEntityTable, CountryEntity> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CountriesEntityTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int?> id = GeneratedColumn<int?>(
      'id', aliasedName, false,
      type: const IntType(), requiredDuringInsert: true);
  final VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String?> name = GeneratedColumn<String?>(
      'name', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _abbreviationMeta =
      const VerificationMeta('abbreviation');
  @override
  late final GeneratedColumn<String?> abbreviation = GeneratedColumn<String?>(
      'abbreviation', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _capitalMeta = const VerificationMeta('capital');
  @override
  late final GeneratedColumn<String?> capital = GeneratedColumn<String?>(
      'capital', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _currencyMeta = const VerificationMeta('currency');
  @override
  late final GeneratedColumn<String?> currency = GeneratedColumn<String?>(
      'currency', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _phoneMeta = const VerificationMeta('phone');
  @override
  late final GeneratedColumn<String?> phone = GeneratedColumn<String?>(
      'phone', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _populationMeta = const VerificationMeta('population');
  @override
  late final GeneratedColumn<int?> population = GeneratedColumn<int?>(
      'population', aliasedName, true,
      type: const IntType(), requiredDuringInsert: false);
  final VerificationMeta _flagMeta = const VerificationMeta('flag');
  @override
  late final GeneratedColumn<String?> flag = GeneratedColumn<String?>(
      'flag', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _emblemMeta = const VerificationMeta('emblem');
  @override
  late final GeneratedColumn<String?> emblem = GeneratedColumn<String?>(
      'emblem', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _orthographicMeta =
      const VerificationMeta('orthographic');
  @override
  late final GeneratedColumn<String?> orthographic = GeneratedColumn<String?>(
      'orthographic', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        name,
        abbreviation,
        capital,
        currency,
        phone,
        population,
        flag,
        emblem,
        orthographic
      ];
  @override
  String get aliasedName => _alias ?? 'countries_entity';
  @override
  String get actualTableName => 'countries_entity';
  @override
  VerificationContext validateIntegrity(Insertable<CountryEntity> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('abbreviation')) {
      context.handle(
          _abbreviationMeta,
          abbreviation.isAcceptableOrUnknown(
              data['abbreviation']!, _abbreviationMeta));
    } else if (isInserting) {
      context.missing(_abbreviationMeta);
    }
    if (data.containsKey('capital')) {
      context.handle(_capitalMeta,
          capital.isAcceptableOrUnknown(data['capital']!, _capitalMeta));
    } else if (isInserting) {
      context.missing(_capitalMeta);
    }
    if (data.containsKey('currency')) {
      context.handle(_currencyMeta,
          currency.isAcceptableOrUnknown(data['currency']!, _currencyMeta));
    } else if (isInserting) {
      context.missing(_currencyMeta);
    }
    if (data.containsKey('phone')) {
      context.handle(
          _phoneMeta, phone.isAcceptableOrUnknown(data['phone']!, _phoneMeta));
    } else if (isInserting) {
      context.missing(_phoneMeta);
    }
    if (data.containsKey('population')) {
      context.handle(
          _populationMeta,
          population.isAcceptableOrUnknown(
              data['population']!, _populationMeta));
    }
    if (data.containsKey('flag')) {
      context.handle(
          _flagMeta, flag.isAcceptableOrUnknown(data['flag']!, _flagMeta));
    } else if (isInserting) {
      context.missing(_flagMeta);
    }
    if (data.containsKey('emblem')) {
      context.handle(_emblemMeta,
          emblem.isAcceptableOrUnknown(data['emblem']!, _emblemMeta));
    } else if (isInserting) {
      context.missing(_emblemMeta);
    }
    if (data.containsKey('orthographic')) {
      context.handle(
          _orthographicMeta,
          orthographic.isAcceptableOrUnknown(
              data['orthographic']!, _orthographicMeta));
    } else if (isInserting) {
      context.missing(_orthographicMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => <GeneratedColumn>{};
  @override
  CountryEntity map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CountryEntity(
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      name: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}name'])!,
      abbreviation: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}abbreviation'])!,
      capital: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}capital'])!,
      currency: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}currency'])!,
      phone: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}phone'])!,
      population: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}population']),
      flag: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}flag'])!,
      emblem: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}emblem'])!,
      orthographic: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}orthographic'])!,
    );
  }

  @override
  $CountriesEntityTable createAlias(String alias) {
    return $CountriesEntityTable(attachedDatabase, alias);
  }
}

abstract class _$DBService extends GeneratedDatabase {
  _$DBService(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  late final $CountriesEntityTable countriesEntity =
      $CountriesEntityTable(this);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [countriesEntity];
}
