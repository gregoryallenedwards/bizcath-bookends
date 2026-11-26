// GENERATED CODE - DO NOT MODIFY BY HAND

// Copyright the BizCath contributors.

part of 'database.dart';

// ignore_for_file: type=lint
class $DaysTable extends Days with TableInfo<$DaysTable, Day> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DaysTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _dateMeta = const VerificationMeta('date');
  @override
  late final GeneratedColumn<String> date = GeneratedColumn<String>(
    'date',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _morningFeelingMeta = const VerificationMeta(
    'morningFeeling',
  );
  @override
  late final GeneratedColumn<String> morningFeeling = GeneratedColumn<String>(
    'morning_feeling',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _morningStrengthMeta = const VerificationMeta(
    'morningStrength',
  );
  @override
  late final GeneratedColumn<String> morningStrength = GeneratedColumn<String>(
    'morning_strength',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _morningWhyMeta = const VerificationMeta(
    'morningWhy',
  );
  @override
  late final GeneratedColumn<String> morningWhy = GeneratedColumn<String>(
    'morning_why',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _goalTextMeta = const VerificationMeta(
    'goalText',
  );
  @override
  late final GeneratedColumn<String> goalText = GeneratedColumn<String>(
    'goal_text',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _goalSourceMeta = const VerificationMeta(
    'goalSource',
  );
  @override
  late final GeneratedColumn<String> goalSource = GeneratedColumn<String>(
    'goal_source',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _lineIdMeta = const VerificationMeta('lineId');
  @override
  late final GeneratedColumn<String> lineId = GeneratedColumn<String>(
    'line_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _morningCompletedAtMeta =
      const VerificationMeta('morningCompletedAt');
  @override
  late final GeneratedColumn<DateTime> morningCompletedAt =
      GeneratedColumn<DateTime>(
        'morning_completed_at',
        aliasedName,
        true,
        type: DriftSqlType.dateTime,
        requiredDuringInsert: false,
      );
  static const VerificationMeta _eveningFeelingMeta = const VerificationMeta(
    'eveningFeeling',
  );
  @override
  late final GeneratedColumn<String> eveningFeeling = GeneratedColumn<String>(
    'evening_feeling',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _eveningStrengthMeta = const VerificationMeta(
    'eveningStrength',
  );
  @override
  late final GeneratedColumn<String> eveningStrength = GeneratedColumn<String>(
    'evening_strength',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _eveningWhyMeta = const VerificationMeta(
    'eveningWhy',
  );
  @override
  late final GeneratedColumn<String> eveningWhy = GeneratedColumn<String>(
    'evening_why',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _goalOutcomeMeta = const VerificationMeta(
    'goalOutcome',
  );
  @override
  late final GeneratedColumn<String> goalOutcome = GeneratedColumn<String>(
    'goal_outcome',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _goodKindMeta = const VerificationMeta(
    'goodKind',
  );
  @override
  late final GeneratedColumn<String> goodKind = GeneratedColumn<String>(
    'good_kind',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _goodTextMeta = const VerificationMeta(
    'goodText',
  );
  @override
  late final GeneratedColumn<String> goodText = GeneratedColumn<String>(
    'good_text',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _eveningCompletedAtMeta =
      const VerificationMeta('eveningCompletedAt');
  @override
  late final GeneratedColumn<DateTime> eveningCompletedAt =
      GeneratedColumn<DateTime>(
        'evening_completed_at',
        aliasedName,
        true,
        type: DriftSqlType.dateTime,
        requiredDuringInsert: false,
      );
  @override
  List<GeneratedColumn> get $columns => [
    date,
    morningFeeling,
    morningStrength,
    morningWhy,
    goalText,
    goalSource,
    lineId,
    morningCompletedAt,
    eveningFeeling,
    eveningStrength,
    eveningWhy,
    goalOutcome,
    goodKind,
    goodText,
    eveningCompletedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'days';
  @override
  VerificationContext validateIntegrity(
    Insertable<Day> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('date')) {
      context.handle(
        _dateMeta,
        date.isAcceptableOrUnknown(data['date']!, _dateMeta),
      );
    } else if (isInserting) {
      context.missing(_dateMeta);
    }
    if (data.containsKey('morning_feeling')) {
      context.handle(
        _morningFeelingMeta,
        morningFeeling.isAcceptableOrUnknown(
          data['morning_feeling']!,
          _morningFeelingMeta,
        ),
      );
    }
    if (data.containsKey('morning_strength')) {
      context.handle(
        _morningStrengthMeta,
        morningStrength.isAcceptableOrUnknown(
          data['morning_strength']!,
          _morningStrengthMeta,
        ),
      );
    }
    if (data.containsKey('morning_why')) {
      context.handle(
        _morningWhyMeta,
        morningWhy.isAcceptableOrUnknown(data['morning_why']!, _morningWhyMeta),
      );
    }
    if (data.containsKey('goal_text')) {
      context.handle(
        _goalTextMeta,
        goalText.isAcceptableOrUnknown(data['goal_text']!, _goalTextMeta),
      );
    }
    if (data.containsKey('goal_source')) {
      context.handle(
        _goalSourceMeta,
        goalSource.isAcceptableOrUnknown(data['goal_source']!, _goalSourceMeta),
      );
    }
    if (data.containsKey('line_id')) {
      context.handle(
        _lineIdMeta,
        lineId.isAcceptableOrUnknown(data['line_id']!, _lineIdMeta),
      );
    }
    if (data.containsKey('morning_completed_at')) {
      context.handle(
        _morningCompletedAtMeta,
        morningCompletedAt.isAcceptableOrUnknown(
          data['morning_completed_at']!,
          _morningCompletedAtMeta,
        ),
      );
    }
    if (data.containsKey('evening_feeling')) {
      context.handle(
        _eveningFeelingMeta,
        eveningFeeling.isAcceptableOrUnknown(
          data['evening_feeling']!,
          _eveningFeelingMeta,
        ),
      );
    }
    if (data.containsKey('evening_strength')) {
      context.handle(
        _eveningStrengthMeta,
        eveningStrength.isAcceptableOrUnknown(
          data['evening_strength']!,
          _eveningStrengthMeta,
        ),
      );
    }
    if (data.containsKey('evening_why')) {
      context.handle(
        _eveningWhyMeta,
        eveningWhy.isAcceptableOrUnknown(data['evening_why']!, _eveningWhyMeta),
      );
    }
    if (data.containsKey('goal_outcome')) {
      context.handle(
        _goalOutcomeMeta,
        goalOutcome.isAcceptableOrUnknown(
          data['goal_outcome']!,
          _goalOutcomeMeta,
        ),
      );
    }
    if (data.containsKey('good_kind')) {
      context.handle(
        _goodKindMeta,
        goodKind.isAcceptableOrUnknown(data['good_kind']!, _goodKindMeta),
      );
    }
    if (data.containsKey('good_text')) {
      context.handle(
        _goodTextMeta,
        goodText.isAcceptableOrUnknown(data['good_text']!, _goodTextMeta),
      );
    }
    if (data.containsKey('evening_completed_at')) {
      context.handle(
        _eveningCompletedAtMeta,
        eveningCompletedAt.isAcceptableOrUnknown(
          data['evening_completed_at']!,
          _eveningCompletedAtMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {date};
  @override
  Day map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Day(
      date: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}date'],
      )!,
      morningFeeling: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}morning_feeling'],
      ),
      morningStrength: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}morning_strength'],
      ),
      morningWhy: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}morning_why'],
      ),
      goalText: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}goal_text'],
      ),
      goalSource: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}goal_source'],
      ),
      lineId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}line_id'],
      ),
      morningCompletedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}morning_completed_at'],
      ),
      eveningFeeling: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}evening_feeling'],
      ),
      eveningStrength: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}evening_strength'],
      ),
      eveningWhy: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}evening_why'],
      ),
      goalOutcome: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}goal_outcome'],
      ),
      goodKind: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}good_kind'],
      ),
      goodText: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}good_text'],
      ),
      eveningCompletedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}evening_completed_at'],
      ),
    );
  }

  @override
  $DaysTable createAlias(String alias) {
    return $DaysTable(attachedDatabase, alias);
  }
}

class Day extends DataClass implements Insertable<Day> {
  final String date;
  final String? morningFeeling;
  final String? morningStrength;
  final String? morningWhy;
  final String? goalText;
  final String? goalSource;
  final String? lineId;
  final DateTime? morningCompletedAt;
  final String? eveningFeeling;
  final String? eveningStrength;
  final String? eveningWhy;
  final String? goalOutcome;
  final String? goodKind;
  final String? goodText;
  final DateTime? eveningCompletedAt;
  const Day({
    required this.date,
    this.morningFeeling,
    this.morningStrength,
    this.morningWhy,
    this.goalText,
    this.goalSource,
    this.lineId,
    this.morningCompletedAt,
    this.eveningFeeling,
    this.eveningStrength,
    this.eveningWhy,
    this.goalOutcome,
    this.goodKind,
    this.goodText,
    this.eveningCompletedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['date'] = Variable<String>(date);
    if (!nullToAbsent || morningFeeling != null) {
      map['morning_feeling'] = Variable<String>(morningFeeling);
    }
    if (!nullToAbsent || morningStrength != null) {
      map['morning_strength'] = Variable<String>(morningStrength);
    }
    if (!nullToAbsent || morningWhy != null) {
      map['morning_why'] = Variable<String>(morningWhy);
    }
    if (!nullToAbsent || goalText != null) {
      map['goal_text'] = Variable<String>(goalText);
    }
    if (!nullToAbsent || goalSource != null) {
      map['goal_source'] = Variable<String>(goalSource);
    }
    if (!nullToAbsent || lineId != null) {
      map['line_id'] = Variable<String>(lineId);
    }
    if (!nullToAbsent || morningCompletedAt != null) {
      map['morning_completed_at'] = Variable<DateTime>(morningCompletedAt);
    }
    if (!nullToAbsent || eveningFeeling != null) {
      map['evening_feeling'] = Variable<String>(eveningFeeling);
    }
    if (!nullToAbsent || eveningStrength != null) {
      map['evening_strength'] = Variable<String>(eveningStrength);
    }
    if (!nullToAbsent || eveningWhy != null) {
      map['evening_why'] = Variable<String>(eveningWhy);
    }
    if (!nullToAbsent || goalOutcome != null) {
      map['goal_outcome'] = Variable<String>(goalOutcome);
    }
    if (!nullToAbsent || goodKind != null) {
      map['good_kind'] = Variable<String>(goodKind);
    }
    if (!nullToAbsent || goodText != null) {
      map['good_text'] = Variable<String>(goodText);
    }
    if (!nullToAbsent || eveningCompletedAt != null) {
      map['evening_completed_at'] = Variable<DateTime>(eveningCompletedAt);
    }
    return map;
  }

  DaysCompanion toCompanion(bool nullToAbsent) {
    return DaysCompanion(
      date: Value(date),
      morningFeeling: morningFeeling == null && nullToAbsent
          ? const Value.absent()
          : Value(morningFeeling),
      morningStrength: morningStrength == null && nullToAbsent
          ? const Value.absent()
          : Value(morningStrength),
      morningWhy: morningWhy == null && nullToAbsent
          ? const Value.absent()
          : Value(morningWhy),
      goalText: goalText == null && nullToAbsent
          ? const Value.absent()
          : Value(goalText),
      goalSource: goalSource == null && nullToAbsent
          ? const Value.absent()
          : Value(goalSource),
      lineId: lineId == null && nullToAbsent
          ? const Value.absent()
          : Value(lineId),
      morningCompletedAt: morningCompletedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(morningCompletedAt),
      eveningFeeling: eveningFeeling == null && nullToAbsent
          ? const Value.absent()
          : Value(eveningFeeling),
      eveningStrength: eveningStrength == null && nullToAbsent
          ? const Value.absent()
          : Value(eveningStrength),
      eveningWhy: eveningWhy == null && nullToAbsent
          ? const Value.absent()
          : Value(eveningWhy),
      goalOutcome: goalOutcome == null && nullToAbsent
          ? const Value.absent()
          : Value(goalOutcome),
      goodKind: goodKind == null && nullToAbsent
          ? const Value.absent()
          : Value(goodKind),
      goodText: goodText == null && nullToAbsent
          ? const Value.absent()
          : Value(goodText),
      eveningCompletedAt: eveningCompletedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(eveningCompletedAt),
    );
  }

  factory Day.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Day(
      date: serializer.fromJson<String>(json['date']),
      morningFeeling: serializer.fromJson<String?>(json['morningFeeling']),
      morningStrength: serializer.fromJson<String?>(json['morningStrength']),
      morningWhy: serializer.fromJson<String?>(json['morningWhy']),
      goalText: serializer.fromJson<String?>(json['goalText']),
      goalSource: serializer.fromJson<String?>(json['goalSource']),
      lineId: serializer.fromJson<String?>(json['lineId']),
      morningCompletedAt: serializer.fromJson<DateTime?>(
        json['morningCompletedAt'],
      ),
      eveningFeeling: serializer.fromJson<String?>(json['eveningFeeling']),
      eveningStrength: serializer.fromJson<String?>(json['eveningStrength']),
      eveningWhy: serializer.fromJson<String?>(json['eveningWhy']),
      goalOutcome: serializer.fromJson<String?>(json['goalOutcome']),
      goodKind: serializer.fromJson<String?>(json['goodKind']),
      goodText: serializer.fromJson<String?>(json['goodText']),
      eveningCompletedAt: serializer.fromJson<DateTime?>(
        json['eveningCompletedAt'],
      ),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'date': serializer.toJson<String>(date),
      'morningFeeling': serializer.toJson<String?>(morningFeeling),
      'morningStrength': serializer.toJson<String?>(morningStrength),
      'morningWhy': serializer.toJson<String?>(morningWhy),
      'goalText': serializer.toJson<String?>(goalText),
      'goalSource': serializer.toJson<String?>(goalSource),
      'lineId': serializer.toJson<String?>(lineId),
      'morningCompletedAt': serializer.toJson<DateTime?>(morningCompletedAt),
      'eveningFeeling': serializer.toJson<String?>(eveningFeeling),
      'eveningStrength': serializer.toJson<String?>(eveningStrength),
      'eveningWhy': serializer.toJson<String?>(eveningWhy),
      'goalOutcome': serializer.toJson<String?>(goalOutcome),
      'goodKind': serializer.toJson<String?>(goodKind),
      'goodText': serializer.toJson<String?>(goodText),
      'eveningCompletedAt': serializer.toJson<DateTime?>(eveningCompletedAt),
    };
  }

  Day copyWith({
    String? date,
    Value<String?> morningFeeling = const Value.absent(),
    Value<String?> morningStrength = const Value.absent(),
    Value<String?> morningWhy = const Value.absent(),
    Value<String?> goalText = const Value.absent(),
    Value<String?> goalSource = const Value.absent(),
    Value<String?> lineId = const Value.absent(),
    Value<DateTime?> morningCompletedAt = const Value.absent(),
    Value<String?> eveningFeeling = const Value.absent(),
    Value<String?> eveningStrength = const Value.absent(),
    Value<String?> eveningWhy = const Value.absent(),
    Value<String?> goalOutcome = const Value.absent(),
    Value<String?> goodKind = const Value.absent(),
    Value<String?> goodText = const Value.absent(),
    Value<DateTime?> eveningCompletedAt = const Value.absent(),
  }) => Day(
    date: date ?? this.date,
    morningFeeling: morningFeeling.present
        ? morningFeeling.value
        : this.morningFeeling,
    morningStrength: morningStrength.present
        ? morningStrength.value
        : this.morningStrength,
    morningWhy: morningWhy.present ? morningWhy.value : this.morningWhy,
    goalText: goalText.present ? goalText.value : this.goalText,
    goalSource: goalSource.present ? goalSource.value : this.goalSource,
    lineId: lineId.present ? lineId.value : this.lineId,
    morningCompletedAt: morningCompletedAt.present
        ? morningCompletedAt.value
        : this.morningCompletedAt,
    eveningFeeling: eveningFeeling.present
        ? eveningFeeling.value
        : this.eveningFeeling,
    eveningStrength: eveningStrength.present
        ? eveningStrength.value
        : this.eveningStrength,
    eveningWhy: eveningWhy.present ? eveningWhy.value : this.eveningWhy,
    goalOutcome: goalOutcome.present ? goalOutcome.value : this.goalOutcome,
    goodKind: goodKind.present ? goodKind.value : this.goodKind,
    goodText: goodText.present ? goodText.value : this.goodText,
    eveningCompletedAt: eveningCompletedAt.present
        ? eveningCompletedAt.value
        : this.eveningCompletedAt,
  );
  Day copyWithCompanion(DaysCompanion data) {
    return Day(
      date: data.date.present ? data.date.value : this.date,
      morningFeeling: data.morningFeeling.present
          ? data.morningFeeling.value
          : this.morningFeeling,
      morningStrength: data.morningStrength.present
          ? data.morningStrength.value
          : this.morningStrength,
      morningWhy: data.morningWhy.present
          ? data.morningWhy.value
          : this.morningWhy,
      goalText: data.goalText.present ? data.goalText.value : this.goalText,
      goalSource: data.goalSource.present
          ? data.goalSource.value
          : this.goalSource,
      lineId: data.lineId.present ? data.lineId.value : this.lineId,
      morningCompletedAt: data.morningCompletedAt.present
          ? data.morningCompletedAt.value
          : this.morningCompletedAt,
      eveningFeeling: data.eveningFeeling.present
          ? data.eveningFeeling.value
          : this.eveningFeeling,
      eveningStrength: data.eveningStrength.present
          ? data.eveningStrength.value
          : this.eveningStrength,
      eveningWhy: data.eveningWhy.present
          ? data.eveningWhy.value
          : this.eveningWhy,
      goalOutcome: data.goalOutcome.present
          ? data.goalOutcome.value
          : this.goalOutcome,
      goodKind: data.goodKind.present ? data.goodKind.value : this.goodKind,
      goodText: data.goodText.present ? data.goodText.value : this.goodText,
      eveningCompletedAt: data.eveningCompletedAt.present
          ? data.eveningCompletedAt.value
          : this.eveningCompletedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Day(')
          ..write('date: $date, ')
          ..write('morningFeeling: $morningFeeling, ')
          ..write('morningStrength: $morningStrength, ')
          ..write('morningWhy: $morningWhy, ')
          ..write('goalText: $goalText, ')
          ..write('goalSource: $goalSource, ')
          ..write('lineId: $lineId, ')
          ..write('morningCompletedAt: $morningCompletedAt, ')
          ..write('eveningFeeling: $eveningFeeling, ')
          ..write('eveningStrength: $eveningStrength, ')
          ..write('eveningWhy: $eveningWhy, ')
          ..write('goalOutcome: $goalOutcome, ')
          ..write('goodKind: $goodKind, ')
          ..write('goodText: $goodText, ')
          ..write('eveningCompletedAt: $eveningCompletedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    date,
    morningFeeling,
    morningStrength,
    morningWhy,
    goalText,
    goalSource,
    lineId,
    morningCompletedAt,
    eveningFeeling,
    eveningStrength,
    eveningWhy,
    goalOutcome,
    goodKind,
    goodText,
    eveningCompletedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Day &&
          other.date == this.date &&
          other.morningFeeling == this.morningFeeling &&
          other.morningStrength == this.morningStrength &&
          other.morningWhy == this.morningWhy &&
          other.goalText == this.goalText &&
          other.goalSource == this.goalSource &&
          other.lineId == this.lineId &&
          other.morningCompletedAt == this.morningCompletedAt &&
          other.eveningFeeling == this.eveningFeeling &&
          other.eveningStrength == this.eveningStrength &&
          other.eveningWhy == this.eveningWhy &&
          other.goalOutcome == this.goalOutcome &&
          other.goodKind == this.goodKind &&
          other.goodText == this.goodText &&
          other.eveningCompletedAt == this.eveningCompletedAt);
}

class DaysCompanion extends UpdateCompanion<Day> {
  final Value<String> date;
  final Value<String?> morningFeeling;
  final Value<String?> morningStrength;
  final Value<String?> morningWhy;
  final Value<String?> goalText;
  final Value<String?> goalSource;
  final Value<String?> lineId;
  final Value<DateTime?> morningCompletedAt;
  final Value<String?> eveningFeeling;
  final Value<String?> eveningStrength;
  final Value<String?> eveningWhy;
  final Value<String?> goalOutcome;
  final Value<String?> goodKind;
  final Value<String?> goodText;
  final Value<DateTime?> eveningCompletedAt;
  final Value<int> rowid;
  const DaysCompanion({
    this.date = const Value.absent(),
    this.morningFeeling = const Value.absent(),
    this.morningStrength = const Value.absent(),
    this.morningWhy = const Value.absent(),
    this.goalText = const Value.absent(),
    this.goalSource = const Value.absent(),
    this.lineId = const Value.absent(),
    this.morningCompletedAt = const Value.absent(),
    this.eveningFeeling = const Value.absent(),
    this.eveningStrength = const Value.absent(),
    this.eveningWhy = const Value.absent(),
    this.goalOutcome = const Value.absent(),
    this.goodKind = const Value.absent(),
    this.goodText = const Value.absent(),
    this.eveningCompletedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  DaysCompanion.insert({
    required String date,
    this.morningFeeling = const Value.absent(),
    this.morningStrength = const Value.absent(),
    this.morningWhy = const Value.absent(),
    this.goalText = const Value.absent(),
    this.goalSource = const Value.absent(),
    this.lineId = const Value.absent(),
    this.morningCompletedAt = const Value.absent(),
    this.eveningFeeling = const Value.absent(),
    this.eveningStrength = const Value.absent(),
    this.eveningWhy = const Value.absent(),
    this.goalOutcome = const Value.absent(),
    this.goodKind = const Value.absent(),
    this.goodText = const Value.absent(),
    this.eveningCompletedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : date = Value(date);
  static Insertable<Day> custom({
    Expression<String>? date,
    Expression<String>? morningFeeling,
    Expression<String>? morningStrength,
    Expression<String>? morningWhy,
    Expression<String>? goalText,
    Expression<String>? goalSource,
    Expression<String>? lineId,
    Expression<DateTime>? morningCompletedAt,
    Expression<String>? eveningFeeling,
    Expression<String>? eveningStrength,
    Expression<String>? eveningWhy,
    Expression<String>? goalOutcome,
    Expression<String>? goodKind,
    Expression<String>? goodText,
    Expression<DateTime>? eveningCompletedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (date != null) 'date': date,
      if (morningFeeling != null) 'morning_feeling': morningFeeling,
      if (morningStrength != null) 'morning_strength': morningStrength,
      if (morningWhy != null) 'morning_why': morningWhy,
      if (goalText != null) 'goal_text': goalText,
      if (goalSource != null) 'goal_source': goalSource,
      if (lineId != null) 'line_id': lineId,
      if (morningCompletedAt != null)
        'morning_completed_at': morningCompletedAt,
      if (eveningFeeling != null) 'evening_feeling': eveningFeeling,
      if (eveningStrength != null) 'evening_strength': eveningStrength,
      if (eveningWhy != null) 'evening_why': eveningWhy,
      if (goalOutcome != null) 'goal_outcome': goalOutcome,
      if (goodKind != null) 'good_kind': goodKind,
      if (goodText != null) 'good_text': goodText,
      if (eveningCompletedAt != null)
        'evening_completed_at': eveningCompletedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  DaysCompanion copyWith({
    Value<String>? date,
    Value<String?>? morningFeeling,
    Value<String?>? morningStrength,
    Value<String?>? morningWhy,
    Value<String?>? goalText,
    Value<String?>? goalSource,
    Value<String?>? lineId,
    Value<DateTime?>? morningCompletedAt,
    Value<String?>? eveningFeeling,
    Value<String?>? eveningStrength,
    Value<String?>? eveningWhy,
    Value<String?>? goalOutcome,
    Value<String?>? goodKind,
    Value<String?>? goodText,
    Value<DateTime?>? eveningCompletedAt,
    Value<int>? rowid,
  }) {
    return DaysCompanion(
      date: date ?? this.date,
      morningFeeling: morningFeeling ?? this.morningFeeling,
      morningStrength: morningStrength ?? this.morningStrength,
      morningWhy: morningWhy ?? this.morningWhy,
      goalText: goalText ?? this.goalText,
      goalSource: goalSource ?? this.goalSource,
      lineId: lineId ?? this.lineId,
      morningCompletedAt: morningCompletedAt ?? this.morningCompletedAt,
      eveningFeeling: eveningFeeling ?? this.eveningFeeling,
      eveningStrength: eveningStrength ?? this.eveningStrength,
      eveningWhy: eveningWhy ?? this.eveningWhy,
      goalOutcome: goalOutcome ?? this.goalOutcome,
      goodKind: goodKind ?? this.goodKind,
      goodText: goodText ?? this.goodText,
      eveningCompletedAt: eveningCompletedAt ?? this.eveningCompletedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (date.present) {
      map['date'] = Variable<String>(date.value);
    }
    if (morningFeeling.present) {
      map['morning_feeling'] = Variable<String>(morningFeeling.value);
    }
    if (morningStrength.present) {
      map['morning_strength'] = Variable<String>(morningStrength.value);
    }
    if (morningWhy.present) {
      map['morning_why'] = Variable<String>(morningWhy.value);
    }
    if (goalText.present) {
      map['goal_text'] = Variable<String>(goalText.value);
    }
    if (goalSource.present) {
      map['goal_source'] = Variable<String>(goalSource.value);
    }
    if (lineId.present) {
      map['line_id'] = Variable<String>(lineId.value);
    }
    if (morningCompletedAt.present) {
      map['morning_completed_at'] = Variable<DateTime>(
        morningCompletedAt.value,
      );
    }
    if (eveningFeeling.present) {
      map['evening_feeling'] = Variable<String>(eveningFeeling.value);
    }
    if (eveningStrength.present) {
      map['evening_strength'] = Variable<String>(eveningStrength.value);
    }
    if (eveningWhy.present) {
      map['evening_why'] = Variable<String>(eveningWhy.value);
    }
    if (goalOutcome.present) {
      map['goal_outcome'] = Variable<String>(goalOutcome.value);
    }
    if (goodKind.present) {
      map['good_kind'] = Variable<String>(goodKind.value);
    }
    if (goodText.present) {
      map['good_text'] = Variable<String>(goodText.value);
    }
    if (eveningCompletedAt.present) {
      map['evening_completed_at'] = Variable<DateTime>(
        eveningCompletedAt.value,
      );
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DaysCompanion(')
          ..write('date: $date, ')
          ..write('morningFeeling: $morningFeeling, ')
          ..write('morningStrength: $morningStrength, ')
          ..write('morningWhy: $morningWhy, ')
          ..write('goalText: $goalText, ')
          ..write('goalSource: $goalSource, ')
          ..write('lineId: $lineId, ')
          ..write('morningCompletedAt: $morningCompletedAt, ')
          ..write('eveningFeeling: $eveningFeeling, ')
          ..write('eveningStrength: $eveningStrength, ')
          ..write('eveningWhy: $eveningWhy, ')
          ..write('goalOutcome: $goalOutcome, ')
          ..write('goodKind: $goodKind, ')
          ..write('goodText: $goodText, ')
          ..write('eveningCompletedAt: $eveningCompletedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $LinesTable extends Lines with TableInfo<$LinesTable, LineRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $LinesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _bodyMeta = const VerificationMeta('body');
  @override
  late final GeneratedColumn<String> body = GeneratedColumn<String>(
    'body',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _sourceMeta = const VerificationMeta('source');
  @override
  late final GeneratedColumn<String> source = GeneratedColumn<String>(
    'source',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _authorMeta = const VerificationMeta('author');
  @override
  late final GeneratedColumn<String> author = GeneratedColumn<String>(
    'author',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _workMeta = const VerificationMeta('work');
  @override
  late final GeneratedColumn<String> work = GeneratedColumn<String>(
    'work',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _yearMeta = const VerificationMeta('year');
  @override
  late final GeneratedColumn<String> year = GeneratedColumn<String>(
    'year',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _checkedSourceMeta = const VerificationMeta(
    'checkedSource',
  );
  @override
  late final GeneratedColumn<String> checkedSource = GeneratedColumn<String>(
    'checked_source',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _favouriteMeta = const VerificationMeta(
    'favourite',
  );
  @override
  late final GeneratedColumn<bool> favourite = GeneratedColumn<bool>(
    'favourite',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("favourite" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    body,
    source,
    author,
    work,
    year,
    checkedSource,
    favourite,
    createdAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'lines';
  @override
  VerificationContext validateIntegrity(
    Insertable<LineRow> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('body')) {
      context.handle(
        _bodyMeta,
        body.isAcceptableOrUnknown(data['body']!, _bodyMeta),
      );
    } else if (isInserting) {
      context.missing(_bodyMeta);
    }
    if (data.containsKey('source')) {
      context.handle(
        _sourceMeta,
        source.isAcceptableOrUnknown(data['source']!, _sourceMeta),
      );
    } else if (isInserting) {
      context.missing(_sourceMeta);
    }
    if (data.containsKey('author')) {
      context.handle(
        _authorMeta,
        author.isAcceptableOrUnknown(data['author']!, _authorMeta),
      );
    }
    if (data.containsKey('work')) {
      context.handle(
        _workMeta,
        work.isAcceptableOrUnknown(data['work']!, _workMeta),
      );
    }
    if (data.containsKey('year')) {
      context.handle(
        _yearMeta,
        year.isAcceptableOrUnknown(data['year']!, _yearMeta),
      );
    }
    if (data.containsKey('checked_source')) {
      context.handle(
        _checkedSourceMeta,
        checkedSource.isAcceptableOrUnknown(
          data['checked_source']!,
          _checkedSourceMeta,
        ),
      );
    }
    if (data.containsKey('favourite')) {
      context.handle(
        _favouriteMeta,
        favourite.isAcceptableOrUnknown(data['favourite']!, _favouriteMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  LineRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return LineRow(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      body: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}body'],
      )!,
      source: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}source'],
      )!,
      author: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}author'],
      ),
      work: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}work'],
      ),
      year: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}year'],
      ),
      checkedSource: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}checked_source'],
      ),
      favourite: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}favourite'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
    );
  }

  @override
  $LinesTable createAlias(String alias) {
    return $LinesTable(attachedDatabase, alias);
  }
}

class LineRow extends DataClass implements Insertable<LineRow> {
  final String id;
  final String body;
  final String source;
  final String? author;
  final String? work;
  final String? year;
  final String? checkedSource;
  final bool favourite;
  final DateTime createdAt;
  const LineRow({
    required this.id,
    required this.body,
    required this.source,
    this.author,
    this.work,
    this.year,
    this.checkedSource,
    required this.favourite,
    required this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['body'] = Variable<String>(body);
    map['source'] = Variable<String>(source);
    if (!nullToAbsent || author != null) {
      map['author'] = Variable<String>(author);
    }
    if (!nullToAbsent || work != null) {
      map['work'] = Variable<String>(work);
    }
    if (!nullToAbsent || year != null) {
      map['year'] = Variable<String>(year);
    }
    if (!nullToAbsent || checkedSource != null) {
      map['checked_source'] = Variable<String>(checkedSource);
    }
    map['favourite'] = Variable<bool>(favourite);
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  LinesCompanion toCompanion(bool nullToAbsent) {
    return LinesCompanion(
      id: Value(id),
      body: Value(body),
      source: Value(source),
      author: author == null && nullToAbsent
          ? const Value.absent()
          : Value(author),
      work: work == null && nullToAbsent ? const Value.absent() : Value(work),
      year: year == null && nullToAbsent ? const Value.absent() : Value(year),
      checkedSource: checkedSource == null && nullToAbsent
          ? const Value.absent()
          : Value(checkedSource),
      favourite: Value(favourite),
      createdAt: Value(createdAt),
    );
  }

  factory LineRow.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return LineRow(
      id: serializer.fromJson<String>(json['id']),
      body: serializer.fromJson<String>(json['body']),
      source: serializer.fromJson<String>(json['source']),
      author: serializer.fromJson<String?>(json['author']),
      work: serializer.fromJson<String?>(json['work']),
      year: serializer.fromJson<String?>(json['year']),
      checkedSource: serializer.fromJson<String?>(json['checkedSource']),
      favourite: serializer.fromJson<bool>(json['favourite']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'body': serializer.toJson<String>(body),
      'source': serializer.toJson<String>(source),
      'author': serializer.toJson<String?>(author),
      'work': serializer.toJson<String?>(work),
      'year': serializer.toJson<String?>(year),
      'checkedSource': serializer.toJson<String?>(checkedSource),
      'favourite': serializer.toJson<bool>(favourite),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  LineRow copyWith({
    String? id,
    String? body,
    String? source,
    Value<String?> author = const Value.absent(),
    Value<String?> work = const Value.absent(),
    Value<String?> year = const Value.absent(),
    Value<String?> checkedSource = const Value.absent(),
    bool? favourite,
    DateTime? createdAt,
  }) => LineRow(
    id: id ?? this.id,
    body: body ?? this.body,
    source: source ?? this.source,
    author: author.present ? author.value : this.author,
    work: work.present ? work.value : this.work,
    year: year.present ? year.value : this.year,
    checkedSource: checkedSource.present
        ? checkedSource.value
        : this.checkedSource,
    favourite: favourite ?? this.favourite,
    createdAt: createdAt ?? this.createdAt,
  );
  LineRow copyWithCompanion(LinesCompanion data) {
    return LineRow(
      id: data.id.present ? data.id.value : this.id,
      body: data.body.present ? data.body.value : this.body,
      source: data.source.present ? data.source.value : this.source,
      author: data.author.present ? data.author.value : this.author,
      work: data.work.present ? data.work.value : this.work,
      year: data.year.present ? data.year.value : this.year,
      checkedSource: data.checkedSource.present
          ? data.checkedSource.value
          : this.checkedSource,
      favourite: data.favourite.present ? data.favourite.value : this.favourite,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('LineRow(')
          ..write('id: $id, ')
          ..write('body: $body, ')
          ..write('source: $source, ')
          ..write('author: $author, ')
          ..write('work: $work, ')
          ..write('year: $year, ')
          ..write('checkedSource: $checkedSource, ')
          ..write('favourite: $favourite, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    body,
    source,
    author,
    work,
    year,
    checkedSource,
    favourite,
    createdAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is LineRow &&
          other.id == this.id &&
          other.body == this.body &&
          other.source == this.source &&
          other.author == this.author &&
          other.work == this.work &&
          other.year == this.year &&
          other.checkedSource == this.checkedSource &&
          other.favourite == this.favourite &&
          other.createdAt == this.createdAt);
}

class LinesCompanion extends UpdateCompanion<LineRow> {
  final Value<String> id;
  final Value<String> body;
  final Value<String> source;
  final Value<String?> author;
  final Value<String?> work;
  final Value<String?> year;
  final Value<String?> checkedSource;
  final Value<bool> favourite;
  final Value<DateTime> createdAt;
  final Value<int> rowid;
  const LinesCompanion({
    this.id = const Value.absent(),
    this.body = const Value.absent(),
    this.source = const Value.absent(),
    this.author = const Value.absent(),
    this.work = const Value.absent(),
    this.year = const Value.absent(),
    this.checkedSource = const Value.absent(),
    this.favourite = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  LinesCompanion.insert({
    required String id,
    required String body,
    required String source,
    this.author = const Value.absent(),
    this.work = const Value.absent(),
    this.year = const Value.absent(),
    this.checkedSource = const Value.absent(),
    this.favourite = const Value.absent(),
    required DateTime createdAt,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       body = Value(body),
       source = Value(source),
       createdAt = Value(createdAt);
  static Insertable<LineRow> custom({
    Expression<String>? id,
    Expression<String>? body,
    Expression<String>? source,
    Expression<String>? author,
    Expression<String>? work,
    Expression<String>? year,
    Expression<String>? checkedSource,
    Expression<bool>? favourite,
    Expression<DateTime>? createdAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (body != null) 'body': body,
      if (source != null) 'source': source,
      if (author != null) 'author': author,
      if (work != null) 'work': work,
      if (year != null) 'year': year,
      if (checkedSource != null) 'checked_source': checkedSource,
      if (favourite != null) 'favourite': favourite,
      if (createdAt != null) 'created_at': createdAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  LinesCompanion copyWith({
    Value<String>? id,
    Value<String>? body,
    Value<String>? source,
    Value<String?>? author,
    Value<String?>? work,
    Value<String?>? year,
    Value<String?>? checkedSource,
    Value<bool>? favourite,
    Value<DateTime>? createdAt,
    Value<int>? rowid,
  }) {
    return LinesCompanion(
      id: id ?? this.id,
      body: body ?? this.body,
      source: source ?? this.source,
      author: author ?? this.author,
      work: work ?? this.work,
      year: year ?? this.year,
      checkedSource: checkedSource ?? this.checkedSource,
      favourite: favourite ?? this.favourite,
      createdAt: createdAt ?? this.createdAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (body.present) {
      map['body'] = Variable<String>(body.value);
    }
    if (source.present) {
      map['source'] = Variable<String>(source.value);
    }
    if (author.present) {
      map['author'] = Variable<String>(author.value);
    }
    if (work.present) {
      map['work'] = Variable<String>(work.value);
    }
    if (year.present) {
      map['year'] = Variable<String>(year.value);
    }
    if (checkedSource.present) {
      map['checked_source'] = Variable<String>(checkedSource.value);
    }
    if (favourite.present) {
      map['favourite'] = Variable<bool>(favourite.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('LinesCompanion(')
          ..write('id: $id, ')
          ..write('body: $body, ')
          ..write('source: $source, ')
          ..write('author: $author, ')
          ..write('work: $work, ')
          ..write('year: $year, ')
          ..write('checkedSource: $checkedSource, ')
          ..write('favourite: $favourite, ')
          ..write('createdAt: $createdAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $NotesTable extends Notes with TableInfo<$NotesTable, NoteRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $NotesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _dayDateMeta = const VerificationMeta(
    'dayDate',
  );
  @override
  late final GeneratedColumn<String> dayDate = GeneratedColumn<String>(
    'day_date',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _authorMeta = const VerificationMeta('author');
  @override
  late final GeneratedColumn<String> author = GeneratedColumn<String>(
    'author',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _bodyMeta = const VerificationMeta('body');
  @override
  late final GeneratedColumn<String> body = GeneratedColumn<String>(
    'body',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [dayDate, author, body];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'notes';
  @override
  VerificationContext validateIntegrity(
    Insertable<NoteRow> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('day_date')) {
      context.handle(
        _dayDateMeta,
        dayDate.isAcceptableOrUnknown(data['day_date']!, _dayDateMeta),
      );
    } else if (isInserting) {
      context.missing(_dayDateMeta);
    }
    if (data.containsKey('author')) {
      context.handle(
        _authorMeta,
        author.isAcceptableOrUnknown(data['author']!, _authorMeta),
      );
    } else if (isInserting) {
      context.missing(_authorMeta);
    }
    if (data.containsKey('body')) {
      context.handle(
        _bodyMeta,
        body.isAcceptableOrUnknown(data['body']!, _bodyMeta),
      );
    } else if (isInserting) {
      context.missing(_bodyMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {dayDate, author};
  @override
  NoteRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return NoteRow(
      dayDate: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}day_date'],
      )!,
      author: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}author'],
      )!,
      body: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}body'],
      )!,
    );
  }

  @override
  $NotesTable createAlias(String alias) {
    return $NotesTable(attachedDatabase, alias);
  }
}

class NoteRow extends DataClass implements Insertable<NoteRow> {
  final String dayDate;
  final String author;
  final String body;
  const NoteRow({
    required this.dayDate,
    required this.author,
    required this.body,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['day_date'] = Variable<String>(dayDate);
    map['author'] = Variable<String>(author);
    map['body'] = Variable<String>(body);
    return map;
  }

  NotesCompanion toCompanion(bool nullToAbsent) {
    return NotesCompanion(
      dayDate: Value(dayDate),
      author: Value(author),
      body: Value(body),
    );
  }

  factory NoteRow.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return NoteRow(
      dayDate: serializer.fromJson<String>(json['dayDate']),
      author: serializer.fromJson<String>(json['author']),
      body: serializer.fromJson<String>(json['body']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'dayDate': serializer.toJson<String>(dayDate),
      'author': serializer.toJson<String>(author),
      'body': serializer.toJson<String>(body),
    };
  }

  NoteRow copyWith({String? dayDate, String? author, String? body}) => NoteRow(
    dayDate: dayDate ?? this.dayDate,
    author: author ?? this.author,
    body: body ?? this.body,
  );
  NoteRow copyWithCompanion(NotesCompanion data) {
    return NoteRow(
      dayDate: data.dayDate.present ? data.dayDate.value : this.dayDate,
      author: data.author.present ? data.author.value : this.author,
      body: data.body.present ? data.body.value : this.body,
    );
  }

  @override
  String toString() {
    return (StringBuffer('NoteRow(')
          ..write('dayDate: $dayDate, ')
          ..write('author: $author, ')
          ..write('body: $body')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(dayDate, author, body);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is NoteRow &&
          other.dayDate == this.dayDate &&
          other.author == this.author &&
          other.body == this.body);
}

class NotesCompanion extends UpdateCompanion<NoteRow> {
  final Value<String> dayDate;
  final Value<String> author;
  final Value<String> body;
  final Value<int> rowid;
  const NotesCompanion({
    this.dayDate = const Value.absent(),
    this.author = const Value.absent(),
    this.body = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  NotesCompanion.insert({
    required String dayDate,
    required String author,
    required String body,
    this.rowid = const Value.absent(),
  }) : dayDate = Value(dayDate),
       author = Value(author),
       body = Value(body);
  static Insertable<NoteRow> custom({
    Expression<String>? dayDate,
    Expression<String>? author,
    Expression<String>? body,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (dayDate != null) 'day_date': dayDate,
      if (author != null) 'author': author,
      if (body != null) 'body': body,
      if (rowid != null) 'rowid': rowid,
    });
  }

  NotesCompanion copyWith({
    Value<String>? dayDate,
    Value<String>? author,
    Value<String>? body,
    Value<int>? rowid,
  }) {
    return NotesCompanion(
      dayDate: dayDate ?? this.dayDate,
      author: author ?? this.author,
      body: body ?? this.body,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (dayDate.present) {
      map['day_date'] = Variable<String>(dayDate.value);
    }
    if (author.present) {
      map['author'] = Variable<String>(author.value);
    }
    if (body.present) {
      map['body'] = Variable<String>(body.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('NotesCompanion(')
          ..write('dayDate: $dayDate, ')
          ..write('author: $author, ')
          ..write('body: $body, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $SteadySessionsTable extends SteadySessions
    with TableInfo<$SteadySessionsTable, SteadySession> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SteadySessionsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _kindMeta = const VerificationMeta('kind');
  @override
  late final GeneratedColumn<String> kind = GeneratedColumn<String>(
    'kind',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _lengthMinutesMeta = const VerificationMeta(
    'lengthMinutes',
  );
  @override
  late final GeneratedColumn<int> lengthMinutes = GeneratedColumn<int>(
    'length_minutes',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _startedAtMeta = const VerificationMeta(
    'startedAt',
  );
  @override
  late final GeneratedColumn<DateTime> startedAt = GeneratedColumn<DateTime>(
    'started_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _completedMeta = const VerificationMeta(
    'completed',
  );
  @override
  late final GeneratedColumn<bool> completed = GeneratedColumn<bool>(
    'completed',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("completed" IN (0, 1))',
    ),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    kind,
    lengthMinutes,
    startedAt,
    completed,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'steady_sessions';
  @override
  VerificationContext validateIntegrity(
    Insertable<SteadySession> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('kind')) {
      context.handle(
        _kindMeta,
        kind.isAcceptableOrUnknown(data['kind']!, _kindMeta),
      );
    } else if (isInserting) {
      context.missing(_kindMeta);
    }
    if (data.containsKey('length_minutes')) {
      context.handle(
        _lengthMinutesMeta,
        lengthMinutes.isAcceptableOrUnknown(
          data['length_minutes']!,
          _lengthMinutesMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_lengthMinutesMeta);
    }
    if (data.containsKey('started_at')) {
      context.handle(
        _startedAtMeta,
        startedAt.isAcceptableOrUnknown(data['started_at']!, _startedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_startedAtMeta);
    }
    if (data.containsKey('completed')) {
      context.handle(
        _completedMeta,
        completed.isAcceptableOrUnknown(data['completed']!, _completedMeta),
      );
    } else if (isInserting) {
      context.missing(_completedMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  SteadySession map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return SteadySession(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      kind: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}kind'],
      )!,
      lengthMinutes: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}length_minutes'],
      )!,
      startedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}started_at'],
      )!,
      completed: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}completed'],
      )!,
    );
  }

  @override
  $SteadySessionsTable createAlias(String alias) {
    return $SteadySessionsTable(attachedDatabase, alias);
  }
}

class SteadySession extends DataClass implements Insertable<SteadySession> {
  final int id;
  final String kind;
  final int lengthMinutes;
  final DateTime startedAt;
  final bool completed;
  const SteadySession({
    required this.id,
    required this.kind,
    required this.lengthMinutes,
    required this.startedAt,
    required this.completed,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['kind'] = Variable<String>(kind);
    map['length_minutes'] = Variable<int>(lengthMinutes);
    map['started_at'] = Variable<DateTime>(startedAt);
    map['completed'] = Variable<bool>(completed);
    return map;
  }

  SteadySessionsCompanion toCompanion(bool nullToAbsent) {
    return SteadySessionsCompanion(
      id: Value(id),
      kind: Value(kind),
      lengthMinutes: Value(lengthMinutes),
      startedAt: Value(startedAt),
      completed: Value(completed),
    );
  }

  factory SteadySession.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return SteadySession(
      id: serializer.fromJson<int>(json['id']),
      kind: serializer.fromJson<String>(json['kind']),
      lengthMinutes: serializer.fromJson<int>(json['lengthMinutes']),
      startedAt: serializer.fromJson<DateTime>(json['startedAt']),
      completed: serializer.fromJson<bool>(json['completed']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'kind': serializer.toJson<String>(kind),
      'lengthMinutes': serializer.toJson<int>(lengthMinutes),
      'startedAt': serializer.toJson<DateTime>(startedAt),
      'completed': serializer.toJson<bool>(completed),
    };
  }

  SteadySession copyWith({
    int? id,
    String? kind,
    int? lengthMinutes,
    DateTime? startedAt,
    bool? completed,
  }) => SteadySession(
    id: id ?? this.id,
    kind: kind ?? this.kind,
    lengthMinutes: lengthMinutes ?? this.lengthMinutes,
    startedAt: startedAt ?? this.startedAt,
    completed: completed ?? this.completed,
  );
  SteadySession copyWithCompanion(SteadySessionsCompanion data) {
    return SteadySession(
      id: data.id.present ? data.id.value : this.id,
      kind: data.kind.present ? data.kind.value : this.kind,
      lengthMinutes: data.lengthMinutes.present
          ? data.lengthMinutes.value
          : this.lengthMinutes,
      startedAt: data.startedAt.present ? data.startedAt.value : this.startedAt,
      completed: data.completed.present ? data.completed.value : this.completed,
    );
  }

  @override
  String toString() {
    return (StringBuffer('SteadySession(')
          ..write('id: $id, ')
          ..write('kind: $kind, ')
          ..write('lengthMinutes: $lengthMinutes, ')
          ..write('startedAt: $startedAt, ')
          ..write('completed: $completed')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, kind, lengthMinutes, startedAt, completed);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SteadySession &&
          other.id == this.id &&
          other.kind == this.kind &&
          other.lengthMinutes == this.lengthMinutes &&
          other.startedAt == this.startedAt &&
          other.completed == this.completed);
}

class SteadySessionsCompanion extends UpdateCompanion<SteadySession> {
  final Value<int> id;
  final Value<String> kind;
  final Value<int> lengthMinutes;
  final Value<DateTime> startedAt;
  final Value<bool> completed;
  const SteadySessionsCompanion({
    this.id = const Value.absent(),
    this.kind = const Value.absent(),
    this.lengthMinutes = const Value.absent(),
    this.startedAt = const Value.absent(),
    this.completed = const Value.absent(),
  });
  SteadySessionsCompanion.insert({
    this.id = const Value.absent(),
    required String kind,
    required int lengthMinutes,
    required DateTime startedAt,
    required bool completed,
  }) : kind = Value(kind),
       lengthMinutes = Value(lengthMinutes),
       startedAt = Value(startedAt),
       completed = Value(completed);
  static Insertable<SteadySession> custom({
    Expression<int>? id,
    Expression<String>? kind,
    Expression<int>? lengthMinutes,
    Expression<DateTime>? startedAt,
    Expression<bool>? completed,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (kind != null) 'kind': kind,
      if (lengthMinutes != null) 'length_minutes': lengthMinutes,
      if (startedAt != null) 'started_at': startedAt,
      if (completed != null) 'completed': completed,
    });
  }

  SteadySessionsCompanion copyWith({
    Value<int>? id,
    Value<String>? kind,
    Value<int>? lengthMinutes,
    Value<DateTime>? startedAt,
    Value<bool>? completed,
  }) {
    return SteadySessionsCompanion(
      id: id ?? this.id,
      kind: kind ?? this.kind,
      lengthMinutes: lengthMinutes ?? this.lengthMinutes,
      startedAt: startedAt ?? this.startedAt,
      completed: completed ?? this.completed,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (kind.present) {
      map['kind'] = Variable<String>(kind.value);
    }
    if (lengthMinutes.present) {
      map['length_minutes'] = Variable<int>(lengthMinutes.value);
    }
    if (startedAt.present) {
      map['started_at'] = Variable<DateTime>(startedAt.value);
    }
    if (completed.present) {
      map['completed'] = Variable<bool>(completed.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SteadySessionsCompanion(')
          ..write('id: $id, ')
          ..write('kind: $kind, ')
          ..write('lengthMinutes: $lengthMinutes, ')
          ..write('startedAt: $startedAt, ')
          ..write('completed: $completed')
          ..write(')'))
        .toString();
  }
}

class $SettingsRowsTable extends SettingsRows
    with TableInfo<$SettingsRowsTable, SettingsRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SettingsRowsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _morningMinutesMeta = const VerificationMeta(
    'morningMinutes',
  );
  @override
  late final GeneratedColumn<int> morningMinutes = GeneratedColumn<int>(
    'morning_minutes',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _eveningMinutesMeta = const VerificationMeta(
    'eveningMinutes',
  );
  @override
  late final GeneratedColumn<int> eveningMinutes = GeneratedColumn<int>(
    'evening_minutes',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _morningReminderOnMeta = const VerificationMeta(
    'morningReminderOn',
  );
  @override
  late final GeneratedColumn<bool> morningReminderOn = GeneratedColumn<bool>(
    'morning_reminder_on',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("morning_reminder_on" IN (0, 1))',
    ),
  );
  static const VerificationMeta _eveningReminderOnMeta = const VerificationMeta(
    'eveningReminderOn',
  );
  @override
  late final GeneratedColumn<bool> eveningReminderOn = GeneratedColumn<bool>(
    'evening_reminder_on',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("evening_reminder_on" IN (0, 1))',
    ),
  );
  static const VerificationMeta _hapticsMeta = const VerificationMeta(
    'haptics',
  );
  @override
  late final GeneratedColumn<bool> haptics = GeneratedColumn<bool>(
    'haptics',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("haptics" IN (0, 1))',
    ),
  );
  static const VerificationMeta _reducedMotionMeta = const VerificationMeta(
    'reducedMotion',
  );
  @override
  late final GeneratedColumn<String> reducedMotion = GeneratedColumn<String>(
    'reduced_motion',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _hiddenFeelingsMeta = const VerificationMeta(
    'hiddenFeelings',
  );
  @override
  late final GeneratedColumn<String> hiddenFeelings = GeneratedColumn<String>(
    'hidden_feelings',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _useMyLinesMeta = const VerificationMeta(
    'useMyLines',
  );
  @override
  late final GeneratedColumn<bool> useMyLines = GeneratedColumn<bool>(
    'use_my_lines',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("use_my_lines" IN (0, 1))',
    ),
  );
  static const VerificationMeta _firstRunDoneMeta = const VerificationMeta(
    'firstRunDone',
  );
  @override
  late final GeneratedColumn<bool> firstRunDone = GeneratedColumn<bool>(
    'first_run_done',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("first_run_done" IN (0, 1))',
    ),
  );
  static const VerificationMeta _firstNameMeta = const VerificationMeta(
    'firstName',
  );
  @override
  late final GeneratedColumn<String> firstName = GeneratedColumn<String>(
    'first_name',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    morningMinutes,
    eveningMinutes,
    morningReminderOn,
    eveningReminderOn,
    haptics,
    reducedMotion,
    hiddenFeelings,
    useMyLines,
    firstRunDone,
    firstName,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'settings_rows';
  @override
  VerificationContext validateIntegrity(
    Insertable<SettingsRow> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('morning_minutes')) {
      context.handle(
        _morningMinutesMeta,
        morningMinutes.isAcceptableOrUnknown(
          data['morning_minutes']!,
          _morningMinutesMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_morningMinutesMeta);
    }
    if (data.containsKey('evening_minutes')) {
      context.handle(
        _eveningMinutesMeta,
        eveningMinutes.isAcceptableOrUnknown(
          data['evening_minutes']!,
          _eveningMinutesMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_eveningMinutesMeta);
    }
    if (data.containsKey('morning_reminder_on')) {
      context.handle(
        _morningReminderOnMeta,
        morningReminderOn.isAcceptableOrUnknown(
          data['morning_reminder_on']!,
          _morningReminderOnMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_morningReminderOnMeta);
    }
    if (data.containsKey('evening_reminder_on')) {
      context.handle(
        _eveningReminderOnMeta,
        eveningReminderOn.isAcceptableOrUnknown(
          data['evening_reminder_on']!,
          _eveningReminderOnMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_eveningReminderOnMeta);
    }
    if (data.containsKey('haptics')) {
      context.handle(
        _hapticsMeta,
        haptics.isAcceptableOrUnknown(data['haptics']!, _hapticsMeta),
      );
    } else if (isInserting) {
      context.missing(_hapticsMeta);
    }
    if (data.containsKey('reduced_motion')) {
      context.handle(
        _reducedMotionMeta,
        reducedMotion.isAcceptableOrUnknown(
          data['reduced_motion']!,
          _reducedMotionMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_reducedMotionMeta);
    }
    if (data.containsKey('hidden_feelings')) {
      context.handle(
        _hiddenFeelingsMeta,
        hiddenFeelings.isAcceptableOrUnknown(
          data['hidden_feelings']!,
          _hiddenFeelingsMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_hiddenFeelingsMeta);
    }
    if (data.containsKey('use_my_lines')) {
      context.handle(
        _useMyLinesMeta,
        useMyLines.isAcceptableOrUnknown(
          data['use_my_lines']!,
          _useMyLinesMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_useMyLinesMeta);
    }
    if (data.containsKey('first_run_done')) {
      context.handle(
        _firstRunDoneMeta,
        firstRunDone.isAcceptableOrUnknown(
          data['first_run_done']!,
          _firstRunDoneMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_firstRunDoneMeta);
    }
    if (data.containsKey('first_name')) {
      context.handle(
        _firstNameMeta,
        firstName.isAcceptableOrUnknown(data['first_name']!, _firstNameMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  SettingsRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return SettingsRow(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      morningMinutes: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}morning_minutes'],
      )!,
      eveningMinutes: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}evening_minutes'],
      )!,
      morningReminderOn: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}morning_reminder_on'],
      )!,
      eveningReminderOn: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}evening_reminder_on'],
      )!,
      haptics: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}haptics'],
      )!,
      reducedMotion: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}reduced_motion'],
      )!,
      hiddenFeelings: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}hidden_feelings'],
      )!,
      useMyLines: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}use_my_lines'],
      )!,
      firstRunDone: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}first_run_done'],
      )!,
      firstName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}first_name'],
      ),
    );
  }

  @override
  $SettingsRowsTable createAlias(String alias) {
    return $SettingsRowsTable(attachedDatabase, alias);
  }
}

class SettingsRow extends DataClass implements Insertable<SettingsRow> {
  final int id;
  final int morningMinutes;
  final int eveningMinutes;
  final bool morningReminderOn;
  final bool eveningReminderOn;
  final bool haptics;
  final String reducedMotion;

  /// Comma-separated feeling names.
  final String hiddenFeelings;
  final bool useMyLines;
  final bool firstRunDone;
  final String? firstName;
  const SettingsRow({
    required this.id,
    required this.morningMinutes,
    required this.eveningMinutes,
    required this.morningReminderOn,
    required this.eveningReminderOn,
    required this.haptics,
    required this.reducedMotion,
    required this.hiddenFeelings,
    required this.useMyLines,
    required this.firstRunDone,
    this.firstName,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['morning_minutes'] = Variable<int>(morningMinutes);
    map['evening_minutes'] = Variable<int>(eveningMinutes);
    map['morning_reminder_on'] = Variable<bool>(morningReminderOn);
    map['evening_reminder_on'] = Variable<bool>(eveningReminderOn);
    map['haptics'] = Variable<bool>(haptics);
    map['reduced_motion'] = Variable<String>(reducedMotion);
    map['hidden_feelings'] = Variable<String>(hiddenFeelings);
    map['use_my_lines'] = Variable<bool>(useMyLines);
    map['first_run_done'] = Variable<bool>(firstRunDone);
    if (!nullToAbsent || firstName != null) {
      map['first_name'] = Variable<String>(firstName);
    }
    return map;
  }

  SettingsRowsCompanion toCompanion(bool nullToAbsent) {
    return SettingsRowsCompanion(
      id: Value(id),
      morningMinutes: Value(morningMinutes),
      eveningMinutes: Value(eveningMinutes),
      morningReminderOn: Value(morningReminderOn),
      eveningReminderOn: Value(eveningReminderOn),
      haptics: Value(haptics),
      reducedMotion: Value(reducedMotion),
      hiddenFeelings: Value(hiddenFeelings),
      useMyLines: Value(useMyLines),
      firstRunDone: Value(firstRunDone),
      firstName: firstName == null && nullToAbsent
          ? const Value.absent()
          : Value(firstName),
    );
  }

  factory SettingsRow.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return SettingsRow(
      id: serializer.fromJson<int>(json['id']),
      morningMinutes: serializer.fromJson<int>(json['morningMinutes']),
      eveningMinutes: serializer.fromJson<int>(json['eveningMinutes']),
      morningReminderOn: serializer.fromJson<bool>(json['morningReminderOn']),
      eveningReminderOn: serializer.fromJson<bool>(json['eveningReminderOn']),
      haptics: serializer.fromJson<bool>(json['haptics']),
      reducedMotion: serializer.fromJson<String>(json['reducedMotion']),
      hiddenFeelings: serializer.fromJson<String>(json['hiddenFeelings']),
      useMyLines: serializer.fromJson<bool>(json['useMyLines']),
      firstRunDone: serializer.fromJson<bool>(json['firstRunDone']),
      firstName: serializer.fromJson<String?>(json['firstName']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'morningMinutes': serializer.toJson<int>(morningMinutes),
      'eveningMinutes': serializer.toJson<int>(eveningMinutes),
      'morningReminderOn': serializer.toJson<bool>(morningReminderOn),
      'eveningReminderOn': serializer.toJson<bool>(eveningReminderOn),
      'haptics': serializer.toJson<bool>(haptics),
      'reducedMotion': serializer.toJson<String>(reducedMotion),
      'hiddenFeelings': serializer.toJson<String>(hiddenFeelings),
      'useMyLines': serializer.toJson<bool>(useMyLines),
      'firstRunDone': serializer.toJson<bool>(firstRunDone),
      'firstName': serializer.toJson<String?>(firstName),
    };
  }

  SettingsRow copyWith({
    int? id,
    int? morningMinutes,
    int? eveningMinutes,
    bool? morningReminderOn,
    bool? eveningReminderOn,
    bool? haptics,
    String? reducedMotion,
    String? hiddenFeelings,
    bool? useMyLines,
    bool? firstRunDone,
    Value<String?> firstName = const Value.absent(),
  }) => SettingsRow(
    id: id ?? this.id,
    morningMinutes: morningMinutes ?? this.morningMinutes,
    eveningMinutes: eveningMinutes ?? this.eveningMinutes,
    morningReminderOn: morningReminderOn ?? this.morningReminderOn,
    eveningReminderOn: eveningReminderOn ?? this.eveningReminderOn,
    haptics: haptics ?? this.haptics,
    reducedMotion: reducedMotion ?? this.reducedMotion,
    hiddenFeelings: hiddenFeelings ?? this.hiddenFeelings,
    useMyLines: useMyLines ?? this.useMyLines,
    firstRunDone: firstRunDone ?? this.firstRunDone,
    firstName: firstName.present ? firstName.value : this.firstName,
  );
  SettingsRow copyWithCompanion(SettingsRowsCompanion data) {
    return SettingsRow(
      id: data.id.present ? data.id.value : this.id,
      morningMinutes: data.morningMinutes.present
          ? data.morningMinutes.value
          : this.morningMinutes,
      eveningMinutes: data.eveningMinutes.present
          ? data.eveningMinutes.value
          : this.eveningMinutes,
      morningReminderOn: data.morningReminderOn.present
          ? data.morningReminderOn.value
          : this.morningReminderOn,
      eveningReminderOn: data.eveningReminderOn.present
          ? data.eveningReminderOn.value
          : this.eveningReminderOn,
      haptics: data.haptics.present ? data.haptics.value : this.haptics,
      reducedMotion: data.reducedMotion.present
          ? data.reducedMotion.value
          : this.reducedMotion,
      hiddenFeelings: data.hiddenFeelings.present
          ? data.hiddenFeelings.value
          : this.hiddenFeelings,
      useMyLines: data.useMyLines.present
          ? data.useMyLines.value
          : this.useMyLines,
      firstRunDone: data.firstRunDone.present
          ? data.firstRunDone.value
          : this.firstRunDone,
      firstName: data.firstName.present ? data.firstName.value : this.firstName,
    );
  }

  @override
  String toString() {
    return (StringBuffer('SettingsRow(')
          ..write('id: $id, ')
          ..write('morningMinutes: $morningMinutes, ')
          ..write('eveningMinutes: $eveningMinutes, ')
          ..write('morningReminderOn: $morningReminderOn, ')
          ..write('eveningReminderOn: $eveningReminderOn, ')
          ..write('haptics: $haptics, ')
          ..write('reducedMotion: $reducedMotion, ')
          ..write('hiddenFeelings: $hiddenFeelings, ')
          ..write('useMyLines: $useMyLines, ')
          ..write('firstRunDone: $firstRunDone, ')
          ..write('firstName: $firstName')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    morningMinutes,
    eveningMinutes,
    morningReminderOn,
    eveningReminderOn,
    haptics,
    reducedMotion,
    hiddenFeelings,
    useMyLines,
    firstRunDone,
    firstName,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SettingsRow &&
          other.id == this.id &&
          other.morningMinutes == this.morningMinutes &&
          other.eveningMinutes == this.eveningMinutes &&
          other.morningReminderOn == this.morningReminderOn &&
          other.eveningReminderOn == this.eveningReminderOn &&
          other.haptics == this.haptics &&
          other.reducedMotion == this.reducedMotion &&
          other.hiddenFeelings == this.hiddenFeelings &&
          other.useMyLines == this.useMyLines &&
          other.firstRunDone == this.firstRunDone &&
          other.firstName == this.firstName);
}

class SettingsRowsCompanion extends UpdateCompanion<SettingsRow> {
  final Value<int> id;
  final Value<int> morningMinutes;
  final Value<int> eveningMinutes;
  final Value<bool> morningReminderOn;
  final Value<bool> eveningReminderOn;
  final Value<bool> haptics;
  final Value<String> reducedMotion;
  final Value<String> hiddenFeelings;
  final Value<bool> useMyLines;
  final Value<bool> firstRunDone;
  final Value<String?> firstName;
  const SettingsRowsCompanion({
    this.id = const Value.absent(),
    this.morningMinutes = const Value.absent(),
    this.eveningMinutes = const Value.absent(),
    this.morningReminderOn = const Value.absent(),
    this.eveningReminderOn = const Value.absent(),
    this.haptics = const Value.absent(),
    this.reducedMotion = const Value.absent(),
    this.hiddenFeelings = const Value.absent(),
    this.useMyLines = const Value.absent(),
    this.firstRunDone = const Value.absent(),
    this.firstName = const Value.absent(),
  });
  SettingsRowsCompanion.insert({
    this.id = const Value.absent(),
    required int morningMinutes,
    required int eveningMinutes,
    required bool morningReminderOn,
    required bool eveningReminderOn,
    required bool haptics,
    required String reducedMotion,
    required String hiddenFeelings,
    required bool useMyLines,
    required bool firstRunDone,
    this.firstName = const Value.absent(),
  }) : morningMinutes = Value(morningMinutes),
       eveningMinutes = Value(eveningMinutes),
       morningReminderOn = Value(morningReminderOn),
       eveningReminderOn = Value(eveningReminderOn),
       haptics = Value(haptics),
       reducedMotion = Value(reducedMotion),
       hiddenFeelings = Value(hiddenFeelings),
       useMyLines = Value(useMyLines),
       firstRunDone = Value(firstRunDone);
  static Insertable<SettingsRow> custom({
    Expression<int>? id,
    Expression<int>? morningMinutes,
    Expression<int>? eveningMinutes,
    Expression<bool>? morningReminderOn,
    Expression<bool>? eveningReminderOn,
    Expression<bool>? haptics,
    Expression<String>? reducedMotion,
    Expression<String>? hiddenFeelings,
    Expression<bool>? useMyLines,
    Expression<bool>? firstRunDone,
    Expression<String>? firstName,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (morningMinutes != null) 'morning_minutes': morningMinutes,
      if (eveningMinutes != null) 'evening_minutes': eveningMinutes,
      if (morningReminderOn != null) 'morning_reminder_on': morningReminderOn,
      if (eveningReminderOn != null) 'evening_reminder_on': eveningReminderOn,
      if (haptics != null) 'haptics': haptics,
      if (reducedMotion != null) 'reduced_motion': reducedMotion,
      if (hiddenFeelings != null) 'hidden_feelings': hiddenFeelings,
      if (useMyLines != null) 'use_my_lines': useMyLines,
      if (firstRunDone != null) 'first_run_done': firstRunDone,
      if (firstName != null) 'first_name': firstName,
    });
  }

  SettingsRowsCompanion copyWith({
    Value<int>? id,
    Value<int>? morningMinutes,
    Value<int>? eveningMinutes,
    Value<bool>? morningReminderOn,
    Value<bool>? eveningReminderOn,
    Value<bool>? haptics,
    Value<String>? reducedMotion,
    Value<String>? hiddenFeelings,
    Value<bool>? useMyLines,
    Value<bool>? firstRunDone,
    Value<String?>? firstName,
  }) {
    return SettingsRowsCompanion(
      id: id ?? this.id,
      morningMinutes: morningMinutes ?? this.morningMinutes,
      eveningMinutes: eveningMinutes ?? this.eveningMinutes,
      morningReminderOn: morningReminderOn ?? this.morningReminderOn,
      eveningReminderOn: eveningReminderOn ?? this.eveningReminderOn,
      haptics: haptics ?? this.haptics,
      reducedMotion: reducedMotion ?? this.reducedMotion,
      hiddenFeelings: hiddenFeelings ?? this.hiddenFeelings,
      useMyLines: useMyLines ?? this.useMyLines,
      firstRunDone: firstRunDone ?? this.firstRunDone,
      firstName: firstName ?? this.firstName,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (morningMinutes.present) {
      map['morning_minutes'] = Variable<int>(morningMinutes.value);
    }
    if (eveningMinutes.present) {
      map['evening_minutes'] = Variable<int>(eveningMinutes.value);
    }
    if (morningReminderOn.present) {
      map['morning_reminder_on'] = Variable<bool>(morningReminderOn.value);
    }
    if (eveningReminderOn.present) {
      map['evening_reminder_on'] = Variable<bool>(eveningReminderOn.value);
    }
    if (haptics.present) {
      map['haptics'] = Variable<bool>(haptics.value);
    }
    if (reducedMotion.present) {
      map['reduced_motion'] = Variable<String>(reducedMotion.value);
    }
    if (hiddenFeelings.present) {
      map['hidden_feelings'] = Variable<String>(hiddenFeelings.value);
    }
    if (useMyLines.present) {
      map['use_my_lines'] = Variable<bool>(useMyLines.value);
    }
    if (firstRunDone.present) {
      map['first_run_done'] = Variable<bool>(firstRunDone.value);
    }
    if (firstName.present) {
      map['first_name'] = Variable<String>(firstName.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SettingsRowsCompanion(')
          ..write('id: $id, ')
          ..write('morningMinutes: $morningMinutes, ')
          ..write('eveningMinutes: $eveningMinutes, ')
          ..write('morningReminderOn: $morningReminderOn, ')
          ..write('eveningReminderOn: $eveningReminderOn, ')
          ..write('haptics: $haptics, ')
          ..write('reducedMotion: $reducedMotion, ')
          ..write('hiddenFeelings: $hiddenFeelings, ')
          ..write('useMyLines: $useMyLines, ')
          ..write('firstRunDone: $firstRunDone, ')
          ..write('firstName: $firstName')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $DaysTable days = $DaysTable(this);
  late final $LinesTable lines = $LinesTable(this);
  late final $NotesTable notes = $NotesTable(this);
  late final $SteadySessionsTable steadySessions = $SteadySessionsTable(this);
  late final $SettingsRowsTable settingsRows = $SettingsRowsTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    days,
    lines,
    notes,
    steadySessions,
    settingsRows,
  ];
}

typedef $$DaysTableCreateCompanionBuilder = DaysCompanion Function({
  required String date,
  Value<String?> morningFeeling,
  Value<String?> morningStrength,
  Value<String?> morningWhy,
  Value<String?> goalText,
  Value<String?> goalSource,
  Value<String?> lineId,
  Value<DateTime?> morningCompletedAt,
  Value<String?> eveningFeeling,
  Value<String?> eveningStrength,
  Value<String?> eveningWhy,
  Value<String?> goalOutcome,
  Value<String?> goodKind,
  Value<String?> goodText,
  Value<DateTime?> eveningCompletedAt,
  Value<int> rowid,
});
typedef $$DaysTableUpdateCompanionBuilder = DaysCompanion Function({
  Value<String> date,
  Value<String?> morningFeeling,
  Value<String?> morningStrength,
  Value<String?> morningWhy,
  Value<String?> goalText,
  Value<String?> goalSource,
  Value<String?> lineId,
  Value<DateTime?> morningCompletedAt,
  Value<String?> eveningFeeling,
  Value<String?> eveningStrength,
  Value<String?> eveningWhy,
  Value<String?> goalOutcome,
  Value<String?> goodKind,
  Value<String?> goodText,
  Value<DateTime?> eveningCompletedAt,
  Value<int> rowid,
});

class $$DaysTableFilterComposer extends Composer<_$AppDatabase, $DaysTable> {
  $$DaysTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get date => $composableBuilder(
    column: $table.date,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get morningFeeling => $composableBuilder(
    column: $table.morningFeeling,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get morningStrength => $composableBuilder(
    column: $table.morningStrength,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get morningWhy => $composableBuilder(
    column: $table.morningWhy,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get goalText => $composableBuilder(
    column: $table.goalText,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get goalSource => $composableBuilder(
    column: $table.goalSource,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get lineId => $composableBuilder(
    column: $table.lineId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get morningCompletedAt => $composableBuilder(
    column: $table.morningCompletedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get eveningFeeling => $composableBuilder(
    column: $table.eveningFeeling,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get eveningStrength => $composableBuilder(
    column: $table.eveningStrength,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get eveningWhy => $composableBuilder(
    column: $table.eveningWhy,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get goalOutcome => $composableBuilder(
    column: $table.goalOutcome,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get goodKind => $composableBuilder(
    column: $table.goodKind,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get goodText => $composableBuilder(
    column: $table.goodText,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get eveningCompletedAt => $composableBuilder(
    column: $table.eveningCompletedAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$DaysTableOrderingComposer extends Composer<_$AppDatabase, $DaysTable> {
  $$DaysTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get date => $composableBuilder(
    column: $table.date,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get morningFeeling => $composableBuilder(
    column: $table.morningFeeling,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get morningStrength => $composableBuilder(
    column: $table.morningStrength,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get morningWhy => $composableBuilder(
    column: $table.morningWhy,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get goalText => $composableBuilder(
    column: $table.goalText,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get goalSource => $composableBuilder(
    column: $table.goalSource,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get lineId => $composableBuilder(
    column: $table.lineId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get morningCompletedAt => $composableBuilder(
    column: $table.morningCompletedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get eveningFeeling => $composableBuilder(
    column: $table.eveningFeeling,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get eveningStrength => $composableBuilder(
    column: $table.eveningStrength,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get eveningWhy => $composableBuilder(
    column: $table.eveningWhy,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get goalOutcome => $composableBuilder(
    column: $table.goalOutcome,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get goodKind => $composableBuilder(
    column: $table.goodKind,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get goodText => $composableBuilder(
    column: $table.goodText,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get eveningCompletedAt => $composableBuilder(
    column: $table.eveningCompletedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$DaysTableAnnotationComposer
    extends Composer<_$AppDatabase, $DaysTable> {
  $$DaysTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get date =>
      $composableBuilder(column: $table.date, builder: (column) => column);

  GeneratedColumn<String> get morningFeeling => $composableBuilder(
    column: $table.morningFeeling,
    builder: (column) => column,
  );

  GeneratedColumn<String> get morningStrength => $composableBuilder(
    column: $table.morningStrength,
    builder: (column) => column,
  );

  GeneratedColumn<String> get morningWhy => $composableBuilder(
    column: $table.morningWhy,
    builder: (column) => column,
  );

  GeneratedColumn<String> get goalText =>
      $composableBuilder(column: $table.goalText, builder: (column) => column);

  GeneratedColumn<String> get goalSource => $composableBuilder(
    column: $table.goalSource,
    builder: (column) => column,
  );

  GeneratedColumn<String> get lineId =>
      $composableBuilder(column: $table.lineId, builder: (column) => column);

  GeneratedColumn<DateTime> get morningCompletedAt => $composableBuilder(
    column: $table.morningCompletedAt,
    builder: (column) => column,
  );

  GeneratedColumn<String> get eveningFeeling => $composableBuilder(
    column: $table.eveningFeeling,
    builder: (column) => column,
  );

  GeneratedColumn<String> get eveningStrength => $composableBuilder(
    column: $table.eveningStrength,
    builder: (column) => column,
  );

  GeneratedColumn<String> get eveningWhy => $composableBuilder(
    column: $table.eveningWhy,
    builder: (column) => column,
  );

  GeneratedColumn<String> get goalOutcome => $composableBuilder(
    column: $table.goalOutcome,
    builder: (column) => column,
  );

  GeneratedColumn<String> get goodKind =>
      $composableBuilder(column: $table.goodKind, builder: (column) => column);

  GeneratedColumn<String> get goodText =>
      $composableBuilder(column: $table.goodText, builder: (column) => column);

  GeneratedColumn<DateTime> get eveningCompletedAt => $composableBuilder(
    column: $table.eveningCompletedAt,
    builder: (column) => column,
  );
}

class $$DaysTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $DaysTable,
          Day,
          $$DaysTableFilterComposer,
          $$DaysTableOrderingComposer,
          $$DaysTableAnnotationComposer,
          $$DaysTableCreateCompanionBuilder,
          $$DaysTableUpdateCompanionBuilder,
          (Day, BaseReferences<_$AppDatabase, $DaysTable, Day>),
          Day,
          PrefetchHooks Function()
        > {
  $$DaysTableTableManager(_$AppDatabase db, $DaysTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$DaysTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$DaysTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$DaysTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> date = const Value.absent(),
                Value<String?> morningFeeling = const Value.absent(),
                Value<String?> morningStrength = const Value.absent(),
                Value<String?> morningWhy = const Value.absent(),
                Value<String?> goalText = const Value.absent(),
                Value<String?> goalSource = const Value.absent(),
                Value<String?> lineId = const Value.absent(),
                Value<DateTime?> morningCompletedAt = const Value.absent(),
                Value<String?> eveningFeeling = const Value.absent(),
                Value<String?> eveningStrength = const Value.absent(),
                Value<String?> eveningWhy = const Value.absent(),
                Value<String?> goalOutcome = const Value.absent(),
                Value<String?> goodKind = const Value.absent(),
                Value<String?> goodText = const Value.absent(),
                Value<DateTime?> eveningCompletedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => DaysCompanion(
                date: date,
                morningFeeling: morningFeeling,
                morningStrength: morningStrength,
                morningWhy: morningWhy,
                goalText: goalText,
                goalSource: goalSource,
                lineId: lineId,
                morningCompletedAt: morningCompletedAt,
                eveningFeeling: eveningFeeling,
                eveningStrength: eveningStrength,
                eveningWhy: eveningWhy,
                goalOutcome: goalOutcome,
                goodKind: goodKind,
                goodText: goodText,
                eveningCompletedAt: eveningCompletedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String date,
                Value<String?> morningFeeling = const Value.absent(),
                Value<String?> morningStrength = const Value.absent(),
                Value<String?> morningWhy = const Value.absent(),
                Value<String?> goalText = const Value.absent(),
                Value<String?> goalSource = const Value.absent(),
                Value<String?> lineId = const Value.absent(),
                Value<DateTime?> morningCompletedAt = const Value.absent(),
                Value<String?> eveningFeeling = const Value.absent(),
                Value<String?> eveningStrength = const Value.absent(),
                Value<String?> eveningWhy = const Value.absent(),
                Value<String?> goalOutcome = const Value.absent(),
                Value<String?> goodKind = const Value.absent(),
                Value<String?> goodText = const Value.absent(),
                Value<DateTime?> eveningCompletedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => DaysCompanion.insert(
                date: date,
                morningFeeling: morningFeeling,
                morningStrength: morningStrength,
                morningWhy: morningWhy,
                goalText: goalText,
                goalSource: goalSource,
                lineId: lineId,
                morningCompletedAt: morningCompletedAt,
                eveningFeeling: eveningFeeling,
                eveningStrength: eveningStrength,
                eveningWhy: eveningWhy,
                goalOutcome: goalOutcome,
                goodKind: goodKind,
                goodText: goodText,
                eveningCompletedAt: eveningCompletedAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$DaysTable, Day>(table),
                  BaseReferences<_$AppDatabase, $DaysTable, Day>(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$DaysTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $DaysTable,
      Day,
      $$DaysTableFilterComposer,
      $$DaysTableOrderingComposer,
      $$DaysTableAnnotationComposer,
      $$DaysTableCreateCompanionBuilder,
      $$DaysTableUpdateCompanionBuilder,
      (Day, BaseReferences<_$AppDatabase, $DaysTable, Day>),
      Day,
      PrefetchHooks Function()
    >;
typedef $$LinesTableCreateCompanionBuilder = LinesCompanion Function({
  required String id,
  required String body,
  required String source,
  Value<String?> author,
  Value<String?> work,
  Value<String?> year,
  Value<String?> checkedSource,
  Value<bool> favourite,
  required DateTime createdAt,
  Value<int> rowid,
});
typedef $$LinesTableUpdateCompanionBuilder = LinesCompanion Function({
  Value<String> id,
  Value<String> body,
  Value<String> source,
  Value<String?> author,
  Value<String?> work,
  Value<String?> year,
  Value<String?> checkedSource,
  Value<bool> favourite,
  Value<DateTime> createdAt,
  Value<int> rowid,
});

class $$LinesTableFilterComposer extends Composer<_$AppDatabase, $LinesTable> {
  $$LinesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get body => $composableBuilder(
    column: $table.body,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get source => $composableBuilder(
    column: $table.source,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get author => $composableBuilder(
    column: $table.author,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get work => $composableBuilder(
    column: $table.work,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get year => $composableBuilder(
    column: $table.year,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get checkedSource => $composableBuilder(
    column: $table.checkedSource,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get favourite => $composableBuilder(
    column: $table.favourite,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$LinesTableOrderingComposer
    extends Composer<_$AppDatabase, $LinesTable> {
  $$LinesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get body => $composableBuilder(
    column: $table.body,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get source => $composableBuilder(
    column: $table.source,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get author => $composableBuilder(
    column: $table.author,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get work => $composableBuilder(
    column: $table.work,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get year => $composableBuilder(
    column: $table.year,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get checkedSource => $composableBuilder(
    column: $table.checkedSource,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get favourite => $composableBuilder(
    column: $table.favourite,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$LinesTableAnnotationComposer
    extends Composer<_$AppDatabase, $LinesTable> {
  $$LinesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get body =>
      $composableBuilder(column: $table.body, builder: (column) => column);

  GeneratedColumn<String> get source =>
      $composableBuilder(column: $table.source, builder: (column) => column);

  GeneratedColumn<String> get author =>
      $composableBuilder(column: $table.author, builder: (column) => column);

  GeneratedColumn<String> get work =>
      $composableBuilder(column: $table.work, builder: (column) => column);

  GeneratedColumn<String> get year =>
      $composableBuilder(column: $table.year, builder: (column) => column);

  GeneratedColumn<String> get checkedSource => $composableBuilder(
    column: $table.checkedSource,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get favourite =>
      $composableBuilder(column: $table.favourite, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);
}

class $$LinesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $LinesTable,
          LineRow,
          $$LinesTableFilterComposer,
          $$LinesTableOrderingComposer,
          $$LinesTableAnnotationComposer,
          $$LinesTableCreateCompanionBuilder,
          $$LinesTableUpdateCompanionBuilder,
          (LineRow, BaseReferences<_$AppDatabase, $LinesTable, LineRow>),
          LineRow,
          PrefetchHooks Function()
        > {
  $$LinesTableTableManager(_$AppDatabase db, $LinesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$LinesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$LinesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$LinesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> body = const Value.absent(),
                Value<String> source = const Value.absent(),
                Value<String?> author = const Value.absent(),
                Value<String?> work = const Value.absent(),
                Value<String?> year = const Value.absent(),
                Value<String?> checkedSource = const Value.absent(),
                Value<bool> favourite = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => LinesCompanion(
                id: id,
                body: body,
                source: source,
                author: author,
                work: work,
                year: year,
                checkedSource: checkedSource,
                favourite: favourite,
                createdAt: createdAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String body,
                required String source,
                Value<String?> author = const Value.absent(),
                Value<String?> work = const Value.absent(),
                Value<String?> year = const Value.absent(),
                Value<String?> checkedSource = const Value.absent(),
                Value<bool> favourite = const Value.absent(),
                required DateTime createdAt,
                Value<int> rowid = const Value.absent(),
              }) => LinesCompanion.insert(
                id: id,
                body: body,
                source: source,
                author: author,
                work: work,
                year: year,
                checkedSource: checkedSource,
                favourite: favourite,
                createdAt: createdAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$LinesTable, LineRow>(table),
                  BaseReferences<_$AppDatabase, $LinesTable, LineRow>(
                    db,
                    table,
                    e,
                  ),
                ),
              )
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$LinesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $LinesTable,
      LineRow,
      $$LinesTableFilterComposer,
      $$LinesTableOrderingComposer,
      $$LinesTableAnnotationComposer,
      $$LinesTableCreateCompanionBuilder,
      $$LinesTableUpdateCompanionBuilder,
      (LineRow, BaseReferences<_$AppDatabase, $LinesTable, LineRow>),
      LineRow,
      PrefetchHooks Function()
    >;
typedef $$NotesTableCreateCompanionBuilder = NotesCompanion Function({
  required String dayDate,
  required String author,
  required String body,
  Value<int> rowid,
});
typedef $$NotesTableUpdateCompanionBuilder = NotesCompanion Function({
  Value<String> dayDate,
  Value<String> author,
  Value<String> body,
  Value<int> rowid,
});

class $$NotesTableFilterComposer extends Composer<_$AppDatabase, $NotesTable> {
  $$NotesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get dayDate => $composableBuilder(
    column: $table.dayDate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get author => $composableBuilder(
    column: $table.author,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get body => $composableBuilder(
    column: $table.body,
    builder: (column) => ColumnFilters(column),
  );
}

class $$NotesTableOrderingComposer
    extends Composer<_$AppDatabase, $NotesTable> {
  $$NotesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get dayDate => $composableBuilder(
    column: $table.dayDate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get author => $composableBuilder(
    column: $table.author,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get body => $composableBuilder(
    column: $table.body,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$NotesTableAnnotationComposer
    extends Composer<_$AppDatabase, $NotesTable> {
  $$NotesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get dayDate =>
      $composableBuilder(column: $table.dayDate, builder: (column) => column);

  GeneratedColumn<String> get author =>
      $composableBuilder(column: $table.author, builder: (column) => column);

  GeneratedColumn<String> get body =>
      $composableBuilder(column: $table.body, builder: (column) => column);
}

class $$NotesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $NotesTable,
          NoteRow,
          $$NotesTableFilterComposer,
          $$NotesTableOrderingComposer,
          $$NotesTableAnnotationComposer,
          $$NotesTableCreateCompanionBuilder,
          $$NotesTableUpdateCompanionBuilder,
          (NoteRow, BaseReferences<_$AppDatabase, $NotesTable, NoteRow>),
          NoteRow,
          PrefetchHooks Function()
        > {
  $$NotesTableTableManager(_$AppDatabase db, $NotesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$NotesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$NotesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$NotesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> dayDate = const Value.absent(),
                Value<String> author = const Value.absent(),
                Value<String> body = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => NotesCompanion(
                dayDate: dayDate,
                author: author,
                body: body,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String dayDate,
                required String author,
                required String body,
                Value<int> rowid = const Value.absent(),
              }) => NotesCompanion.insert(
                dayDate: dayDate,
                author: author,
                body: body,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$NotesTable, NoteRow>(table),
                  BaseReferences<_$AppDatabase, $NotesTable, NoteRow>(
                    db,
                    table,
                    e,
                  ),
                ),
              )
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$NotesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $NotesTable,
      NoteRow,
      $$NotesTableFilterComposer,
      $$NotesTableOrderingComposer,
      $$NotesTableAnnotationComposer,
      $$NotesTableCreateCompanionBuilder,
      $$NotesTableUpdateCompanionBuilder,
      (NoteRow, BaseReferences<_$AppDatabase, $NotesTable, NoteRow>),
      NoteRow,
      PrefetchHooks Function()
    >;
typedef $$SteadySessionsTableCreateCompanionBuilder =
    SteadySessionsCompanion Function({
      Value<int> id,
      required String kind,
      required int lengthMinutes,
      required DateTime startedAt,
      required bool completed,
    });
typedef $$SteadySessionsTableUpdateCompanionBuilder =
    SteadySessionsCompanion Function({
      Value<int> id,
      Value<String> kind,
      Value<int> lengthMinutes,
      Value<DateTime> startedAt,
      Value<bool> completed,
    });

class $$SteadySessionsTableFilterComposer
    extends Composer<_$AppDatabase, $SteadySessionsTable> {
  $$SteadySessionsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get kind => $composableBuilder(
    column: $table.kind,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get lengthMinutes => $composableBuilder(
    column: $table.lengthMinutes,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get startedAt => $composableBuilder(
    column: $table.startedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get completed => $composableBuilder(
    column: $table.completed,
    builder: (column) => ColumnFilters(column),
  );
}

class $$SteadySessionsTableOrderingComposer
    extends Composer<_$AppDatabase, $SteadySessionsTable> {
  $$SteadySessionsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get kind => $composableBuilder(
    column: $table.kind,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get lengthMinutes => $composableBuilder(
    column: $table.lengthMinutes,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get startedAt => $composableBuilder(
    column: $table.startedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get completed => $composableBuilder(
    column: $table.completed,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$SteadySessionsTableAnnotationComposer
    extends Composer<_$AppDatabase, $SteadySessionsTable> {
  $$SteadySessionsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get kind =>
      $composableBuilder(column: $table.kind, builder: (column) => column);

  GeneratedColumn<int> get lengthMinutes => $composableBuilder(
    column: $table.lengthMinutes,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get startedAt =>
      $composableBuilder(column: $table.startedAt, builder: (column) => column);

  GeneratedColumn<bool> get completed =>
      $composableBuilder(column: $table.completed, builder: (column) => column);
}

class $$SteadySessionsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $SteadySessionsTable,
          SteadySession,
          $$SteadySessionsTableFilterComposer,
          $$SteadySessionsTableOrderingComposer,
          $$SteadySessionsTableAnnotationComposer,
          $$SteadySessionsTableCreateCompanionBuilder,
          $$SteadySessionsTableUpdateCompanionBuilder,
          (
            SteadySession,
            BaseReferences<_$AppDatabase, $SteadySessionsTable, SteadySession>,
          ),
          SteadySession,
          PrefetchHooks Function()
        > {
  $$SteadySessionsTableTableManager(
    _$AppDatabase db,
    $SteadySessionsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$SteadySessionsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$SteadySessionsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$SteadySessionsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> kind = const Value.absent(),
                Value<int> lengthMinutes = const Value.absent(),
                Value<DateTime> startedAt = const Value.absent(),
                Value<bool> completed = const Value.absent(),
              }) => SteadySessionsCompanion(
                id: id,
                kind: kind,
                lengthMinutes: lengthMinutes,
                startedAt: startedAt,
                completed: completed,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String kind,
                required int lengthMinutes,
                required DateTime startedAt,
                required bool completed,
              }) => SteadySessionsCompanion.insert(
                id: id,
                kind: kind,
                lengthMinutes: lengthMinutes,
                startedAt: startedAt,
                completed: completed,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$SteadySessionsTable, SteadySession>(table),
                  BaseReferences<
                    _$AppDatabase,
                    $SteadySessionsTable,
                    SteadySession
                  >(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$SteadySessionsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $SteadySessionsTable,
      SteadySession,
      $$SteadySessionsTableFilterComposer,
      $$SteadySessionsTableOrderingComposer,
      $$SteadySessionsTableAnnotationComposer,
      $$SteadySessionsTableCreateCompanionBuilder,
      $$SteadySessionsTableUpdateCompanionBuilder,
      (
        SteadySession,
        BaseReferences<_$AppDatabase, $SteadySessionsTable, SteadySession>,
      ),
      SteadySession,
      PrefetchHooks Function()
    >;
typedef $$SettingsRowsTableCreateCompanionBuilder =
    SettingsRowsCompanion Function({
      Value<int> id,
      required int morningMinutes,
      required int eveningMinutes,
      required bool morningReminderOn,
      required bool eveningReminderOn,
      required bool haptics,
      required String reducedMotion,
      required String hiddenFeelings,
      required bool useMyLines,
      required bool firstRunDone,
      Value<String?> firstName,
    });
typedef $$SettingsRowsTableUpdateCompanionBuilder =
    SettingsRowsCompanion Function({
      Value<int> id,
      Value<int> morningMinutes,
      Value<int> eveningMinutes,
      Value<bool> morningReminderOn,
      Value<bool> eveningReminderOn,
      Value<bool> haptics,
      Value<String> reducedMotion,
      Value<String> hiddenFeelings,
      Value<bool> useMyLines,
      Value<bool> firstRunDone,
      Value<String?> firstName,
    });

class $$SettingsRowsTableFilterComposer
    extends Composer<_$AppDatabase, $SettingsRowsTable> {
  $$SettingsRowsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get morningMinutes => $composableBuilder(
    column: $table.morningMinutes,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get eveningMinutes => $composableBuilder(
    column: $table.eveningMinutes,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get morningReminderOn => $composableBuilder(
    column: $table.morningReminderOn,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get eveningReminderOn => $composableBuilder(
    column: $table.eveningReminderOn,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get haptics => $composableBuilder(
    column: $table.haptics,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get reducedMotion => $composableBuilder(
    column: $table.reducedMotion,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get hiddenFeelings => $composableBuilder(
    column: $table.hiddenFeelings,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get useMyLines => $composableBuilder(
    column: $table.useMyLines,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get firstRunDone => $composableBuilder(
    column: $table.firstRunDone,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get firstName => $composableBuilder(
    column: $table.firstName,
    builder: (column) => ColumnFilters(column),
  );
}

class $$SettingsRowsTableOrderingComposer
    extends Composer<_$AppDatabase, $SettingsRowsTable> {
  $$SettingsRowsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get morningMinutes => $composableBuilder(
    column: $table.morningMinutes,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get eveningMinutes => $composableBuilder(
    column: $table.eveningMinutes,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get morningReminderOn => $composableBuilder(
    column: $table.morningReminderOn,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get eveningReminderOn => $composableBuilder(
    column: $table.eveningReminderOn,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get haptics => $composableBuilder(
    column: $table.haptics,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get reducedMotion => $composableBuilder(
    column: $table.reducedMotion,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get hiddenFeelings => $composableBuilder(
    column: $table.hiddenFeelings,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get useMyLines => $composableBuilder(
    column: $table.useMyLines,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get firstRunDone => $composableBuilder(
    column: $table.firstRunDone,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get firstName => $composableBuilder(
    column: $table.firstName,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$SettingsRowsTableAnnotationComposer
    extends Composer<_$AppDatabase, $SettingsRowsTable> {
  $$SettingsRowsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get morningMinutes => $composableBuilder(
    column: $table.morningMinutes,
    builder: (column) => column,
  );

  GeneratedColumn<int> get eveningMinutes => $composableBuilder(
    column: $table.eveningMinutes,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get morningReminderOn => $composableBuilder(
    column: $table.morningReminderOn,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get eveningReminderOn => $composableBuilder(
    column: $table.eveningReminderOn,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get haptics =>
      $composableBuilder(column: $table.haptics, builder: (column) => column);

  GeneratedColumn<String> get reducedMotion => $composableBuilder(
    column: $table.reducedMotion,
    builder: (column) => column,
  );

  GeneratedColumn<String> get hiddenFeelings => $composableBuilder(
    column: $table.hiddenFeelings,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get useMyLines => $composableBuilder(
    column: $table.useMyLines,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get firstRunDone => $composableBuilder(
    column: $table.firstRunDone,
    builder: (column) => column,
  );

  GeneratedColumn<String> get firstName =>
      $composableBuilder(column: $table.firstName, builder: (column) => column);
}

class $$SettingsRowsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $SettingsRowsTable,
          SettingsRow,
          $$SettingsRowsTableFilterComposer,
          $$SettingsRowsTableOrderingComposer,
          $$SettingsRowsTableAnnotationComposer,
          $$SettingsRowsTableCreateCompanionBuilder,
          $$SettingsRowsTableUpdateCompanionBuilder,
          (
            SettingsRow,
            BaseReferences<_$AppDatabase, $SettingsRowsTable, SettingsRow>,
          ),
          SettingsRow,
          PrefetchHooks Function()
        > {
  $$SettingsRowsTableTableManager(_$AppDatabase db, $SettingsRowsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$SettingsRowsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$SettingsRowsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$SettingsRowsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> morningMinutes = const Value.absent(),
                Value<int> eveningMinutes = const Value.absent(),
                Value<bool> morningReminderOn = const Value.absent(),
                Value<bool> eveningReminderOn = const Value.absent(),
                Value<bool> haptics = const Value.absent(),
                Value<String> reducedMotion = const Value.absent(),
                Value<String> hiddenFeelings = const Value.absent(),
                Value<bool> useMyLines = const Value.absent(),
                Value<bool> firstRunDone = const Value.absent(),
                Value<String?> firstName = const Value.absent(),
              }) => SettingsRowsCompanion(
                id: id,
                morningMinutes: morningMinutes,
                eveningMinutes: eveningMinutes,
                morningReminderOn: morningReminderOn,
                eveningReminderOn: eveningReminderOn,
                haptics: haptics,
                reducedMotion: reducedMotion,
                hiddenFeelings: hiddenFeelings,
                useMyLines: useMyLines,
                firstRunDone: firstRunDone,
                firstName: firstName,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int morningMinutes,
                required int eveningMinutes,
                required bool morningReminderOn,
                required bool eveningReminderOn,
                required bool haptics,
                required String reducedMotion,
                required String hiddenFeelings,
                required bool useMyLines,
                required bool firstRunDone,
                Value<String?> firstName = const Value.absent(),
              }) => SettingsRowsCompanion.insert(
                id: id,
                morningMinutes: morningMinutes,
                eveningMinutes: eveningMinutes,
                morningReminderOn: morningReminderOn,
                eveningReminderOn: eveningReminderOn,
                haptics: haptics,
                reducedMotion: reducedMotion,
                hiddenFeelings: hiddenFeelings,
                useMyLines: useMyLines,
                firstRunDone: firstRunDone,
                firstName: firstName,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$SettingsRowsTable, SettingsRow>(table),
                  BaseReferences<
                    _$AppDatabase,
                    $SettingsRowsTable,
                    SettingsRow
                  >(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$SettingsRowsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $SettingsRowsTable,
      SettingsRow,
      $$SettingsRowsTableFilterComposer,
      $$SettingsRowsTableOrderingComposer,
      $$SettingsRowsTableAnnotationComposer,
      $$SettingsRowsTableCreateCompanionBuilder,
      $$SettingsRowsTableUpdateCompanionBuilder,
      (
        SettingsRow,
        BaseReferences<_$AppDatabase, $SettingsRowsTable, SettingsRow>,
      ),
      SettingsRow,
      PrefetchHooks Function()
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$DaysTableTableManager get days => $$DaysTableTableManager(_db, _db.days);
  $$LinesTableTableManager get lines =>
      $$LinesTableTableManager(_db, _db.lines);
  $$NotesTableTableManager get notes =>
      $$NotesTableTableManager(_db, _db.notes);
  $$SteadySessionsTableTableManager get steadySessions =>
      $$SteadySessionsTableTableManager(_db, _db.steadySessions);
  $$SettingsRowsTableTableManager get settingsRows =>
      $$SettingsRowsTableTableManager(_db, _db.settingsRows);
}
