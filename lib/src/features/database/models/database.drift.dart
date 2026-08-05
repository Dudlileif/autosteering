// dart format width=80
// ignore_for_file: type=lint
part of 'database.dart';

class $PartfieldsTable extends Partfields
    with TableInfo<$PartfieldsTable, Partfield> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PartfieldsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    clientDefault: DateTime.now,
  );
  static const VerificationMeta _lastUpdatedAtMeta = const VerificationMeta(
    'lastUpdatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> lastUpdatedAt =
      GeneratedColumn<DateTime>(
        'last_updated_at',
        aliasedName,
        true,
        type: DriftSqlType.dateTime,
        requiredDuringInsert: false,
      );
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
  static const VerificationMeta _parentFieldMeta = const VerificationMeta(
    'parentField',
  );
  @override
  late final GeneratedColumn<int> parentField = GeneratedColumn<int>(
    'parent_field',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES partfields (id)',
    ),
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _areaMeta = const VerificationMeta('area');
  @override
  late final GeneratedColumn<double> area = GeneratedColumn<double>(
    'area',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    createdAt,
    lastUpdatedAt,
    id,
    parentField,
    name,
    area,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'partfields';
  @override
  VerificationContext validateIntegrity(
    Insertable<Partfield> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    if (data.containsKey('last_updated_at')) {
      context.handle(
        _lastUpdatedAtMeta,
        lastUpdatedAt.isAcceptableOrUnknown(
          data['last_updated_at']!,
          _lastUpdatedAtMeta,
        ),
      );
    }
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('parent_field')) {
      context.handle(
        _parentFieldMeta,
        parentField.isAcceptableOrUnknown(
          data['parent_field']!,
          _parentFieldMeta,
        ),
      );
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    }
    if (data.containsKey('area')) {
      context.handle(
        _areaMeta,
        area.isAcceptableOrUnknown(data['area']!, _areaMeta),
      );
    } else if (isInserting) {
      context.missing(_areaMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Partfield map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Partfield(
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      lastUpdatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}last_updated_at'],
      ),
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      parentField: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}parent_field'],
      ),
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      ),
      area: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}area'],
      )!,
    );
  }

  @override
  $PartfieldsTable createAlias(String alias) {
    return $PartfieldsTable(attachedDatabase, alias);
  }
}

class Partfield extends DataClass implements Insertable<Partfield> {
  /// When this was created.
  final DateTime createdAt;

  /// When this was last updated.
  final DateTime? lastUpdatedAt;

  /// The local database ID of this.
  final int id;

  /// Reference to an optional parent [Partfield].
  final int? parentField;

  /// The name of this.
  final String? name;

  /// The area of this, in m².
  final double area;
  const Partfield({
    required this.createdAt,
    this.lastUpdatedAt,
    required this.id,
    this.parentField,
    this.name,
    required this.area,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['created_at'] = Variable<DateTime>(createdAt);
    if (!nullToAbsent || lastUpdatedAt != null) {
      map['last_updated_at'] = Variable<DateTime>(lastUpdatedAt);
    }
    map['id'] = Variable<int>(id);
    if (!nullToAbsent || parentField != null) {
      map['parent_field'] = Variable<int>(parentField);
    }
    if (!nullToAbsent || name != null) {
      map['name'] = Variable<String>(name);
    }
    map['area'] = Variable<double>(area);
    return map;
  }

  PartfieldsCompanion toCompanion(bool nullToAbsent) {
    return PartfieldsCompanion(
      createdAt: Value(createdAt),
      lastUpdatedAt: lastUpdatedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(lastUpdatedAt),
      id: Value(id),
      parentField: parentField == null && nullToAbsent
          ? const Value.absent()
          : Value(parentField),
      name: name == null && nullToAbsent ? const Value.absent() : Value(name),
      area: Value(area),
    );
  }

  factory Partfield.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Partfield(
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      lastUpdatedAt: serializer.fromJson<DateTime?>(json['lastUpdatedAt']),
      id: serializer.fromJson<int>(json['id']),
      parentField: serializer.fromJson<int?>(json['parentField']),
      name: serializer.fromJson<String?>(json['name']),
      area: serializer.fromJson<double>(json['area']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'lastUpdatedAt': serializer.toJson<DateTime?>(lastUpdatedAt),
      'id': serializer.toJson<int>(id),
      'parentField': serializer.toJson<int?>(parentField),
      'name': serializer.toJson<String?>(name),
      'area': serializer.toJson<double>(area),
    };
  }

  Partfield copyWith({
    DateTime? createdAt,
    Value<DateTime?> lastUpdatedAt = const Value.absent(),
    int? id,
    Value<int?> parentField = const Value.absent(),
    Value<String?> name = const Value.absent(),
    double? area,
  }) => Partfield(
    createdAt: createdAt ?? this.createdAt,
    lastUpdatedAt: lastUpdatedAt.present
        ? lastUpdatedAt.value
        : this.lastUpdatedAt,
    id: id ?? this.id,
    parentField: parentField.present ? parentField.value : this.parentField,
    name: name.present ? name.value : this.name,
    area: area ?? this.area,
  );
  Partfield copyWithCompanion(PartfieldsCompanion data) {
    return Partfield(
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      lastUpdatedAt: data.lastUpdatedAt.present
          ? data.lastUpdatedAt.value
          : this.lastUpdatedAt,
      id: data.id.present ? data.id.value : this.id,
      parentField: data.parentField.present
          ? data.parentField.value
          : this.parentField,
      name: data.name.present ? data.name.value : this.name,
      area: data.area.present ? data.area.value : this.area,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Partfield(')
          ..write('createdAt: $createdAt, ')
          ..write('lastUpdatedAt: $lastUpdatedAt, ')
          ..write('id: $id, ')
          ..write('parentField: $parentField, ')
          ..write('name: $name, ')
          ..write('area: $area')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(createdAt, lastUpdatedAt, id, parentField, name, area);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Partfield &&
          other.createdAt == this.createdAt &&
          other.lastUpdatedAt == this.lastUpdatedAt &&
          other.id == this.id &&
          other.parentField == this.parentField &&
          other.name == this.name &&
          other.area == this.area);
}

class PartfieldsCompanion extends UpdateCompanion<Partfield> {
  final Value<DateTime> createdAt;
  final Value<DateTime?> lastUpdatedAt;
  final Value<int> id;
  final Value<int?> parentField;
  final Value<String?> name;
  final Value<double> area;
  const PartfieldsCompanion({
    this.createdAt = const Value.absent(),
    this.lastUpdatedAt = const Value.absent(),
    this.id = const Value.absent(),
    this.parentField = const Value.absent(),
    this.name = const Value.absent(),
    this.area = const Value.absent(),
  });
  PartfieldsCompanion.insert({
    this.createdAt = const Value.absent(),
    this.lastUpdatedAt = const Value.absent(),
    this.id = const Value.absent(),
    this.parentField = const Value.absent(),
    this.name = const Value.absent(),
    required double area,
  }) : area = Value(area);
  static Insertable<Partfield> custom({
    Expression<DateTime>? createdAt,
    Expression<DateTime>? lastUpdatedAt,
    Expression<int>? id,
    Expression<int>? parentField,
    Expression<String>? name,
    Expression<double>? area,
  }) {
    return RawValuesInsertable({
      if (createdAt != null) 'created_at': createdAt,
      if (lastUpdatedAt != null) 'last_updated_at': lastUpdatedAt,
      if (id != null) 'id': id,
      if (parentField != null) 'parent_field': parentField,
      if (name != null) 'name': name,
      if (area != null) 'area': area,
    });
  }

  PartfieldsCompanion copyWith({
    Value<DateTime>? createdAt,
    Value<DateTime?>? lastUpdatedAt,
    Value<int>? id,
    Value<int?>? parentField,
    Value<String?>? name,
    Value<double>? area,
  }) {
    return PartfieldsCompanion(
      createdAt: createdAt ?? this.createdAt,
      lastUpdatedAt: lastUpdatedAt ?? this.lastUpdatedAt,
      id: id ?? this.id,
      parentField: parentField ?? this.parentField,
      name: name ?? this.name,
      area: area ?? this.area,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (lastUpdatedAt.present) {
      map['last_updated_at'] = Variable<DateTime>(lastUpdatedAt.value);
    }
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (parentField.present) {
      map['parent_field'] = Variable<int>(parentField.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (area.present) {
      map['area'] = Variable<double>(area.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PartfieldsCompanion(')
          ..write('createdAt: $createdAt, ')
          ..write('lastUpdatedAt: $lastUpdatedAt, ')
          ..write('id: $id, ')
          ..write('parentField: $parentField, ')
          ..write('name: $name, ')
          ..write('area: $area')
          ..write(')'))
        .toString();
  }
}

class $TasksTable extends Tasks with TableInfo<$TasksTable, Task> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TasksTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    clientDefault: DateTime.now,
  );
  static const VerificationMeta _lastUpdatedAtMeta = const VerificationMeta(
    'lastUpdatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> lastUpdatedAt =
      GeneratedColumn<DateTime>(
        'last_updated_at',
        aliasedName,
        true,
        type: DriftSqlType.dateTime,
        requiredDuringInsert: false,
      );
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
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _noteMeta = const VerificationMeta('note');
  @override
  late final GeneratedColumn<String> note = GeneratedColumn<String>(
    'note',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _partfieldMeta = const VerificationMeta(
    'partfield',
  );
  @override
  late final GeneratedColumn<int> partfield = GeneratedColumn<int>(
    'partfield',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES partfields (id)',
    ),
  );
  static const VerificationMeta _workStartedAtMeta = const VerificationMeta(
    'workStartedAt',
  );
  @override
  late final GeneratedColumn<DateTime> workStartedAt =
      GeneratedColumn<DateTime>(
        'work_started_at',
        aliasedName,
        true,
        type: DriftSqlType.dateTime,
        requiredDuringInsert: false,
      );
  static const VerificationMeta _workEndedAtMeta = const VerificationMeta(
    'workEndedAt',
  );
  @override
  late final GeneratedColumn<DateTime> workEndedAt = GeneratedColumn<DateTime>(
    'work_ended_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    createdAt,
    lastUpdatedAt,
    id,
    name,
    note,
    partfield,
    workStartedAt,
    workEndedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'tasks';
  @override
  VerificationContext validateIntegrity(
    Insertable<Task> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    if (data.containsKey('last_updated_at')) {
      context.handle(
        _lastUpdatedAtMeta,
        lastUpdatedAt.isAcceptableOrUnknown(
          data['last_updated_at']!,
          _lastUpdatedAtMeta,
        ),
      );
    }
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('note')) {
      context.handle(
        _noteMeta,
        note.isAcceptableOrUnknown(data['note']!, _noteMeta),
      );
    }
    if (data.containsKey('partfield')) {
      context.handle(
        _partfieldMeta,
        partfield.isAcceptableOrUnknown(data['partfield']!, _partfieldMeta),
      );
    }
    if (data.containsKey('work_started_at')) {
      context.handle(
        _workStartedAtMeta,
        workStartedAt.isAcceptableOrUnknown(
          data['work_started_at']!,
          _workStartedAtMeta,
        ),
      );
    }
    if (data.containsKey('work_ended_at')) {
      context.handle(
        _workEndedAtMeta,
        workEndedAt.isAcceptableOrUnknown(
          data['work_ended_at']!,
          _workEndedAtMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Task map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Task(
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      lastUpdatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}last_updated_at'],
      ),
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      note: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}note'],
      ),
      partfield: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}partfield'],
      ),
      workStartedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}work_started_at'],
      ),
      workEndedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}work_ended_at'],
      ),
    );
  }

  @override
  $TasksTable createAlias(String alias) {
    return $TasksTable(attachedDatabase, alias);
  }
}

class Task extends DataClass implements Insertable<Task> {
  /// When this was created.
  final DateTime createdAt;

  /// When this was last updated.
  final DateTime? lastUpdatedAt;

  /// The local database ID of this.
  final int id;

  /// The name of this.
  final String name;

  /// A note with various information recorded by the worker.
  final String? note;

  /// A reference to a [Partfield].
  final int? partfield;

  /// When the work started.
  final DateTime? workStartedAt;

  /// When the work ended.
  final DateTime? workEndedAt;
  const Task({
    required this.createdAt,
    this.lastUpdatedAt,
    required this.id,
    required this.name,
    this.note,
    this.partfield,
    this.workStartedAt,
    this.workEndedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['created_at'] = Variable<DateTime>(createdAt);
    if (!nullToAbsent || lastUpdatedAt != null) {
      map['last_updated_at'] = Variable<DateTime>(lastUpdatedAt);
    }
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || note != null) {
      map['note'] = Variable<String>(note);
    }
    if (!nullToAbsent || partfield != null) {
      map['partfield'] = Variable<int>(partfield);
    }
    if (!nullToAbsent || workStartedAt != null) {
      map['work_started_at'] = Variable<DateTime>(workStartedAt);
    }
    if (!nullToAbsent || workEndedAt != null) {
      map['work_ended_at'] = Variable<DateTime>(workEndedAt);
    }
    return map;
  }

  TasksCompanion toCompanion(bool nullToAbsent) {
    return TasksCompanion(
      createdAt: Value(createdAt),
      lastUpdatedAt: lastUpdatedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(lastUpdatedAt),
      id: Value(id),
      name: Value(name),
      note: note == null && nullToAbsent ? const Value.absent() : Value(note),
      partfield: partfield == null && nullToAbsent
          ? const Value.absent()
          : Value(partfield),
      workStartedAt: workStartedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(workStartedAt),
      workEndedAt: workEndedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(workEndedAt),
    );
  }

  factory Task.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Task(
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      lastUpdatedAt: serializer.fromJson<DateTime?>(json['lastUpdatedAt']),
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      note: serializer.fromJson<String?>(json['note']),
      partfield: serializer.fromJson<int?>(json['partfield']),
      workStartedAt: serializer.fromJson<DateTime?>(json['workStartedAt']),
      workEndedAt: serializer.fromJson<DateTime?>(json['workEndedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'lastUpdatedAt': serializer.toJson<DateTime?>(lastUpdatedAt),
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'note': serializer.toJson<String?>(note),
      'partfield': serializer.toJson<int?>(partfield),
      'workStartedAt': serializer.toJson<DateTime?>(workStartedAt),
      'workEndedAt': serializer.toJson<DateTime?>(workEndedAt),
    };
  }

  Task copyWith({
    DateTime? createdAt,
    Value<DateTime?> lastUpdatedAt = const Value.absent(),
    int? id,
    String? name,
    Value<String?> note = const Value.absent(),
    Value<int?> partfield = const Value.absent(),
    Value<DateTime?> workStartedAt = const Value.absent(),
    Value<DateTime?> workEndedAt = const Value.absent(),
  }) => Task(
    createdAt: createdAt ?? this.createdAt,
    lastUpdatedAt: lastUpdatedAt.present
        ? lastUpdatedAt.value
        : this.lastUpdatedAt,
    id: id ?? this.id,
    name: name ?? this.name,
    note: note.present ? note.value : this.note,
    partfield: partfield.present ? partfield.value : this.partfield,
    workStartedAt: workStartedAt.present
        ? workStartedAt.value
        : this.workStartedAt,
    workEndedAt: workEndedAt.present ? workEndedAt.value : this.workEndedAt,
  );
  Task copyWithCompanion(TasksCompanion data) {
    return Task(
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      lastUpdatedAt: data.lastUpdatedAt.present
          ? data.lastUpdatedAt.value
          : this.lastUpdatedAt,
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      note: data.note.present ? data.note.value : this.note,
      partfield: data.partfield.present ? data.partfield.value : this.partfield,
      workStartedAt: data.workStartedAt.present
          ? data.workStartedAt.value
          : this.workStartedAt,
      workEndedAt: data.workEndedAt.present
          ? data.workEndedAt.value
          : this.workEndedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Task(')
          ..write('createdAt: $createdAt, ')
          ..write('lastUpdatedAt: $lastUpdatedAt, ')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('note: $note, ')
          ..write('partfield: $partfield, ')
          ..write('workStartedAt: $workStartedAt, ')
          ..write('workEndedAt: $workEndedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    createdAt,
    lastUpdatedAt,
    id,
    name,
    note,
    partfield,
    workStartedAt,
    workEndedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Task &&
          other.createdAt == this.createdAt &&
          other.lastUpdatedAt == this.lastUpdatedAt &&
          other.id == this.id &&
          other.name == this.name &&
          other.note == this.note &&
          other.partfield == this.partfield &&
          other.workStartedAt == this.workStartedAt &&
          other.workEndedAt == this.workEndedAt);
}

class TasksCompanion extends UpdateCompanion<Task> {
  final Value<DateTime> createdAt;
  final Value<DateTime?> lastUpdatedAt;
  final Value<int> id;
  final Value<String> name;
  final Value<String?> note;
  final Value<int?> partfield;
  final Value<DateTime?> workStartedAt;
  final Value<DateTime?> workEndedAt;
  const TasksCompanion({
    this.createdAt = const Value.absent(),
    this.lastUpdatedAt = const Value.absent(),
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.note = const Value.absent(),
    this.partfield = const Value.absent(),
    this.workStartedAt = const Value.absent(),
    this.workEndedAt = const Value.absent(),
  });
  TasksCompanion.insert({
    this.createdAt = const Value.absent(),
    this.lastUpdatedAt = const Value.absent(),
    this.id = const Value.absent(),
    required String name,
    this.note = const Value.absent(),
    this.partfield = const Value.absent(),
    this.workStartedAt = const Value.absent(),
    this.workEndedAt = const Value.absent(),
  }) : name = Value(name);
  static Insertable<Task> custom({
    Expression<DateTime>? createdAt,
    Expression<DateTime>? lastUpdatedAt,
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? note,
    Expression<int>? partfield,
    Expression<DateTime>? workStartedAt,
    Expression<DateTime>? workEndedAt,
  }) {
    return RawValuesInsertable({
      if (createdAt != null) 'created_at': createdAt,
      if (lastUpdatedAt != null) 'last_updated_at': lastUpdatedAt,
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (note != null) 'note': note,
      if (partfield != null) 'partfield': partfield,
      if (workStartedAt != null) 'work_started_at': workStartedAt,
      if (workEndedAt != null) 'work_ended_at': workEndedAt,
    });
  }

  TasksCompanion copyWith({
    Value<DateTime>? createdAt,
    Value<DateTime?>? lastUpdatedAt,
    Value<int>? id,
    Value<String>? name,
    Value<String?>? note,
    Value<int?>? partfield,
    Value<DateTime?>? workStartedAt,
    Value<DateTime?>? workEndedAt,
  }) {
    return TasksCompanion(
      createdAt: createdAt ?? this.createdAt,
      lastUpdatedAt: lastUpdatedAt ?? this.lastUpdatedAt,
      id: id ?? this.id,
      name: name ?? this.name,
      note: note ?? this.note,
      partfield: partfield ?? this.partfield,
      workStartedAt: workStartedAt ?? this.workStartedAt,
      workEndedAt: workEndedAt ?? this.workEndedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (lastUpdatedAt.present) {
      map['last_updated_at'] = Variable<DateTime>(lastUpdatedAt.value);
    }
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (note.present) {
      map['note'] = Variable<String>(note.value);
    }
    if (partfield.present) {
      map['partfield'] = Variable<int>(partfield.value);
    }
    if (workStartedAt.present) {
      map['work_started_at'] = Variable<DateTime>(workStartedAt.value);
    }
    if (workEndedAt.present) {
      map['work_ended_at'] = Variable<DateTime>(workEndedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TasksCompanion(')
          ..write('createdAt: $createdAt, ')
          ..write('lastUpdatedAt: $lastUpdatedAt, ')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('note: $note, ')
          ..write('partfield: $partfield, ')
          ..write('workStartedAt: $workStartedAt, ')
          ..write('workEndedAt: $workEndedAt')
          ..write(')'))
        .toString();
  }
}

class $VehiclesTable extends Vehicles with TableInfo<$VehiclesTable, Vehicle> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $VehiclesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    clientDefault: DateTime.now,
  );
  static const VerificationMeta _lastUpdatedAtMeta = const VerificationMeta(
    'lastUpdatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> lastUpdatedAt =
      GeneratedColumn<DateTime>(
        'last_updated_at',
        aliasedName,
        true,
        type: DriftSqlType.dateTime,
        requiredDuringInsert: false,
      );
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
  @override
  late final GeneratedColumnWithTypeConverter<VehicleType, String> type =
      GeneratedColumn<String>(
        'type',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
      ).withConverter<VehicleType>($VehiclesTable.$convertertype);
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  late final GeneratedColumnWithTypeConverter<VehicleGeometry, String>
  geometry = GeneratedColumn<String>(
    'geometry',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  ).withConverter<VehicleGeometry>($VehiclesTable.$convertergeometry);
  @override
  late final GeneratedColumnWithTypeConverter<GnssAntennaConfig?, String>
  gnssAntennaConfig =
      GeneratedColumn<String>(
        'gnss_antenna_config',
        aliasedName,
        true,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
      ).withConverter<GnssAntennaConfig?>(
        $VehiclesTable.$convertergnssAntennaConfign,
      );
  @override
  late final GeneratedColumnWithTypeConverter<ImuConfig?, String> imuConfig =
      GeneratedColumn<String>(
        'imu_config',
        aliasedName,
        true,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
      ).withConverter<ImuConfig?>($VehiclesTable.$converterimuConfign);
  @override
  late final GeneratedColumnWithTypeConverter<WasConfig?, String> wasConfig =
      GeneratedColumn<String>(
        'was_config',
        aliasedName,
        true,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
      ).withConverter<WasConfig?>($VehiclesTable.$converterwasConfign);
  @override
  late final GeneratedColumnWithTypeConverter<SteeringHardwareConfig?, String>
  steeringHardwareConfig =
      GeneratedColumn<String>(
        'steering_hardware_config',
        aliasedName,
        true,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
      ).withConverter<SteeringHardwareConfig?>(
        $VehiclesTable.$convertersteeringHardwareConfign,
      );
  @override
  late final GeneratedColumnWithTypeConverter<VehicleThresholds?, String>
  thresholds = GeneratedColumn<String>(
    'thresholds',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  ).withConverter<VehicleThresholds?>($VehiclesTable.$converterthresholdsn);
  @override
  late final GeneratedColumnWithTypeConverter<PathTrackingParameters?, String>
  pathTrackingParameters =
      GeneratedColumn<String>(
        'path_tracking_parameters',
        aliasedName,
        true,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
      ).withConverter<PathTrackingParameters?>(
        $VehiclesTable.$converterpathTrackingParametersn,
      );
  @override
  late final GeneratedColumnWithTypeConverter<ManufacturerColors?, String>
  colorScheme = GeneratedColumn<String>(
    'color_scheme',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  ).withConverter<ManufacturerColors?>($VehiclesTable.$convertercolorSchemen);
  @override
  List<GeneratedColumn> get $columns => [
    createdAt,
    lastUpdatedAt,
    id,
    type,
    name,
    geometry,
    gnssAntennaConfig,
    imuConfig,
    wasConfig,
    steeringHardwareConfig,
    thresholds,
    pathTrackingParameters,
    colorScheme,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'vehicles';
  @override
  VerificationContext validateIntegrity(
    Insertable<Vehicle> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    if (data.containsKey('last_updated_at')) {
      context.handle(
        _lastUpdatedAtMeta,
        lastUpdatedAt.isAcceptableOrUnknown(
          data['last_updated_at']!,
          _lastUpdatedAtMeta,
        ),
      );
    }
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Vehicle map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Vehicle.fromDatabase(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      type: $VehiclesTable.$convertertype.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}type'],
        )!,
      ),
      geometry: $VehiclesTable.$convertergeometry.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}geometry'],
        )!,
      ),
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      ),
      gnssAntennaConfig: $VehiclesTable.$convertergnssAntennaConfign.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}gnss_antenna_config'],
        ),
      ),
      imuConfig: $VehiclesTable.$converterimuConfign.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}imu_config'],
        ),
      ),
      steeringHardwareConfig: $VehiclesTable.$convertersteeringHardwareConfign
          .fromSql(
            attachedDatabase.typeMapping.read(
              DriftSqlType.string,
              data['${effectivePrefix}steering_hardware_config'],
            ),
          ),
      wasConfig: $VehiclesTable.$converterwasConfign.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}was_config'],
        ),
      ),
      pathTrackingParameters: $VehiclesTable.$converterpathTrackingParametersn
          .fromSql(
            attachedDatabase.typeMapping.read(
              DriftSqlType.string,
              data['${effectivePrefix}path_tracking_parameters'],
            ),
          ),
      colorScheme: $VehiclesTable.$convertercolorSchemen.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}color_scheme'],
        ),
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      lastUpdatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}last_updated_at'],
      ),
    );
  }

  @override
  $VehiclesTable createAlias(String alias) {
    return $VehiclesTable(attachedDatabase, alias);
  }

  static JsonTypeConverter2<VehicleType, String, String> $convertertype =
      const EnumNameConverter<VehicleType>(VehicleType.values);
  static JsonTypeConverter2<VehicleGeometry, String, Object?>
  $convertergeometry = VehicleGeometryConverter.converter;
  static JsonTypeConverter2<GnssAntennaConfig, String, Object?>
  $convertergnssAntennaConfig = GnssAntennaConfigConverter.converter;
  static JsonTypeConverter2<GnssAntennaConfig?, String?, Object?>
  $convertergnssAntennaConfign = JsonTypeConverter2.asNullable(
    $convertergnssAntennaConfig,
  );
  static JsonTypeConverter2<ImuConfig, String, Object?> $converterimuConfig =
      ImuConfigConverter.converter;
  static JsonTypeConverter2<ImuConfig?, String?, Object?> $converterimuConfign =
      JsonTypeConverter2.asNullable($converterimuConfig);
  static JsonTypeConverter2<WasConfig, String, Object?> $converterwasConfig =
      WasConfigConverter.converter;
  static JsonTypeConverter2<WasConfig?, String?, Object?> $converterwasConfign =
      JsonTypeConverter2.asNullable($converterwasConfig);
  static JsonTypeConverter2<SteeringHardwareConfig, String, Object?>
  $convertersteeringHardwareConfig = SteeringHardwareConfigConverter.converter;
  static JsonTypeConverter2<SteeringHardwareConfig?, String?, Object?>
  $convertersteeringHardwareConfign = JsonTypeConverter2.asNullable(
    $convertersteeringHardwareConfig,
  );
  static JsonTypeConverter2<VehicleThresholds, String, Object?>
  $converterthresholds = VehicleThresholdsConverter.converter;
  static JsonTypeConverter2<VehicleThresholds?, String?, Object?>
  $converterthresholdsn = JsonTypeConverter2.asNullable($converterthresholds);
  static JsonTypeConverter2<PathTrackingParameters, String, Object?>
  $converterpathTrackingParameters = PathTrackingParametersConverter.converter;
  static JsonTypeConverter2<PathTrackingParameters?, String?, Object?>
  $converterpathTrackingParametersn = JsonTypeConverter2.asNullable(
    $converterpathTrackingParameters,
  );
  static JsonTypeConverter2<ManufacturerColors, String, Object?>
  $convertercolorScheme = ManufacturerColorsConverter.converter;
  static JsonTypeConverter2<ManufacturerColors?, String?, Object?>
  $convertercolorSchemen = JsonTypeConverter2.asNullable($convertercolorScheme);
}

class VehiclesCompanion extends UpdateCompanion<Vehicle> {
  final Value<DateTime> createdAt;
  final Value<DateTime?> lastUpdatedAt;
  final Value<int> id;
  final Value<VehicleType> type;
  final Value<String?> name;
  final Value<VehicleGeometry> geometry;
  final Value<GnssAntennaConfig?> gnssAntennaConfig;
  final Value<ImuConfig?> imuConfig;
  final Value<WasConfig?> wasConfig;
  final Value<SteeringHardwareConfig?> steeringHardwareConfig;
  final Value<VehicleThresholds?> thresholds;
  final Value<PathTrackingParameters?> pathTrackingParameters;
  final Value<ManufacturerColors?> colorScheme;
  const VehiclesCompanion({
    this.createdAt = const Value.absent(),
    this.lastUpdatedAt = const Value.absent(),
    this.id = const Value.absent(),
    this.type = const Value.absent(),
    this.name = const Value.absent(),
    this.geometry = const Value.absent(),
    this.gnssAntennaConfig = const Value.absent(),
    this.imuConfig = const Value.absent(),
    this.wasConfig = const Value.absent(),
    this.steeringHardwareConfig = const Value.absent(),
    this.thresholds = const Value.absent(),
    this.pathTrackingParameters = const Value.absent(),
    this.colorScheme = const Value.absent(),
  });
  VehiclesCompanion.insert({
    this.createdAt = const Value.absent(),
    this.lastUpdatedAt = const Value.absent(),
    this.id = const Value.absent(),
    required VehicleType type,
    this.name = const Value.absent(),
    required VehicleGeometry geometry,
    this.gnssAntennaConfig = const Value.absent(),
    this.imuConfig = const Value.absent(),
    this.wasConfig = const Value.absent(),
    this.steeringHardwareConfig = const Value.absent(),
    this.thresholds = const Value.absent(),
    this.pathTrackingParameters = const Value.absent(),
    this.colorScheme = const Value.absent(),
  }) : type = Value(type),
       geometry = Value(geometry);
  static Insertable<Vehicle> custom({
    Expression<DateTime>? createdAt,
    Expression<DateTime>? lastUpdatedAt,
    Expression<int>? id,
    Expression<String>? type,
    Expression<String>? name,
    Expression<String>? geometry,
    Expression<String>? gnssAntennaConfig,
    Expression<String>? imuConfig,
    Expression<String>? wasConfig,
    Expression<String>? steeringHardwareConfig,
    Expression<String>? thresholds,
    Expression<String>? pathTrackingParameters,
    Expression<String>? colorScheme,
  }) {
    return RawValuesInsertable({
      if (createdAt != null) 'created_at': createdAt,
      if (lastUpdatedAt != null) 'last_updated_at': lastUpdatedAt,
      if (id != null) 'id': id,
      if (type != null) 'type': type,
      if (name != null) 'name': name,
      if (geometry != null) 'geometry': geometry,
      if (gnssAntennaConfig != null) 'gnss_antenna_config': gnssAntennaConfig,
      if (imuConfig != null) 'imu_config': imuConfig,
      if (wasConfig != null) 'was_config': wasConfig,
      if (steeringHardwareConfig != null)
        'steering_hardware_config': steeringHardwareConfig,
      if (thresholds != null) 'thresholds': thresholds,
      if (pathTrackingParameters != null)
        'path_tracking_parameters': pathTrackingParameters,
      if (colorScheme != null) 'color_scheme': colorScheme,
    });
  }

  VehiclesCompanion copyWith({
    Value<DateTime>? createdAt,
    Value<DateTime?>? lastUpdatedAt,
    Value<int>? id,
    Value<VehicleType>? type,
    Value<String?>? name,
    Value<VehicleGeometry>? geometry,
    Value<GnssAntennaConfig?>? gnssAntennaConfig,
    Value<ImuConfig?>? imuConfig,
    Value<WasConfig?>? wasConfig,
    Value<SteeringHardwareConfig?>? steeringHardwareConfig,
    Value<VehicleThresholds?>? thresholds,
    Value<PathTrackingParameters?>? pathTrackingParameters,
    Value<ManufacturerColors?>? colorScheme,
  }) {
    return VehiclesCompanion(
      createdAt: createdAt ?? this.createdAt,
      lastUpdatedAt: lastUpdatedAt ?? this.lastUpdatedAt,
      id: id ?? this.id,
      type: type ?? this.type,
      name: name ?? this.name,
      geometry: geometry ?? this.geometry,
      gnssAntennaConfig: gnssAntennaConfig ?? this.gnssAntennaConfig,
      imuConfig: imuConfig ?? this.imuConfig,
      wasConfig: wasConfig ?? this.wasConfig,
      steeringHardwareConfig:
          steeringHardwareConfig ?? this.steeringHardwareConfig,
      thresholds: thresholds ?? this.thresholds,
      pathTrackingParameters:
          pathTrackingParameters ?? this.pathTrackingParameters,
      colorScheme: colorScheme ?? this.colorScheme,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (lastUpdatedAt.present) {
      map['last_updated_at'] = Variable<DateTime>(lastUpdatedAt.value);
    }
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (type.present) {
      map['type'] = Variable<String>(
        $VehiclesTable.$convertertype.toSql(type.value),
      );
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (geometry.present) {
      map['geometry'] = Variable<String>(
        $VehiclesTable.$convertergeometry.toSql(geometry.value),
      );
    }
    if (gnssAntennaConfig.present) {
      map['gnss_antenna_config'] = Variable<String>(
        $VehiclesTable.$convertergnssAntennaConfign.toSql(
          gnssAntennaConfig.value,
        ),
      );
    }
    if (imuConfig.present) {
      map['imu_config'] = Variable<String>(
        $VehiclesTable.$converterimuConfign.toSql(imuConfig.value),
      );
    }
    if (wasConfig.present) {
      map['was_config'] = Variable<String>(
        $VehiclesTable.$converterwasConfign.toSql(wasConfig.value),
      );
    }
    if (steeringHardwareConfig.present) {
      map['steering_hardware_config'] = Variable<String>(
        $VehiclesTable.$convertersteeringHardwareConfign.toSql(
          steeringHardwareConfig.value,
        ),
      );
    }
    if (thresholds.present) {
      map['thresholds'] = Variable<String>(
        $VehiclesTable.$converterthresholdsn.toSql(thresholds.value),
      );
    }
    if (pathTrackingParameters.present) {
      map['path_tracking_parameters'] = Variable<String>(
        $VehiclesTable.$converterpathTrackingParametersn.toSql(
          pathTrackingParameters.value,
        ),
      );
    }
    if (colorScheme.present) {
      map['color_scheme'] = Variable<String>(
        $VehiclesTable.$convertercolorSchemen.toSql(colorScheme.value),
      );
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('VehiclesCompanion(')
          ..write('createdAt: $createdAt, ')
          ..write('lastUpdatedAt: $lastUpdatedAt, ')
          ..write('id: $id, ')
          ..write('type: $type, ')
          ..write('name: $name, ')
          ..write('geometry: $geometry, ')
          ..write('gnssAntennaConfig: $gnssAntennaConfig, ')
          ..write('imuConfig: $imuConfig, ')
          ..write('wasConfig: $wasConfig, ')
          ..write('steeringHardwareConfig: $steeringHardwareConfig, ')
          ..write('thresholds: $thresholds, ')
          ..write('pathTrackingParameters: $pathTrackingParameters, ')
          ..write('colorScheme: $colorScheme')
          ..write(')'))
        .toString();
  }
}

class $ImplementsTable extends Implements
    with TableInfo<$ImplementsTable, Equipment> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ImplementsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    clientDefault: DateTime.now,
  );
  static const VerificationMeta _lastUpdatedAtMeta = const VerificationMeta(
    'lastUpdatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> lastUpdatedAt =
      GeneratedColumn<DateTime>(
        'last_updated_at',
        aliasedName,
        true,
        type: DriftSqlType.dateTime,
        requiredDuringInsert: false,
      );
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
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [createdAt, lastUpdatedAt, id, name];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'implements';
  @override
  VerificationContext validateIntegrity(
    Insertable<Equipment> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    if (data.containsKey('last_updated_at')) {
      context.handle(
        _lastUpdatedAtMeta,
        lastUpdatedAt.isAcceptableOrUnknown(
          data['last_updated_at']!,
          _lastUpdatedAtMeta,
        ),
      );
    }
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Equipment map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Equipment.fromDatabase(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      lastUpdatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}last_updated_at'],
      ),
    );
  }

  @override
  $ImplementsTable createAlias(String alias) {
    return $ImplementsTable(attachedDatabase, alias);
  }
}

class ImplementsCompanion extends UpdateCompanion<Equipment> {
  final Value<DateTime> createdAt;
  final Value<DateTime?> lastUpdatedAt;
  final Value<int> id;
  final Value<String?> name;
  const ImplementsCompanion({
    this.createdAt = const Value.absent(),
    this.lastUpdatedAt = const Value.absent(),
    this.id = const Value.absent(),
    this.name = const Value.absent(),
  });
  ImplementsCompanion.insert({
    this.createdAt = const Value.absent(),
    this.lastUpdatedAt = const Value.absent(),
    this.id = const Value.absent(),
    this.name = const Value.absent(),
  });
  static Insertable<Equipment> custom({
    Expression<DateTime>? createdAt,
    Expression<DateTime>? lastUpdatedAt,
    Expression<int>? id,
    Expression<String>? name,
  }) {
    return RawValuesInsertable({
      if (createdAt != null) 'created_at': createdAt,
      if (lastUpdatedAt != null) 'last_updated_at': lastUpdatedAt,
      if (id != null) 'id': id,
      if (name != null) 'name': name,
    });
  }

  ImplementsCompanion copyWith({
    Value<DateTime>? createdAt,
    Value<DateTime?>? lastUpdatedAt,
    Value<int>? id,
    Value<String?>? name,
  }) {
    return ImplementsCompanion(
      createdAt: createdAt ?? this.createdAt,
      lastUpdatedAt: lastUpdatedAt ?? this.lastUpdatedAt,
      id: id ?? this.id,
      name: name ?? this.name,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (lastUpdatedAt.present) {
      map['last_updated_at'] = Variable<DateTime>(lastUpdatedAt.value);
    }
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ImplementsCompanion(')
          ..write('createdAt: $createdAt, ')
          ..write('lastUpdatedAt: $lastUpdatedAt, ')
          ..write('id: $id, ')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }
}

class $ConnectorsTable extends Connectors
    with TableInfo<$ConnectorsTable, Connector> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ConnectorsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    clientDefault: DateTime.now,
  );
  static const VerificationMeta _lastUpdatedAtMeta = const VerificationMeta(
    'lastUpdatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> lastUpdatedAt =
      GeneratedColumn<DateTime>(
        'last_updated_at',
        aliasedName,
        true,
        type: DriftSqlType.dateTime,
        requiredDuringInsert: false,
      );
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
  static const VerificationMeta _vehicleMeta = const VerificationMeta(
    'vehicle',
  );
  @override
  late final GeneratedColumn<int> vehicle = GeneratedColumn<int>(
    'vehicle',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES vehicles (id)',
    ),
  );
  static const VerificationMeta _implementMeta = const VerificationMeta(
    'implement',
  );
  @override
  late final GeneratedColumn<int> implement = GeneratedColumn<int>(
    'implement',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES implements (id)',
    ),
  );
  @override
  late final GeneratedColumnWithTypeConverter<ConnectorType, String> type =
      GeneratedColumn<String>(
        'type',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
      ).withConverter<ConnectorType>($ConnectorsTable.$convertertype);
  @override
  late final GeneratedColumnWithTypeConverter<ConnectorRelation, String>
  relation = GeneratedColumn<String>(
    'relation',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  ).withConverter<ConnectorRelation>($ConnectorsTable.$converterrelation);
  static const VerificationMeta _longitudinalOffsetFromRefMeta =
      const VerificationMeta('longitudinalOffsetFromRef');
  @override
  late final GeneratedColumn<double> longitudinalOffsetFromRef =
      GeneratedColumn<double>(
        'longitudinal_offset_from_ref',
        aliasedName,
        false,
        type: DriftSqlType.double,
        requiredDuringInsert: true,
      );
  static const VerificationMeta _lateralOffsetFromRefMeta =
      const VerificationMeta('lateralOffsetFromRef');
  @override
  late final GeneratedColumn<double> lateralOffsetFromRef =
      GeneratedColumn<double>(
        'lateral_offset_from_ref',
        aliasedName,
        false,
        type: DriftSqlType.double,
        requiredDuringInsert: true,
      );
  static const VerificationMeta _verticalOffsetFromRefMeta =
      const VerificationMeta('verticalOffsetFromRef');
  @override
  late final GeneratedColumn<double> verticalOffsetFromRef =
      GeneratedColumn<double>(
        'vertical_offset_from_ref',
        aliasedName,
        false,
        type: DriftSqlType.double,
        requiredDuringInsert: false,
        defaultValue: const Constant(0),
      );
  static const VerificationMeta _angleMeta = const VerificationMeta('angle');
  @override
  late final GeneratedColumn<double> angle = GeneratedColumn<double>(
    'angle',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    createdAt,
    lastUpdatedAt,
    id,
    vehicle,
    implement,
    type,
    relation,
    longitudinalOffsetFromRef,
    lateralOffsetFromRef,
    verticalOffsetFromRef,
    angle,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'connectors';
  @override
  VerificationContext validateIntegrity(
    Insertable<Connector> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    if (data.containsKey('last_updated_at')) {
      context.handle(
        _lastUpdatedAtMeta,
        lastUpdatedAt.isAcceptableOrUnknown(
          data['last_updated_at']!,
          _lastUpdatedAtMeta,
        ),
      );
    }
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('vehicle')) {
      context.handle(
        _vehicleMeta,
        vehicle.isAcceptableOrUnknown(data['vehicle']!, _vehicleMeta),
      );
    }
    if (data.containsKey('implement')) {
      context.handle(
        _implementMeta,
        implement.isAcceptableOrUnknown(data['implement']!, _implementMeta),
      );
    }
    if (data.containsKey('longitudinal_offset_from_ref')) {
      context.handle(
        _longitudinalOffsetFromRefMeta,
        longitudinalOffsetFromRef.isAcceptableOrUnknown(
          data['longitudinal_offset_from_ref']!,
          _longitudinalOffsetFromRefMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_longitudinalOffsetFromRefMeta);
    }
    if (data.containsKey('lateral_offset_from_ref')) {
      context.handle(
        _lateralOffsetFromRefMeta,
        lateralOffsetFromRef.isAcceptableOrUnknown(
          data['lateral_offset_from_ref']!,
          _lateralOffsetFromRefMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_lateralOffsetFromRefMeta);
    }
    if (data.containsKey('vertical_offset_from_ref')) {
      context.handle(
        _verticalOffsetFromRefMeta,
        verticalOffsetFromRef.isAcceptableOrUnknown(
          data['vertical_offset_from_ref']!,
          _verticalOffsetFromRefMeta,
        ),
      );
    }
    if (data.containsKey('angle')) {
      context.handle(
        _angleMeta,
        angle.isAcceptableOrUnknown(data['angle']!, _angleMeta),
      );
    } else if (isInserting) {
      context.missing(_angleMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Connector map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Connector.fromDatabase(
      longitudinalOffsetFromRef: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}longitudinal_offset_from_ref'],
      )!,
      lateralOffsetFromRef: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}lateral_offset_from_ref'],
      )!,
      type: $ConnectorsTable.$convertertype.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}type'],
        )!,
      ),
      relation: $ConnectorsTable.$converterrelation.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}relation'],
        )!,
      ),
      vehicle: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}vehicle'],
      ),
      implement: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}implement'],
      ),
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      verticalOffsetFromRef: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}vertical_offset_from_ref'],
      )!,
      angle: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}angle'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      lastUpdatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}last_updated_at'],
      ),
    );
  }

  @override
  $ConnectorsTable createAlias(String alias) {
    return $ConnectorsTable(attachedDatabase, alias);
  }

  static JsonTypeConverter2<ConnectorType, String, String> $convertertype =
      const EnumNameConverter<ConnectorType>(ConnectorType.values);
  static JsonTypeConverter2<ConnectorRelation, String, String>
  $converterrelation = const EnumNameConverter<ConnectorRelation>(
    ConnectorRelation.values,
  );
}

class ConnectorsCompanion extends UpdateCompanion<Connector> {
  final Value<DateTime> createdAt;
  final Value<DateTime?> lastUpdatedAt;
  final Value<int> id;
  final Value<int?> vehicle;
  final Value<int?> implement;
  final Value<ConnectorType> type;
  final Value<ConnectorRelation> relation;
  final Value<double> longitudinalOffsetFromRef;
  final Value<double> lateralOffsetFromRef;
  final Value<double> verticalOffsetFromRef;
  final Value<double> angle;
  const ConnectorsCompanion({
    this.createdAt = const Value.absent(),
    this.lastUpdatedAt = const Value.absent(),
    this.id = const Value.absent(),
    this.vehicle = const Value.absent(),
    this.implement = const Value.absent(),
    this.type = const Value.absent(),
    this.relation = const Value.absent(),
    this.longitudinalOffsetFromRef = const Value.absent(),
    this.lateralOffsetFromRef = const Value.absent(),
    this.verticalOffsetFromRef = const Value.absent(),
    this.angle = const Value.absent(),
  });
  ConnectorsCompanion.insert({
    this.createdAt = const Value.absent(),
    this.lastUpdatedAt = const Value.absent(),
    this.id = const Value.absent(),
    this.vehicle = const Value.absent(),
    this.implement = const Value.absent(),
    required ConnectorType type,
    required ConnectorRelation relation,
    required double longitudinalOffsetFromRef,
    required double lateralOffsetFromRef,
    this.verticalOffsetFromRef = const Value.absent(),
    required double angle,
  }) : type = Value(type),
       relation = Value(relation),
       longitudinalOffsetFromRef = Value(longitudinalOffsetFromRef),
       lateralOffsetFromRef = Value(lateralOffsetFromRef),
       angle = Value(angle);
  static Insertable<Connector> custom({
    Expression<DateTime>? createdAt,
    Expression<DateTime>? lastUpdatedAt,
    Expression<int>? id,
    Expression<int>? vehicle,
    Expression<int>? implement,
    Expression<String>? type,
    Expression<String>? relation,
    Expression<double>? longitudinalOffsetFromRef,
    Expression<double>? lateralOffsetFromRef,
    Expression<double>? verticalOffsetFromRef,
    Expression<double>? angle,
  }) {
    return RawValuesInsertable({
      if (createdAt != null) 'created_at': createdAt,
      if (lastUpdatedAt != null) 'last_updated_at': lastUpdatedAt,
      if (id != null) 'id': id,
      if (vehicle != null) 'vehicle': vehicle,
      if (implement != null) 'implement': implement,
      if (type != null) 'type': type,
      if (relation != null) 'relation': relation,
      if (longitudinalOffsetFromRef != null)
        'longitudinal_offset_from_ref': longitudinalOffsetFromRef,
      if (lateralOffsetFromRef != null)
        'lateral_offset_from_ref': lateralOffsetFromRef,
      if (verticalOffsetFromRef != null)
        'vertical_offset_from_ref': verticalOffsetFromRef,
      if (angle != null) 'angle': angle,
    });
  }

  ConnectorsCompanion copyWith({
    Value<DateTime>? createdAt,
    Value<DateTime?>? lastUpdatedAt,
    Value<int>? id,
    Value<int?>? vehicle,
    Value<int?>? implement,
    Value<ConnectorType>? type,
    Value<ConnectorRelation>? relation,
    Value<double>? longitudinalOffsetFromRef,
    Value<double>? lateralOffsetFromRef,
    Value<double>? verticalOffsetFromRef,
    Value<double>? angle,
  }) {
    return ConnectorsCompanion(
      createdAt: createdAt ?? this.createdAt,
      lastUpdatedAt: lastUpdatedAt ?? this.lastUpdatedAt,
      id: id ?? this.id,
      vehicle: vehicle ?? this.vehicle,
      implement: implement ?? this.implement,
      type: type ?? this.type,
      relation: relation ?? this.relation,
      longitudinalOffsetFromRef:
          longitudinalOffsetFromRef ?? this.longitudinalOffsetFromRef,
      lateralOffsetFromRef: lateralOffsetFromRef ?? this.lateralOffsetFromRef,
      verticalOffsetFromRef:
          verticalOffsetFromRef ?? this.verticalOffsetFromRef,
      angle: angle ?? this.angle,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (lastUpdatedAt.present) {
      map['last_updated_at'] = Variable<DateTime>(lastUpdatedAt.value);
    }
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (vehicle.present) {
      map['vehicle'] = Variable<int>(vehicle.value);
    }
    if (implement.present) {
      map['implement'] = Variable<int>(implement.value);
    }
    if (type.present) {
      map['type'] = Variable<String>(
        $ConnectorsTable.$convertertype.toSql(type.value),
      );
    }
    if (relation.present) {
      map['relation'] = Variable<String>(
        $ConnectorsTable.$converterrelation.toSql(relation.value),
      );
    }
    if (longitudinalOffsetFromRef.present) {
      map['longitudinal_offset_from_ref'] = Variable<double>(
        longitudinalOffsetFromRef.value,
      );
    }
    if (lateralOffsetFromRef.present) {
      map['lateral_offset_from_ref'] = Variable<double>(
        lateralOffsetFromRef.value,
      );
    }
    if (verticalOffsetFromRef.present) {
      map['vertical_offset_from_ref'] = Variable<double>(
        verticalOffsetFromRef.value,
      );
    }
    if (angle.present) {
      map['angle'] = Variable<double>(angle.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ConnectorsCompanion(')
          ..write('createdAt: $createdAt, ')
          ..write('lastUpdatedAt: $lastUpdatedAt, ')
          ..write('id: $id, ')
          ..write('vehicle: $vehicle, ')
          ..write('implement: $implement, ')
          ..write('type: $type, ')
          ..write('relation: $relation, ')
          ..write('longitudinalOffsetFromRef: $longitudinalOffsetFromRef, ')
          ..write('lateralOffsetFromRef: $lateralOffsetFromRef, ')
          ..write('verticalOffsetFromRef: $verticalOffsetFromRef, ')
          ..write('angle: $angle')
          ..write(')'))
        .toString();
  }
}

class $ConnectionsTable extends Connections
    with TableInfo<$ConnectionsTable, Connection> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ConnectionsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _taskMeta = const VerificationMeta('task');
  @override
  late final GeneratedColumn<int> task = GeneratedColumn<int>(
    'task',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES tasks (id)',
    ),
  );
  static const VerificationMeta _parentConnectorMeta = const VerificationMeta(
    'parentConnector',
  );
  @override
  late final GeneratedColumn<int> parentConnector = GeneratedColumn<int>(
    'parent_connector',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES connectors (id)',
    ),
  );
  static const VerificationMeta _childConnectorMeta = const VerificationMeta(
    'childConnector',
  );
  @override
  late final GeneratedColumn<int> childConnector = GeneratedColumn<int>(
    'child_connector',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES connectors (id)',
    ),
  );
  @override
  List<GeneratedColumn> get $columns => [task, parentConnector, childConnector];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'connections';
  @override
  VerificationContext validateIntegrity(
    Insertable<Connection> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('task')) {
      context.handle(
        _taskMeta,
        task.isAcceptableOrUnknown(data['task']!, _taskMeta),
      );
    } else if (isInserting) {
      context.missing(_taskMeta);
    }
    if (data.containsKey('parent_connector')) {
      context.handle(
        _parentConnectorMeta,
        parentConnector.isAcceptableOrUnknown(
          data['parent_connector']!,
          _parentConnectorMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_parentConnectorMeta);
    }
    if (data.containsKey('child_connector')) {
      context.handle(
        _childConnectorMeta,
        childConnector.isAcceptableOrUnknown(
          data['child_connector']!,
          _childConnectorMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_childConnectorMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {
    task,
    parentConnector,
    childConnector,
  };
  @override
  Connection map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Connection(
      task: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}task'],
      )!,
      parentConnector: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}parent_connector'],
      )!,
      childConnector: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}child_connector'],
      )!,
    );
  }

  @override
  $ConnectionsTable createAlias(String alias) {
    return $ConnectionsTable(attachedDatabase, alias);
  }

  @override
  bool get withoutRowId => true;
}

class Connection extends DataClass implements Insertable<Connection> {
  /// Reference to a [Task].
  final int task;

  /// Reference to the parent [Connector].
  final int parentConnector;

  /// Reference to the child [Connector].
  final int childConnector;
  const Connection({
    required this.task,
    required this.parentConnector,
    required this.childConnector,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['task'] = Variable<int>(task);
    map['parent_connector'] = Variable<int>(parentConnector);
    map['child_connector'] = Variable<int>(childConnector);
    return map;
  }

  ConnectionsCompanion toCompanion(bool nullToAbsent) {
    return ConnectionsCompanion(
      task: Value(task),
      parentConnector: Value(parentConnector),
      childConnector: Value(childConnector),
    );
  }

  factory Connection.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Connection(
      task: serializer.fromJson<int>(json['task']),
      parentConnector: serializer.fromJson<int>(json['parentConnector']),
      childConnector: serializer.fromJson<int>(json['childConnector']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'task': serializer.toJson<int>(task),
      'parentConnector': serializer.toJson<int>(parentConnector),
      'childConnector': serializer.toJson<int>(childConnector),
    };
  }

  Connection copyWith({int? task, int? parentConnector, int? childConnector}) =>
      Connection(
        task: task ?? this.task,
        parentConnector: parentConnector ?? this.parentConnector,
        childConnector: childConnector ?? this.childConnector,
      );
  Connection copyWithCompanion(ConnectionsCompanion data) {
    return Connection(
      task: data.task.present ? data.task.value : this.task,
      parentConnector: data.parentConnector.present
          ? data.parentConnector.value
          : this.parentConnector,
      childConnector: data.childConnector.present
          ? data.childConnector.value
          : this.childConnector,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Connection(')
          ..write('task: $task, ')
          ..write('parentConnector: $parentConnector, ')
          ..write('childConnector: $childConnector')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(task, parentConnector, childConnector);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Connection &&
          other.task == this.task &&
          other.parentConnector == this.parentConnector &&
          other.childConnector == this.childConnector);
}

class ConnectionsCompanion extends UpdateCompanion<Connection> {
  final Value<int> task;
  final Value<int> parentConnector;
  final Value<int> childConnector;
  const ConnectionsCompanion({
    this.task = const Value.absent(),
    this.parentConnector = const Value.absent(),
    this.childConnector = const Value.absent(),
  });
  ConnectionsCompanion.insert({
    required int task,
    required int parentConnector,
    required int childConnector,
  }) : task = Value(task),
       parentConnector = Value(parentConnector),
       childConnector = Value(childConnector);
  static Insertable<Connection> custom({
    Expression<int>? task,
    Expression<int>? parentConnector,
    Expression<int>? childConnector,
  }) {
    return RawValuesInsertable({
      if (task != null) 'task': task,
      if (parentConnector != null) 'parent_connector': parentConnector,
      if (childConnector != null) 'child_connector': childConnector,
    });
  }

  ConnectionsCompanion copyWith({
    Value<int>? task,
    Value<int>? parentConnector,
    Value<int>? childConnector,
  }) {
    return ConnectionsCompanion(
      task: task ?? this.task,
      parentConnector: parentConnector ?? this.parentConnector,
      childConnector: childConnector ?? this.childConnector,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (task.present) {
      map['task'] = Variable<int>(task.value);
    }
    if (parentConnector.present) {
      map['parent_connector'] = Variable<int>(parentConnector.value);
    }
    if (childConnector.present) {
      map['child_connector'] = Variable<int>(childConnector.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ConnectionsCompanion(')
          ..write('task: $task, ')
          ..write('parentConnector: $parentConnector, ')
          ..write('childConnector: $childConnector')
          ..write(')'))
        .toString();
  }
}

class $PolygonsTable extends Polygons with TableInfo<$PolygonsTable, Polygon> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PolygonsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    clientDefault: DateTime.now,
  );
  static const VerificationMeta _lastUpdatedAtMeta = const VerificationMeta(
    'lastUpdatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> lastUpdatedAt =
      GeneratedColumn<DateTime>(
        'last_updated_at',
        aliasedName,
        true,
        type: DriftSqlType.dateTime,
        requiredDuringInsert: false,
      );
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
  @override
  late final GeneratedColumnWithTypeConverter<PolygonType, int> type =
      GeneratedColumn<int>(
        'type',
        aliasedName,
        false,
        type: DriftSqlType.int,
        requiredDuringInsert: true,
      ).withConverter<PolygonType>($PolygonsTable.$convertertype);
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    createdAt,
    lastUpdatedAt,
    id,
    type,
    name,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'polygons';
  @override
  VerificationContext validateIntegrity(
    Insertable<Polygon> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    if (data.containsKey('last_updated_at')) {
      context.handle(
        _lastUpdatedAtMeta,
        lastUpdatedAt.isAcceptableOrUnknown(
          data['last_updated_at']!,
          _lastUpdatedAtMeta,
        ),
      );
    }
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Polygon map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Polygon(
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      lastUpdatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}last_updated_at'],
      ),
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      type: $PolygonsTable.$convertertype.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.int,
          data['${effectivePrefix}type'],
        )!,
      ),
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      ),
    );
  }

  @override
  $PolygonsTable createAlias(String alias) {
    return $PolygonsTable(attachedDatabase, alias);
  }

  static TypeConverter<PolygonType, int> $convertertype =
      const PolygonTypeConverter();
}

class Polygon extends DataClass implements Insertable<Polygon> {
  /// When this was created.
  final DateTime createdAt;

  /// When this was last updated.
  final DateTime? lastUpdatedAt;

  /// The local database ID of this.
  final int id;

  /// Which type of polygon this is.
  final PolygonType type;

  /// The name of this.
  final String? name;
  const Polygon({
    required this.createdAt,
    this.lastUpdatedAt,
    required this.id,
    required this.type,
    this.name,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['created_at'] = Variable<DateTime>(createdAt);
    if (!nullToAbsent || lastUpdatedAt != null) {
      map['last_updated_at'] = Variable<DateTime>(lastUpdatedAt);
    }
    map['id'] = Variable<int>(id);
    {
      map['type'] = Variable<int>($PolygonsTable.$convertertype.toSql(type));
    }
    if (!nullToAbsent || name != null) {
      map['name'] = Variable<String>(name);
    }
    return map;
  }

  PolygonsCompanion toCompanion(bool nullToAbsent) {
    return PolygonsCompanion(
      createdAt: Value(createdAt),
      lastUpdatedAt: lastUpdatedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(lastUpdatedAt),
      id: Value(id),
      type: Value(type),
      name: name == null && nullToAbsent ? const Value.absent() : Value(name),
    );
  }

  factory Polygon.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Polygon(
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      lastUpdatedAt: serializer.fromJson<DateTime?>(json['lastUpdatedAt']),
      id: serializer.fromJson<int>(json['id']),
      type: serializer.fromJson<PolygonType>(json['type']),
      name: serializer.fromJson<String?>(json['name']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'lastUpdatedAt': serializer.toJson<DateTime?>(lastUpdatedAt),
      'id': serializer.toJson<int>(id),
      'type': serializer.toJson<PolygonType>(type),
      'name': serializer.toJson<String?>(name),
    };
  }

  Polygon copyWith({
    DateTime? createdAt,
    Value<DateTime?> lastUpdatedAt = const Value.absent(),
    int? id,
    PolygonType? type,
    Value<String?> name = const Value.absent(),
  }) => Polygon(
    createdAt: createdAt ?? this.createdAt,
    lastUpdatedAt: lastUpdatedAt.present
        ? lastUpdatedAt.value
        : this.lastUpdatedAt,
    id: id ?? this.id,
    type: type ?? this.type,
    name: name.present ? name.value : this.name,
  );
  Polygon copyWithCompanion(PolygonsCompanion data) {
    return Polygon(
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      lastUpdatedAt: data.lastUpdatedAt.present
          ? data.lastUpdatedAt.value
          : this.lastUpdatedAt,
      id: data.id.present ? data.id.value : this.id,
      type: data.type.present ? data.type.value : this.type,
      name: data.name.present ? data.name.value : this.name,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Polygon(')
          ..write('createdAt: $createdAt, ')
          ..write('lastUpdatedAt: $lastUpdatedAt, ')
          ..write('id: $id, ')
          ..write('type: $type, ')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(createdAt, lastUpdatedAt, id, type, name);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Polygon &&
          other.createdAt == this.createdAt &&
          other.lastUpdatedAt == this.lastUpdatedAt &&
          other.id == this.id &&
          other.type == this.type &&
          other.name == this.name);
}

class PolygonsCompanion extends UpdateCompanion<Polygon> {
  final Value<DateTime> createdAt;
  final Value<DateTime?> lastUpdatedAt;
  final Value<int> id;
  final Value<PolygonType> type;
  final Value<String?> name;
  const PolygonsCompanion({
    this.createdAt = const Value.absent(),
    this.lastUpdatedAt = const Value.absent(),
    this.id = const Value.absent(),
    this.type = const Value.absent(),
    this.name = const Value.absent(),
  });
  PolygonsCompanion.insert({
    this.createdAt = const Value.absent(),
    this.lastUpdatedAt = const Value.absent(),
    this.id = const Value.absent(),
    required PolygonType type,
    this.name = const Value.absent(),
  }) : type = Value(type);
  static Insertable<Polygon> custom({
    Expression<DateTime>? createdAt,
    Expression<DateTime>? lastUpdatedAt,
    Expression<int>? id,
    Expression<int>? type,
    Expression<String>? name,
  }) {
    return RawValuesInsertable({
      if (createdAt != null) 'created_at': createdAt,
      if (lastUpdatedAt != null) 'last_updated_at': lastUpdatedAt,
      if (id != null) 'id': id,
      if (type != null) 'type': type,
      if (name != null) 'name': name,
    });
  }

  PolygonsCompanion copyWith({
    Value<DateTime>? createdAt,
    Value<DateTime?>? lastUpdatedAt,
    Value<int>? id,
    Value<PolygonType>? type,
    Value<String?>? name,
  }) {
    return PolygonsCompanion(
      createdAt: createdAt ?? this.createdAt,
      lastUpdatedAt: lastUpdatedAt ?? this.lastUpdatedAt,
      id: id ?? this.id,
      type: type ?? this.type,
      name: name ?? this.name,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (lastUpdatedAt.present) {
      map['last_updated_at'] = Variable<DateTime>(lastUpdatedAt.value);
    }
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (type.present) {
      map['type'] = Variable<int>(
        $PolygonsTable.$convertertype.toSql(type.value),
      );
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PolygonsCompanion(')
          ..write('createdAt: $createdAt, ')
          ..write('lastUpdatedAt: $lastUpdatedAt, ')
          ..write('id: $id, ')
          ..write('type: $type, ')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }
}

class $GuidanceGroupsTable extends GuidanceGroups
    with TableInfo<$GuidanceGroupsTable, GuidanceGroup> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $GuidanceGroupsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    clientDefault: DateTime.now,
  );
  static const VerificationMeta _lastUpdatedAtMeta = const VerificationMeta(
    'lastUpdatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> lastUpdatedAt =
      GeneratedColumn<DateTime>(
        'last_updated_at',
        aliasedName,
        true,
        type: DriftSqlType.dateTime,
        requiredDuringInsert: false,
      );
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
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _borderPolygonMeta = const VerificationMeta(
    'borderPolygon',
  );
  @override
  late final GeneratedColumn<int> borderPolygon = GeneratedColumn<int>(
    'border_polygon',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES polygons (id)',
    ),
  );
  @override
  List<GeneratedColumn> get $columns => [
    createdAt,
    lastUpdatedAt,
    id,
    name,
    borderPolygon,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'guidance_groups';
  @override
  VerificationContext validateIntegrity(
    Insertable<GuidanceGroup> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    if (data.containsKey('last_updated_at')) {
      context.handle(
        _lastUpdatedAtMeta,
        lastUpdatedAt.isAcceptableOrUnknown(
          data['last_updated_at']!,
          _lastUpdatedAtMeta,
        ),
      );
    }
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    }
    if (data.containsKey('border_polygon')) {
      context.handle(
        _borderPolygonMeta,
        borderPolygon.isAcceptableOrUnknown(
          data['border_polygon']!,
          _borderPolygonMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  GuidanceGroup map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return GuidanceGroup(
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      lastUpdatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}last_updated_at'],
      ),
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      ),
      borderPolygon: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}border_polygon'],
      ),
    );
  }

  @override
  $GuidanceGroupsTable createAlias(String alias) {
    return $GuidanceGroupsTable(attachedDatabase, alias);
  }
}

class GuidanceGroup extends DataClass implements Insertable<GuidanceGroup> {
  /// When this was created.
  final DateTime createdAt;

  /// When this was last updated.
  final DateTime? lastUpdatedAt;

  /// The local database ID of this.
  final int id;

  /// The name of this.
  final String? name;

  /// Reference to a border [Polygon], if there is one.
  final int? borderPolygon;
  const GuidanceGroup({
    required this.createdAt,
    this.lastUpdatedAt,
    required this.id,
    this.name,
    this.borderPolygon,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['created_at'] = Variable<DateTime>(createdAt);
    if (!nullToAbsent || lastUpdatedAt != null) {
      map['last_updated_at'] = Variable<DateTime>(lastUpdatedAt);
    }
    map['id'] = Variable<int>(id);
    if (!nullToAbsent || name != null) {
      map['name'] = Variable<String>(name);
    }
    if (!nullToAbsent || borderPolygon != null) {
      map['border_polygon'] = Variable<int>(borderPolygon);
    }
    return map;
  }

  GuidanceGroupsCompanion toCompanion(bool nullToAbsent) {
    return GuidanceGroupsCompanion(
      createdAt: Value(createdAt),
      lastUpdatedAt: lastUpdatedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(lastUpdatedAt),
      id: Value(id),
      name: name == null && nullToAbsent ? const Value.absent() : Value(name),
      borderPolygon: borderPolygon == null && nullToAbsent
          ? const Value.absent()
          : Value(borderPolygon),
    );
  }

  factory GuidanceGroup.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return GuidanceGroup(
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      lastUpdatedAt: serializer.fromJson<DateTime?>(json['lastUpdatedAt']),
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String?>(json['name']),
      borderPolygon: serializer.fromJson<int?>(json['borderPolygon']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'lastUpdatedAt': serializer.toJson<DateTime?>(lastUpdatedAt),
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String?>(name),
      'borderPolygon': serializer.toJson<int?>(borderPolygon),
    };
  }

  GuidanceGroup copyWith({
    DateTime? createdAt,
    Value<DateTime?> lastUpdatedAt = const Value.absent(),
    int? id,
    Value<String?> name = const Value.absent(),
    Value<int?> borderPolygon = const Value.absent(),
  }) => GuidanceGroup(
    createdAt: createdAt ?? this.createdAt,
    lastUpdatedAt: lastUpdatedAt.present
        ? lastUpdatedAt.value
        : this.lastUpdatedAt,
    id: id ?? this.id,
    name: name.present ? name.value : this.name,
    borderPolygon: borderPolygon.present
        ? borderPolygon.value
        : this.borderPolygon,
  );
  GuidanceGroup copyWithCompanion(GuidanceGroupsCompanion data) {
    return GuidanceGroup(
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      lastUpdatedAt: data.lastUpdatedAt.present
          ? data.lastUpdatedAt.value
          : this.lastUpdatedAt,
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      borderPolygon: data.borderPolygon.present
          ? data.borderPolygon.value
          : this.borderPolygon,
    );
  }

  @override
  String toString() {
    return (StringBuffer('GuidanceGroup(')
          ..write('createdAt: $createdAt, ')
          ..write('lastUpdatedAt: $lastUpdatedAt, ')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('borderPolygon: $borderPolygon')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(createdAt, lastUpdatedAt, id, name, borderPolygon);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is GuidanceGroup &&
          other.createdAt == this.createdAt &&
          other.lastUpdatedAt == this.lastUpdatedAt &&
          other.id == this.id &&
          other.name == this.name &&
          other.borderPolygon == this.borderPolygon);
}

class GuidanceGroupsCompanion extends UpdateCompanion<GuidanceGroup> {
  final Value<DateTime> createdAt;
  final Value<DateTime?> lastUpdatedAt;
  final Value<int> id;
  final Value<String?> name;
  final Value<int?> borderPolygon;
  const GuidanceGroupsCompanion({
    this.createdAt = const Value.absent(),
    this.lastUpdatedAt = const Value.absent(),
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.borderPolygon = const Value.absent(),
  });
  GuidanceGroupsCompanion.insert({
    this.createdAt = const Value.absent(),
    this.lastUpdatedAt = const Value.absent(),
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.borderPolygon = const Value.absent(),
  });
  static Insertable<GuidanceGroup> custom({
    Expression<DateTime>? createdAt,
    Expression<DateTime>? lastUpdatedAt,
    Expression<int>? id,
    Expression<String>? name,
    Expression<int>? borderPolygon,
  }) {
    return RawValuesInsertable({
      if (createdAt != null) 'created_at': createdAt,
      if (lastUpdatedAt != null) 'last_updated_at': lastUpdatedAt,
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (borderPolygon != null) 'border_polygon': borderPolygon,
    });
  }

  GuidanceGroupsCompanion copyWith({
    Value<DateTime>? createdAt,
    Value<DateTime?>? lastUpdatedAt,
    Value<int>? id,
    Value<String?>? name,
    Value<int?>? borderPolygon,
  }) {
    return GuidanceGroupsCompanion(
      createdAt: createdAt ?? this.createdAt,
      lastUpdatedAt: lastUpdatedAt ?? this.lastUpdatedAt,
      id: id ?? this.id,
      name: name ?? this.name,
      borderPolygon: borderPolygon ?? this.borderPolygon,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (lastUpdatedAt.present) {
      map['last_updated_at'] = Variable<DateTime>(lastUpdatedAt.value);
    }
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (borderPolygon.present) {
      map['border_polygon'] = Variable<int>(borderPolygon.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('GuidanceGroupsCompanion(')
          ..write('createdAt: $createdAt, ')
          ..write('lastUpdatedAt: $lastUpdatedAt, ')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('borderPolygon: $borderPolygon')
          ..write(')'))
        .toString();
  }
}

class $GuidanceAllocationsTable extends GuidanceAllocations
    with TableInfo<$GuidanceAllocationsTable, GuidanceAllocation> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $GuidanceAllocationsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    clientDefault: DateTime.now,
  );
  static const VerificationMeta _lastUpdatedAtMeta = const VerificationMeta(
    'lastUpdatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> lastUpdatedAt =
      GeneratedColumn<DateTime>(
        'last_updated_at',
        aliasedName,
        true,
        type: DriftSqlType.dateTime,
        requiredDuringInsert: false,
      );
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
  static const VerificationMeta _taskMeta = const VerificationMeta('task');
  @override
  late final GeneratedColumn<int> task = GeneratedColumn<int>(
    'task',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES tasks (id)',
    ),
  );
  static const VerificationMeta _guidanceGroupMeta = const VerificationMeta(
    'guidanceGroup',
  );
  @override
  late final GeneratedColumn<int> guidanceGroup = GeneratedColumn<int>(
    'guidance_group',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES guidance_groups (id)',
    ),
  );
  @override
  List<GeneratedColumn> get $columns => [
    createdAt,
    lastUpdatedAt,
    id,
    task,
    guidanceGroup,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'guidance_allocations';
  @override
  VerificationContext validateIntegrity(
    Insertable<GuidanceAllocation> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    if (data.containsKey('last_updated_at')) {
      context.handle(
        _lastUpdatedAtMeta,
        lastUpdatedAt.isAcceptableOrUnknown(
          data['last_updated_at']!,
          _lastUpdatedAtMeta,
        ),
      );
    }
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('task')) {
      context.handle(
        _taskMeta,
        task.isAcceptableOrUnknown(data['task']!, _taskMeta),
      );
    } else if (isInserting) {
      context.missing(_taskMeta);
    }
    if (data.containsKey('guidance_group')) {
      context.handle(
        _guidanceGroupMeta,
        guidanceGroup.isAcceptableOrUnknown(
          data['guidance_group']!,
          _guidanceGroupMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_guidanceGroupMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  GuidanceAllocation map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return GuidanceAllocation(
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      lastUpdatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}last_updated_at'],
      ),
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      task: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}task'],
      )!,
      guidanceGroup: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}guidance_group'],
      )!,
    );
  }

  @override
  $GuidanceAllocationsTable createAlias(String alias) {
    return $GuidanceAllocationsTable(attachedDatabase, alias);
  }
}

class GuidanceAllocation extends DataClass
    implements Insertable<GuidanceAllocation> {
  /// When this was created.
  final DateTime createdAt;

  /// When this was last updated.
  final DateTime? lastUpdatedAt;

  /// The local database ID of this.
  final int id;

  /// Reference to a [Task].
  final int task;

  /// Reference to a [GuidanceGroup].
  final int guidanceGroup;
  const GuidanceAllocation({
    required this.createdAt,
    this.lastUpdatedAt,
    required this.id,
    required this.task,
    required this.guidanceGroup,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['created_at'] = Variable<DateTime>(createdAt);
    if (!nullToAbsent || lastUpdatedAt != null) {
      map['last_updated_at'] = Variable<DateTime>(lastUpdatedAt);
    }
    map['id'] = Variable<int>(id);
    map['task'] = Variable<int>(task);
    map['guidance_group'] = Variable<int>(guidanceGroup);
    return map;
  }

  GuidanceAllocationsCompanion toCompanion(bool nullToAbsent) {
    return GuidanceAllocationsCompanion(
      createdAt: Value(createdAt),
      lastUpdatedAt: lastUpdatedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(lastUpdatedAt),
      id: Value(id),
      task: Value(task),
      guidanceGroup: Value(guidanceGroup),
    );
  }

  factory GuidanceAllocation.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return GuidanceAllocation(
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      lastUpdatedAt: serializer.fromJson<DateTime?>(json['lastUpdatedAt']),
      id: serializer.fromJson<int>(json['id']),
      task: serializer.fromJson<int>(json['task']),
      guidanceGroup: serializer.fromJson<int>(json['guidanceGroup']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'lastUpdatedAt': serializer.toJson<DateTime?>(lastUpdatedAt),
      'id': serializer.toJson<int>(id),
      'task': serializer.toJson<int>(task),
      'guidanceGroup': serializer.toJson<int>(guidanceGroup),
    };
  }

  GuidanceAllocation copyWith({
    DateTime? createdAt,
    Value<DateTime?> lastUpdatedAt = const Value.absent(),
    int? id,
    int? task,
    int? guidanceGroup,
  }) => GuidanceAllocation(
    createdAt: createdAt ?? this.createdAt,
    lastUpdatedAt: lastUpdatedAt.present
        ? lastUpdatedAt.value
        : this.lastUpdatedAt,
    id: id ?? this.id,
    task: task ?? this.task,
    guidanceGroup: guidanceGroup ?? this.guidanceGroup,
  );
  GuidanceAllocation copyWithCompanion(GuidanceAllocationsCompanion data) {
    return GuidanceAllocation(
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      lastUpdatedAt: data.lastUpdatedAt.present
          ? data.lastUpdatedAt.value
          : this.lastUpdatedAt,
      id: data.id.present ? data.id.value : this.id,
      task: data.task.present ? data.task.value : this.task,
      guidanceGroup: data.guidanceGroup.present
          ? data.guidanceGroup.value
          : this.guidanceGroup,
    );
  }

  @override
  String toString() {
    return (StringBuffer('GuidanceAllocation(')
          ..write('createdAt: $createdAt, ')
          ..write('lastUpdatedAt: $lastUpdatedAt, ')
          ..write('id: $id, ')
          ..write('task: $task, ')
          ..write('guidanceGroup: $guidanceGroup')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(createdAt, lastUpdatedAt, id, task, guidanceGroup);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is GuidanceAllocation &&
          other.createdAt == this.createdAt &&
          other.lastUpdatedAt == this.lastUpdatedAt &&
          other.id == this.id &&
          other.task == this.task &&
          other.guidanceGroup == this.guidanceGroup);
}

class GuidanceAllocationsCompanion extends UpdateCompanion<GuidanceAllocation> {
  final Value<DateTime> createdAt;
  final Value<DateTime?> lastUpdatedAt;
  final Value<int> id;
  final Value<int> task;
  final Value<int> guidanceGroup;
  const GuidanceAllocationsCompanion({
    this.createdAt = const Value.absent(),
    this.lastUpdatedAt = const Value.absent(),
    this.id = const Value.absent(),
    this.task = const Value.absent(),
    this.guidanceGroup = const Value.absent(),
  });
  GuidanceAllocationsCompanion.insert({
    this.createdAt = const Value.absent(),
    this.lastUpdatedAt = const Value.absent(),
    this.id = const Value.absent(),
    required int task,
    required int guidanceGroup,
  }) : task = Value(task),
       guidanceGroup = Value(guidanceGroup);
  static Insertable<GuidanceAllocation> custom({
    Expression<DateTime>? createdAt,
    Expression<DateTime>? lastUpdatedAt,
    Expression<int>? id,
    Expression<int>? task,
    Expression<int>? guidanceGroup,
  }) {
    return RawValuesInsertable({
      if (createdAt != null) 'created_at': createdAt,
      if (lastUpdatedAt != null) 'last_updated_at': lastUpdatedAt,
      if (id != null) 'id': id,
      if (task != null) 'task': task,
      if (guidanceGroup != null) 'guidance_group': guidanceGroup,
    });
  }

  GuidanceAllocationsCompanion copyWith({
    Value<DateTime>? createdAt,
    Value<DateTime?>? lastUpdatedAt,
    Value<int>? id,
    Value<int>? task,
    Value<int>? guidanceGroup,
  }) {
    return GuidanceAllocationsCompanion(
      createdAt: createdAt ?? this.createdAt,
      lastUpdatedAt: lastUpdatedAt ?? this.lastUpdatedAt,
      id: id ?? this.id,
      task: task ?? this.task,
      guidanceGroup: guidanceGroup ?? this.guidanceGroup,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (lastUpdatedAt.present) {
      map['last_updated_at'] = Variable<DateTime>(lastUpdatedAt.value);
    }
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (task.present) {
      map['task'] = Variable<int>(task.value);
    }
    if (guidanceGroup.present) {
      map['guidance_group'] = Variable<int>(guidanceGroup.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('GuidanceAllocationsCompanion(')
          ..write('createdAt: $createdAt, ')
          ..write('lastUpdatedAt: $lastUpdatedAt, ')
          ..write('id: $id, ')
          ..write('task: $task, ')
          ..write('guidanceGroup: $guidanceGroup')
          ..write(')'))
        .toString();
  }
}

class $LineStringsTable extends LineStrings
    with TableInfo<$LineStringsTable, LineString> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $LineStringsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    clientDefault: DateTime.now,
  );
  static const VerificationMeta _lastUpdatedAtMeta = const VerificationMeta(
    'lastUpdatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> lastUpdatedAt =
      GeneratedColumn<DateTime>(
        'last_updated_at',
        aliasedName,
        true,
        type: DriftSqlType.dateTime,
        requiredDuringInsert: false,
      );
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
  @override
  late final GeneratedColumnWithTypeConverter<LineStringType, int> type =
      GeneratedColumn<int>(
        'type',
        aliasedName,
        false,
        type: DriftSqlType.int,
        requiredDuringInsert: true,
      ).withConverter<LineStringType>($LineStringsTable.$convertertype);
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _widthMeta = const VerificationMeta('width');
  @override
  late final GeneratedColumn<int> width = GeneratedColumn<int>(
    'width',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _lengthMeta = const VerificationMeta('length');
  @override
  late final GeneratedColumn<int> length = GeneratedColumn<int>(
    'length',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    createdAt,
    lastUpdatedAt,
    id,
    type,
    name,
    width,
    length,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'line_strings';
  @override
  VerificationContext validateIntegrity(
    Insertable<LineString> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    if (data.containsKey('last_updated_at')) {
      context.handle(
        _lastUpdatedAtMeta,
        lastUpdatedAt.isAcceptableOrUnknown(
          data['last_updated_at']!,
          _lastUpdatedAtMeta,
        ),
      );
    }
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    }
    if (data.containsKey('width')) {
      context.handle(
        _widthMeta,
        width.isAcceptableOrUnknown(data['width']!, _widthMeta),
      );
    }
    if (data.containsKey('length')) {
      context.handle(
        _lengthMeta,
        length.isAcceptableOrUnknown(data['length']!, _lengthMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  LineString map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return LineString(
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      lastUpdatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}last_updated_at'],
      ),
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      type: $LineStringsTable.$convertertype.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.int,
          data['${effectivePrefix}type'],
        )!,
      ),
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      ),
      width: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}width'],
      ),
      length: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}length'],
      ),
    );
  }

  @override
  $LineStringsTable createAlias(String alias) {
    return $LineStringsTable(attachedDatabase, alias);
  }

  static TypeConverter<LineStringType, int> $convertertype =
      const LineStringTypeConverter();
}

class LineString extends DataClass implements Insertable<LineString> {
  /// When this was created.
  final DateTime createdAt;

  /// When this was last updated.
  final DateTime? lastUpdatedAt;

  /// The local database ID of this.
  final int id;

  /// Which type of line string this is.
  final LineStringType type;

  /// The name of this.
  final String? name;

  /// Width of this in millimeters, typically used as the spacing for separating
  /// adjacent path in [GuidancePattern]s.
  final int? width;

  /// Length of this in millimeters.
  final int? length;
  const LineString({
    required this.createdAt,
    this.lastUpdatedAt,
    required this.id,
    required this.type,
    this.name,
    this.width,
    this.length,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['created_at'] = Variable<DateTime>(createdAt);
    if (!nullToAbsent || lastUpdatedAt != null) {
      map['last_updated_at'] = Variable<DateTime>(lastUpdatedAt);
    }
    map['id'] = Variable<int>(id);
    {
      map['type'] = Variable<int>($LineStringsTable.$convertertype.toSql(type));
    }
    if (!nullToAbsent || name != null) {
      map['name'] = Variable<String>(name);
    }
    if (!nullToAbsent || width != null) {
      map['width'] = Variable<int>(width);
    }
    if (!nullToAbsent || length != null) {
      map['length'] = Variable<int>(length);
    }
    return map;
  }

  LineStringsCompanion toCompanion(bool nullToAbsent) {
    return LineStringsCompanion(
      createdAt: Value(createdAt),
      lastUpdatedAt: lastUpdatedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(lastUpdatedAt),
      id: Value(id),
      type: Value(type),
      name: name == null && nullToAbsent ? const Value.absent() : Value(name),
      width: width == null && nullToAbsent
          ? const Value.absent()
          : Value(width),
      length: length == null && nullToAbsent
          ? const Value.absent()
          : Value(length),
    );
  }

  factory LineString.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return LineString(
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      lastUpdatedAt: serializer.fromJson<DateTime?>(json['lastUpdatedAt']),
      id: serializer.fromJson<int>(json['id']),
      type: serializer.fromJson<LineStringType>(json['type']),
      name: serializer.fromJson<String?>(json['name']),
      width: serializer.fromJson<int?>(json['width']),
      length: serializer.fromJson<int?>(json['length']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'lastUpdatedAt': serializer.toJson<DateTime?>(lastUpdatedAt),
      'id': serializer.toJson<int>(id),
      'type': serializer.toJson<LineStringType>(type),
      'name': serializer.toJson<String?>(name),
      'width': serializer.toJson<int?>(width),
      'length': serializer.toJson<int?>(length),
    };
  }

  LineString copyWith({
    DateTime? createdAt,
    Value<DateTime?> lastUpdatedAt = const Value.absent(),
    int? id,
    LineStringType? type,
    Value<String?> name = const Value.absent(),
    Value<int?> width = const Value.absent(),
    Value<int?> length = const Value.absent(),
  }) => LineString(
    createdAt: createdAt ?? this.createdAt,
    lastUpdatedAt: lastUpdatedAt.present
        ? lastUpdatedAt.value
        : this.lastUpdatedAt,
    id: id ?? this.id,
    type: type ?? this.type,
    name: name.present ? name.value : this.name,
    width: width.present ? width.value : this.width,
    length: length.present ? length.value : this.length,
  );
  LineString copyWithCompanion(LineStringsCompanion data) {
    return LineString(
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      lastUpdatedAt: data.lastUpdatedAt.present
          ? data.lastUpdatedAt.value
          : this.lastUpdatedAt,
      id: data.id.present ? data.id.value : this.id,
      type: data.type.present ? data.type.value : this.type,
      name: data.name.present ? data.name.value : this.name,
      width: data.width.present ? data.width.value : this.width,
      length: data.length.present ? data.length.value : this.length,
    );
  }

  @override
  String toString() {
    return (StringBuffer('LineString(')
          ..write('createdAt: $createdAt, ')
          ..write('lastUpdatedAt: $lastUpdatedAt, ')
          ..write('id: $id, ')
          ..write('type: $type, ')
          ..write('name: $name, ')
          ..write('width: $width, ')
          ..write('length: $length')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(createdAt, lastUpdatedAt, id, type, name, width, length);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is LineString &&
          other.createdAt == this.createdAt &&
          other.lastUpdatedAt == this.lastUpdatedAt &&
          other.id == this.id &&
          other.type == this.type &&
          other.name == this.name &&
          other.width == this.width &&
          other.length == this.length);
}

class LineStringsCompanion extends UpdateCompanion<LineString> {
  final Value<DateTime> createdAt;
  final Value<DateTime?> lastUpdatedAt;
  final Value<int> id;
  final Value<LineStringType> type;
  final Value<String?> name;
  final Value<int?> width;
  final Value<int?> length;
  const LineStringsCompanion({
    this.createdAt = const Value.absent(),
    this.lastUpdatedAt = const Value.absent(),
    this.id = const Value.absent(),
    this.type = const Value.absent(),
    this.name = const Value.absent(),
    this.width = const Value.absent(),
    this.length = const Value.absent(),
  });
  LineStringsCompanion.insert({
    this.createdAt = const Value.absent(),
    this.lastUpdatedAt = const Value.absent(),
    this.id = const Value.absent(),
    required LineStringType type,
    this.name = const Value.absent(),
    this.width = const Value.absent(),
    this.length = const Value.absent(),
  }) : type = Value(type);
  static Insertable<LineString> custom({
    Expression<DateTime>? createdAt,
    Expression<DateTime>? lastUpdatedAt,
    Expression<int>? id,
    Expression<int>? type,
    Expression<String>? name,
    Expression<int>? width,
    Expression<int>? length,
  }) {
    return RawValuesInsertable({
      if (createdAt != null) 'created_at': createdAt,
      if (lastUpdatedAt != null) 'last_updated_at': lastUpdatedAt,
      if (id != null) 'id': id,
      if (type != null) 'type': type,
      if (name != null) 'name': name,
      if (width != null) 'width': width,
      if (length != null) 'length': length,
    });
  }

  LineStringsCompanion copyWith({
    Value<DateTime>? createdAt,
    Value<DateTime?>? lastUpdatedAt,
    Value<int>? id,
    Value<LineStringType>? type,
    Value<String?>? name,
    Value<int?>? width,
    Value<int?>? length,
  }) {
    return LineStringsCompanion(
      createdAt: createdAt ?? this.createdAt,
      lastUpdatedAt: lastUpdatedAt ?? this.lastUpdatedAt,
      id: id ?? this.id,
      type: type ?? this.type,
      name: name ?? this.name,
      width: width ?? this.width,
      length: length ?? this.length,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (lastUpdatedAt.present) {
      map['last_updated_at'] = Variable<DateTime>(lastUpdatedAt.value);
    }
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (type.present) {
      map['type'] = Variable<int>(
        $LineStringsTable.$convertertype.toSql(type.value),
      );
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (width.present) {
      map['width'] = Variable<int>(width.value);
    }
    if (length.present) {
      map['length'] = Variable<int>(length.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('LineStringsCompanion(')
          ..write('createdAt: $createdAt, ')
          ..write('lastUpdatedAt: $lastUpdatedAt, ')
          ..write('id: $id, ')
          ..write('type: $type, ')
          ..write('name: $name, ')
          ..write('width: $width, ')
          ..write('length: $length')
          ..write(')'))
        .toString();
  }
}

class $GuidancePatternsTable extends GuidancePatterns
    with TableInfo<$GuidancePatternsTable, GuidancePattern> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $GuidancePatternsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    clientDefault: DateTime.now,
  );
  static const VerificationMeta _lastUpdatedAtMeta = const VerificationMeta(
    'lastUpdatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> lastUpdatedAt =
      GeneratedColumn<DateTime>(
        'last_updated_at',
        aliasedName,
        true,
        type: DriftSqlType.dateTime,
        requiredDuringInsert: false,
      );
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
  static const VerificationMeta _lineStringMeta = const VerificationMeta(
    'lineString',
  );
  @override
  late final GeneratedColumn<int> lineString = GeneratedColumn<int>(
    'line_string',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES line_strings (id)',
    ),
  );
  static const VerificationMeta _borderPolygonMeta = const VerificationMeta(
    'borderPolygon',
  );
  @override
  late final GeneratedColumn<int> borderPolygon = GeneratedColumn<int>(
    'border_polygon',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES polygons (id)',
    ),
  );
  @override
  late final GeneratedColumnWithTypeConverter<GuidancePatternType, int> type =
      GeneratedColumn<int>(
        'type',
        aliasedName,
        false,
        type: DriftSqlType.int,
        requiredDuringInsert: true,
      ).withConverter<GuidancePatternType>(
        $GuidancePatternsTable.$convertertype,
      );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _headingMeta = const VerificationMeta(
    'heading',
  );
  @override
  late final GeneratedColumn<double> heading = GeneratedColumn<double>(
    'heading',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _radiusMeta = const VerificationMeta('radius');
  @override
  late final GeneratedColumn<int> radius = GeneratedColumn<int>(
    'radius',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  @override
  late final GeneratedColumnWithTypeConverter<GuidancePatternOptions?, int>
  options =
      GeneratedColumn<int>(
        'options',
        aliasedName,
        true,
        type: DriftSqlType.int,
        requiredDuringInsert: false,
      ).withConverter<GuidancePatternOptions?>(
        $GuidancePatternsTable.$converteroptionsn,
      );
  @override
  late final GeneratedColumnWithTypeConverter<
    GuidancePatternPropagationDirection?,
    int
  >
  propagationDirection =
      GeneratedColumn<int>(
        'propagation_direction',
        aliasedName,
        true,
        type: DriftSqlType.int,
        requiredDuringInsert: false,
      ).withConverter<GuidancePatternPropagationDirection?>(
        $GuidancePatternsTable.$converterpropagationDirectionn,
      );
  @override
  late final GeneratedColumnWithTypeConverter<GuidancePatternExtension?, int>
  extension =
      GeneratedColumn<int>(
        'extension',
        aliasedName,
        true,
        type: DriftSqlType.int,
        requiredDuringInsert: false,
      ).withConverter<GuidancePatternExtension?>(
        $GuidancePatternsTable.$converterextensionn,
      );
  static const VerificationMeta _numberOfSwathsLeftMeta =
      const VerificationMeta('numberOfSwathsLeft');
  @override
  late final GeneratedColumn<int> numberOfSwathsLeft = GeneratedColumn<int>(
    'number_of_swaths_left',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _numberOfSwathsRightMeta =
      const VerificationMeta('numberOfSwathsRight');
  @override
  late final GeneratedColumn<int> numberOfSwathsRight = GeneratedColumn<int>(
    'number_of_swaths_right',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    createdAt,
    lastUpdatedAt,
    id,
    lineString,
    borderPolygon,
    type,
    name,
    heading,
    radius,
    options,
    propagationDirection,
    extension,
    numberOfSwathsLeft,
    numberOfSwathsRight,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'guidance_patterns';
  @override
  VerificationContext validateIntegrity(
    Insertable<GuidancePattern> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    if (data.containsKey('last_updated_at')) {
      context.handle(
        _lastUpdatedAtMeta,
        lastUpdatedAt.isAcceptableOrUnknown(
          data['last_updated_at']!,
          _lastUpdatedAtMeta,
        ),
      );
    }
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('line_string')) {
      context.handle(
        _lineStringMeta,
        lineString.isAcceptableOrUnknown(data['line_string']!, _lineStringMeta),
      );
    } else if (isInserting) {
      context.missing(_lineStringMeta);
    }
    if (data.containsKey('border_polygon')) {
      context.handle(
        _borderPolygonMeta,
        borderPolygon.isAcceptableOrUnknown(
          data['border_polygon']!,
          _borderPolygonMeta,
        ),
      );
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    }
    if (data.containsKey('heading')) {
      context.handle(
        _headingMeta,
        heading.isAcceptableOrUnknown(data['heading']!, _headingMeta),
      );
    }
    if (data.containsKey('radius')) {
      context.handle(
        _radiusMeta,
        radius.isAcceptableOrUnknown(data['radius']!, _radiusMeta),
      );
    }
    if (data.containsKey('number_of_swaths_left')) {
      context.handle(
        _numberOfSwathsLeftMeta,
        numberOfSwathsLeft.isAcceptableOrUnknown(
          data['number_of_swaths_left']!,
          _numberOfSwathsLeftMeta,
        ),
      );
    }
    if (data.containsKey('number_of_swaths_right')) {
      context.handle(
        _numberOfSwathsRightMeta,
        numberOfSwathsRight.isAcceptableOrUnknown(
          data['number_of_swaths_right']!,
          _numberOfSwathsRightMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  GuidancePattern map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return GuidancePattern(
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      lastUpdatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}last_updated_at'],
      ),
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      lineString: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}line_string'],
      )!,
      borderPolygon: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}border_polygon'],
      ),
      type: $GuidancePatternsTable.$convertertype.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.int,
          data['${effectivePrefix}type'],
        )!,
      ),
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      ),
      heading: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}heading'],
      ),
      radius: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}radius'],
      ),
      options: $GuidancePatternsTable.$converteroptionsn.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.int,
          data['${effectivePrefix}options'],
        ),
      ),
      propagationDirection: $GuidancePatternsTable
          .$converterpropagationDirectionn
          .fromSql(
            attachedDatabase.typeMapping.read(
              DriftSqlType.int,
              data['${effectivePrefix}propagation_direction'],
            ),
          ),
      extension: $GuidancePatternsTable.$converterextensionn.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.int,
          data['${effectivePrefix}extension'],
        ),
      ),
      numberOfSwathsLeft: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}number_of_swaths_left'],
      ),
      numberOfSwathsRight: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}number_of_swaths_right'],
      ),
    );
  }

  @override
  $GuidancePatternsTable createAlias(String alias) {
    return $GuidancePatternsTable(attachedDatabase, alias);
  }

  static TypeConverter<GuidancePatternType, int> $convertertype =
      const GuidancePatternTypeConverter();
  static TypeConverter<GuidancePatternOptions, int> $converteroptions =
      const GuidancePatternOptionsConverter();
  static TypeConverter<GuidancePatternOptions?, int?> $converteroptionsn =
      NullAwareTypeConverter.wrap($converteroptions);
  static TypeConverter<GuidancePatternPropagationDirection, int>
  $converterpropagationDirection =
      const GuidancePatternPropagationDirectionConverter();
  static TypeConverter<GuidancePatternPropagationDirection?, int?>
  $converterpropagationDirectionn = NullAwareTypeConverter.wrap(
    $converterpropagationDirection,
  );
  static TypeConverter<GuidancePatternExtension, int> $converterextension =
      const GuidancePatternExtensionConverter();
  static TypeConverter<GuidancePatternExtension?, int?> $converterextensionn =
      NullAwareTypeConverter.wrap($converterextension);
}

class GuidancePattern extends DataClass implements Insertable<GuidancePattern> {
  /// When this was created.
  final DateTime createdAt;

  /// When this was last updated.
  final DateTime? lastUpdatedAt;

  /// The local database ID of this.
  final int id;

  /// A reference to a [LineString].
  final int lineString;

  /// A reference to a border [Polygon].
  final int? borderPolygon;

  /// Which type of guidance pattern this is.
  final GuidancePatternType type;

  /// The name of this.
  final String? name;

  /// Heading/bearing of the pattern.
  final double? heading;

  /// Radius in millimeters for pivot guidance pattern.
  final int? radius;

  /// Options if [type] is [GuidancePatternType.pivot].
  final GuidancePatternOptions? options;

  /// Which directions this pattern can propagate in.
  final GuidancePatternPropagationDirection? propagationDirection;

  /// In which directions the pattern should extend past the A and B points.
  final GuidancePatternExtension? extension;

  /// The number of swaths to the left of the linestring, as seen from the
  /// point A in the direction to the first next point or the [heading].
  final int? numberOfSwathsLeft;

  /// The number of swaths to the right of the linestring, as seen from the
  /// point A in the direction to the first next point or the [heading].
  final int? numberOfSwathsRight;
  const GuidancePattern({
    required this.createdAt,
    this.lastUpdatedAt,
    required this.id,
    required this.lineString,
    this.borderPolygon,
    required this.type,
    this.name,
    this.heading,
    this.radius,
    this.options,
    this.propagationDirection,
    this.extension,
    this.numberOfSwathsLeft,
    this.numberOfSwathsRight,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['created_at'] = Variable<DateTime>(createdAt);
    if (!nullToAbsent || lastUpdatedAt != null) {
      map['last_updated_at'] = Variable<DateTime>(lastUpdatedAt);
    }
    map['id'] = Variable<int>(id);
    map['line_string'] = Variable<int>(lineString);
    if (!nullToAbsent || borderPolygon != null) {
      map['border_polygon'] = Variable<int>(borderPolygon);
    }
    {
      map['type'] = Variable<int>(
        $GuidancePatternsTable.$convertertype.toSql(type),
      );
    }
    if (!nullToAbsent || name != null) {
      map['name'] = Variable<String>(name);
    }
    if (!nullToAbsent || heading != null) {
      map['heading'] = Variable<double>(heading);
    }
    if (!nullToAbsent || radius != null) {
      map['radius'] = Variable<int>(radius);
    }
    if (!nullToAbsent || options != null) {
      map['options'] = Variable<int>(
        $GuidancePatternsTable.$converteroptionsn.toSql(options),
      );
    }
    if (!nullToAbsent || propagationDirection != null) {
      map['propagation_direction'] = Variable<int>(
        $GuidancePatternsTable.$converterpropagationDirectionn.toSql(
          propagationDirection,
        ),
      );
    }
    if (!nullToAbsent || extension != null) {
      map['extension'] = Variable<int>(
        $GuidancePatternsTable.$converterextensionn.toSql(extension),
      );
    }
    if (!nullToAbsent || numberOfSwathsLeft != null) {
      map['number_of_swaths_left'] = Variable<int>(numberOfSwathsLeft);
    }
    if (!nullToAbsent || numberOfSwathsRight != null) {
      map['number_of_swaths_right'] = Variable<int>(numberOfSwathsRight);
    }
    return map;
  }

  GuidancePatternsCompanion toCompanion(bool nullToAbsent) {
    return GuidancePatternsCompanion(
      createdAt: Value(createdAt),
      lastUpdatedAt: lastUpdatedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(lastUpdatedAt),
      id: Value(id),
      lineString: Value(lineString),
      borderPolygon: borderPolygon == null && nullToAbsent
          ? const Value.absent()
          : Value(borderPolygon),
      type: Value(type),
      name: name == null && nullToAbsent ? const Value.absent() : Value(name),
      heading: heading == null && nullToAbsent
          ? const Value.absent()
          : Value(heading),
      radius: radius == null && nullToAbsent
          ? const Value.absent()
          : Value(radius),
      options: options == null && nullToAbsent
          ? const Value.absent()
          : Value(options),
      propagationDirection: propagationDirection == null && nullToAbsent
          ? const Value.absent()
          : Value(propagationDirection),
      extension: extension == null && nullToAbsent
          ? const Value.absent()
          : Value(extension),
      numberOfSwathsLeft: numberOfSwathsLeft == null && nullToAbsent
          ? const Value.absent()
          : Value(numberOfSwathsLeft),
      numberOfSwathsRight: numberOfSwathsRight == null && nullToAbsent
          ? const Value.absent()
          : Value(numberOfSwathsRight),
    );
  }

  factory GuidancePattern.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return GuidancePattern(
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      lastUpdatedAt: serializer.fromJson<DateTime?>(json['lastUpdatedAt']),
      id: serializer.fromJson<int>(json['id']),
      lineString: serializer.fromJson<int>(json['lineString']),
      borderPolygon: serializer.fromJson<int?>(json['borderPolygon']),
      type: serializer.fromJson<GuidancePatternType>(json['type']),
      name: serializer.fromJson<String?>(json['name']),
      heading: serializer.fromJson<double?>(json['heading']),
      radius: serializer.fromJson<int?>(json['radius']),
      options: serializer.fromJson<GuidancePatternOptions?>(json['options']),
      propagationDirection: serializer
          .fromJson<GuidancePatternPropagationDirection?>(
            json['propagationDirection'],
          ),
      extension: serializer.fromJson<GuidancePatternExtension?>(
        json['extension'],
      ),
      numberOfSwathsLeft: serializer.fromJson<int?>(json['numberOfSwathsLeft']),
      numberOfSwathsRight: serializer.fromJson<int?>(
        json['numberOfSwathsRight'],
      ),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'lastUpdatedAt': serializer.toJson<DateTime?>(lastUpdatedAt),
      'id': serializer.toJson<int>(id),
      'lineString': serializer.toJson<int>(lineString),
      'borderPolygon': serializer.toJson<int?>(borderPolygon),
      'type': serializer.toJson<GuidancePatternType>(type),
      'name': serializer.toJson<String?>(name),
      'heading': serializer.toJson<double?>(heading),
      'radius': serializer.toJson<int?>(radius),
      'options': serializer.toJson<GuidancePatternOptions?>(options),
      'propagationDirection': serializer
          .toJson<GuidancePatternPropagationDirection?>(propagationDirection),
      'extension': serializer.toJson<GuidancePatternExtension?>(extension),
      'numberOfSwathsLeft': serializer.toJson<int?>(numberOfSwathsLeft),
      'numberOfSwathsRight': serializer.toJson<int?>(numberOfSwathsRight),
    };
  }

  GuidancePattern copyWith({
    DateTime? createdAt,
    Value<DateTime?> lastUpdatedAt = const Value.absent(),
    int? id,
    int? lineString,
    Value<int?> borderPolygon = const Value.absent(),
    GuidancePatternType? type,
    Value<String?> name = const Value.absent(),
    Value<double?> heading = const Value.absent(),
    Value<int?> radius = const Value.absent(),
    Value<GuidancePatternOptions?> options = const Value.absent(),
    Value<GuidancePatternPropagationDirection?> propagationDirection =
        const Value.absent(),
    Value<GuidancePatternExtension?> extension = const Value.absent(),
    Value<int?> numberOfSwathsLeft = const Value.absent(),
    Value<int?> numberOfSwathsRight = const Value.absent(),
  }) => GuidancePattern(
    createdAt: createdAt ?? this.createdAt,
    lastUpdatedAt: lastUpdatedAt.present
        ? lastUpdatedAt.value
        : this.lastUpdatedAt,
    id: id ?? this.id,
    lineString: lineString ?? this.lineString,
    borderPolygon: borderPolygon.present
        ? borderPolygon.value
        : this.borderPolygon,
    type: type ?? this.type,
    name: name.present ? name.value : this.name,
    heading: heading.present ? heading.value : this.heading,
    radius: radius.present ? radius.value : this.radius,
    options: options.present ? options.value : this.options,
    propagationDirection: propagationDirection.present
        ? propagationDirection.value
        : this.propagationDirection,
    extension: extension.present ? extension.value : this.extension,
    numberOfSwathsLeft: numberOfSwathsLeft.present
        ? numberOfSwathsLeft.value
        : this.numberOfSwathsLeft,
    numberOfSwathsRight: numberOfSwathsRight.present
        ? numberOfSwathsRight.value
        : this.numberOfSwathsRight,
  );
  GuidancePattern copyWithCompanion(GuidancePatternsCompanion data) {
    return GuidancePattern(
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      lastUpdatedAt: data.lastUpdatedAt.present
          ? data.lastUpdatedAt.value
          : this.lastUpdatedAt,
      id: data.id.present ? data.id.value : this.id,
      lineString: data.lineString.present
          ? data.lineString.value
          : this.lineString,
      borderPolygon: data.borderPolygon.present
          ? data.borderPolygon.value
          : this.borderPolygon,
      type: data.type.present ? data.type.value : this.type,
      name: data.name.present ? data.name.value : this.name,
      heading: data.heading.present ? data.heading.value : this.heading,
      radius: data.radius.present ? data.radius.value : this.radius,
      options: data.options.present ? data.options.value : this.options,
      propagationDirection: data.propagationDirection.present
          ? data.propagationDirection.value
          : this.propagationDirection,
      extension: data.extension.present ? data.extension.value : this.extension,
      numberOfSwathsLeft: data.numberOfSwathsLeft.present
          ? data.numberOfSwathsLeft.value
          : this.numberOfSwathsLeft,
      numberOfSwathsRight: data.numberOfSwathsRight.present
          ? data.numberOfSwathsRight.value
          : this.numberOfSwathsRight,
    );
  }

  @override
  String toString() {
    return (StringBuffer('GuidancePattern(')
          ..write('createdAt: $createdAt, ')
          ..write('lastUpdatedAt: $lastUpdatedAt, ')
          ..write('id: $id, ')
          ..write('lineString: $lineString, ')
          ..write('borderPolygon: $borderPolygon, ')
          ..write('type: $type, ')
          ..write('name: $name, ')
          ..write('heading: $heading, ')
          ..write('radius: $radius, ')
          ..write('options: $options, ')
          ..write('propagationDirection: $propagationDirection, ')
          ..write('extension: $extension, ')
          ..write('numberOfSwathsLeft: $numberOfSwathsLeft, ')
          ..write('numberOfSwathsRight: $numberOfSwathsRight')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    createdAt,
    lastUpdatedAt,
    id,
    lineString,
    borderPolygon,
    type,
    name,
    heading,
    radius,
    options,
    propagationDirection,
    extension,
    numberOfSwathsLeft,
    numberOfSwathsRight,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is GuidancePattern &&
          other.createdAt == this.createdAt &&
          other.lastUpdatedAt == this.lastUpdatedAt &&
          other.id == this.id &&
          other.lineString == this.lineString &&
          other.borderPolygon == this.borderPolygon &&
          other.type == this.type &&
          other.name == this.name &&
          other.heading == this.heading &&
          other.radius == this.radius &&
          other.options == this.options &&
          other.propagationDirection == this.propagationDirection &&
          other.extension == this.extension &&
          other.numberOfSwathsLeft == this.numberOfSwathsLeft &&
          other.numberOfSwathsRight == this.numberOfSwathsRight);
}

class GuidancePatternsCompanion extends UpdateCompanion<GuidancePattern> {
  final Value<DateTime> createdAt;
  final Value<DateTime?> lastUpdatedAt;
  final Value<int> id;
  final Value<int> lineString;
  final Value<int?> borderPolygon;
  final Value<GuidancePatternType> type;
  final Value<String?> name;
  final Value<double?> heading;
  final Value<int?> radius;
  final Value<GuidancePatternOptions?> options;
  final Value<GuidancePatternPropagationDirection?> propagationDirection;
  final Value<GuidancePatternExtension?> extension;
  final Value<int?> numberOfSwathsLeft;
  final Value<int?> numberOfSwathsRight;
  const GuidancePatternsCompanion({
    this.createdAt = const Value.absent(),
    this.lastUpdatedAt = const Value.absent(),
    this.id = const Value.absent(),
    this.lineString = const Value.absent(),
    this.borderPolygon = const Value.absent(),
    this.type = const Value.absent(),
    this.name = const Value.absent(),
    this.heading = const Value.absent(),
    this.radius = const Value.absent(),
    this.options = const Value.absent(),
    this.propagationDirection = const Value.absent(),
    this.extension = const Value.absent(),
    this.numberOfSwathsLeft = const Value.absent(),
    this.numberOfSwathsRight = const Value.absent(),
  });
  GuidancePatternsCompanion.insert({
    this.createdAt = const Value.absent(),
    this.lastUpdatedAt = const Value.absent(),
    this.id = const Value.absent(),
    required int lineString,
    this.borderPolygon = const Value.absent(),
    required GuidancePatternType type,
    this.name = const Value.absent(),
    this.heading = const Value.absent(),
    this.radius = const Value.absent(),
    this.options = const Value.absent(),
    this.propagationDirection = const Value.absent(),
    this.extension = const Value.absent(),
    this.numberOfSwathsLeft = const Value.absent(),
    this.numberOfSwathsRight = const Value.absent(),
  }) : lineString = Value(lineString),
       type = Value(type);
  static Insertable<GuidancePattern> custom({
    Expression<DateTime>? createdAt,
    Expression<DateTime>? lastUpdatedAt,
    Expression<int>? id,
    Expression<int>? lineString,
    Expression<int>? borderPolygon,
    Expression<int>? type,
    Expression<String>? name,
    Expression<double>? heading,
    Expression<int>? radius,
    Expression<int>? options,
    Expression<int>? propagationDirection,
    Expression<int>? extension,
    Expression<int>? numberOfSwathsLeft,
    Expression<int>? numberOfSwathsRight,
  }) {
    return RawValuesInsertable({
      if (createdAt != null) 'created_at': createdAt,
      if (lastUpdatedAt != null) 'last_updated_at': lastUpdatedAt,
      if (id != null) 'id': id,
      if (lineString != null) 'line_string': lineString,
      if (borderPolygon != null) 'border_polygon': borderPolygon,
      if (type != null) 'type': type,
      if (name != null) 'name': name,
      if (heading != null) 'heading': heading,
      if (radius != null) 'radius': radius,
      if (options != null) 'options': options,
      if (propagationDirection != null)
        'propagation_direction': propagationDirection,
      if (extension != null) 'extension': extension,
      if (numberOfSwathsLeft != null)
        'number_of_swaths_left': numberOfSwathsLeft,
      if (numberOfSwathsRight != null)
        'number_of_swaths_right': numberOfSwathsRight,
    });
  }

  GuidancePatternsCompanion copyWith({
    Value<DateTime>? createdAt,
    Value<DateTime?>? lastUpdatedAt,
    Value<int>? id,
    Value<int>? lineString,
    Value<int?>? borderPolygon,
    Value<GuidancePatternType>? type,
    Value<String?>? name,
    Value<double?>? heading,
    Value<int?>? radius,
    Value<GuidancePatternOptions?>? options,
    Value<GuidancePatternPropagationDirection?>? propagationDirection,
    Value<GuidancePatternExtension?>? extension,
    Value<int?>? numberOfSwathsLeft,
    Value<int?>? numberOfSwathsRight,
  }) {
    return GuidancePatternsCompanion(
      createdAt: createdAt ?? this.createdAt,
      lastUpdatedAt: lastUpdatedAt ?? this.lastUpdatedAt,
      id: id ?? this.id,
      lineString: lineString ?? this.lineString,
      borderPolygon: borderPolygon ?? this.borderPolygon,
      type: type ?? this.type,
      name: name ?? this.name,
      heading: heading ?? this.heading,
      radius: radius ?? this.radius,
      options: options ?? this.options,
      propagationDirection: propagationDirection ?? this.propagationDirection,
      extension: extension ?? this.extension,
      numberOfSwathsLeft: numberOfSwathsLeft ?? this.numberOfSwathsLeft,
      numberOfSwathsRight: numberOfSwathsRight ?? this.numberOfSwathsRight,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (lastUpdatedAt.present) {
      map['last_updated_at'] = Variable<DateTime>(lastUpdatedAt.value);
    }
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (lineString.present) {
      map['line_string'] = Variable<int>(lineString.value);
    }
    if (borderPolygon.present) {
      map['border_polygon'] = Variable<int>(borderPolygon.value);
    }
    if (type.present) {
      map['type'] = Variable<int>(
        $GuidancePatternsTable.$convertertype.toSql(type.value),
      );
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (heading.present) {
      map['heading'] = Variable<double>(heading.value);
    }
    if (radius.present) {
      map['radius'] = Variable<int>(radius.value);
    }
    if (options.present) {
      map['options'] = Variable<int>(
        $GuidancePatternsTable.$converteroptionsn.toSql(options.value),
      );
    }
    if (propagationDirection.present) {
      map['propagation_direction'] = Variable<int>(
        $GuidancePatternsTable.$converterpropagationDirectionn.toSql(
          propagationDirection.value,
        ),
      );
    }
    if (extension.present) {
      map['extension'] = Variable<int>(
        $GuidancePatternsTable.$converterextensionn.toSql(extension.value),
      );
    }
    if (numberOfSwathsLeft.present) {
      map['number_of_swaths_left'] = Variable<int>(numberOfSwathsLeft.value);
    }
    if (numberOfSwathsRight.present) {
      map['number_of_swaths_right'] = Variable<int>(numberOfSwathsRight.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('GuidancePatternsCompanion(')
          ..write('createdAt: $createdAt, ')
          ..write('lastUpdatedAt: $lastUpdatedAt, ')
          ..write('id: $id, ')
          ..write('lineString: $lineString, ')
          ..write('borderPolygon: $borderPolygon, ')
          ..write('type: $type, ')
          ..write('name: $name, ')
          ..write('heading: $heading, ')
          ..write('radius: $radius, ')
          ..write('options: $options, ')
          ..write('propagationDirection: $propagationDirection, ')
          ..write('extension: $extension, ')
          ..write('numberOfSwathsLeft: $numberOfSwathsLeft, ')
          ..write('numberOfSwathsRight: $numberOfSwathsRight')
          ..write(')'))
        .toString();
  }
}

class $GuidanceGroupPatternsTable extends GuidanceGroupPatterns
    with TableInfo<$GuidanceGroupPatternsTable, GuidanceGroupPattern> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $GuidanceGroupPatternsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _guidanceGroupMeta = const VerificationMeta(
    'guidanceGroup',
  );
  @override
  late final GeneratedColumn<int> guidanceGroup = GeneratedColumn<int>(
    'guidance_group',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES guidance_groups (id)',
    ),
  );
  static const VerificationMeta _guidancePatternMeta = const VerificationMeta(
    'guidancePattern',
  );
  @override
  late final GeneratedColumn<int> guidancePattern = GeneratedColumn<int>(
    'guidance_pattern',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES guidance_patterns (id)',
    ),
  );
  @override
  List<GeneratedColumn> get $columns => [guidanceGroup, guidancePattern];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'guidance_group_patterns';
  @override
  VerificationContext validateIntegrity(
    Insertable<GuidanceGroupPattern> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('guidance_group')) {
      context.handle(
        _guidanceGroupMeta,
        guidanceGroup.isAcceptableOrUnknown(
          data['guidance_group']!,
          _guidanceGroupMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_guidanceGroupMeta);
    }
    if (data.containsKey('guidance_pattern')) {
      context.handle(
        _guidancePatternMeta,
        guidancePattern.isAcceptableOrUnknown(
          data['guidance_pattern']!,
          _guidancePatternMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_guidancePatternMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {guidanceGroup, guidancePattern};
  @override
  GuidanceGroupPattern map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return GuidanceGroupPattern(
      guidanceGroup: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}guidance_group'],
      )!,
      guidancePattern: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}guidance_pattern'],
      )!,
    );
  }

  @override
  $GuidanceGroupPatternsTable createAlias(String alias) {
    return $GuidanceGroupPatternsTable(attachedDatabase, alias);
  }

  @override
  bool get withoutRowId => true;
}

class GuidanceGroupPattern extends DataClass
    implements Insertable<GuidanceGroupPattern> {
  /// Reference to a [GuidanceGroup].
  final int guidanceGroup;

  /// Reference to a [GuidancePattern].
  final int guidancePattern;
  const GuidanceGroupPattern({
    required this.guidanceGroup,
    required this.guidancePattern,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['guidance_group'] = Variable<int>(guidanceGroup);
    map['guidance_pattern'] = Variable<int>(guidancePattern);
    return map;
  }

  GuidanceGroupPatternsCompanion toCompanion(bool nullToAbsent) {
    return GuidanceGroupPatternsCompanion(
      guidanceGroup: Value(guidanceGroup),
      guidancePattern: Value(guidancePattern),
    );
  }

  factory GuidanceGroupPattern.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return GuidanceGroupPattern(
      guidanceGroup: serializer.fromJson<int>(json['guidanceGroup']),
      guidancePattern: serializer.fromJson<int>(json['guidancePattern']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'guidanceGroup': serializer.toJson<int>(guidanceGroup),
      'guidancePattern': serializer.toJson<int>(guidancePattern),
    };
  }

  GuidanceGroupPattern copyWith({int? guidanceGroup, int? guidancePattern}) =>
      GuidanceGroupPattern(
        guidanceGroup: guidanceGroup ?? this.guidanceGroup,
        guidancePattern: guidancePattern ?? this.guidancePattern,
      );
  GuidanceGroupPattern copyWithCompanion(GuidanceGroupPatternsCompanion data) {
    return GuidanceGroupPattern(
      guidanceGroup: data.guidanceGroup.present
          ? data.guidanceGroup.value
          : this.guidanceGroup,
      guidancePattern: data.guidancePattern.present
          ? data.guidancePattern.value
          : this.guidancePattern,
    );
  }

  @override
  String toString() {
    return (StringBuffer('GuidanceGroupPattern(')
          ..write('guidanceGroup: $guidanceGroup, ')
          ..write('guidancePattern: $guidancePattern')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(guidanceGroup, guidancePattern);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is GuidanceGroupPattern &&
          other.guidanceGroup == this.guidanceGroup &&
          other.guidancePattern == this.guidancePattern);
}

class GuidanceGroupPatternsCompanion
    extends UpdateCompanion<GuidanceGroupPattern> {
  final Value<int> guidanceGroup;
  final Value<int> guidancePattern;
  const GuidanceGroupPatternsCompanion({
    this.guidanceGroup = const Value.absent(),
    this.guidancePattern = const Value.absent(),
  });
  GuidanceGroupPatternsCompanion.insert({
    required int guidanceGroup,
    required int guidancePattern,
  }) : guidanceGroup = Value(guidanceGroup),
       guidancePattern = Value(guidancePattern);
  static Insertable<GuidanceGroupPattern> custom({
    Expression<int>? guidanceGroup,
    Expression<int>? guidancePattern,
  }) {
    return RawValuesInsertable({
      if (guidanceGroup != null) 'guidance_group': guidanceGroup,
      if (guidancePattern != null) 'guidance_pattern': guidancePattern,
    });
  }

  GuidanceGroupPatternsCompanion copyWith({
    Value<int>? guidanceGroup,
    Value<int>? guidancePattern,
  }) {
    return GuidanceGroupPatternsCompanion(
      guidanceGroup: guidanceGroup ?? this.guidanceGroup,
      guidancePattern: guidancePattern ?? this.guidancePattern,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (guidanceGroup.present) {
      map['guidance_group'] = Variable<int>(guidanceGroup.value);
    }
    if (guidancePattern.present) {
      map['guidance_pattern'] = Variable<int>(guidancePattern.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('GuidanceGroupPatternsCompanion(')
          ..write('guidanceGroup: $guidanceGroup, ')
          ..write('guidancePattern: $guidancePattern')
          ..write(')'))
        .toString();
  }
}

class $PointsTable extends Points with TableInfo<$PointsTable, Point> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PointsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    clientDefault: DateTime.now,
  );
  static const VerificationMeta _lastUpdatedAtMeta = const VerificationMeta(
    'lastUpdatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> lastUpdatedAt =
      GeneratedColumn<DateTime>(
        'last_updated_at',
        aliasedName,
        true,
        type: DriftSqlType.dateTime,
        requiredDuringInsert: false,
      );
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
  @override
  late final GeneratedColumnWithTypeConverter<PointType, int> type =
      GeneratedColumn<int>(
        'type',
        aliasedName,
        false,
        type: DriftSqlType.int,
        requiredDuringInsert: true,
      ).withConverter<PointType>($PointsTable.$convertertype);
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _latitudeMeta = const VerificationMeta(
    'latitude',
  );
  @override
  late final GeneratedColumn<double> latitude = GeneratedColumn<double>(
    'latitude',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _longitudeMeta = const VerificationMeta(
    'longitude',
  );
  @override
  late final GeneratedColumn<double> longitude = GeneratedColumn<double>(
    'longitude',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _elevationMeta = const VerificationMeta(
    'elevation',
  );
  @override
  late final GeneratedColumn<double> elevation = GeneratedColumn<double>(
    'elevation',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    createdAt,
    lastUpdatedAt,
    id,
    type,
    name,
    latitude,
    longitude,
    elevation,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'points';
  @override
  VerificationContext validateIntegrity(
    Insertable<Point> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    if (data.containsKey('last_updated_at')) {
      context.handle(
        _lastUpdatedAtMeta,
        lastUpdatedAt.isAcceptableOrUnknown(
          data['last_updated_at']!,
          _lastUpdatedAtMeta,
        ),
      );
    }
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    }
    if (data.containsKey('latitude')) {
      context.handle(
        _latitudeMeta,
        latitude.isAcceptableOrUnknown(data['latitude']!, _latitudeMeta),
      );
    } else if (isInserting) {
      context.missing(_latitudeMeta);
    }
    if (data.containsKey('longitude')) {
      context.handle(
        _longitudeMeta,
        longitude.isAcceptableOrUnknown(data['longitude']!, _longitudeMeta),
      );
    } else if (isInserting) {
      context.missing(_longitudeMeta);
    }
    if (data.containsKey('elevation')) {
      context.handle(
        _elevationMeta,
        elevation.isAcceptableOrUnknown(data['elevation']!, _elevationMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Point map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Point(
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      lastUpdatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}last_updated_at'],
      ),
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      type: $PointsTable.$convertertype.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.int,
          data['${effectivePrefix}type'],
        )!,
      ),
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      ),
      latitude: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}latitude'],
      )!,
      longitude: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}longitude'],
      )!,
      elevation: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}elevation'],
      ),
    );
  }

  @override
  $PointsTable createAlias(String alias) {
    return $PointsTable(attachedDatabase, alias);
  }

  static TypeConverter<PointType, int> $convertertype =
      const PointTypeConverter();
}

class Point extends DataClass implements Insertable<Point> {
  /// When this was created.
  final DateTime createdAt;

  /// When this was last updated.
  final DateTime? lastUpdatedAt;

  /// The local database ID of this.
  final int id;

  /// Which type of point this is.
  final PointType type;

  /// The name of this.
  final String? name;

  /// GNSS position north, format: WGS84 latitude
  final double latitude;

  /// GNSS position east, format: WGS84 longitude.
  final double longitude;

  /// The elevation of this, deviation in meters from WGS84 ellipsoid.
  final double? elevation;
  const Point({
    required this.createdAt,
    this.lastUpdatedAt,
    required this.id,
    required this.type,
    this.name,
    required this.latitude,
    required this.longitude,
    this.elevation,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['created_at'] = Variable<DateTime>(createdAt);
    if (!nullToAbsent || lastUpdatedAt != null) {
      map['last_updated_at'] = Variable<DateTime>(lastUpdatedAt);
    }
    map['id'] = Variable<int>(id);
    {
      map['type'] = Variable<int>($PointsTable.$convertertype.toSql(type));
    }
    if (!nullToAbsent || name != null) {
      map['name'] = Variable<String>(name);
    }
    map['latitude'] = Variable<double>(latitude);
    map['longitude'] = Variable<double>(longitude);
    if (!nullToAbsent || elevation != null) {
      map['elevation'] = Variable<double>(elevation);
    }
    return map;
  }

  PointsCompanion toCompanion(bool nullToAbsent) {
    return PointsCompanion(
      createdAt: Value(createdAt),
      lastUpdatedAt: lastUpdatedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(lastUpdatedAt),
      id: Value(id),
      type: Value(type),
      name: name == null && nullToAbsent ? const Value.absent() : Value(name),
      latitude: Value(latitude),
      longitude: Value(longitude),
      elevation: elevation == null && nullToAbsent
          ? const Value.absent()
          : Value(elevation),
    );
  }

  factory Point.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Point(
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      lastUpdatedAt: serializer.fromJson<DateTime?>(json['lastUpdatedAt']),
      id: serializer.fromJson<int>(json['id']),
      type: serializer.fromJson<PointType>(json['type']),
      name: serializer.fromJson<String?>(json['name']),
      latitude: serializer.fromJson<double>(json['latitude']),
      longitude: serializer.fromJson<double>(json['longitude']),
      elevation: serializer.fromJson<double?>(json['elevation']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'lastUpdatedAt': serializer.toJson<DateTime?>(lastUpdatedAt),
      'id': serializer.toJson<int>(id),
      'type': serializer.toJson<PointType>(type),
      'name': serializer.toJson<String?>(name),
      'latitude': serializer.toJson<double>(latitude),
      'longitude': serializer.toJson<double>(longitude),
      'elevation': serializer.toJson<double?>(elevation),
    };
  }

  Point copyWith({
    DateTime? createdAt,
    Value<DateTime?> lastUpdatedAt = const Value.absent(),
    int? id,
    PointType? type,
    Value<String?> name = const Value.absent(),
    double? latitude,
    double? longitude,
    Value<double?> elevation = const Value.absent(),
  }) => Point(
    createdAt: createdAt ?? this.createdAt,
    lastUpdatedAt: lastUpdatedAt.present
        ? lastUpdatedAt.value
        : this.lastUpdatedAt,
    id: id ?? this.id,
    type: type ?? this.type,
    name: name.present ? name.value : this.name,
    latitude: latitude ?? this.latitude,
    longitude: longitude ?? this.longitude,
    elevation: elevation.present ? elevation.value : this.elevation,
  );
  Point copyWithCompanion(PointsCompanion data) {
    return Point(
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      lastUpdatedAt: data.lastUpdatedAt.present
          ? data.lastUpdatedAt.value
          : this.lastUpdatedAt,
      id: data.id.present ? data.id.value : this.id,
      type: data.type.present ? data.type.value : this.type,
      name: data.name.present ? data.name.value : this.name,
      latitude: data.latitude.present ? data.latitude.value : this.latitude,
      longitude: data.longitude.present ? data.longitude.value : this.longitude,
      elevation: data.elevation.present ? data.elevation.value : this.elevation,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Point(')
          ..write('createdAt: $createdAt, ')
          ..write('lastUpdatedAt: $lastUpdatedAt, ')
          ..write('id: $id, ')
          ..write('type: $type, ')
          ..write('name: $name, ')
          ..write('latitude: $latitude, ')
          ..write('longitude: $longitude, ')
          ..write('elevation: $elevation')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    createdAt,
    lastUpdatedAt,
    id,
    type,
    name,
    latitude,
    longitude,
    elevation,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Point &&
          other.createdAt == this.createdAt &&
          other.lastUpdatedAt == this.lastUpdatedAt &&
          other.id == this.id &&
          other.type == this.type &&
          other.name == this.name &&
          other.latitude == this.latitude &&
          other.longitude == this.longitude &&
          other.elevation == this.elevation);
}

class PointsCompanion extends UpdateCompanion<Point> {
  final Value<DateTime> createdAt;
  final Value<DateTime?> lastUpdatedAt;
  final Value<int> id;
  final Value<PointType> type;
  final Value<String?> name;
  final Value<double> latitude;
  final Value<double> longitude;
  final Value<double?> elevation;
  const PointsCompanion({
    this.createdAt = const Value.absent(),
    this.lastUpdatedAt = const Value.absent(),
    this.id = const Value.absent(),
    this.type = const Value.absent(),
    this.name = const Value.absent(),
    this.latitude = const Value.absent(),
    this.longitude = const Value.absent(),
    this.elevation = const Value.absent(),
  });
  PointsCompanion.insert({
    this.createdAt = const Value.absent(),
    this.lastUpdatedAt = const Value.absent(),
    this.id = const Value.absent(),
    required PointType type,
    this.name = const Value.absent(),
    required double latitude,
    required double longitude,
    this.elevation = const Value.absent(),
  }) : type = Value(type),
       latitude = Value(latitude),
       longitude = Value(longitude);
  static Insertable<Point> custom({
    Expression<DateTime>? createdAt,
    Expression<DateTime>? lastUpdatedAt,
    Expression<int>? id,
    Expression<int>? type,
    Expression<String>? name,
    Expression<double>? latitude,
    Expression<double>? longitude,
    Expression<double>? elevation,
  }) {
    return RawValuesInsertable({
      if (createdAt != null) 'created_at': createdAt,
      if (lastUpdatedAt != null) 'last_updated_at': lastUpdatedAt,
      if (id != null) 'id': id,
      if (type != null) 'type': type,
      if (name != null) 'name': name,
      if (latitude != null) 'latitude': latitude,
      if (longitude != null) 'longitude': longitude,
      if (elevation != null) 'elevation': elevation,
    });
  }

  PointsCompanion copyWith({
    Value<DateTime>? createdAt,
    Value<DateTime?>? lastUpdatedAt,
    Value<int>? id,
    Value<PointType>? type,
    Value<String?>? name,
    Value<double>? latitude,
    Value<double>? longitude,
    Value<double?>? elevation,
  }) {
    return PointsCompanion(
      createdAt: createdAt ?? this.createdAt,
      lastUpdatedAt: lastUpdatedAt ?? this.lastUpdatedAt,
      id: id ?? this.id,
      type: type ?? this.type,
      name: name ?? this.name,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
      elevation: elevation ?? this.elevation,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (lastUpdatedAt.present) {
      map['last_updated_at'] = Variable<DateTime>(lastUpdatedAt.value);
    }
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (type.present) {
      map['type'] = Variable<int>(
        $PointsTable.$convertertype.toSql(type.value),
      );
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (latitude.present) {
      map['latitude'] = Variable<double>(latitude.value);
    }
    if (longitude.present) {
      map['longitude'] = Variable<double>(longitude.value);
    }
    if (elevation.present) {
      map['elevation'] = Variable<double>(elevation.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PointsCompanion(')
          ..write('createdAt: $createdAt, ')
          ..write('lastUpdatedAt: $lastUpdatedAt, ')
          ..write('id: $id, ')
          ..write('type: $type, ')
          ..write('name: $name, ')
          ..write('latitude: $latitude, ')
          ..write('longitude: $longitude, ')
          ..write('elevation: $elevation')
          ..write(')'))
        .toString();
  }
}

class $LineStringPointsTable extends LineStringPoints
    with TableInfo<$LineStringPointsTable, LineStringPoint> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $LineStringPointsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _lineStringMeta = const VerificationMeta(
    'lineString',
  );
  @override
  late final GeneratedColumn<int> lineString = GeneratedColumn<int>(
    'line_string',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES line_strings (id)',
    ),
  );
  static const VerificationMeta _pointMeta = const VerificationMeta('point');
  @override
  late final GeneratedColumn<int> point = GeneratedColumn<int>(
    'point',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES points (id)',
    ),
  );
  @override
  List<GeneratedColumn> get $columns => [lineString, point];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'line_string_points';
  @override
  VerificationContext validateIntegrity(
    Insertable<LineStringPoint> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('line_string')) {
      context.handle(
        _lineStringMeta,
        lineString.isAcceptableOrUnknown(data['line_string']!, _lineStringMeta),
      );
    } else if (isInserting) {
      context.missing(_lineStringMeta);
    }
    if (data.containsKey('point')) {
      context.handle(
        _pointMeta,
        point.isAcceptableOrUnknown(data['point']!, _pointMeta),
      );
    } else if (isInserting) {
      context.missing(_pointMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {lineString, point};
  @override
  LineStringPoint map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return LineStringPoint(
      lineString: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}line_string'],
      )!,
      point: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}point'],
      )!,
    );
  }

  @override
  $LineStringPointsTable createAlias(String alias) {
    return $LineStringPointsTable(attachedDatabase, alias);
  }

  @override
  bool get withoutRowId => true;
}

class LineStringPoint extends DataClass implements Insertable<LineStringPoint> {
  /// A reference to a [LineString].
  final int lineString;

  /// A reference to a [Point]
  final int point;
  const LineStringPoint({required this.lineString, required this.point});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['line_string'] = Variable<int>(lineString);
    map['point'] = Variable<int>(point);
    return map;
  }

  LineStringPointsCompanion toCompanion(bool nullToAbsent) {
    return LineStringPointsCompanion(
      lineString: Value(lineString),
      point: Value(point),
    );
  }

  factory LineStringPoint.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return LineStringPoint(
      lineString: serializer.fromJson<int>(json['lineString']),
      point: serializer.fromJson<int>(json['point']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'lineString': serializer.toJson<int>(lineString),
      'point': serializer.toJson<int>(point),
    };
  }

  LineStringPoint copyWith({int? lineString, int? point}) => LineStringPoint(
    lineString: lineString ?? this.lineString,
    point: point ?? this.point,
  );
  LineStringPoint copyWithCompanion(LineStringPointsCompanion data) {
    return LineStringPoint(
      lineString: data.lineString.present
          ? data.lineString.value
          : this.lineString,
      point: data.point.present ? data.point.value : this.point,
    );
  }

  @override
  String toString() {
    return (StringBuffer('LineStringPoint(')
          ..write('lineString: $lineString, ')
          ..write('point: $point')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(lineString, point);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is LineStringPoint &&
          other.lineString == this.lineString &&
          other.point == this.point);
}

class LineStringPointsCompanion extends UpdateCompanion<LineStringPoint> {
  final Value<int> lineString;
  final Value<int> point;
  const LineStringPointsCompanion({
    this.lineString = const Value.absent(),
    this.point = const Value.absent(),
  });
  LineStringPointsCompanion.insert({
    required int lineString,
    required int point,
  }) : lineString = Value(lineString),
       point = Value(point);
  static Insertable<LineStringPoint> custom({
    Expression<int>? lineString,
    Expression<int>? point,
  }) {
    return RawValuesInsertable({
      if (lineString != null) 'line_string': lineString,
      if (point != null) 'point': point,
    });
  }

  LineStringPointsCompanion copyWith({
    Value<int>? lineString,
    Value<int>? point,
  }) {
    return LineStringPointsCompanion(
      lineString: lineString ?? this.lineString,
      point: point ?? this.point,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (lineString.present) {
      map['line_string'] = Variable<int>(lineString.value);
    }
    if (point.present) {
      map['point'] = Variable<int>(point.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('LineStringPointsCompanion(')
          ..write('lineString: $lineString, ')
          ..write('point: $point')
          ..write(')'))
        .toString();
  }
}

class $LinksTable extends Links with TableInfo<$LinksTable, Link> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $LinksTable(this.attachedDatabase, [this._alias]);
  @override
  late final GeneratedColumnWithTypeConverter<LinkTableRef, String> tableRef =
      GeneratedColumn<String>(
        'table_ref',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
      ).withConverter<LinkTableRef>($LinksTable.$convertertableRef);
  static const VerificationMeta _refIdMeta = const VerificationMeta('refId');
  @override
  late final GeneratedColumn<int> refId = GeneratedColumn<int>(
    'ref_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _linkValueMeta = const VerificationMeta(
    'linkValue',
  );
  @override
  late final GeneratedColumn<String> linkValue = GeneratedColumn<String>(
    'link_value',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    clientDefault: () => const Uuid().v4(),
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [tableRef, refId, linkValue, name];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'links';
  @override
  VerificationContext validateIntegrity(
    Insertable<Link> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('ref_id')) {
      context.handle(
        _refIdMeta,
        refId.isAcceptableOrUnknown(data['ref_id']!, _refIdMeta),
      );
    } else if (isInserting) {
      context.missing(_refIdMeta);
    }
    if (data.containsKey('link_value')) {
      context.handle(
        _linkValueMeta,
        linkValue.isAcceptableOrUnknown(data['link_value']!, _linkValueMeta),
      );
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {tableRef, refId};
  @override
  Link map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Link(
      tableRef: $LinksTable.$convertertableRef.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}table_ref'],
        )!,
      ),
      refId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}ref_id'],
      )!,
      linkValue: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}link_value'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      ),
    );
  }

  @override
  $LinksTable createAlias(String alias) {
    return $LinksTable(attachedDatabase, alias);
  }

  static TypeConverter<LinkTableRef, String> $convertertableRef =
      const LinkTableRefConverter();
  @override
  bool get withoutRowId => true;
}

class Link extends DataClass implements Insertable<Link> {
  /// Which table this referes to.
  final LinkTableRef tableRef;

  /// Which row in the reference table this referes to.
  final int refId;

  /// The link value for the references table row.
  final String linkValue;

  /// A name for the link.
  final String? name;
  const Link({
    required this.tableRef,
    required this.refId,
    required this.linkValue,
    this.name,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    {
      map['table_ref'] = Variable<String>(
        $LinksTable.$convertertableRef.toSql(tableRef),
      );
    }
    map['ref_id'] = Variable<int>(refId);
    map['link_value'] = Variable<String>(linkValue);
    if (!nullToAbsent || name != null) {
      map['name'] = Variable<String>(name);
    }
    return map;
  }

  LinksCompanion toCompanion(bool nullToAbsent) {
    return LinksCompanion(
      tableRef: Value(tableRef),
      refId: Value(refId),
      linkValue: Value(linkValue),
      name: name == null && nullToAbsent ? const Value.absent() : Value(name),
    );
  }

  factory Link.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Link(
      tableRef: serializer.fromJson<LinkTableRef>(json['tableRef']),
      refId: serializer.fromJson<int>(json['refId']),
      linkValue: serializer.fromJson<String>(json['linkValue']),
      name: serializer.fromJson<String?>(json['name']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'tableRef': serializer.toJson<LinkTableRef>(tableRef),
      'refId': serializer.toJson<int>(refId),
      'linkValue': serializer.toJson<String>(linkValue),
      'name': serializer.toJson<String?>(name),
    };
  }

  Link copyWith({
    LinkTableRef? tableRef,
    int? refId,
    String? linkValue,
    Value<String?> name = const Value.absent(),
  }) => Link(
    tableRef: tableRef ?? this.tableRef,
    refId: refId ?? this.refId,
    linkValue: linkValue ?? this.linkValue,
    name: name.present ? name.value : this.name,
  );
  Link copyWithCompanion(LinksCompanion data) {
    return Link(
      tableRef: data.tableRef.present ? data.tableRef.value : this.tableRef,
      refId: data.refId.present ? data.refId.value : this.refId,
      linkValue: data.linkValue.present ? data.linkValue.value : this.linkValue,
      name: data.name.present ? data.name.value : this.name,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Link(')
          ..write('tableRef: $tableRef, ')
          ..write('refId: $refId, ')
          ..write('linkValue: $linkValue, ')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(tableRef, refId, linkValue, name);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Link &&
          other.tableRef == this.tableRef &&
          other.refId == this.refId &&
          other.linkValue == this.linkValue &&
          other.name == this.name);
}

class LinksCompanion extends UpdateCompanion<Link> {
  final Value<LinkTableRef> tableRef;
  final Value<int> refId;
  final Value<String> linkValue;
  final Value<String?> name;
  const LinksCompanion({
    this.tableRef = const Value.absent(),
    this.refId = const Value.absent(),
    this.linkValue = const Value.absent(),
    this.name = const Value.absent(),
  });
  LinksCompanion.insert({
    required LinkTableRef tableRef,
    required int refId,
    this.linkValue = const Value.absent(),
    this.name = const Value.absent(),
  }) : tableRef = Value(tableRef),
       refId = Value(refId);
  static Insertable<Link> custom({
    Expression<String>? tableRef,
    Expression<int>? refId,
    Expression<String>? linkValue,
    Expression<String>? name,
  }) {
    return RawValuesInsertable({
      if (tableRef != null) 'table_ref': tableRef,
      if (refId != null) 'ref_id': refId,
      if (linkValue != null) 'link_value': linkValue,
      if (name != null) 'name': name,
    });
  }

  LinksCompanion copyWith({
    Value<LinkTableRef>? tableRef,
    Value<int>? refId,
    Value<String>? linkValue,
    Value<String?>? name,
  }) {
    return LinksCompanion(
      tableRef: tableRef ?? this.tableRef,
      refId: refId ?? this.refId,
      linkValue: linkValue ?? this.linkValue,
      name: name ?? this.name,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (tableRef.present) {
      map['table_ref'] = Variable<String>(
        $LinksTable.$convertertableRef.toSql(tableRef.value),
      );
    }
    if (refId.present) {
      map['ref_id'] = Variable<int>(refId.value);
    }
    if (linkValue.present) {
      map['link_value'] = Variable<String>(linkValue.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('LinksCompanion(')
          ..write('tableRef: $tableRef, ')
          ..write('refId: $refId, ')
          ..write('linkValue: $linkValue, ')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }
}

class $PartfieldGuidanceGroupsTable extends PartfieldGuidanceGroups
    with TableInfo<$PartfieldGuidanceGroupsTable, PartfieldGuidanceGroup> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PartfieldGuidanceGroupsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _partfieldMeta = const VerificationMeta(
    'partfield',
  );
  @override
  late final GeneratedColumn<int> partfield = GeneratedColumn<int>(
    'partfield',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES partfields (id)',
    ),
  );
  static const VerificationMeta _guidanceGroupMeta = const VerificationMeta(
    'guidanceGroup',
  );
  @override
  late final GeneratedColumn<int> guidanceGroup = GeneratedColumn<int>(
    'guidance_group',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES guidance_groups (id)',
    ),
  );
  @override
  List<GeneratedColumn> get $columns => [partfield, guidanceGroup];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'partfield_guidance_groups';
  @override
  VerificationContext validateIntegrity(
    Insertable<PartfieldGuidanceGroup> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('partfield')) {
      context.handle(
        _partfieldMeta,
        partfield.isAcceptableOrUnknown(data['partfield']!, _partfieldMeta),
      );
    } else if (isInserting) {
      context.missing(_partfieldMeta);
    }
    if (data.containsKey('guidance_group')) {
      context.handle(
        _guidanceGroupMeta,
        guidanceGroup.isAcceptableOrUnknown(
          data['guidance_group']!,
          _guidanceGroupMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_guidanceGroupMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {partfield, guidanceGroup};
  @override
  PartfieldGuidanceGroup map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return PartfieldGuidanceGroup(
      partfield: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}partfield'],
      )!,
      guidanceGroup: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}guidance_group'],
      )!,
    );
  }

  @override
  $PartfieldGuidanceGroupsTable createAlias(String alias) {
    return $PartfieldGuidanceGroupsTable(attachedDatabase, alias);
  }

  @override
  bool get withoutRowId => true;
}

class PartfieldGuidanceGroup extends DataClass
    implements Insertable<PartfieldGuidanceGroup> {
  /// A reference to a [Partfield].
  final int partfield;

  /// A reference to a [GuidanceGroup].
  final int guidanceGroup;
  const PartfieldGuidanceGroup({
    required this.partfield,
    required this.guidanceGroup,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['partfield'] = Variable<int>(partfield);
    map['guidance_group'] = Variable<int>(guidanceGroup);
    return map;
  }

  PartfieldGuidanceGroupsCompanion toCompanion(bool nullToAbsent) {
    return PartfieldGuidanceGroupsCompanion(
      partfield: Value(partfield),
      guidanceGroup: Value(guidanceGroup),
    );
  }

  factory PartfieldGuidanceGroup.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return PartfieldGuidanceGroup(
      partfield: serializer.fromJson<int>(json['partfield']),
      guidanceGroup: serializer.fromJson<int>(json['guidanceGroup']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'partfield': serializer.toJson<int>(partfield),
      'guidanceGroup': serializer.toJson<int>(guidanceGroup),
    };
  }

  PartfieldGuidanceGroup copyWith({int? partfield, int? guidanceGroup}) =>
      PartfieldGuidanceGroup(
        partfield: partfield ?? this.partfield,
        guidanceGroup: guidanceGroup ?? this.guidanceGroup,
      );
  PartfieldGuidanceGroup copyWithCompanion(
    PartfieldGuidanceGroupsCompanion data,
  ) {
    return PartfieldGuidanceGroup(
      partfield: data.partfield.present ? data.partfield.value : this.partfield,
      guidanceGroup: data.guidanceGroup.present
          ? data.guidanceGroup.value
          : this.guidanceGroup,
    );
  }

  @override
  String toString() {
    return (StringBuffer('PartfieldGuidanceGroup(')
          ..write('partfield: $partfield, ')
          ..write('guidanceGroup: $guidanceGroup')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(partfield, guidanceGroup);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PartfieldGuidanceGroup &&
          other.partfield == this.partfield &&
          other.guidanceGroup == this.guidanceGroup);
}

class PartfieldGuidanceGroupsCompanion
    extends UpdateCompanion<PartfieldGuidanceGroup> {
  final Value<int> partfield;
  final Value<int> guidanceGroup;
  const PartfieldGuidanceGroupsCompanion({
    this.partfield = const Value.absent(),
    this.guidanceGroup = const Value.absent(),
  });
  PartfieldGuidanceGroupsCompanion.insert({
    required int partfield,
    required int guidanceGroup,
  }) : partfield = Value(partfield),
       guidanceGroup = Value(guidanceGroup);
  static Insertable<PartfieldGuidanceGroup> custom({
    Expression<int>? partfield,
    Expression<int>? guidanceGroup,
  }) {
    return RawValuesInsertable({
      if (partfield != null) 'partfield': partfield,
      if (guidanceGroup != null) 'guidance_group': guidanceGroup,
    });
  }

  PartfieldGuidanceGroupsCompanion copyWith({
    Value<int>? partfield,
    Value<int>? guidanceGroup,
  }) {
    return PartfieldGuidanceGroupsCompanion(
      partfield: partfield ?? this.partfield,
      guidanceGroup: guidanceGroup ?? this.guidanceGroup,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (partfield.present) {
      map['partfield'] = Variable<int>(partfield.value);
    }
    if (guidanceGroup.present) {
      map['guidance_group'] = Variable<int>(guidanceGroup.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PartfieldGuidanceGroupsCompanion(')
          ..write('partfield: $partfield, ')
          ..write('guidanceGroup: $guidanceGroup')
          ..write(')'))
        .toString();
  }
}

class $PartfieldPolygonsTable extends PartfieldPolygons
    with TableInfo<$PartfieldPolygonsTable, PartfieldPolygon> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PartfieldPolygonsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _partfieldMeta = const VerificationMeta(
    'partfield',
  );
  @override
  late final GeneratedColumn<int> partfield = GeneratedColumn<int>(
    'partfield',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES partfields (id)',
    ),
  );
  static const VerificationMeta _polygonMeta = const VerificationMeta(
    'polygon',
  );
  @override
  late final GeneratedColumn<int> polygon = GeneratedColumn<int>(
    'polygon',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES polygons (id)',
    ),
  );
  @override
  List<GeneratedColumn> get $columns => [partfield, polygon];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'partfield_polygons';
  @override
  VerificationContext validateIntegrity(
    Insertable<PartfieldPolygon> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('partfield')) {
      context.handle(
        _partfieldMeta,
        partfield.isAcceptableOrUnknown(data['partfield']!, _partfieldMeta),
      );
    } else if (isInserting) {
      context.missing(_partfieldMeta);
    }
    if (data.containsKey('polygon')) {
      context.handle(
        _polygonMeta,
        polygon.isAcceptableOrUnknown(data['polygon']!, _polygonMeta),
      );
    } else if (isInserting) {
      context.missing(_polygonMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {partfield, polygon};
  @override
  PartfieldPolygon map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return PartfieldPolygon(
      partfield: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}partfield'],
      )!,
      polygon: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}polygon'],
      )!,
    );
  }

  @override
  $PartfieldPolygonsTable createAlias(String alias) {
    return $PartfieldPolygonsTable(attachedDatabase, alias);
  }

  @override
  bool get withoutRowId => true;
}

class PartfieldPolygon extends DataClass
    implements Insertable<PartfieldPolygon> {
  /// A reference to a [Partfield].
  final int partfield;

  /// A reference to a [Polygon].
  final int polygon;
  const PartfieldPolygon({required this.partfield, required this.polygon});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['partfield'] = Variable<int>(partfield);
    map['polygon'] = Variable<int>(polygon);
    return map;
  }

  PartfieldPolygonsCompanion toCompanion(bool nullToAbsent) {
    return PartfieldPolygonsCompanion(
      partfield: Value(partfield),
      polygon: Value(polygon),
    );
  }

  factory PartfieldPolygon.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return PartfieldPolygon(
      partfield: serializer.fromJson<int>(json['partfield']),
      polygon: serializer.fromJson<int>(json['polygon']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'partfield': serializer.toJson<int>(partfield),
      'polygon': serializer.toJson<int>(polygon),
    };
  }

  PartfieldPolygon copyWith({int? partfield, int? polygon}) => PartfieldPolygon(
    partfield: partfield ?? this.partfield,
    polygon: polygon ?? this.polygon,
  );
  PartfieldPolygon copyWithCompanion(PartfieldPolygonsCompanion data) {
    return PartfieldPolygon(
      partfield: data.partfield.present ? data.partfield.value : this.partfield,
      polygon: data.polygon.present ? data.polygon.value : this.polygon,
    );
  }

  @override
  String toString() {
    return (StringBuffer('PartfieldPolygon(')
          ..write('partfield: $partfield, ')
          ..write('polygon: $polygon')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(partfield, polygon);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PartfieldPolygon &&
          other.partfield == this.partfield &&
          other.polygon == this.polygon);
}

class PartfieldPolygonsCompanion extends UpdateCompanion<PartfieldPolygon> {
  final Value<int> partfield;
  final Value<int> polygon;
  const PartfieldPolygonsCompanion({
    this.partfield = const Value.absent(),
    this.polygon = const Value.absent(),
  });
  PartfieldPolygonsCompanion.insert({
    required int partfield,
    required int polygon,
  }) : partfield = Value(partfield),
       polygon = Value(polygon);
  static Insertable<PartfieldPolygon> custom({
    Expression<int>? partfield,
    Expression<int>? polygon,
  }) {
    return RawValuesInsertable({
      if (partfield != null) 'partfield': partfield,
      if (polygon != null) 'polygon': polygon,
    });
  }

  PartfieldPolygonsCompanion copyWith({
    Value<int>? partfield,
    Value<int>? polygon,
  }) {
    return PartfieldPolygonsCompanion(
      partfield: partfield ?? this.partfield,
      polygon: polygon ?? this.polygon,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (partfield.present) {
      map['partfield'] = Variable<int>(partfield.value);
    }
    if (polygon.present) {
      map['polygon'] = Variable<int>(polygon.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PartfieldPolygonsCompanion(')
          ..write('partfield: $partfield, ')
          ..write('polygon: $polygon')
          ..write(')'))
        .toString();
  }
}

class $PartfieldLineStringsTable extends PartfieldLineStrings
    with TableInfo<$PartfieldLineStringsTable, PartfieldLineString> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PartfieldLineStringsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _partfieldMeta = const VerificationMeta(
    'partfield',
  );
  @override
  late final GeneratedColumn<int> partfield = GeneratedColumn<int>(
    'partfield',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES partfields (id)',
    ),
  );
  static const VerificationMeta _lineStringMeta = const VerificationMeta(
    'lineString',
  );
  @override
  late final GeneratedColumn<int> lineString = GeneratedColumn<int>(
    'line_string',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES line_strings (id)',
    ),
  );
  @override
  List<GeneratedColumn> get $columns => [partfield, lineString];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'partfield_line_strings';
  @override
  VerificationContext validateIntegrity(
    Insertable<PartfieldLineString> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('partfield')) {
      context.handle(
        _partfieldMeta,
        partfield.isAcceptableOrUnknown(data['partfield']!, _partfieldMeta),
      );
    } else if (isInserting) {
      context.missing(_partfieldMeta);
    }
    if (data.containsKey('line_string')) {
      context.handle(
        _lineStringMeta,
        lineString.isAcceptableOrUnknown(data['line_string']!, _lineStringMeta),
      );
    } else if (isInserting) {
      context.missing(_lineStringMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {partfield, lineString};
  @override
  PartfieldLineString map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return PartfieldLineString(
      partfield: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}partfield'],
      )!,
      lineString: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}line_string'],
      )!,
    );
  }

  @override
  $PartfieldLineStringsTable createAlias(String alias) {
    return $PartfieldLineStringsTable(attachedDatabase, alias);
  }

  @override
  bool get withoutRowId => true;
}

class PartfieldLineString extends DataClass
    implements Insertable<PartfieldLineString> {
  /// A reference to a [Partfield].
  final int partfield;

  /// A reference to a [LineString]
  final int lineString;
  const PartfieldLineString({
    required this.partfield,
    required this.lineString,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['partfield'] = Variable<int>(partfield);
    map['line_string'] = Variable<int>(lineString);
    return map;
  }

  PartfieldLineStringsCompanion toCompanion(bool nullToAbsent) {
    return PartfieldLineStringsCompanion(
      partfield: Value(partfield),
      lineString: Value(lineString),
    );
  }

  factory PartfieldLineString.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return PartfieldLineString(
      partfield: serializer.fromJson<int>(json['partfield']),
      lineString: serializer.fromJson<int>(json['lineString']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'partfield': serializer.toJson<int>(partfield),
      'lineString': serializer.toJson<int>(lineString),
    };
  }

  PartfieldLineString copyWith({int? partfield, int? lineString}) =>
      PartfieldLineString(
        partfield: partfield ?? this.partfield,
        lineString: lineString ?? this.lineString,
      );
  PartfieldLineString copyWithCompanion(PartfieldLineStringsCompanion data) {
    return PartfieldLineString(
      partfield: data.partfield.present ? data.partfield.value : this.partfield,
      lineString: data.lineString.present
          ? data.lineString.value
          : this.lineString,
    );
  }

  @override
  String toString() {
    return (StringBuffer('PartfieldLineString(')
          ..write('partfield: $partfield, ')
          ..write('lineString: $lineString')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(partfield, lineString);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PartfieldLineString &&
          other.partfield == this.partfield &&
          other.lineString == this.lineString);
}

class PartfieldLineStringsCompanion
    extends UpdateCompanion<PartfieldLineString> {
  final Value<int> partfield;
  final Value<int> lineString;
  const PartfieldLineStringsCompanion({
    this.partfield = const Value.absent(),
    this.lineString = const Value.absent(),
  });
  PartfieldLineStringsCompanion.insert({
    required int partfield,
    required int lineString,
  }) : partfield = Value(partfield),
       lineString = Value(lineString);
  static Insertable<PartfieldLineString> custom({
    Expression<int>? partfield,
    Expression<int>? lineString,
  }) {
    return RawValuesInsertable({
      if (partfield != null) 'partfield': partfield,
      if (lineString != null) 'line_string': lineString,
    });
  }

  PartfieldLineStringsCompanion copyWith({
    Value<int>? partfield,
    Value<int>? lineString,
  }) {
    return PartfieldLineStringsCompanion(
      partfield: partfield ?? this.partfield,
      lineString: lineString ?? this.lineString,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (partfield.present) {
      map['partfield'] = Variable<int>(partfield.value);
    }
    if (lineString.present) {
      map['line_string'] = Variable<int>(lineString.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PartfieldLineStringsCompanion(')
          ..write('partfield: $partfield, ')
          ..write('lineString: $lineString')
          ..write(')'))
        .toString();
  }
}

class $PartfieldPointsTable extends PartfieldPoints
    with TableInfo<$PartfieldPointsTable, PartfieldPoint> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PartfieldPointsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _partfieldMeta = const VerificationMeta(
    'partfield',
  );
  @override
  late final GeneratedColumn<int> partfield = GeneratedColumn<int>(
    'partfield',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES partfields (id)',
    ),
  );
  static const VerificationMeta _pointMeta = const VerificationMeta('point');
  @override
  late final GeneratedColumn<int> point = GeneratedColumn<int>(
    'point',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES points (id)',
    ),
  );
  @override
  List<GeneratedColumn> get $columns => [partfield, point];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'partfield_points';
  @override
  VerificationContext validateIntegrity(
    Insertable<PartfieldPoint> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('partfield')) {
      context.handle(
        _partfieldMeta,
        partfield.isAcceptableOrUnknown(data['partfield']!, _partfieldMeta),
      );
    } else if (isInserting) {
      context.missing(_partfieldMeta);
    }
    if (data.containsKey('point')) {
      context.handle(
        _pointMeta,
        point.isAcceptableOrUnknown(data['point']!, _pointMeta),
      );
    } else if (isInserting) {
      context.missing(_pointMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {partfield, point};
  @override
  PartfieldPoint map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return PartfieldPoint(
      partfield: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}partfield'],
      )!,
      point: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}point'],
      )!,
    );
  }

  @override
  $PartfieldPointsTable createAlias(String alias) {
    return $PartfieldPointsTable(attachedDatabase, alias);
  }

  @override
  bool get withoutRowId => true;
}

class PartfieldPoint extends DataClass implements Insertable<PartfieldPoint> {
  /// A reference to a [Partfield].
  final int partfield;

  /// A reference to a [Point]
  final int point;
  const PartfieldPoint({required this.partfield, required this.point});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['partfield'] = Variable<int>(partfield);
    map['point'] = Variable<int>(point);
    return map;
  }

  PartfieldPointsCompanion toCompanion(bool nullToAbsent) {
    return PartfieldPointsCompanion(
      partfield: Value(partfield),
      point: Value(point),
    );
  }

  factory PartfieldPoint.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return PartfieldPoint(
      partfield: serializer.fromJson<int>(json['partfield']),
      point: serializer.fromJson<int>(json['point']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'partfield': serializer.toJson<int>(partfield),
      'point': serializer.toJson<int>(point),
    };
  }

  PartfieldPoint copyWith({int? partfield, int? point}) => PartfieldPoint(
    partfield: partfield ?? this.partfield,
    point: point ?? this.point,
  );
  PartfieldPoint copyWithCompanion(PartfieldPointsCompanion data) {
    return PartfieldPoint(
      partfield: data.partfield.present ? data.partfield.value : this.partfield,
      point: data.point.present ? data.point.value : this.point,
    );
  }

  @override
  String toString() {
    return (StringBuffer('PartfieldPoint(')
          ..write('partfield: $partfield, ')
          ..write('point: $point')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(partfield, point);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PartfieldPoint &&
          other.partfield == this.partfield &&
          other.point == this.point);
}

class PartfieldPointsCompanion extends UpdateCompanion<PartfieldPoint> {
  final Value<int> partfield;
  final Value<int> point;
  const PartfieldPointsCompanion({
    this.partfield = const Value.absent(),
    this.point = const Value.absent(),
  });
  PartfieldPointsCompanion.insert({required int partfield, required int point})
    : partfield = Value(partfield),
      point = Value(point);
  static Insertable<PartfieldPoint> custom({
    Expression<int>? partfield,
    Expression<int>? point,
  }) {
    return RawValuesInsertable({
      if (partfield != null) 'partfield': partfield,
      if (point != null) 'point': point,
    });
  }

  PartfieldPointsCompanion copyWith({
    Value<int>? partfield,
    Value<int>? point,
  }) {
    return PartfieldPointsCompanion(
      partfield: partfield ?? this.partfield,
      point: point ?? this.point,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (partfield.present) {
      map['partfield'] = Variable<int>(partfield.value);
    }
    if (point.present) {
      map['point'] = Variable<int>(point.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PartfieldPointsCompanion(')
          ..write('partfield: $partfield, ')
          ..write('point: $point')
          ..write(')'))
        .toString();
  }
}

class $PolygonLineStringsTable extends PolygonLineStrings
    with TableInfo<$PolygonLineStringsTable, PolygonLineString> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PolygonLineStringsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _polygonMeta = const VerificationMeta(
    'polygon',
  );
  @override
  late final GeneratedColumn<int> polygon = GeneratedColumn<int>(
    'polygon',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES polygons (id)',
    ),
  );
  static const VerificationMeta _lineStringMeta = const VerificationMeta(
    'lineString',
  );
  @override
  late final GeneratedColumn<int> lineString = GeneratedColumn<int>(
    'line_string',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES line_strings (id)',
    ),
  );
  @override
  List<GeneratedColumn> get $columns => [polygon, lineString];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'polygon_line_strings';
  @override
  VerificationContext validateIntegrity(
    Insertable<PolygonLineString> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('polygon')) {
      context.handle(
        _polygonMeta,
        polygon.isAcceptableOrUnknown(data['polygon']!, _polygonMeta),
      );
    } else if (isInserting) {
      context.missing(_polygonMeta);
    }
    if (data.containsKey('line_string')) {
      context.handle(
        _lineStringMeta,
        lineString.isAcceptableOrUnknown(data['line_string']!, _lineStringMeta),
      );
    } else if (isInserting) {
      context.missing(_lineStringMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  PolygonLineString map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return PolygonLineString(
      polygon: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}polygon'],
      )!,
      lineString: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}line_string'],
      )!,
    );
  }

  @override
  $PolygonLineStringsTable createAlias(String alias) {
    return $PolygonLineStringsTable(attachedDatabase, alias);
  }
}

class PolygonLineString extends DataClass
    implements Insertable<PolygonLineString> {
  /// Reference to a [Polygon].
  final int polygon;

  /// Reference to a [LineString].
  final int lineString;
  const PolygonLineString({required this.polygon, required this.lineString});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['polygon'] = Variable<int>(polygon);
    map['line_string'] = Variable<int>(lineString);
    return map;
  }

  PolygonLineStringsCompanion toCompanion(bool nullToAbsent) {
    return PolygonLineStringsCompanion(
      polygon: Value(polygon),
      lineString: Value(lineString),
    );
  }

  factory PolygonLineString.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return PolygonLineString(
      polygon: serializer.fromJson<int>(json['polygon']),
      lineString: serializer.fromJson<int>(json['lineString']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'polygon': serializer.toJson<int>(polygon),
      'lineString': serializer.toJson<int>(lineString),
    };
  }

  PolygonLineString copyWith({int? polygon, int? lineString}) =>
      PolygonLineString(
        polygon: polygon ?? this.polygon,
        lineString: lineString ?? this.lineString,
      );
  PolygonLineString copyWithCompanion(PolygonLineStringsCompanion data) {
    return PolygonLineString(
      polygon: data.polygon.present ? data.polygon.value : this.polygon,
      lineString: data.lineString.present
          ? data.lineString.value
          : this.lineString,
    );
  }

  @override
  String toString() {
    return (StringBuffer('PolygonLineString(')
          ..write('polygon: $polygon, ')
          ..write('lineString: $lineString')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(polygon, lineString);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PolygonLineString &&
          other.polygon == this.polygon &&
          other.lineString == this.lineString);
}

class PolygonLineStringsCompanion extends UpdateCompanion<PolygonLineString> {
  final Value<int> polygon;
  final Value<int> lineString;
  final Value<int> rowid;
  const PolygonLineStringsCompanion({
    this.polygon = const Value.absent(),
    this.lineString = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  PolygonLineStringsCompanion.insert({
    required int polygon,
    required int lineString,
    this.rowid = const Value.absent(),
  }) : polygon = Value(polygon),
       lineString = Value(lineString);
  static Insertable<PolygonLineString> custom({
    Expression<int>? polygon,
    Expression<int>? lineString,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (polygon != null) 'polygon': polygon,
      if (lineString != null) 'line_string': lineString,
      if (rowid != null) 'rowid': rowid,
    });
  }

  PolygonLineStringsCompanion copyWith({
    Value<int>? polygon,
    Value<int>? lineString,
    Value<int>? rowid,
  }) {
    return PolygonLineStringsCompanion(
      polygon: polygon ?? this.polygon,
      lineString: lineString ?? this.lineString,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (polygon.present) {
      map['polygon'] = Variable<int>(polygon.value);
    }
    if (lineString.present) {
      map['line_string'] = Variable<int>(lineString.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PolygonLineStringsCompanion(')
          ..write('polygon: $polygon, ')
          ..write('lineString: $lineString, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $SectionsTable extends Sections with TableInfo<$SectionsTable, Section> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SectionsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    clientDefault: DateTime.now,
  );
  static const VerificationMeta _lastUpdatedAtMeta = const VerificationMeta(
    'lastUpdatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> lastUpdatedAt =
      GeneratedColumn<DateTime>(
        'last_updated_at',
        aliasedName,
        true,
        type: DriftSqlType.dateTime,
        requiredDuringInsert: false,
      );
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
  static const VerificationMeta _implementMeta = const VerificationMeta(
    'implement',
  );
  @override
  late final GeneratedColumn<int> implement = GeneratedColumn<int>(
    'implement',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES implements (id)',
    ),
  );
  static const VerificationMeta _longitudinalOffsetMeta =
      const VerificationMeta('longitudinalOffset');
  @override
  late final GeneratedColumn<double> longitudinalOffset =
      GeneratedColumn<double>(
        'longitudinal_offset',
        aliasedName,
        false,
        type: DriftSqlType.double,
        requiredDuringInsert: true,
      );
  static const VerificationMeta _lateralOffsetMeta = const VerificationMeta(
    'lateralOffset',
  );
  @override
  late final GeneratedColumn<double> lateralOffset = GeneratedColumn<double>(
    'lateral_offset',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _widthMeta = const VerificationMeta('width');
  @override
  late final GeneratedColumn<double> width = GeneratedColumn<double>(
    'width',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _lengthMeta = const VerificationMeta('length');
  @override
  late final GeneratedColumn<double> length = GeneratedColumn<double>(
    'length',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _automateActivationMeta =
      const VerificationMeta('automateActivation');
  @override
  late final GeneratedColumn<bool> automateActivation = GeneratedColumn<bool>(
    'automate_activation',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("automate_activation" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  @override
  late final GeneratedColumnWithTypeConverter<Color?, String> color =
      GeneratedColumn<String>(
        'color',
        aliasedName,
        true,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
      ).withConverter<Color?>($SectionsTable.$convertercolorn);
  @override
  late final GeneratedColumnWithTypeConverter<Color?, String> workedPathColor =
      GeneratedColumn<String>(
        'worked_path_color',
        aliasedName,
        true,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
      ).withConverter<Color?>($SectionsTable.$converterworkedPathColorn);
  @override
  List<GeneratedColumn> get $columns => [
    createdAt,
    lastUpdatedAt,
    id,
    implement,
    longitudinalOffset,
    lateralOffset,
    width,
    length,
    automateActivation,
    color,
    workedPathColor,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'sections';
  @override
  VerificationContext validateIntegrity(
    Insertable<Section> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    if (data.containsKey('last_updated_at')) {
      context.handle(
        _lastUpdatedAtMeta,
        lastUpdatedAt.isAcceptableOrUnknown(
          data['last_updated_at']!,
          _lastUpdatedAtMeta,
        ),
      );
    }
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('implement')) {
      context.handle(
        _implementMeta,
        implement.isAcceptableOrUnknown(data['implement']!, _implementMeta),
      );
    } else if (isInserting) {
      context.missing(_implementMeta);
    }
    if (data.containsKey('longitudinal_offset')) {
      context.handle(
        _longitudinalOffsetMeta,
        longitudinalOffset.isAcceptableOrUnknown(
          data['longitudinal_offset']!,
          _longitudinalOffsetMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_longitudinalOffsetMeta);
    }
    if (data.containsKey('lateral_offset')) {
      context.handle(
        _lateralOffsetMeta,
        lateralOffset.isAcceptableOrUnknown(
          data['lateral_offset']!,
          _lateralOffsetMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_lateralOffsetMeta);
    }
    if (data.containsKey('width')) {
      context.handle(
        _widthMeta,
        width.isAcceptableOrUnknown(data['width']!, _widthMeta),
      );
    } else if (isInserting) {
      context.missing(_widthMeta);
    }
    if (data.containsKey('length')) {
      context.handle(
        _lengthMeta,
        length.isAcceptableOrUnknown(data['length']!, _lengthMeta),
      );
    } else if (isInserting) {
      context.missing(_lengthMeta);
    }
    if (data.containsKey('automate_activation')) {
      context.handle(
        _automateActivationMeta,
        automateActivation.isAcceptableOrUnknown(
          data['automate_activation']!,
          _automateActivationMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Section map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Section.fromDatabase(
      longitudinalOffset: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}longitudinal_offset'],
      )!,
      lateralOffset: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}lateral_offset'],
      )!,
      width: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}width'],
      )!,
      length: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}length'],
      )!,
      automateActivation: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}automate_activation'],
      )!,
      color: $SectionsTable.$convertercolorn.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}color'],
        ),
      ),
      workedPathColor: $SectionsTable.$converterworkedPathColorn.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}worked_path_color'],
        ),
      ),
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      implement: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}implement'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      lastUpdatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}last_updated_at'],
      ),
    );
  }

  @override
  $SectionsTable createAlias(String alias) {
    return $SectionsTable(attachedDatabase, alias);
  }

  static TypeConverter<Color, String> $convertercolor = const ColorConverter();
  static TypeConverter<Color?, String?> $convertercolorn =
      NullAwareTypeConverter.wrap($convertercolor);
  static TypeConverter<Color, String> $converterworkedPathColor =
      const ColorConverter();
  static TypeConverter<Color?, String?> $converterworkedPathColorn =
      NullAwareTypeConverter.wrap($converterworkedPathColor);
}

class SectionsCompanion extends UpdateCompanion<Section> {
  final Value<DateTime> createdAt;
  final Value<DateTime?> lastUpdatedAt;
  final Value<int> id;
  final Value<int> implement;
  final Value<double> longitudinalOffset;
  final Value<double> lateralOffset;
  final Value<double> width;
  final Value<double> length;
  final Value<bool> automateActivation;
  final Value<Color?> color;
  final Value<Color?> workedPathColor;
  const SectionsCompanion({
    this.createdAt = const Value.absent(),
    this.lastUpdatedAt = const Value.absent(),
    this.id = const Value.absent(),
    this.implement = const Value.absent(),
    this.longitudinalOffset = const Value.absent(),
    this.lateralOffset = const Value.absent(),
    this.width = const Value.absent(),
    this.length = const Value.absent(),
    this.automateActivation = const Value.absent(),
    this.color = const Value.absent(),
    this.workedPathColor = const Value.absent(),
  });
  SectionsCompanion.insert({
    this.createdAt = const Value.absent(),
    this.lastUpdatedAt = const Value.absent(),
    this.id = const Value.absent(),
    required int implement,
    required double longitudinalOffset,
    required double lateralOffset,
    required double width,
    required double length,
    this.automateActivation = const Value.absent(),
    this.color = const Value.absent(),
    this.workedPathColor = const Value.absent(),
  }) : implement = Value(implement),
       longitudinalOffset = Value(longitudinalOffset),
       lateralOffset = Value(lateralOffset),
       width = Value(width),
       length = Value(length);
  static Insertable<Section> custom({
    Expression<DateTime>? createdAt,
    Expression<DateTime>? lastUpdatedAt,
    Expression<int>? id,
    Expression<int>? implement,
    Expression<double>? longitudinalOffset,
    Expression<double>? lateralOffset,
    Expression<double>? width,
    Expression<double>? length,
    Expression<bool>? automateActivation,
    Expression<String>? color,
    Expression<String>? workedPathColor,
  }) {
    return RawValuesInsertable({
      if (createdAt != null) 'created_at': createdAt,
      if (lastUpdatedAt != null) 'last_updated_at': lastUpdatedAt,
      if (id != null) 'id': id,
      if (implement != null) 'implement': implement,
      if (longitudinalOffset != null) 'longitudinal_offset': longitudinalOffset,
      if (lateralOffset != null) 'lateral_offset': lateralOffset,
      if (width != null) 'width': width,
      if (length != null) 'length': length,
      if (automateActivation != null) 'automate_activation': automateActivation,
      if (color != null) 'color': color,
      if (workedPathColor != null) 'worked_path_color': workedPathColor,
    });
  }

  SectionsCompanion copyWith({
    Value<DateTime>? createdAt,
    Value<DateTime?>? lastUpdatedAt,
    Value<int>? id,
    Value<int>? implement,
    Value<double>? longitudinalOffset,
    Value<double>? lateralOffset,
    Value<double>? width,
    Value<double>? length,
    Value<bool>? automateActivation,
    Value<Color?>? color,
    Value<Color?>? workedPathColor,
  }) {
    return SectionsCompanion(
      createdAt: createdAt ?? this.createdAt,
      lastUpdatedAt: lastUpdatedAt ?? this.lastUpdatedAt,
      id: id ?? this.id,
      implement: implement ?? this.implement,
      longitudinalOffset: longitudinalOffset ?? this.longitudinalOffset,
      lateralOffset: lateralOffset ?? this.lateralOffset,
      width: width ?? this.width,
      length: length ?? this.length,
      automateActivation: automateActivation ?? this.automateActivation,
      color: color ?? this.color,
      workedPathColor: workedPathColor ?? this.workedPathColor,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (lastUpdatedAt.present) {
      map['last_updated_at'] = Variable<DateTime>(lastUpdatedAt.value);
    }
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (implement.present) {
      map['implement'] = Variable<int>(implement.value);
    }
    if (longitudinalOffset.present) {
      map['longitudinal_offset'] = Variable<double>(longitudinalOffset.value);
    }
    if (lateralOffset.present) {
      map['lateral_offset'] = Variable<double>(lateralOffset.value);
    }
    if (width.present) {
      map['width'] = Variable<double>(width.value);
    }
    if (length.present) {
      map['length'] = Variable<double>(length.value);
    }
    if (automateActivation.present) {
      map['automate_activation'] = Variable<bool>(automateActivation.value);
    }
    if (color.present) {
      map['color'] = Variable<String>(
        $SectionsTable.$convertercolorn.toSql(color.value),
      );
    }
    if (workedPathColor.present) {
      map['worked_path_color'] = Variable<String>(
        $SectionsTable.$converterworkedPathColorn.toSql(workedPathColor.value),
      );
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SectionsCompanion(')
          ..write('createdAt: $createdAt, ')
          ..write('lastUpdatedAt: $lastUpdatedAt, ')
          ..write('id: $id, ')
          ..write('implement: $implement, ')
          ..write('longitudinalOffset: $longitudinalOffset, ')
          ..write('lateralOffset: $lateralOffset, ')
          ..write('width: $width, ')
          ..write('length: $length, ')
          ..write('automateActivation: $automateActivation, ')
          ..write('color: $color, ')
          ..write('workedPathColor: $workedPathColor')
          ..write(')'))
        .toString();
  }
}

abstract class _$Database extends GeneratedDatabase {
  _$Database(QueryExecutor e) : super(e);
  $DatabaseManager get managers => $DatabaseManager(this);
  late final $PartfieldsTable partfields = $PartfieldsTable(this);
  late final $TasksTable tasks = $TasksTable(this);
  late final $VehiclesTable vehicles = $VehiclesTable(this);
  late final $ImplementsTable implements = $ImplementsTable(this);
  late final $ConnectorsTable connectors = $ConnectorsTable(this);
  late final $ConnectionsTable connections = $ConnectionsTable(this);
  late final $PolygonsTable polygons = $PolygonsTable(this);
  late final $GuidanceGroupsTable guidanceGroups = $GuidanceGroupsTable(this);
  late final $GuidanceAllocationsTable guidanceAllocations =
      $GuidanceAllocationsTable(this);
  late final $LineStringsTable lineStrings = $LineStringsTable(this);
  late final $GuidancePatternsTable guidancePatterns = $GuidancePatternsTable(
    this,
  );
  late final $GuidanceGroupPatternsTable guidanceGroupPatterns =
      $GuidanceGroupPatternsTable(this);
  late final $PointsTable points = $PointsTable(this);
  late final $LineStringPointsTable lineStringPoints = $LineStringPointsTable(
    this,
  );
  late final $LinksTable links = $LinksTable(this);
  late final $PartfieldGuidanceGroupsTable partfieldGuidanceGroups =
      $PartfieldGuidanceGroupsTable(this);
  late final $PartfieldPolygonsTable partfieldPolygons =
      $PartfieldPolygonsTable(this);
  late final $PartfieldLineStringsTable partfieldLineStrings =
      $PartfieldLineStringsTable(this);
  late final $PartfieldPointsTable partfieldPoints = $PartfieldPointsTable(
    this,
  );
  late final $PolygonLineStringsTable polygonLineStrings =
      $PolygonLineStringsTable(this);
  late final $SectionsTable sections = $SectionsTable(this);
  late final ConnectionsDao connectionsDao = ConnectionsDao(this as Database);
  late final GuidanceAllocationsDao guidanceAllocationsDao =
      GuidanceAllocationsDao(this as Database);
  late final GuidanceGroupsDao guidanceGroupsDao = GuidanceGroupsDao(
    this as Database,
  );
  late final GuidancePatternsDao guidancePatternsDao = GuidancePatternsDao(
    this as Database,
  );
  late final ImplementsDao implementsDao = ImplementsDao(this as Database);
  late final LineStringsDao lineStringsDao = LineStringsDao(this as Database);
  late final PartfieldsDao partfieldsDao = PartfieldsDao(this as Database);
  late final PointsDao pointsDao = PointsDao(this as Database);
  late final PolygonsDao polygonsDao = PolygonsDao(this as Database);
  late final TasksDao tasksDao = TasksDao(this as Database);
  late final VehiclesDao vehiclesDao = VehiclesDao(this as Database);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    partfields,
    tasks,
    vehicles,
    implements,
    connectors,
    connections,
    polygons,
    guidanceGroups,
    guidanceAllocations,
    lineStrings,
    guidancePatterns,
    guidanceGroupPatterns,
    points,
    lineStringPoints,
    links,
    partfieldGuidanceGroups,
    partfieldPolygons,
    partfieldLineStrings,
    partfieldPoints,
    polygonLineStrings,
    sections,
  ];
  @override
  DriftDatabaseOptions get options =>
      const DriftDatabaseOptions(storeDateTimeAsText: true);
}

typedef $$PartfieldsTableCreateCompanionBuilder =
    PartfieldsCompanion Function({
      Value<DateTime> createdAt,
      Value<DateTime?> lastUpdatedAt,
      Value<int> id,
      Value<int?> parentField,
      Value<String?> name,
      required double area,
    });
typedef $$PartfieldsTableUpdateCompanionBuilder =
    PartfieldsCompanion Function({
      Value<DateTime> createdAt,
      Value<DateTime?> lastUpdatedAt,
      Value<int> id,
      Value<int?> parentField,
      Value<String?> name,
      Value<double> area,
    });

final class $$PartfieldsTableReferences
    extends BaseReferences<_$Database, $PartfieldsTable, Partfield> {
  $$PartfieldsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $PartfieldsTable _parentFieldTable(_$Database db) =>
      db.partfields.createAlias(
        $_aliasNameGenerator(db.partfields.parentField, db.partfields.id),
      );

  $$PartfieldsTableProcessedTableManager? get parentField {
    final $_column = $_itemColumn<int>('parent_field');
    if ($_column == null) return null;
    final manager = $$PartfieldsTableTableManager(
      $_db,
      $_db.partfields,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_parentFieldTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static MultiTypedResultKey<$TasksTable, List<Task>> _taskPartfieldTable(
    _$Database db,
  ) => MultiTypedResultKey.fromTable(
    db.tasks,
    aliasName: $_aliasNameGenerator(db.partfields.id, db.tasks.partfield),
  );

  $$TasksTableProcessedTableManager get taskPartfield {
    final manager = $$TasksTableTableManager(
      $_db,
      $_db.tasks,
    ).filter((f) => f.partfield.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_taskPartfieldTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<
    $PartfieldGuidanceGroupsTable,
    List<PartfieldGuidanceGroup>
  >
  _partfieldGuidanceGroupPartfieldTable(_$Database db) =>
      MultiTypedResultKey.fromTable(
        db.partfieldGuidanceGroups,
        aliasName: $_aliasNameGenerator(
          db.partfields.id,
          db.partfieldGuidanceGroups.partfield,
        ),
      );

  $$PartfieldGuidanceGroupsTableProcessedTableManager
  get partfieldGuidanceGroupPartfield {
    final manager = $$PartfieldGuidanceGroupsTableTableManager(
      $_db,
      $_db.partfieldGuidanceGroups,
    ).filter((f) => f.partfield.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _partfieldGuidanceGroupPartfieldTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$PartfieldPolygonsTable, List<PartfieldPolygon>>
  _partfieldPolygonPartfieldTable(_$Database db) =>
      MultiTypedResultKey.fromTable(
        db.partfieldPolygons,
        aliasName: $_aliasNameGenerator(
          db.partfields.id,
          db.partfieldPolygons.partfield,
        ),
      );

  $$PartfieldPolygonsTableProcessedTableManager get partfieldPolygonPartfield {
    final manager = $$PartfieldPolygonsTableTableManager(
      $_db,
      $_db.partfieldPolygons,
    ).filter((f) => f.partfield.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _partfieldPolygonPartfieldTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<
    $PartfieldLineStringsTable,
    List<PartfieldLineString>
  >
  _partfieldLineStringPartfieldTable(_$Database db) =>
      MultiTypedResultKey.fromTable(
        db.partfieldLineStrings,
        aliasName: $_aliasNameGenerator(
          db.partfields.id,
          db.partfieldLineStrings.partfield,
        ),
      );

  $$PartfieldLineStringsTableProcessedTableManager
  get partfieldLineStringPartfield {
    final manager = $$PartfieldLineStringsTableTableManager(
      $_db,
      $_db.partfieldLineStrings,
    ).filter((f) => f.partfield.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _partfieldLineStringPartfieldTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$PartfieldPointsTable, List<PartfieldPoint>>
  _partfieldPointPartfieldTable(_$Database db) => MultiTypedResultKey.fromTable(
    db.partfieldPoints,
    aliasName: $_aliasNameGenerator(
      db.partfields.id,
      db.partfieldPoints.partfield,
    ),
  );

  $$PartfieldPointsTableProcessedTableManager get partfieldPointPartfield {
    final manager = $$PartfieldPointsTableTableManager(
      $_db,
      $_db.partfieldPoints,
    ).filter((f) => f.partfield.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _partfieldPointPartfieldTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$PartfieldsTableFilterComposer
    extends Composer<_$Database, $PartfieldsTable> {
  $$PartfieldsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get lastUpdatedAt => $composableBuilder(
    column: $table.lastUpdatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get area => $composableBuilder(
    column: $table.area,
    builder: (column) => ColumnFilters(column),
  );

  $$PartfieldsTableFilterComposer get parentField {
    final $$PartfieldsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.parentField,
      referencedTable: $db.partfields,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PartfieldsTableFilterComposer(
            $db: $db,
            $table: $db.partfields,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<bool> taskPartfield(
    Expression<bool> Function($$TasksTableFilterComposer f) f,
  ) {
    final $$TasksTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.tasks,
      getReferencedColumn: (t) => t.partfield,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TasksTableFilterComposer(
            $db: $db,
            $table: $db.tasks,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> partfieldGuidanceGroupPartfield(
    Expression<bool> Function($$PartfieldGuidanceGroupsTableFilterComposer f) f,
  ) {
    final $$PartfieldGuidanceGroupsTableFilterComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.partfieldGuidanceGroups,
          getReferencedColumn: (t) => t.partfield,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$PartfieldGuidanceGroupsTableFilterComposer(
                $db: $db,
                $table: $db.partfieldGuidanceGroups,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }

  Expression<bool> partfieldPolygonPartfield(
    Expression<bool> Function($$PartfieldPolygonsTableFilterComposer f) f,
  ) {
    final $$PartfieldPolygonsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.partfieldPolygons,
      getReferencedColumn: (t) => t.partfield,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PartfieldPolygonsTableFilterComposer(
            $db: $db,
            $table: $db.partfieldPolygons,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> partfieldLineStringPartfield(
    Expression<bool> Function($$PartfieldLineStringsTableFilterComposer f) f,
  ) {
    final $$PartfieldLineStringsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.partfieldLineStrings,
      getReferencedColumn: (t) => t.partfield,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PartfieldLineStringsTableFilterComposer(
            $db: $db,
            $table: $db.partfieldLineStrings,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> partfieldPointPartfield(
    Expression<bool> Function($$PartfieldPointsTableFilterComposer f) f,
  ) {
    final $$PartfieldPointsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.partfieldPoints,
      getReferencedColumn: (t) => t.partfield,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PartfieldPointsTableFilterComposer(
            $db: $db,
            $table: $db.partfieldPoints,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$PartfieldsTableOrderingComposer
    extends Composer<_$Database, $PartfieldsTable> {
  $$PartfieldsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get lastUpdatedAt => $composableBuilder(
    column: $table.lastUpdatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get area => $composableBuilder(
    column: $table.area,
    builder: (column) => ColumnOrderings(column),
  );

  $$PartfieldsTableOrderingComposer get parentField {
    final $$PartfieldsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.parentField,
      referencedTable: $db.partfields,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PartfieldsTableOrderingComposer(
            $db: $db,
            $table: $db.partfields,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$PartfieldsTableAnnotationComposer
    extends Composer<_$Database, $PartfieldsTable> {
  $$PartfieldsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get lastUpdatedAt => $composableBuilder(
    column: $table.lastUpdatedAt,
    builder: (column) => column,
  );

  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<double> get area =>
      $composableBuilder(column: $table.area, builder: (column) => column);

  $$PartfieldsTableAnnotationComposer get parentField {
    final $$PartfieldsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.parentField,
      referencedTable: $db.partfields,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PartfieldsTableAnnotationComposer(
            $db: $db,
            $table: $db.partfields,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<T> taskPartfield<T extends Object>(
    Expression<T> Function($$TasksTableAnnotationComposer a) f,
  ) {
    final $$TasksTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.tasks,
      getReferencedColumn: (t) => t.partfield,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TasksTableAnnotationComposer(
            $db: $db,
            $table: $db.tasks,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> partfieldGuidanceGroupPartfield<T extends Object>(
    Expression<T> Function($$PartfieldGuidanceGroupsTableAnnotationComposer a)
    f,
  ) {
    final $$PartfieldGuidanceGroupsTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.partfieldGuidanceGroups,
          getReferencedColumn: (t) => t.partfield,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$PartfieldGuidanceGroupsTableAnnotationComposer(
                $db: $db,
                $table: $db.partfieldGuidanceGroups,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }

  Expression<T> partfieldPolygonPartfield<T extends Object>(
    Expression<T> Function($$PartfieldPolygonsTableAnnotationComposer a) f,
  ) {
    final $$PartfieldPolygonsTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.partfieldPolygons,
          getReferencedColumn: (t) => t.partfield,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$PartfieldPolygonsTableAnnotationComposer(
                $db: $db,
                $table: $db.partfieldPolygons,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }

  Expression<T> partfieldLineStringPartfield<T extends Object>(
    Expression<T> Function($$PartfieldLineStringsTableAnnotationComposer a) f,
  ) {
    final $$PartfieldLineStringsTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.partfieldLineStrings,
          getReferencedColumn: (t) => t.partfield,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$PartfieldLineStringsTableAnnotationComposer(
                $db: $db,
                $table: $db.partfieldLineStrings,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }

  Expression<T> partfieldPointPartfield<T extends Object>(
    Expression<T> Function($$PartfieldPointsTableAnnotationComposer a) f,
  ) {
    final $$PartfieldPointsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.partfieldPoints,
      getReferencedColumn: (t) => t.partfield,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PartfieldPointsTableAnnotationComposer(
            $db: $db,
            $table: $db.partfieldPoints,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$PartfieldsTableTableManager
    extends
        RootTableManager<
          _$Database,
          $PartfieldsTable,
          Partfield,
          $$PartfieldsTableFilterComposer,
          $$PartfieldsTableOrderingComposer,
          $$PartfieldsTableAnnotationComposer,
          $$PartfieldsTableCreateCompanionBuilder,
          $$PartfieldsTableUpdateCompanionBuilder,
          (Partfield, $$PartfieldsTableReferences),
          Partfield,
          PrefetchHooks Function({
            bool parentField,
            bool taskPartfield,
            bool partfieldGuidanceGroupPartfield,
            bool partfieldPolygonPartfield,
            bool partfieldLineStringPartfield,
            bool partfieldPointPartfield,
          })
        > {
  $$PartfieldsTableTableManager(_$Database db, $PartfieldsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$PartfieldsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$PartfieldsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$PartfieldsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime?> lastUpdatedAt = const Value.absent(),
                Value<int> id = const Value.absent(),
                Value<int?> parentField = const Value.absent(),
                Value<String?> name = const Value.absent(),
                Value<double> area = const Value.absent(),
              }) => PartfieldsCompanion(
                createdAt: createdAt,
                lastUpdatedAt: lastUpdatedAt,
                id: id,
                parentField: parentField,
                name: name,
                area: area,
              ),
          createCompanionCallback:
              ({
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime?> lastUpdatedAt = const Value.absent(),
                Value<int> id = const Value.absent(),
                Value<int?> parentField = const Value.absent(),
                Value<String?> name = const Value.absent(),
                required double area,
              }) => PartfieldsCompanion.insert(
                createdAt: createdAt,
                lastUpdatedAt: lastUpdatedAt,
                id: id,
                parentField: parentField,
                name: name,
                area: area,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$PartfieldsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({
                parentField = false,
                taskPartfield = false,
                partfieldGuidanceGroupPartfield = false,
                partfieldPolygonPartfield = false,
                partfieldLineStringPartfield = false,
                partfieldPointPartfield = false,
              }) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (taskPartfield) db.tasks,
                    if (partfieldGuidanceGroupPartfield)
                      db.partfieldGuidanceGroups,
                    if (partfieldPolygonPartfield) db.partfieldPolygons,
                    if (partfieldLineStringPartfield) db.partfieldLineStrings,
                    if (partfieldPointPartfield) db.partfieldPoints,
                  ],
                  addJoins:
                      <
                        T extends TableManagerState<
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic
                        >
                      >(state) {
                        if (parentField) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.parentField,
                                    referencedTable: $$PartfieldsTableReferences
                                        ._parentFieldTable(db),
                                    referencedColumn:
                                        $$PartfieldsTableReferences
                                            ._parentFieldTable(db)
                                            .id,
                                  )
                                  as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (taskPartfield)
                        await $_getPrefetchedData<
                          Partfield,
                          $PartfieldsTable,
                          Task
                        >(
                          currentTable: table,
                          referencedTable: $$PartfieldsTableReferences
                              ._taskPartfieldTable(db),
                          managerFromTypedResult: (p0) =>
                              $$PartfieldsTableReferences(
                                db,
                                table,
                                p0,
                              ).taskPartfield,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.partfield == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (partfieldGuidanceGroupPartfield)
                        await $_getPrefetchedData<
                          Partfield,
                          $PartfieldsTable,
                          PartfieldGuidanceGroup
                        >(
                          currentTable: table,
                          referencedTable: $$PartfieldsTableReferences
                              ._partfieldGuidanceGroupPartfieldTable(db),
                          managerFromTypedResult: (p0) =>
                              $$PartfieldsTableReferences(
                                db,
                                table,
                                p0,
                              ).partfieldGuidanceGroupPartfield,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.partfield == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (partfieldPolygonPartfield)
                        await $_getPrefetchedData<
                          Partfield,
                          $PartfieldsTable,
                          PartfieldPolygon
                        >(
                          currentTable: table,
                          referencedTable: $$PartfieldsTableReferences
                              ._partfieldPolygonPartfieldTable(db),
                          managerFromTypedResult: (p0) =>
                              $$PartfieldsTableReferences(
                                db,
                                table,
                                p0,
                              ).partfieldPolygonPartfield,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.partfield == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (partfieldLineStringPartfield)
                        await $_getPrefetchedData<
                          Partfield,
                          $PartfieldsTable,
                          PartfieldLineString
                        >(
                          currentTable: table,
                          referencedTable: $$PartfieldsTableReferences
                              ._partfieldLineStringPartfieldTable(db),
                          managerFromTypedResult: (p0) =>
                              $$PartfieldsTableReferences(
                                db,
                                table,
                                p0,
                              ).partfieldLineStringPartfield,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.partfield == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (partfieldPointPartfield)
                        await $_getPrefetchedData<
                          Partfield,
                          $PartfieldsTable,
                          PartfieldPoint
                        >(
                          currentTable: table,
                          referencedTable: $$PartfieldsTableReferences
                              ._partfieldPointPartfieldTable(db),
                          managerFromTypedResult: (p0) =>
                              $$PartfieldsTableReferences(
                                db,
                                table,
                                p0,
                              ).partfieldPointPartfield,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.partfield == item.id,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$PartfieldsTableProcessedTableManager =
    ProcessedTableManager<
      _$Database,
      $PartfieldsTable,
      Partfield,
      $$PartfieldsTableFilterComposer,
      $$PartfieldsTableOrderingComposer,
      $$PartfieldsTableAnnotationComposer,
      $$PartfieldsTableCreateCompanionBuilder,
      $$PartfieldsTableUpdateCompanionBuilder,
      (Partfield, $$PartfieldsTableReferences),
      Partfield,
      PrefetchHooks Function({
        bool parentField,
        bool taskPartfield,
        bool partfieldGuidanceGroupPartfield,
        bool partfieldPolygonPartfield,
        bool partfieldLineStringPartfield,
        bool partfieldPointPartfield,
      })
    >;
typedef $$TasksTableCreateCompanionBuilder =
    TasksCompanion Function({
      Value<DateTime> createdAt,
      Value<DateTime?> lastUpdatedAt,
      Value<int> id,
      required String name,
      Value<String?> note,
      Value<int?> partfield,
      Value<DateTime?> workStartedAt,
      Value<DateTime?> workEndedAt,
    });
typedef $$TasksTableUpdateCompanionBuilder =
    TasksCompanion Function({
      Value<DateTime> createdAt,
      Value<DateTime?> lastUpdatedAt,
      Value<int> id,
      Value<String> name,
      Value<String?> note,
      Value<int?> partfield,
      Value<DateTime?> workStartedAt,
      Value<DateTime?> workEndedAt,
    });

final class $$TasksTableReferences
    extends BaseReferences<_$Database, $TasksTable, Task> {
  $$TasksTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $PartfieldsTable _partfieldTable(_$Database db) => db.partfields
      .createAlias($_aliasNameGenerator(db.tasks.partfield, db.partfields.id));

  $$PartfieldsTableProcessedTableManager? get partfield {
    final $_column = $_itemColumn<int>('partfield');
    if ($_column == null) return null;
    final manager = $$PartfieldsTableTableManager(
      $_db,
      $_db.partfields,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_partfieldTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static MultiTypedResultKey<$ConnectionsTable, List<Connection>>
  _connectionTaskTable(_$Database db) => MultiTypedResultKey.fromTable(
    db.connections,
    aliasName: $_aliasNameGenerator(db.tasks.id, db.connections.task),
  );

  $$ConnectionsTableProcessedTableManager get connectionTask {
    final manager = $$ConnectionsTableTableManager(
      $_db,
      $_db.connections,
    ).filter((f) => f.task.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_connectionTaskTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<
    $GuidanceAllocationsTable,
    List<GuidanceAllocation>
  >
  _guidanceAllocationTaskTable(_$Database db) => MultiTypedResultKey.fromTable(
    db.guidanceAllocations,
    aliasName: $_aliasNameGenerator(db.tasks.id, db.guidanceAllocations.task),
  );

  $$GuidanceAllocationsTableProcessedTableManager get guidanceAllocationTask {
    final manager = $$GuidanceAllocationsTableTableManager(
      $_db,
      $_db.guidanceAllocations,
    ).filter((f) => f.task.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _guidanceAllocationTaskTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$TasksTableFilterComposer extends Composer<_$Database, $TasksTable> {
  $$TasksTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get lastUpdatedAt => $composableBuilder(
    column: $table.lastUpdatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get note => $composableBuilder(
    column: $table.note,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get workStartedAt => $composableBuilder(
    column: $table.workStartedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get workEndedAt => $composableBuilder(
    column: $table.workEndedAt,
    builder: (column) => ColumnFilters(column),
  );

  $$PartfieldsTableFilterComposer get partfield {
    final $$PartfieldsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.partfield,
      referencedTable: $db.partfields,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PartfieldsTableFilterComposer(
            $db: $db,
            $table: $db.partfields,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<bool> connectionTask(
    Expression<bool> Function($$ConnectionsTableFilterComposer f) f,
  ) {
    final $$ConnectionsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.connections,
      getReferencedColumn: (t) => t.task,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ConnectionsTableFilterComposer(
            $db: $db,
            $table: $db.connections,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> guidanceAllocationTask(
    Expression<bool> Function($$GuidanceAllocationsTableFilterComposer f) f,
  ) {
    final $$GuidanceAllocationsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.guidanceAllocations,
      getReferencedColumn: (t) => t.task,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$GuidanceAllocationsTableFilterComposer(
            $db: $db,
            $table: $db.guidanceAllocations,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$TasksTableOrderingComposer extends Composer<_$Database, $TasksTable> {
  $$TasksTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get lastUpdatedAt => $composableBuilder(
    column: $table.lastUpdatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get note => $composableBuilder(
    column: $table.note,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get workStartedAt => $composableBuilder(
    column: $table.workStartedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get workEndedAt => $composableBuilder(
    column: $table.workEndedAt,
    builder: (column) => ColumnOrderings(column),
  );

  $$PartfieldsTableOrderingComposer get partfield {
    final $$PartfieldsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.partfield,
      referencedTable: $db.partfields,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PartfieldsTableOrderingComposer(
            $db: $db,
            $table: $db.partfields,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$TasksTableAnnotationComposer extends Composer<_$Database, $TasksTable> {
  $$TasksTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get lastUpdatedAt => $composableBuilder(
    column: $table.lastUpdatedAt,
    builder: (column) => column,
  );

  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get note =>
      $composableBuilder(column: $table.note, builder: (column) => column);

  GeneratedColumn<DateTime> get workStartedAt => $composableBuilder(
    column: $table.workStartedAt,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get workEndedAt => $composableBuilder(
    column: $table.workEndedAt,
    builder: (column) => column,
  );

  $$PartfieldsTableAnnotationComposer get partfield {
    final $$PartfieldsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.partfield,
      referencedTable: $db.partfields,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PartfieldsTableAnnotationComposer(
            $db: $db,
            $table: $db.partfields,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<T> connectionTask<T extends Object>(
    Expression<T> Function($$ConnectionsTableAnnotationComposer a) f,
  ) {
    final $$ConnectionsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.connections,
      getReferencedColumn: (t) => t.task,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ConnectionsTableAnnotationComposer(
            $db: $db,
            $table: $db.connections,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> guidanceAllocationTask<T extends Object>(
    Expression<T> Function($$GuidanceAllocationsTableAnnotationComposer a) f,
  ) {
    final $$GuidanceAllocationsTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.guidanceAllocations,
          getReferencedColumn: (t) => t.task,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$GuidanceAllocationsTableAnnotationComposer(
                $db: $db,
                $table: $db.guidanceAllocations,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }
}

class $$TasksTableTableManager
    extends
        RootTableManager<
          _$Database,
          $TasksTable,
          Task,
          $$TasksTableFilterComposer,
          $$TasksTableOrderingComposer,
          $$TasksTableAnnotationComposer,
          $$TasksTableCreateCompanionBuilder,
          $$TasksTableUpdateCompanionBuilder,
          (Task, $$TasksTableReferences),
          Task,
          PrefetchHooks Function({
            bool partfield,
            bool connectionTask,
            bool guidanceAllocationTask,
          })
        > {
  $$TasksTableTableManager(_$Database db, $TasksTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$TasksTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$TasksTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$TasksTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime?> lastUpdatedAt = const Value.absent(),
                Value<int> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String?> note = const Value.absent(),
                Value<int?> partfield = const Value.absent(),
                Value<DateTime?> workStartedAt = const Value.absent(),
                Value<DateTime?> workEndedAt = const Value.absent(),
              }) => TasksCompanion(
                createdAt: createdAt,
                lastUpdatedAt: lastUpdatedAt,
                id: id,
                name: name,
                note: note,
                partfield: partfield,
                workStartedAt: workStartedAt,
                workEndedAt: workEndedAt,
              ),
          createCompanionCallback:
              ({
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime?> lastUpdatedAt = const Value.absent(),
                Value<int> id = const Value.absent(),
                required String name,
                Value<String?> note = const Value.absent(),
                Value<int?> partfield = const Value.absent(),
                Value<DateTime?> workStartedAt = const Value.absent(),
                Value<DateTime?> workEndedAt = const Value.absent(),
              }) => TasksCompanion.insert(
                createdAt: createdAt,
                lastUpdatedAt: lastUpdatedAt,
                id: id,
                name: name,
                note: note,
                partfield: partfield,
                workStartedAt: workStartedAt,
                workEndedAt: workEndedAt,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) =>
                    (e.readTable(table), $$TasksTableReferences(db, table, e)),
              )
              .toList(),
          prefetchHooksCallback:
              ({
                partfield = false,
                connectionTask = false,
                guidanceAllocationTask = false,
              }) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (connectionTask) db.connections,
                    if (guidanceAllocationTask) db.guidanceAllocations,
                  ],
                  addJoins:
                      <
                        T extends TableManagerState<
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic
                        >
                      >(state) {
                        if (partfield) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.partfield,
                                    referencedTable: $$TasksTableReferences
                                        ._partfieldTable(db),
                                    referencedColumn: $$TasksTableReferences
                                        ._partfieldTable(db)
                                        .id,
                                  )
                                  as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (connectionTask)
                        await $_getPrefetchedData<
                          Task,
                          $TasksTable,
                          Connection
                        >(
                          currentTable: table,
                          referencedTable: $$TasksTableReferences
                              ._connectionTaskTable(db),
                          managerFromTypedResult: (p0) =>
                              $$TasksTableReferences(
                                db,
                                table,
                                p0,
                              ).connectionTask,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.task == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (guidanceAllocationTask)
                        await $_getPrefetchedData<
                          Task,
                          $TasksTable,
                          GuidanceAllocation
                        >(
                          currentTable: table,
                          referencedTable: $$TasksTableReferences
                              ._guidanceAllocationTaskTable(db),
                          managerFromTypedResult: (p0) =>
                              $$TasksTableReferences(
                                db,
                                table,
                                p0,
                              ).guidanceAllocationTask,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.task == item.id,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$TasksTableProcessedTableManager =
    ProcessedTableManager<
      _$Database,
      $TasksTable,
      Task,
      $$TasksTableFilterComposer,
      $$TasksTableOrderingComposer,
      $$TasksTableAnnotationComposer,
      $$TasksTableCreateCompanionBuilder,
      $$TasksTableUpdateCompanionBuilder,
      (Task, $$TasksTableReferences),
      Task,
      PrefetchHooks Function({
        bool partfield,
        bool connectionTask,
        bool guidanceAllocationTask,
      })
    >;
typedef $$VehiclesTableCreateCompanionBuilder =
    VehiclesCompanion Function({
      Value<DateTime> createdAt,
      Value<DateTime?> lastUpdatedAt,
      Value<int> id,
      required VehicleType type,
      Value<String?> name,
      required VehicleGeometry geometry,
      Value<GnssAntennaConfig?> gnssAntennaConfig,
      Value<ImuConfig?> imuConfig,
      Value<WasConfig?> wasConfig,
      Value<SteeringHardwareConfig?> steeringHardwareConfig,
      Value<VehicleThresholds?> thresholds,
      Value<PathTrackingParameters?> pathTrackingParameters,
      Value<ManufacturerColors?> colorScheme,
    });
typedef $$VehiclesTableUpdateCompanionBuilder =
    VehiclesCompanion Function({
      Value<DateTime> createdAt,
      Value<DateTime?> lastUpdatedAt,
      Value<int> id,
      Value<VehicleType> type,
      Value<String?> name,
      Value<VehicleGeometry> geometry,
      Value<GnssAntennaConfig?> gnssAntennaConfig,
      Value<ImuConfig?> imuConfig,
      Value<WasConfig?> wasConfig,
      Value<SteeringHardwareConfig?> steeringHardwareConfig,
      Value<VehicleThresholds?> thresholds,
      Value<PathTrackingParameters?> pathTrackingParameters,
      Value<ManufacturerColors?> colorScheme,
    });

final class $$VehiclesTableReferences
    extends BaseReferences<_$Database, $VehiclesTable, Vehicle> {
  $$VehiclesTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$ConnectorsTable, List<Connector>>
  _connectorVehicleTable(_$Database db) => MultiTypedResultKey.fromTable(
    db.connectors,
    aliasName: $_aliasNameGenerator(db.vehicles.id, db.connectors.vehicle),
  );

  $$ConnectorsTableProcessedTableManager get connectorVehicle {
    final manager = $$ConnectorsTableTableManager(
      $_db,
      $_db.connectors,
    ).filter((f) => f.vehicle.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_connectorVehicleTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$VehiclesTableFilterComposer
    extends Composer<_$Database, $VehiclesTable> {
  $$VehiclesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get lastUpdatedAt => $composableBuilder(
    column: $table.lastUpdatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<VehicleType, VehicleType, String> get type =>
      $composableBuilder(
        column: $table.type,
        builder: (column) => ColumnWithTypeConverterFilters(column),
      );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<VehicleGeometry, VehicleGeometry, String>
  get geometry => $composableBuilder(
    column: $table.geometry,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );

  ColumnWithTypeConverterFilters<GnssAntennaConfig?, GnssAntennaConfig, String>
  get gnssAntennaConfig => $composableBuilder(
    column: $table.gnssAntennaConfig,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );

  ColumnWithTypeConverterFilters<ImuConfig?, ImuConfig, String> get imuConfig =>
      $composableBuilder(
        column: $table.imuConfig,
        builder: (column) => ColumnWithTypeConverterFilters(column),
      );

  ColumnWithTypeConverterFilters<WasConfig?, WasConfig, String> get wasConfig =>
      $composableBuilder(
        column: $table.wasConfig,
        builder: (column) => ColumnWithTypeConverterFilters(column),
      );

  ColumnWithTypeConverterFilters<
    SteeringHardwareConfig?,
    SteeringHardwareConfig,
    String
  >
  get steeringHardwareConfig => $composableBuilder(
    column: $table.steeringHardwareConfig,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );

  ColumnWithTypeConverterFilters<VehicleThresholds?, VehicleThresholds, String>
  get thresholds => $composableBuilder(
    column: $table.thresholds,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );

  ColumnWithTypeConverterFilters<
    PathTrackingParameters?,
    PathTrackingParameters,
    String
  >
  get pathTrackingParameters => $composableBuilder(
    column: $table.pathTrackingParameters,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );

  ColumnWithTypeConverterFilters<
    ManufacturerColors?,
    ManufacturerColors,
    String
  >
  get colorScheme => $composableBuilder(
    column: $table.colorScheme,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );

  Expression<bool> connectorVehicle(
    Expression<bool> Function($$ConnectorsTableFilterComposer f) f,
  ) {
    final $$ConnectorsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.connectors,
      getReferencedColumn: (t) => t.vehicle,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ConnectorsTableFilterComposer(
            $db: $db,
            $table: $db.connectors,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$VehiclesTableOrderingComposer
    extends Composer<_$Database, $VehiclesTable> {
  $$VehiclesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get lastUpdatedAt => $composableBuilder(
    column: $table.lastUpdatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get type => $composableBuilder(
    column: $table.type,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get geometry => $composableBuilder(
    column: $table.geometry,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get gnssAntennaConfig => $composableBuilder(
    column: $table.gnssAntennaConfig,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get imuConfig => $composableBuilder(
    column: $table.imuConfig,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get wasConfig => $composableBuilder(
    column: $table.wasConfig,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get steeringHardwareConfig => $composableBuilder(
    column: $table.steeringHardwareConfig,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get thresholds => $composableBuilder(
    column: $table.thresholds,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get pathTrackingParameters => $composableBuilder(
    column: $table.pathTrackingParameters,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get colorScheme => $composableBuilder(
    column: $table.colorScheme,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$VehiclesTableAnnotationComposer
    extends Composer<_$Database, $VehiclesTable> {
  $$VehiclesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get lastUpdatedAt => $composableBuilder(
    column: $table.lastUpdatedAt,
    builder: (column) => column,
  );

  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumnWithTypeConverter<VehicleType, String> get type =>
      $composableBuilder(column: $table.type, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumnWithTypeConverter<VehicleGeometry, String> get geometry =>
      $composableBuilder(column: $table.geometry, builder: (column) => column);

  GeneratedColumnWithTypeConverter<GnssAntennaConfig?, String>
  get gnssAntennaConfig => $composableBuilder(
    column: $table.gnssAntennaConfig,
    builder: (column) => column,
  );

  GeneratedColumnWithTypeConverter<ImuConfig?, String> get imuConfig =>
      $composableBuilder(column: $table.imuConfig, builder: (column) => column);

  GeneratedColumnWithTypeConverter<WasConfig?, String> get wasConfig =>
      $composableBuilder(column: $table.wasConfig, builder: (column) => column);

  GeneratedColumnWithTypeConverter<SteeringHardwareConfig?, String>
  get steeringHardwareConfig => $composableBuilder(
    column: $table.steeringHardwareConfig,
    builder: (column) => column,
  );

  GeneratedColumnWithTypeConverter<VehicleThresholds?, String> get thresholds =>
      $composableBuilder(
        column: $table.thresholds,
        builder: (column) => column,
      );

  GeneratedColumnWithTypeConverter<PathTrackingParameters?, String>
  get pathTrackingParameters => $composableBuilder(
    column: $table.pathTrackingParameters,
    builder: (column) => column,
  );

  GeneratedColumnWithTypeConverter<ManufacturerColors?, String>
  get colorScheme => $composableBuilder(
    column: $table.colorScheme,
    builder: (column) => column,
  );

  Expression<T> connectorVehicle<T extends Object>(
    Expression<T> Function($$ConnectorsTableAnnotationComposer a) f,
  ) {
    final $$ConnectorsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.connectors,
      getReferencedColumn: (t) => t.vehicle,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ConnectorsTableAnnotationComposer(
            $db: $db,
            $table: $db.connectors,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$VehiclesTableTableManager
    extends
        RootTableManager<
          _$Database,
          $VehiclesTable,
          Vehicle,
          $$VehiclesTableFilterComposer,
          $$VehiclesTableOrderingComposer,
          $$VehiclesTableAnnotationComposer,
          $$VehiclesTableCreateCompanionBuilder,
          $$VehiclesTableUpdateCompanionBuilder,
          (Vehicle, $$VehiclesTableReferences),
          Vehicle,
          PrefetchHooks Function({bool connectorVehicle})
        > {
  $$VehiclesTableTableManager(_$Database db, $VehiclesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$VehiclesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$VehiclesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$VehiclesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime?> lastUpdatedAt = const Value.absent(),
                Value<int> id = const Value.absent(),
                Value<VehicleType> type = const Value.absent(),
                Value<String?> name = const Value.absent(),
                Value<VehicleGeometry> geometry = const Value.absent(),
                Value<GnssAntennaConfig?> gnssAntennaConfig =
                    const Value.absent(),
                Value<ImuConfig?> imuConfig = const Value.absent(),
                Value<WasConfig?> wasConfig = const Value.absent(),
                Value<SteeringHardwareConfig?> steeringHardwareConfig =
                    const Value.absent(),
                Value<VehicleThresholds?> thresholds = const Value.absent(),
                Value<PathTrackingParameters?> pathTrackingParameters =
                    const Value.absent(),
                Value<ManufacturerColors?> colorScheme = const Value.absent(),
              }) => VehiclesCompanion(
                createdAt: createdAt,
                lastUpdatedAt: lastUpdatedAt,
                id: id,
                type: type,
                name: name,
                geometry: geometry,
                gnssAntennaConfig: gnssAntennaConfig,
                imuConfig: imuConfig,
                wasConfig: wasConfig,
                steeringHardwareConfig: steeringHardwareConfig,
                thresholds: thresholds,
                pathTrackingParameters: pathTrackingParameters,
                colorScheme: colorScheme,
              ),
          createCompanionCallback:
              ({
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime?> lastUpdatedAt = const Value.absent(),
                Value<int> id = const Value.absent(),
                required VehicleType type,
                Value<String?> name = const Value.absent(),
                required VehicleGeometry geometry,
                Value<GnssAntennaConfig?> gnssAntennaConfig =
                    const Value.absent(),
                Value<ImuConfig?> imuConfig = const Value.absent(),
                Value<WasConfig?> wasConfig = const Value.absent(),
                Value<SteeringHardwareConfig?> steeringHardwareConfig =
                    const Value.absent(),
                Value<VehicleThresholds?> thresholds = const Value.absent(),
                Value<PathTrackingParameters?> pathTrackingParameters =
                    const Value.absent(),
                Value<ManufacturerColors?> colorScheme = const Value.absent(),
              }) => VehiclesCompanion.insert(
                createdAt: createdAt,
                lastUpdatedAt: lastUpdatedAt,
                id: id,
                type: type,
                name: name,
                geometry: geometry,
                gnssAntennaConfig: gnssAntennaConfig,
                imuConfig: imuConfig,
                wasConfig: wasConfig,
                steeringHardwareConfig: steeringHardwareConfig,
                thresholds: thresholds,
                pathTrackingParameters: pathTrackingParameters,
                colorScheme: colorScheme,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$VehiclesTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({connectorVehicle = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (connectorVehicle) db.connectors],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (connectorVehicle)
                    await $_getPrefetchedData<
                      Vehicle,
                      $VehiclesTable,
                      Connector
                    >(
                      currentTable: table,
                      referencedTable: $$VehiclesTableReferences
                          ._connectorVehicleTable(db),
                      managerFromTypedResult: (p0) => $$VehiclesTableReferences(
                        db,
                        table,
                        p0,
                      ).connectorVehicle,
                      referencedItemsForCurrentItem: (item, referencedItems) =>
                          referencedItems.where((e) => e.vehicle == item.id),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$VehiclesTableProcessedTableManager =
    ProcessedTableManager<
      _$Database,
      $VehiclesTable,
      Vehicle,
      $$VehiclesTableFilterComposer,
      $$VehiclesTableOrderingComposer,
      $$VehiclesTableAnnotationComposer,
      $$VehiclesTableCreateCompanionBuilder,
      $$VehiclesTableUpdateCompanionBuilder,
      (Vehicle, $$VehiclesTableReferences),
      Vehicle,
      PrefetchHooks Function({bool connectorVehicle})
    >;
typedef $$ImplementsTableCreateCompanionBuilder =
    ImplementsCompanion Function({
      Value<DateTime> createdAt,
      Value<DateTime?> lastUpdatedAt,
      Value<int> id,
      Value<String?> name,
    });
typedef $$ImplementsTableUpdateCompanionBuilder =
    ImplementsCompanion Function({
      Value<DateTime> createdAt,
      Value<DateTime?> lastUpdatedAt,
      Value<int> id,
      Value<String?> name,
    });

final class $$ImplementsTableReferences
    extends BaseReferences<_$Database, $ImplementsTable, Equipment> {
  $$ImplementsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$ConnectorsTable, List<Connector>>
  _connectorImplementTable(_$Database db) => MultiTypedResultKey.fromTable(
    db.connectors,
    aliasName: $_aliasNameGenerator(db.implements.id, db.connectors.implement),
  );

  $$ConnectorsTableProcessedTableManager get connectorImplement {
    final manager = $$ConnectorsTableTableManager(
      $_db,
      $_db.connectors,
    ).filter((f) => f.implement.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_connectorImplementTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$SectionsTable, List<Section>>
  _sectionImplementTable(_$Database db) => MultiTypedResultKey.fromTable(
    db.sections,
    aliasName: $_aliasNameGenerator(db.implements.id, db.sections.implement),
  );

  $$SectionsTableProcessedTableManager get sectionImplement {
    final manager = $$SectionsTableTableManager(
      $_db,
      $_db.sections,
    ).filter((f) => f.implement.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_sectionImplementTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$ImplementsTableFilterComposer
    extends Composer<_$Database, $ImplementsTable> {
  $$ImplementsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get lastUpdatedAt => $composableBuilder(
    column: $table.lastUpdatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> connectorImplement(
    Expression<bool> Function($$ConnectorsTableFilterComposer f) f,
  ) {
    final $$ConnectorsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.connectors,
      getReferencedColumn: (t) => t.implement,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ConnectorsTableFilterComposer(
            $db: $db,
            $table: $db.connectors,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> sectionImplement(
    Expression<bool> Function($$SectionsTableFilterComposer f) f,
  ) {
    final $$SectionsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.sections,
      getReferencedColumn: (t) => t.implement,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SectionsTableFilterComposer(
            $db: $db,
            $table: $db.sections,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$ImplementsTableOrderingComposer
    extends Composer<_$Database, $ImplementsTable> {
  $$ImplementsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get lastUpdatedAt => $composableBuilder(
    column: $table.lastUpdatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$ImplementsTableAnnotationComposer
    extends Composer<_$Database, $ImplementsTable> {
  $$ImplementsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get lastUpdatedAt => $composableBuilder(
    column: $table.lastUpdatedAt,
    builder: (column) => column,
  );

  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  Expression<T> connectorImplement<T extends Object>(
    Expression<T> Function($$ConnectorsTableAnnotationComposer a) f,
  ) {
    final $$ConnectorsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.connectors,
      getReferencedColumn: (t) => t.implement,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ConnectorsTableAnnotationComposer(
            $db: $db,
            $table: $db.connectors,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> sectionImplement<T extends Object>(
    Expression<T> Function($$SectionsTableAnnotationComposer a) f,
  ) {
    final $$SectionsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.sections,
      getReferencedColumn: (t) => t.implement,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SectionsTableAnnotationComposer(
            $db: $db,
            $table: $db.sections,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$ImplementsTableTableManager
    extends
        RootTableManager<
          _$Database,
          $ImplementsTable,
          Equipment,
          $$ImplementsTableFilterComposer,
          $$ImplementsTableOrderingComposer,
          $$ImplementsTableAnnotationComposer,
          $$ImplementsTableCreateCompanionBuilder,
          $$ImplementsTableUpdateCompanionBuilder,
          (Equipment, $$ImplementsTableReferences),
          Equipment,
          PrefetchHooks Function({
            bool connectorImplement,
            bool sectionImplement,
          })
        > {
  $$ImplementsTableTableManager(_$Database db, $ImplementsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ImplementsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ImplementsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ImplementsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime?> lastUpdatedAt = const Value.absent(),
                Value<int> id = const Value.absent(),
                Value<String?> name = const Value.absent(),
              }) => ImplementsCompanion(
                createdAt: createdAt,
                lastUpdatedAt: lastUpdatedAt,
                id: id,
                name: name,
              ),
          createCompanionCallback:
              ({
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime?> lastUpdatedAt = const Value.absent(),
                Value<int> id = const Value.absent(),
                Value<String?> name = const Value.absent(),
              }) => ImplementsCompanion.insert(
                createdAt: createdAt,
                lastUpdatedAt: lastUpdatedAt,
                id: id,
                name: name,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$ImplementsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({connectorImplement = false, sectionImplement = false}) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (connectorImplement) db.connectors,
                    if (sectionImplement) db.sections,
                  ],
                  addJoins: null,
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (connectorImplement)
                        await $_getPrefetchedData<
                          Equipment,
                          $ImplementsTable,
                          Connector
                        >(
                          currentTable: table,
                          referencedTable: $$ImplementsTableReferences
                              ._connectorImplementTable(db),
                          managerFromTypedResult: (p0) =>
                              $$ImplementsTableReferences(
                                db,
                                table,
                                p0,
                              ).connectorImplement,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.implement == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (sectionImplement)
                        await $_getPrefetchedData<
                          Equipment,
                          $ImplementsTable,
                          Section
                        >(
                          currentTable: table,
                          referencedTable: $$ImplementsTableReferences
                              ._sectionImplementTable(db),
                          managerFromTypedResult: (p0) =>
                              $$ImplementsTableReferences(
                                db,
                                table,
                                p0,
                              ).sectionImplement,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.implement == item.id,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$ImplementsTableProcessedTableManager =
    ProcessedTableManager<
      _$Database,
      $ImplementsTable,
      Equipment,
      $$ImplementsTableFilterComposer,
      $$ImplementsTableOrderingComposer,
      $$ImplementsTableAnnotationComposer,
      $$ImplementsTableCreateCompanionBuilder,
      $$ImplementsTableUpdateCompanionBuilder,
      (Equipment, $$ImplementsTableReferences),
      Equipment,
      PrefetchHooks Function({bool connectorImplement, bool sectionImplement})
    >;
typedef $$ConnectorsTableCreateCompanionBuilder =
    ConnectorsCompanion Function({
      Value<DateTime> createdAt,
      Value<DateTime?> lastUpdatedAt,
      Value<int> id,
      Value<int?> vehicle,
      Value<int?> implement,
      required ConnectorType type,
      required ConnectorRelation relation,
      required double longitudinalOffsetFromRef,
      required double lateralOffsetFromRef,
      Value<double> verticalOffsetFromRef,
      required double angle,
    });
typedef $$ConnectorsTableUpdateCompanionBuilder =
    ConnectorsCompanion Function({
      Value<DateTime> createdAt,
      Value<DateTime?> lastUpdatedAt,
      Value<int> id,
      Value<int?> vehicle,
      Value<int?> implement,
      Value<ConnectorType> type,
      Value<ConnectorRelation> relation,
      Value<double> longitudinalOffsetFromRef,
      Value<double> lateralOffsetFromRef,
      Value<double> verticalOffsetFromRef,
      Value<double> angle,
    });

final class $$ConnectorsTableReferences
    extends BaseReferences<_$Database, $ConnectorsTable, Connector> {
  $$ConnectorsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $VehiclesTable _vehicleTable(_$Database db) => db.vehicles.createAlias(
    $_aliasNameGenerator(db.connectors.vehicle, db.vehicles.id),
  );

  $$VehiclesTableProcessedTableManager? get vehicle {
    final $_column = $_itemColumn<int>('vehicle');
    if ($_column == null) return null;
    final manager = $$VehiclesTableTableManager(
      $_db,
      $_db.vehicles,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_vehicleTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $ImplementsTable _implementTable(_$Database db) =>
      db.implements.createAlias(
        $_aliasNameGenerator(db.connectors.implement, db.implements.id),
      );

  $$ImplementsTableProcessedTableManager? get implement {
    final $_column = $_itemColumn<int>('implement');
    if ($_column == null) return null;
    final manager = $$ImplementsTableTableManager(
      $_db,
      $_db.implements,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_implementTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static MultiTypedResultKey<$ConnectionsTable, List<Connection>>
  _connectionParentTable(_$Database db) => MultiTypedResultKey.fromTable(
    db.connections,
    aliasName: $_aliasNameGenerator(
      db.connectors.id,
      db.connections.parentConnector,
    ),
  );

  $$ConnectionsTableProcessedTableManager get connectionParent {
    final manager = $$ConnectionsTableTableManager(
      $_db,
      $_db.connections,
    ).filter((f) => f.parentConnector.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_connectionParentTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$ConnectionsTable, List<Connection>>
  _connectionChildTable(_$Database db) => MultiTypedResultKey.fromTable(
    db.connections,
    aliasName: $_aliasNameGenerator(
      db.connectors.id,
      db.connections.childConnector,
    ),
  );

  $$ConnectionsTableProcessedTableManager get connectionChild {
    final manager = $$ConnectionsTableTableManager(
      $_db,
      $_db.connections,
    ).filter((f) => f.childConnector.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_connectionChildTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$ConnectorsTableFilterComposer
    extends Composer<_$Database, $ConnectorsTable> {
  $$ConnectorsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get lastUpdatedAt => $composableBuilder(
    column: $table.lastUpdatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<ConnectorType, ConnectorType, String>
  get type => $composableBuilder(
    column: $table.type,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );

  ColumnWithTypeConverterFilters<ConnectorRelation, ConnectorRelation, String>
  get relation => $composableBuilder(
    column: $table.relation,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );

  ColumnFilters<double> get longitudinalOffsetFromRef => $composableBuilder(
    column: $table.longitudinalOffsetFromRef,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get lateralOffsetFromRef => $composableBuilder(
    column: $table.lateralOffsetFromRef,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get verticalOffsetFromRef => $composableBuilder(
    column: $table.verticalOffsetFromRef,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get angle => $composableBuilder(
    column: $table.angle,
    builder: (column) => ColumnFilters(column),
  );

  $$VehiclesTableFilterComposer get vehicle {
    final $$VehiclesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.vehicle,
      referencedTable: $db.vehicles,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$VehiclesTableFilterComposer(
            $db: $db,
            $table: $db.vehicles,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$ImplementsTableFilterComposer get implement {
    final $$ImplementsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.implement,
      referencedTable: $db.implements,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ImplementsTableFilterComposer(
            $db: $db,
            $table: $db.implements,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<bool> connectionParent(
    Expression<bool> Function($$ConnectionsTableFilterComposer f) f,
  ) {
    final $$ConnectionsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.connections,
      getReferencedColumn: (t) => t.parentConnector,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ConnectionsTableFilterComposer(
            $db: $db,
            $table: $db.connections,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> connectionChild(
    Expression<bool> Function($$ConnectionsTableFilterComposer f) f,
  ) {
    final $$ConnectionsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.connections,
      getReferencedColumn: (t) => t.childConnector,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ConnectionsTableFilterComposer(
            $db: $db,
            $table: $db.connections,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$ConnectorsTableOrderingComposer
    extends Composer<_$Database, $ConnectorsTable> {
  $$ConnectorsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get lastUpdatedAt => $composableBuilder(
    column: $table.lastUpdatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get type => $composableBuilder(
    column: $table.type,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get relation => $composableBuilder(
    column: $table.relation,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get longitudinalOffsetFromRef => $composableBuilder(
    column: $table.longitudinalOffsetFromRef,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get lateralOffsetFromRef => $composableBuilder(
    column: $table.lateralOffsetFromRef,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get verticalOffsetFromRef => $composableBuilder(
    column: $table.verticalOffsetFromRef,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get angle => $composableBuilder(
    column: $table.angle,
    builder: (column) => ColumnOrderings(column),
  );

  $$VehiclesTableOrderingComposer get vehicle {
    final $$VehiclesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.vehicle,
      referencedTable: $db.vehicles,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$VehiclesTableOrderingComposer(
            $db: $db,
            $table: $db.vehicles,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$ImplementsTableOrderingComposer get implement {
    final $$ImplementsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.implement,
      referencedTable: $db.implements,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ImplementsTableOrderingComposer(
            $db: $db,
            $table: $db.implements,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ConnectorsTableAnnotationComposer
    extends Composer<_$Database, $ConnectorsTable> {
  $$ConnectorsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get lastUpdatedAt => $composableBuilder(
    column: $table.lastUpdatedAt,
    builder: (column) => column,
  );

  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumnWithTypeConverter<ConnectorType, String> get type =>
      $composableBuilder(column: $table.type, builder: (column) => column);

  GeneratedColumnWithTypeConverter<ConnectorRelation, String> get relation =>
      $composableBuilder(column: $table.relation, builder: (column) => column);

  GeneratedColumn<double> get longitudinalOffsetFromRef => $composableBuilder(
    column: $table.longitudinalOffsetFromRef,
    builder: (column) => column,
  );

  GeneratedColumn<double> get lateralOffsetFromRef => $composableBuilder(
    column: $table.lateralOffsetFromRef,
    builder: (column) => column,
  );

  GeneratedColumn<double> get verticalOffsetFromRef => $composableBuilder(
    column: $table.verticalOffsetFromRef,
    builder: (column) => column,
  );

  GeneratedColumn<double> get angle =>
      $composableBuilder(column: $table.angle, builder: (column) => column);

  $$VehiclesTableAnnotationComposer get vehicle {
    final $$VehiclesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.vehicle,
      referencedTable: $db.vehicles,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$VehiclesTableAnnotationComposer(
            $db: $db,
            $table: $db.vehicles,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$ImplementsTableAnnotationComposer get implement {
    final $$ImplementsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.implement,
      referencedTable: $db.implements,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ImplementsTableAnnotationComposer(
            $db: $db,
            $table: $db.implements,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<T> connectionParent<T extends Object>(
    Expression<T> Function($$ConnectionsTableAnnotationComposer a) f,
  ) {
    final $$ConnectionsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.connections,
      getReferencedColumn: (t) => t.parentConnector,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ConnectionsTableAnnotationComposer(
            $db: $db,
            $table: $db.connections,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> connectionChild<T extends Object>(
    Expression<T> Function($$ConnectionsTableAnnotationComposer a) f,
  ) {
    final $$ConnectionsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.connections,
      getReferencedColumn: (t) => t.childConnector,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ConnectionsTableAnnotationComposer(
            $db: $db,
            $table: $db.connections,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$ConnectorsTableTableManager
    extends
        RootTableManager<
          _$Database,
          $ConnectorsTable,
          Connector,
          $$ConnectorsTableFilterComposer,
          $$ConnectorsTableOrderingComposer,
          $$ConnectorsTableAnnotationComposer,
          $$ConnectorsTableCreateCompanionBuilder,
          $$ConnectorsTableUpdateCompanionBuilder,
          (Connector, $$ConnectorsTableReferences),
          Connector,
          PrefetchHooks Function({
            bool vehicle,
            bool implement,
            bool connectionParent,
            bool connectionChild,
          })
        > {
  $$ConnectorsTableTableManager(_$Database db, $ConnectorsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ConnectorsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ConnectorsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ConnectorsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime?> lastUpdatedAt = const Value.absent(),
                Value<int> id = const Value.absent(),
                Value<int?> vehicle = const Value.absent(),
                Value<int?> implement = const Value.absent(),
                Value<ConnectorType> type = const Value.absent(),
                Value<ConnectorRelation> relation = const Value.absent(),
                Value<double> longitudinalOffsetFromRef = const Value.absent(),
                Value<double> lateralOffsetFromRef = const Value.absent(),
                Value<double> verticalOffsetFromRef = const Value.absent(),
                Value<double> angle = const Value.absent(),
              }) => ConnectorsCompanion(
                createdAt: createdAt,
                lastUpdatedAt: lastUpdatedAt,
                id: id,
                vehicle: vehicle,
                implement: implement,
                type: type,
                relation: relation,
                longitudinalOffsetFromRef: longitudinalOffsetFromRef,
                lateralOffsetFromRef: lateralOffsetFromRef,
                verticalOffsetFromRef: verticalOffsetFromRef,
                angle: angle,
              ),
          createCompanionCallback:
              ({
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime?> lastUpdatedAt = const Value.absent(),
                Value<int> id = const Value.absent(),
                Value<int?> vehicle = const Value.absent(),
                Value<int?> implement = const Value.absent(),
                required ConnectorType type,
                required ConnectorRelation relation,
                required double longitudinalOffsetFromRef,
                required double lateralOffsetFromRef,
                Value<double> verticalOffsetFromRef = const Value.absent(),
                required double angle,
              }) => ConnectorsCompanion.insert(
                createdAt: createdAt,
                lastUpdatedAt: lastUpdatedAt,
                id: id,
                vehicle: vehicle,
                implement: implement,
                type: type,
                relation: relation,
                longitudinalOffsetFromRef: longitudinalOffsetFromRef,
                lateralOffsetFromRef: lateralOffsetFromRef,
                verticalOffsetFromRef: verticalOffsetFromRef,
                angle: angle,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$ConnectorsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({
                vehicle = false,
                implement = false,
                connectionParent = false,
                connectionChild = false,
              }) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (connectionParent) db.connections,
                    if (connectionChild) db.connections,
                  ],
                  addJoins:
                      <
                        T extends TableManagerState<
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic
                        >
                      >(state) {
                        if (vehicle) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.vehicle,
                                    referencedTable: $$ConnectorsTableReferences
                                        ._vehicleTable(db),
                                    referencedColumn:
                                        $$ConnectorsTableReferences
                                            ._vehicleTable(db)
                                            .id,
                                  )
                                  as T;
                        }
                        if (implement) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.implement,
                                    referencedTable: $$ConnectorsTableReferences
                                        ._implementTable(db),
                                    referencedColumn:
                                        $$ConnectorsTableReferences
                                            ._implementTable(db)
                                            .id,
                                  )
                                  as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (connectionParent)
                        await $_getPrefetchedData<
                          Connector,
                          $ConnectorsTable,
                          Connection
                        >(
                          currentTable: table,
                          referencedTable: $$ConnectorsTableReferences
                              ._connectionParentTable(db),
                          managerFromTypedResult: (p0) =>
                              $$ConnectorsTableReferences(
                                db,
                                table,
                                p0,
                              ).connectionParent,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.parentConnector == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (connectionChild)
                        await $_getPrefetchedData<
                          Connector,
                          $ConnectorsTable,
                          Connection
                        >(
                          currentTable: table,
                          referencedTable: $$ConnectorsTableReferences
                              ._connectionChildTable(db),
                          managerFromTypedResult: (p0) =>
                              $$ConnectorsTableReferences(
                                db,
                                table,
                                p0,
                              ).connectionChild,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.childConnector == item.id,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$ConnectorsTableProcessedTableManager =
    ProcessedTableManager<
      _$Database,
      $ConnectorsTable,
      Connector,
      $$ConnectorsTableFilterComposer,
      $$ConnectorsTableOrderingComposer,
      $$ConnectorsTableAnnotationComposer,
      $$ConnectorsTableCreateCompanionBuilder,
      $$ConnectorsTableUpdateCompanionBuilder,
      (Connector, $$ConnectorsTableReferences),
      Connector,
      PrefetchHooks Function({
        bool vehicle,
        bool implement,
        bool connectionParent,
        bool connectionChild,
      })
    >;
typedef $$ConnectionsTableCreateCompanionBuilder =
    ConnectionsCompanion Function({
      required int task,
      required int parentConnector,
      required int childConnector,
    });
typedef $$ConnectionsTableUpdateCompanionBuilder =
    ConnectionsCompanion Function({
      Value<int> task,
      Value<int> parentConnector,
      Value<int> childConnector,
    });

final class $$ConnectionsTableReferences
    extends BaseReferences<_$Database, $ConnectionsTable, Connection> {
  $$ConnectionsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $TasksTable _taskTable(_$Database db) => db.tasks.createAlias(
    $_aliasNameGenerator(db.connections.task, db.tasks.id),
  );

  $$TasksTableProcessedTableManager get task {
    final $_column = $_itemColumn<int>('task')!;

    final manager = $$TasksTableTableManager(
      $_db,
      $_db.tasks,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_taskTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $ConnectorsTable _parentConnectorTable(_$Database db) =>
      db.connectors.createAlias(
        $_aliasNameGenerator(db.connections.parentConnector, db.connectors.id),
      );

  $$ConnectorsTableProcessedTableManager get parentConnector {
    final $_column = $_itemColumn<int>('parent_connector')!;

    final manager = $$ConnectorsTableTableManager(
      $_db,
      $_db.connectors,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_parentConnectorTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $ConnectorsTable _childConnectorTable(_$Database db) =>
      db.connectors.createAlias(
        $_aliasNameGenerator(db.connections.childConnector, db.connectors.id),
      );

  $$ConnectorsTableProcessedTableManager get childConnector {
    final $_column = $_itemColumn<int>('child_connector')!;

    final manager = $$ConnectorsTableTableManager(
      $_db,
      $_db.connectors,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_childConnectorTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$ConnectionsTableFilterComposer
    extends Composer<_$Database, $ConnectionsTable> {
  $$ConnectionsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  $$TasksTableFilterComposer get task {
    final $$TasksTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.task,
      referencedTable: $db.tasks,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TasksTableFilterComposer(
            $db: $db,
            $table: $db.tasks,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$ConnectorsTableFilterComposer get parentConnector {
    final $$ConnectorsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.parentConnector,
      referencedTable: $db.connectors,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ConnectorsTableFilterComposer(
            $db: $db,
            $table: $db.connectors,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$ConnectorsTableFilterComposer get childConnector {
    final $$ConnectorsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.childConnector,
      referencedTable: $db.connectors,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ConnectorsTableFilterComposer(
            $db: $db,
            $table: $db.connectors,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ConnectionsTableOrderingComposer
    extends Composer<_$Database, $ConnectionsTable> {
  $$ConnectionsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  $$TasksTableOrderingComposer get task {
    final $$TasksTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.task,
      referencedTable: $db.tasks,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TasksTableOrderingComposer(
            $db: $db,
            $table: $db.tasks,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$ConnectorsTableOrderingComposer get parentConnector {
    final $$ConnectorsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.parentConnector,
      referencedTable: $db.connectors,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ConnectorsTableOrderingComposer(
            $db: $db,
            $table: $db.connectors,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$ConnectorsTableOrderingComposer get childConnector {
    final $$ConnectorsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.childConnector,
      referencedTable: $db.connectors,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ConnectorsTableOrderingComposer(
            $db: $db,
            $table: $db.connectors,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ConnectionsTableAnnotationComposer
    extends Composer<_$Database, $ConnectionsTable> {
  $$ConnectionsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  $$TasksTableAnnotationComposer get task {
    final $$TasksTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.task,
      referencedTable: $db.tasks,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TasksTableAnnotationComposer(
            $db: $db,
            $table: $db.tasks,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$ConnectorsTableAnnotationComposer get parentConnector {
    final $$ConnectorsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.parentConnector,
      referencedTable: $db.connectors,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ConnectorsTableAnnotationComposer(
            $db: $db,
            $table: $db.connectors,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$ConnectorsTableAnnotationComposer get childConnector {
    final $$ConnectorsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.childConnector,
      referencedTable: $db.connectors,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ConnectorsTableAnnotationComposer(
            $db: $db,
            $table: $db.connectors,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ConnectionsTableTableManager
    extends
        RootTableManager<
          _$Database,
          $ConnectionsTable,
          Connection,
          $$ConnectionsTableFilterComposer,
          $$ConnectionsTableOrderingComposer,
          $$ConnectionsTableAnnotationComposer,
          $$ConnectionsTableCreateCompanionBuilder,
          $$ConnectionsTableUpdateCompanionBuilder,
          (Connection, $$ConnectionsTableReferences),
          Connection,
          PrefetchHooks Function({
            bool task,
            bool parentConnector,
            bool childConnector,
          })
        > {
  $$ConnectionsTableTableManager(_$Database db, $ConnectionsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ConnectionsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ConnectionsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ConnectionsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> task = const Value.absent(),
                Value<int> parentConnector = const Value.absent(),
                Value<int> childConnector = const Value.absent(),
              }) => ConnectionsCompanion(
                task: task,
                parentConnector: parentConnector,
                childConnector: childConnector,
              ),
          createCompanionCallback:
              ({
                required int task,
                required int parentConnector,
                required int childConnector,
              }) => ConnectionsCompanion.insert(
                task: task,
                parentConnector: parentConnector,
                childConnector: childConnector,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$ConnectionsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({
                task = false,
                parentConnector = false,
                childConnector = false,
              }) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [],
                  addJoins:
                      <
                        T extends TableManagerState<
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic
                        >
                      >(state) {
                        if (task) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.task,
                                    referencedTable:
                                        $$ConnectionsTableReferences._taskTable(
                                          db,
                                        ),
                                    referencedColumn:
                                        $$ConnectionsTableReferences
                                            ._taskTable(db)
                                            .id,
                                  )
                                  as T;
                        }
                        if (parentConnector) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.parentConnector,
                                    referencedTable:
                                        $$ConnectionsTableReferences
                                            ._parentConnectorTable(db),
                                    referencedColumn:
                                        $$ConnectionsTableReferences
                                            ._parentConnectorTable(db)
                                            .id,
                                  )
                                  as T;
                        }
                        if (childConnector) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.childConnector,
                                    referencedTable:
                                        $$ConnectionsTableReferences
                                            ._childConnectorTable(db),
                                    referencedColumn:
                                        $$ConnectionsTableReferences
                                            ._childConnectorTable(db)
                                            .id,
                                  )
                                  as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [];
                  },
                );
              },
        ),
      );
}

typedef $$ConnectionsTableProcessedTableManager =
    ProcessedTableManager<
      _$Database,
      $ConnectionsTable,
      Connection,
      $$ConnectionsTableFilterComposer,
      $$ConnectionsTableOrderingComposer,
      $$ConnectionsTableAnnotationComposer,
      $$ConnectionsTableCreateCompanionBuilder,
      $$ConnectionsTableUpdateCompanionBuilder,
      (Connection, $$ConnectionsTableReferences),
      Connection,
      PrefetchHooks Function({
        bool task,
        bool parentConnector,
        bool childConnector,
      })
    >;
typedef $$PolygonsTableCreateCompanionBuilder =
    PolygonsCompanion Function({
      Value<DateTime> createdAt,
      Value<DateTime?> lastUpdatedAt,
      Value<int> id,
      required PolygonType type,
      Value<String?> name,
    });
typedef $$PolygonsTableUpdateCompanionBuilder =
    PolygonsCompanion Function({
      Value<DateTime> createdAt,
      Value<DateTime?> lastUpdatedAt,
      Value<int> id,
      Value<PolygonType> type,
      Value<String?> name,
    });

final class $$PolygonsTableReferences
    extends BaseReferences<_$Database, $PolygonsTable, Polygon> {
  $$PolygonsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$GuidanceGroupsTable, List<GuidanceGroup>>
  _guidanceGroupBorderPolygonTable(_$Database db) =>
      MultiTypedResultKey.fromTable(
        db.guidanceGroups,
        aliasName: $_aliasNameGenerator(
          db.polygons.id,
          db.guidanceGroups.borderPolygon,
        ),
      );

  $$GuidanceGroupsTableProcessedTableManager get guidanceGroupBorderPolygon {
    final manager = $$GuidanceGroupsTableTableManager(
      $_db,
      $_db.guidanceGroups,
    ).filter((f) => f.borderPolygon.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _guidanceGroupBorderPolygonTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$GuidancePatternsTable, List<GuidancePattern>>
  _guidancePatternBorderPolygonTable(_$Database db) =>
      MultiTypedResultKey.fromTable(
        db.guidancePatterns,
        aliasName: $_aliasNameGenerator(
          db.polygons.id,
          db.guidancePatterns.borderPolygon,
        ),
      );

  $$GuidancePatternsTableProcessedTableManager
  get guidancePatternBorderPolygon {
    final manager = $$GuidancePatternsTableTableManager(
      $_db,
      $_db.guidancePatterns,
    ).filter((f) => f.borderPolygon.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _guidancePatternBorderPolygonTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$PartfieldPolygonsTable, List<PartfieldPolygon>>
  _partfieldPolygonPolygonTable(_$Database db) => MultiTypedResultKey.fromTable(
    db.partfieldPolygons,
    aliasName: $_aliasNameGenerator(
      db.polygons.id,
      db.partfieldPolygons.polygon,
    ),
  );

  $$PartfieldPolygonsTableProcessedTableManager get partfieldPolygonPolygon {
    final manager = $$PartfieldPolygonsTableTableManager(
      $_db,
      $_db.partfieldPolygons,
    ).filter((f) => f.polygon.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _partfieldPolygonPolygonTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$PolygonLineStringsTable, List<PolygonLineString>>
  _polygonLineStringPolygonTable(_$Database db) =>
      MultiTypedResultKey.fromTable(
        db.polygonLineStrings,
        aliasName: $_aliasNameGenerator(
          db.polygons.id,
          db.polygonLineStrings.polygon,
        ),
      );

  $$PolygonLineStringsTableProcessedTableManager get polygonLineStringPolygon {
    final manager = $$PolygonLineStringsTableTableManager(
      $_db,
      $_db.polygonLineStrings,
    ).filter((f) => f.polygon.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _polygonLineStringPolygonTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$PolygonsTableFilterComposer
    extends Composer<_$Database, $PolygonsTable> {
  $$PolygonsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get lastUpdatedAt => $composableBuilder(
    column: $table.lastUpdatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<PolygonType, PolygonType, int> get type =>
      $composableBuilder(
        column: $table.type,
        builder: (column) => ColumnWithTypeConverterFilters(column),
      );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> guidanceGroupBorderPolygon(
    Expression<bool> Function($$GuidanceGroupsTableFilterComposer f) f,
  ) {
    final $$GuidanceGroupsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.guidanceGroups,
      getReferencedColumn: (t) => t.borderPolygon,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$GuidanceGroupsTableFilterComposer(
            $db: $db,
            $table: $db.guidanceGroups,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> guidancePatternBorderPolygon(
    Expression<bool> Function($$GuidancePatternsTableFilterComposer f) f,
  ) {
    final $$GuidancePatternsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.guidancePatterns,
      getReferencedColumn: (t) => t.borderPolygon,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$GuidancePatternsTableFilterComposer(
            $db: $db,
            $table: $db.guidancePatterns,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> partfieldPolygonPolygon(
    Expression<bool> Function($$PartfieldPolygonsTableFilterComposer f) f,
  ) {
    final $$PartfieldPolygonsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.partfieldPolygons,
      getReferencedColumn: (t) => t.polygon,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PartfieldPolygonsTableFilterComposer(
            $db: $db,
            $table: $db.partfieldPolygons,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> polygonLineStringPolygon(
    Expression<bool> Function($$PolygonLineStringsTableFilterComposer f) f,
  ) {
    final $$PolygonLineStringsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.polygonLineStrings,
      getReferencedColumn: (t) => t.polygon,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PolygonLineStringsTableFilterComposer(
            $db: $db,
            $table: $db.polygonLineStrings,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$PolygonsTableOrderingComposer
    extends Composer<_$Database, $PolygonsTable> {
  $$PolygonsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get lastUpdatedAt => $composableBuilder(
    column: $table.lastUpdatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get type => $composableBuilder(
    column: $table.type,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$PolygonsTableAnnotationComposer
    extends Composer<_$Database, $PolygonsTable> {
  $$PolygonsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get lastUpdatedAt => $composableBuilder(
    column: $table.lastUpdatedAt,
    builder: (column) => column,
  );

  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumnWithTypeConverter<PolygonType, int> get type =>
      $composableBuilder(column: $table.type, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  Expression<T> guidanceGroupBorderPolygon<T extends Object>(
    Expression<T> Function($$GuidanceGroupsTableAnnotationComposer a) f,
  ) {
    final $$GuidanceGroupsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.guidanceGroups,
      getReferencedColumn: (t) => t.borderPolygon,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$GuidanceGroupsTableAnnotationComposer(
            $db: $db,
            $table: $db.guidanceGroups,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> guidancePatternBorderPolygon<T extends Object>(
    Expression<T> Function($$GuidancePatternsTableAnnotationComposer a) f,
  ) {
    final $$GuidancePatternsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.guidancePatterns,
      getReferencedColumn: (t) => t.borderPolygon,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$GuidancePatternsTableAnnotationComposer(
            $db: $db,
            $table: $db.guidancePatterns,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> partfieldPolygonPolygon<T extends Object>(
    Expression<T> Function($$PartfieldPolygonsTableAnnotationComposer a) f,
  ) {
    final $$PartfieldPolygonsTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.partfieldPolygons,
          getReferencedColumn: (t) => t.polygon,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$PartfieldPolygonsTableAnnotationComposer(
                $db: $db,
                $table: $db.partfieldPolygons,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }

  Expression<T> polygonLineStringPolygon<T extends Object>(
    Expression<T> Function($$PolygonLineStringsTableAnnotationComposer a) f,
  ) {
    final $$PolygonLineStringsTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.polygonLineStrings,
          getReferencedColumn: (t) => t.polygon,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$PolygonLineStringsTableAnnotationComposer(
                $db: $db,
                $table: $db.polygonLineStrings,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }
}

class $$PolygonsTableTableManager
    extends
        RootTableManager<
          _$Database,
          $PolygonsTable,
          Polygon,
          $$PolygonsTableFilterComposer,
          $$PolygonsTableOrderingComposer,
          $$PolygonsTableAnnotationComposer,
          $$PolygonsTableCreateCompanionBuilder,
          $$PolygonsTableUpdateCompanionBuilder,
          (Polygon, $$PolygonsTableReferences),
          Polygon,
          PrefetchHooks Function({
            bool guidanceGroupBorderPolygon,
            bool guidancePatternBorderPolygon,
            bool partfieldPolygonPolygon,
            bool polygonLineStringPolygon,
          })
        > {
  $$PolygonsTableTableManager(_$Database db, $PolygonsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$PolygonsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$PolygonsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$PolygonsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime?> lastUpdatedAt = const Value.absent(),
                Value<int> id = const Value.absent(),
                Value<PolygonType> type = const Value.absent(),
                Value<String?> name = const Value.absent(),
              }) => PolygonsCompanion(
                createdAt: createdAt,
                lastUpdatedAt: lastUpdatedAt,
                id: id,
                type: type,
                name: name,
              ),
          createCompanionCallback:
              ({
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime?> lastUpdatedAt = const Value.absent(),
                Value<int> id = const Value.absent(),
                required PolygonType type,
                Value<String?> name = const Value.absent(),
              }) => PolygonsCompanion.insert(
                createdAt: createdAt,
                lastUpdatedAt: lastUpdatedAt,
                id: id,
                type: type,
                name: name,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$PolygonsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({
                guidanceGroupBorderPolygon = false,
                guidancePatternBorderPolygon = false,
                partfieldPolygonPolygon = false,
                polygonLineStringPolygon = false,
              }) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (guidanceGroupBorderPolygon) db.guidanceGroups,
                    if (guidancePatternBorderPolygon) db.guidancePatterns,
                    if (partfieldPolygonPolygon) db.partfieldPolygons,
                    if (polygonLineStringPolygon) db.polygonLineStrings,
                  ],
                  addJoins: null,
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (guidanceGroupBorderPolygon)
                        await $_getPrefetchedData<
                          Polygon,
                          $PolygonsTable,
                          GuidanceGroup
                        >(
                          currentTable: table,
                          referencedTable: $$PolygonsTableReferences
                              ._guidanceGroupBorderPolygonTable(db),
                          managerFromTypedResult: (p0) =>
                              $$PolygonsTableReferences(
                                db,
                                table,
                                p0,
                              ).guidanceGroupBorderPolygon,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.borderPolygon == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (guidancePatternBorderPolygon)
                        await $_getPrefetchedData<
                          Polygon,
                          $PolygonsTable,
                          GuidancePattern
                        >(
                          currentTable: table,
                          referencedTable: $$PolygonsTableReferences
                              ._guidancePatternBorderPolygonTable(db),
                          managerFromTypedResult: (p0) =>
                              $$PolygonsTableReferences(
                                db,
                                table,
                                p0,
                              ).guidancePatternBorderPolygon,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.borderPolygon == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (partfieldPolygonPolygon)
                        await $_getPrefetchedData<
                          Polygon,
                          $PolygonsTable,
                          PartfieldPolygon
                        >(
                          currentTable: table,
                          referencedTable: $$PolygonsTableReferences
                              ._partfieldPolygonPolygonTable(db),
                          managerFromTypedResult: (p0) =>
                              $$PolygonsTableReferences(
                                db,
                                table,
                                p0,
                              ).partfieldPolygonPolygon,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.polygon == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (polygonLineStringPolygon)
                        await $_getPrefetchedData<
                          Polygon,
                          $PolygonsTable,
                          PolygonLineString
                        >(
                          currentTable: table,
                          referencedTable: $$PolygonsTableReferences
                              ._polygonLineStringPolygonTable(db),
                          managerFromTypedResult: (p0) =>
                              $$PolygonsTableReferences(
                                db,
                                table,
                                p0,
                              ).polygonLineStringPolygon,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.polygon == item.id,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$PolygonsTableProcessedTableManager =
    ProcessedTableManager<
      _$Database,
      $PolygonsTable,
      Polygon,
      $$PolygonsTableFilterComposer,
      $$PolygonsTableOrderingComposer,
      $$PolygonsTableAnnotationComposer,
      $$PolygonsTableCreateCompanionBuilder,
      $$PolygonsTableUpdateCompanionBuilder,
      (Polygon, $$PolygonsTableReferences),
      Polygon,
      PrefetchHooks Function({
        bool guidanceGroupBorderPolygon,
        bool guidancePatternBorderPolygon,
        bool partfieldPolygonPolygon,
        bool polygonLineStringPolygon,
      })
    >;
typedef $$GuidanceGroupsTableCreateCompanionBuilder =
    GuidanceGroupsCompanion Function({
      Value<DateTime> createdAt,
      Value<DateTime?> lastUpdatedAt,
      Value<int> id,
      Value<String?> name,
      Value<int?> borderPolygon,
    });
typedef $$GuidanceGroupsTableUpdateCompanionBuilder =
    GuidanceGroupsCompanion Function({
      Value<DateTime> createdAt,
      Value<DateTime?> lastUpdatedAt,
      Value<int> id,
      Value<String?> name,
      Value<int?> borderPolygon,
    });

final class $$GuidanceGroupsTableReferences
    extends BaseReferences<_$Database, $GuidanceGroupsTable, GuidanceGroup> {
  $$GuidanceGroupsTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $PolygonsTable _borderPolygonTable(_$Database db) =>
      db.polygons.createAlias(
        $_aliasNameGenerator(db.guidanceGroups.borderPolygon, db.polygons.id),
      );

  $$PolygonsTableProcessedTableManager? get borderPolygon {
    final $_column = $_itemColumn<int>('border_polygon');
    if ($_column == null) return null;
    final manager = $$PolygonsTableTableManager(
      $_db,
      $_db.polygons,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_borderPolygonTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static MultiTypedResultKey<
    $GuidanceAllocationsTable,
    List<GuidanceAllocation>
  >
  _guidanceAllocationGuidanceGroupTable(_$Database db) =>
      MultiTypedResultKey.fromTable(
        db.guidanceAllocations,
        aliasName: $_aliasNameGenerator(
          db.guidanceGroups.id,
          db.guidanceAllocations.guidanceGroup,
        ),
      );

  $$GuidanceAllocationsTableProcessedTableManager
  get guidanceAllocationGuidanceGroup {
    final manager = $$GuidanceAllocationsTableTableManager(
      $_db,
      $_db.guidanceAllocations,
    ).filter((f) => f.guidanceGroup.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _guidanceAllocationGuidanceGroupTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<
    $GuidanceGroupPatternsTable,
    List<GuidanceGroupPattern>
  >
  _guidanceGroupGroupTable(_$Database db) => MultiTypedResultKey.fromTable(
    db.guidanceGroupPatterns,
    aliasName: $_aliasNameGenerator(
      db.guidanceGroups.id,
      db.guidanceGroupPatterns.guidanceGroup,
    ),
  );

  $$GuidanceGroupPatternsTableProcessedTableManager get guidanceGroupGroup {
    final manager = $$GuidanceGroupPatternsTableTableManager(
      $_db,
      $_db.guidanceGroupPatterns,
    ).filter((f) => f.guidanceGroup.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_guidanceGroupGroupTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<
    $PartfieldGuidanceGroupsTable,
    List<PartfieldGuidanceGroup>
  >
  _partfieldGuidanceGroupGuidanceGroupTable(_$Database db) =>
      MultiTypedResultKey.fromTable(
        db.partfieldGuidanceGroups,
        aliasName: $_aliasNameGenerator(
          db.guidanceGroups.id,
          db.partfieldGuidanceGroups.guidanceGroup,
        ),
      );

  $$PartfieldGuidanceGroupsTableProcessedTableManager
  get partfieldGuidanceGroupGuidanceGroup {
    final manager = $$PartfieldGuidanceGroupsTableTableManager(
      $_db,
      $_db.partfieldGuidanceGroups,
    ).filter((f) => f.guidanceGroup.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _partfieldGuidanceGroupGuidanceGroupTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$GuidanceGroupsTableFilterComposer
    extends Composer<_$Database, $GuidanceGroupsTable> {
  $$GuidanceGroupsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get lastUpdatedAt => $composableBuilder(
    column: $table.lastUpdatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  $$PolygonsTableFilterComposer get borderPolygon {
    final $$PolygonsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.borderPolygon,
      referencedTable: $db.polygons,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PolygonsTableFilterComposer(
            $db: $db,
            $table: $db.polygons,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<bool> guidanceAllocationGuidanceGroup(
    Expression<bool> Function($$GuidanceAllocationsTableFilterComposer f) f,
  ) {
    final $$GuidanceAllocationsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.guidanceAllocations,
      getReferencedColumn: (t) => t.guidanceGroup,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$GuidanceAllocationsTableFilterComposer(
            $db: $db,
            $table: $db.guidanceAllocations,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> guidanceGroupGroup(
    Expression<bool> Function($$GuidanceGroupPatternsTableFilterComposer f) f,
  ) {
    final $$GuidanceGroupPatternsTableFilterComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.guidanceGroupPatterns,
          getReferencedColumn: (t) => t.guidanceGroup,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$GuidanceGroupPatternsTableFilterComposer(
                $db: $db,
                $table: $db.guidanceGroupPatterns,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }

  Expression<bool> partfieldGuidanceGroupGuidanceGroup(
    Expression<bool> Function($$PartfieldGuidanceGroupsTableFilterComposer f) f,
  ) {
    final $$PartfieldGuidanceGroupsTableFilterComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.partfieldGuidanceGroups,
          getReferencedColumn: (t) => t.guidanceGroup,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$PartfieldGuidanceGroupsTableFilterComposer(
                $db: $db,
                $table: $db.partfieldGuidanceGroups,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }
}

class $$GuidanceGroupsTableOrderingComposer
    extends Composer<_$Database, $GuidanceGroupsTable> {
  $$GuidanceGroupsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get lastUpdatedAt => $composableBuilder(
    column: $table.lastUpdatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  $$PolygonsTableOrderingComposer get borderPolygon {
    final $$PolygonsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.borderPolygon,
      referencedTable: $db.polygons,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PolygonsTableOrderingComposer(
            $db: $db,
            $table: $db.polygons,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$GuidanceGroupsTableAnnotationComposer
    extends Composer<_$Database, $GuidanceGroupsTable> {
  $$GuidanceGroupsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get lastUpdatedAt => $composableBuilder(
    column: $table.lastUpdatedAt,
    builder: (column) => column,
  );

  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  $$PolygonsTableAnnotationComposer get borderPolygon {
    final $$PolygonsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.borderPolygon,
      referencedTable: $db.polygons,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PolygonsTableAnnotationComposer(
            $db: $db,
            $table: $db.polygons,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<T> guidanceAllocationGuidanceGroup<T extends Object>(
    Expression<T> Function($$GuidanceAllocationsTableAnnotationComposer a) f,
  ) {
    final $$GuidanceAllocationsTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.guidanceAllocations,
          getReferencedColumn: (t) => t.guidanceGroup,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$GuidanceAllocationsTableAnnotationComposer(
                $db: $db,
                $table: $db.guidanceAllocations,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }

  Expression<T> guidanceGroupGroup<T extends Object>(
    Expression<T> Function($$GuidanceGroupPatternsTableAnnotationComposer a) f,
  ) {
    final $$GuidanceGroupPatternsTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.guidanceGroupPatterns,
          getReferencedColumn: (t) => t.guidanceGroup,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$GuidanceGroupPatternsTableAnnotationComposer(
                $db: $db,
                $table: $db.guidanceGroupPatterns,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }

  Expression<T> partfieldGuidanceGroupGuidanceGroup<T extends Object>(
    Expression<T> Function($$PartfieldGuidanceGroupsTableAnnotationComposer a)
    f,
  ) {
    final $$PartfieldGuidanceGroupsTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.partfieldGuidanceGroups,
          getReferencedColumn: (t) => t.guidanceGroup,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$PartfieldGuidanceGroupsTableAnnotationComposer(
                $db: $db,
                $table: $db.partfieldGuidanceGroups,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }
}

class $$GuidanceGroupsTableTableManager
    extends
        RootTableManager<
          _$Database,
          $GuidanceGroupsTable,
          GuidanceGroup,
          $$GuidanceGroupsTableFilterComposer,
          $$GuidanceGroupsTableOrderingComposer,
          $$GuidanceGroupsTableAnnotationComposer,
          $$GuidanceGroupsTableCreateCompanionBuilder,
          $$GuidanceGroupsTableUpdateCompanionBuilder,
          (GuidanceGroup, $$GuidanceGroupsTableReferences),
          GuidanceGroup,
          PrefetchHooks Function({
            bool borderPolygon,
            bool guidanceAllocationGuidanceGroup,
            bool guidanceGroupGroup,
            bool partfieldGuidanceGroupGuidanceGroup,
          })
        > {
  $$GuidanceGroupsTableTableManager(_$Database db, $GuidanceGroupsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$GuidanceGroupsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$GuidanceGroupsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$GuidanceGroupsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime?> lastUpdatedAt = const Value.absent(),
                Value<int> id = const Value.absent(),
                Value<String?> name = const Value.absent(),
                Value<int?> borderPolygon = const Value.absent(),
              }) => GuidanceGroupsCompanion(
                createdAt: createdAt,
                lastUpdatedAt: lastUpdatedAt,
                id: id,
                name: name,
                borderPolygon: borderPolygon,
              ),
          createCompanionCallback:
              ({
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime?> lastUpdatedAt = const Value.absent(),
                Value<int> id = const Value.absent(),
                Value<String?> name = const Value.absent(),
                Value<int?> borderPolygon = const Value.absent(),
              }) => GuidanceGroupsCompanion.insert(
                createdAt: createdAt,
                lastUpdatedAt: lastUpdatedAt,
                id: id,
                name: name,
                borderPolygon: borderPolygon,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$GuidanceGroupsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({
                borderPolygon = false,
                guidanceAllocationGuidanceGroup = false,
                guidanceGroupGroup = false,
                partfieldGuidanceGroupGuidanceGroup = false,
              }) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (guidanceAllocationGuidanceGroup) db.guidanceAllocations,
                    if (guidanceGroupGroup) db.guidanceGroupPatterns,
                    if (partfieldGuidanceGroupGuidanceGroup)
                      db.partfieldGuidanceGroups,
                  ],
                  addJoins:
                      <
                        T extends TableManagerState<
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic
                        >
                      >(state) {
                        if (borderPolygon) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.borderPolygon,
                                    referencedTable:
                                        $$GuidanceGroupsTableReferences
                                            ._borderPolygonTable(db),
                                    referencedColumn:
                                        $$GuidanceGroupsTableReferences
                                            ._borderPolygonTable(db)
                                            .id,
                                  )
                                  as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (guidanceAllocationGuidanceGroup)
                        await $_getPrefetchedData<
                          GuidanceGroup,
                          $GuidanceGroupsTable,
                          GuidanceAllocation
                        >(
                          currentTable: table,
                          referencedTable: $$GuidanceGroupsTableReferences
                              ._guidanceAllocationGuidanceGroupTable(db),
                          managerFromTypedResult: (p0) =>
                              $$GuidanceGroupsTableReferences(
                                db,
                                table,
                                p0,
                              ).guidanceAllocationGuidanceGroup,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.guidanceGroup == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (guidanceGroupGroup)
                        await $_getPrefetchedData<
                          GuidanceGroup,
                          $GuidanceGroupsTable,
                          GuidanceGroupPattern
                        >(
                          currentTable: table,
                          referencedTable: $$GuidanceGroupsTableReferences
                              ._guidanceGroupGroupTable(db),
                          managerFromTypedResult: (p0) =>
                              $$GuidanceGroupsTableReferences(
                                db,
                                table,
                                p0,
                              ).guidanceGroupGroup,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.guidanceGroup == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (partfieldGuidanceGroupGuidanceGroup)
                        await $_getPrefetchedData<
                          GuidanceGroup,
                          $GuidanceGroupsTable,
                          PartfieldGuidanceGroup
                        >(
                          currentTable: table,
                          referencedTable: $$GuidanceGroupsTableReferences
                              ._partfieldGuidanceGroupGuidanceGroupTable(db),
                          managerFromTypedResult: (p0) =>
                              $$GuidanceGroupsTableReferences(
                                db,
                                table,
                                p0,
                              ).partfieldGuidanceGroupGuidanceGroup,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.guidanceGroup == item.id,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$GuidanceGroupsTableProcessedTableManager =
    ProcessedTableManager<
      _$Database,
      $GuidanceGroupsTable,
      GuidanceGroup,
      $$GuidanceGroupsTableFilterComposer,
      $$GuidanceGroupsTableOrderingComposer,
      $$GuidanceGroupsTableAnnotationComposer,
      $$GuidanceGroupsTableCreateCompanionBuilder,
      $$GuidanceGroupsTableUpdateCompanionBuilder,
      (GuidanceGroup, $$GuidanceGroupsTableReferences),
      GuidanceGroup,
      PrefetchHooks Function({
        bool borderPolygon,
        bool guidanceAllocationGuidanceGroup,
        bool guidanceGroupGroup,
        bool partfieldGuidanceGroupGuidanceGroup,
      })
    >;
typedef $$GuidanceAllocationsTableCreateCompanionBuilder =
    GuidanceAllocationsCompanion Function({
      Value<DateTime> createdAt,
      Value<DateTime?> lastUpdatedAt,
      Value<int> id,
      required int task,
      required int guidanceGroup,
    });
typedef $$GuidanceAllocationsTableUpdateCompanionBuilder =
    GuidanceAllocationsCompanion Function({
      Value<DateTime> createdAt,
      Value<DateTime?> lastUpdatedAt,
      Value<int> id,
      Value<int> task,
      Value<int> guidanceGroup,
    });

final class $$GuidanceAllocationsTableReferences
    extends
        BaseReferences<
          _$Database,
          $GuidanceAllocationsTable,
          GuidanceAllocation
        > {
  $$GuidanceAllocationsTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $TasksTable _taskTable(_$Database db) => db.tasks.createAlias(
    $_aliasNameGenerator(db.guidanceAllocations.task, db.tasks.id),
  );

  $$TasksTableProcessedTableManager get task {
    final $_column = $_itemColumn<int>('task')!;

    final manager = $$TasksTableTableManager(
      $_db,
      $_db.tasks,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_taskTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $GuidanceGroupsTable _guidanceGroupTable(_$Database db) =>
      db.guidanceGroups.createAlias(
        $_aliasNameGenerator(
          db.guidanceAllocations.guidanceGroup,
          db.guidanceGroups.id,
        ),
      );

  $$GuidanceGroupsTableProcessedTableManager get guidanceGroup {
    final $_column = $_itemColumn<int>('guidance_group')!;

    final manager = $$GuidanceGroupsTableTableManager(
      $_db,
      $_db.guidanceGroups,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_guidanceGroupTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$GuidanceAllocationsTableFilterComposer
    extends Composer<_$Database, $GuidanceAllocationsTable> {
  $$GuidanceAllocationsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get lastUpdatedAt => $composableBuilder(
    column: $table.lastUpdatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  $$TasksTableFilterComposer get task {
    final $$TasksTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.task,
      referencedTable: $db.tasks,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TasksTableFilterComposer(
            $db: $db,
            $table: $db.tasks,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$GuidanceGroupsTableFilterComposer get guidanceGroup {
    final $$GuidanceGroupsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.guidanceGroup,
      referencedTable: $db.guidanceGroups,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$GuidanceGroupsTableFilterComposer(
            $db: $db,
            $table: $db.guidanceGroups,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$GuidanceAllocationsTableOrderingComposer
    extends Composer<_$Database, $GuidanceAllocationsTable> {
  $$GuidanceAllocationsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get lastUpdatedAt => $composableBuilder(
    column: $table.lastUpdatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  $$TasksTableOrderingComposer get task {
    final $$TasksTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.task,
      referencedTable: $db.tasks,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TasksTableOrderingComposer(
            $db: $db,
            $table: $db.tasks,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$GuidanceGroupsTableOrderingComposer get guidanceGroup {
    final $$GuidanceGroupsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.guidanceGroup,
      referencedTable: $db.guidanceGroups,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$GuidanceGroupsTableOrderingComposer(
            $db: $db,
            $table: $db.guidanceGroups,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$GuidanceAllocationsTableAnnotationComposer
    extends Composer<_$Database, $GuidanceAllocationsTable> {
  $$GuidanceAllocationsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get lastUpdatedAt => $composableBuilder(
    column: $table.lastUpdatedAt,
    builder: (column) => column,
  );

  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  $$TasksTableAnnotationComposer get task {
    final $$TasksTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.task,
      referencedTable: $db.tasks,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TasksTableAnnotationComposer(
            $db: $db,
            $table: $db.tasks,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$GuidanceGroupsTableAnnotationComposer get guidanceGroup {
    final $$GuidanceGroupsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.guidanceGroup,
      referencedTable: $db.guidanceGroups,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$GuidanceGroupsTableAnnotationComposer(
            $db: $db,
            $table: $db.guidanceGroups,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$GuidanceAllocationsTableTableManager
    extends
        RootTableManager<
          _$Database,
          $GuidanceAllocationsTable,
          GuidanceAllocation,
          $$GuidanceAllocationsTableFilterComposer,
          $$GuidanceAllocationsTableOrderingComposer,
          $$GuidanceAllocationsTableAnnotationComposer,
          $$GuidanceAllocationsTableCreateCompanionBuilder,
          $$GuidanceAllocationsTableUpdateCompanionBuilder,
          (GuidanceAllocation, $$GuidanceAllocationsTableReferences),
          GuidanceAllocation,
          PrefetchHooks Function({bool task, bool guidanceGroup})
        > {
  $$GuidanceAllocationsTableTableManager(
    _$Database db,
    $GuidanceAllocationsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$GuidanceAllocationsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$GuidanceAllocationsTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer: () =>
              $$GuidanceAllocationsTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime?> lastUpdatedAt = const Value.absent(),
                Value<int> id = const Value.absent(),
                Value<int> task = const Value.absent(),
                Value<int> guidanceGroup = const Value.absent(),
              }) => GuidanceAllocationsCompanion(
                createdAt: createdAt,
                lastUpdatedAt: lastUpdatedAt,
                id: id,
                task: task,
                guidanceGroup: guidanceGroup,
              ),
          createCompanionCallback:
              ({
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime?> lastUpdatedAt = const Value.absent(),
                Value<int> id = const Value.absent(),
                required int task,
                required int guidanceGroup,
              }) => GuidanceAllocationsCompanion.insert(
                createdAt: createdAt,
                lastUpdatedAt: lastUpdatedAt,
                id: id,
                task: task,
                guidanceGroup: guidanceGroup,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$GuidanceAllocationsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({task = false, guidanceGroup = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (task) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.task,
                                referencedTable:
                                    $$GuidanceAllocationsTableReferences
                                        ._taskTable(db),
                                referencedColumn:
                                    $$GuidanceAllocationsTableReferences
                                        ._taskTable(db)
                                        .id,
                              )
                              as T;
                    }
                    if (guidanceGroup) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.guidanceGroup,
                                referencedTable:
                                    $$GuidanceAllocationsTableReferences
                                        ._guidanceGroupTable(db),
                                referencedColumn:
                                    $$GuidanceAllocationsTableReferences
                                        ._guidanceGroupTable(db)
                                        .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$GuidanceAllocationsTableProcessedTableManager =
    ProcessedTableManager<
      _$Database,
      $GuidanceAllocationsTable,
      GuidanceAllocation,
      $$GuidanceAllocationsTableFilterComposer,
      $$GuidanceAllocationsTableOrderingComposer,
      $$GuidanceAllocationsTableAnnotationComposer,
      $$GuidanceAllocationsTableCreateCompanionBuilder,
      $$GuidanceAllocationsTableUpdateCompanionBuilder,
      (GuidanceAllocation, $$GuidanceAllocationsTableReferences),
      GuidanceAllocation,
      PrefetchHooks Function({bool task, bool guidanceGroup})
    >;
typedef $$LineStringsTableCreateCompanionBuilder =
    LineStringsCompanion Function({
      Value<DateTime> createdAt,
      Value<DateTime?> lastUpdatedAt,
      Value<int> id,
      required LineStringType type,
      Value<String?> name,
      Value<int?> width,
      Value<int?> length,
    });
typedef $$LineStringsTableUpdateCompanionBuilder =
    LineStringsCompanion Function({
      Value<DateTime> createdAt,
      Value<DateTime?> lastUpdatedAt,
      Value<int> id,
      Value<LineStringType> type,
      Value<String?> name,
      Value<int?> width,
      Value<int?> length,
    });

final class $$LineStringsTableReferences
    extends BaseReferences<_$Database, $LineStringsTable, LineString> {
  $$LineStringsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$GuidancePatternsTable, List<GuidancePattern>>
  _guidancePatternLineStringTable(_$Database db) =>
      MultiTypedResultKey.fromTable(
        db.guidancePatterns,
        aliasName: $_aliasNameGenerator(
          db.lineStrings.id,
          db.guidancePatterns.lineString,
        ),
      );

  $$GuidancePatternsTableProcessedTableManager get guidancePatternLineString {
    final manager = $$GuidancePatternsTableTableManager(
      $_db,
      $_db.guidancePatterns,
    ).filter((f) => f.lineString.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _guidancePatternLineStringTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$LineStringPointsTable, List<LineStringPoint>>
  _lineStringPointLineStringTable(_$Database db) =>
      MultiTypedResultKey.fromTable(
        db.lineStringPoints,
        aliasName: $_aliasNameGenerator(
          db.lineStrings.id,
          db.lineStringPoints.lineString,
        ),
      );

  $$LineStringPointsTableProcessedTableManager get lineStringPointLineString {
    final manager = $$LineStringPointsTableTableManager(
      $_db,
      $_db.lineStringPoints,
    ).filter((f) => f.lineString.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _lineStringPointLineStringTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<
    $PartfieldLineStringsTable,
    List<PartfieldLineString>
  >
  _partfieldLineStringLineStringTable(_$Database db) =>
      MultiTypedResultKey.fromTable(
        db.partfieldLineStrings,
        aliasName: $_aliasNameGenerator(
          db.lineStrings.id,
          db.partfieldLineStrings.lineString,
        ),
      );

  $$PartfieldLineStringsTableProcessedTableManager
  get partfieldLineStringLineString {
    final manager = $$PartfieldLineStringsTableTableManager(
      $_db,
      $_db.partfieldLineStrings,
    ).filter((f) => f.lineString.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _partfieldLineStringLineStringTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$PolygonLineStringsTable, List<PolygonLineString>>
  _polygonLineStringLineStringTable(_$Database db) =>
      MultiTypedResultKey.fromTable(
        db.polygonLineStrings,
        aliasName: $_aliasNameGenerator(
          db.lineStrings.id,
          db.polygonLineStrings.lineString,
        ),
      );

  $$PolygonLineStringsTableProcessedTableManager
  get polygonLineStringLineString {
    final manager = $$PolygonLineStringsTableTableManager(
      $_db,
      $_db.polygonLineStrings,
    ).filter((f) => f.lineString.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _polygonLineStringLineStringTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$LineStringsTableFilterComposer
    extends Composer<_$Database, $LineStringsTable> {
  $$LineStringsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get lastUpdatedAt => $composableBuilder(
    column: $table.lastUpdatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<LineStringType, LineStringType, int>
  get type => $composableBuilder(
    column: $table.type,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get width => $composableBuilder(
    column: $table.width,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get length => $composableBuilder(
    column: $table.length,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> guidancePatternLineString(
    Expression<bool> Function($$GuidancePatternsTableFilterComposer f) f,
  ) {
    final $$GuidancePatternsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.guidancePatterns,
      getReferencedColumn: (t) => t.lineString,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$GuidancePatternsTableFilterComposer(
            $db: $db,
            $table: $db.guidancePatterns,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> lineStringPointLineString(
    Expression<bool> Function($$LineStringPointsTableFilterComposer f) f,
  ) {
    final $$LineStringPointsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.lineStringPoints,
      getReferencedColumn: (t) => t.lineString,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$LineStringPointsTableFilterComposer(
            $db: $db,
            $table: $db.lineStringPoints,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> partfieldLineStringLineString(
    Expression<bool> Function($$PartfieldLineStringsTableFilterComposer f) f,
  ) {
    final $$PartfieldLineStringsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.partfieldLineStrings,
      getReferencedColumn: (t) => t.lineString,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PartfieldLineStringsTableFilterComposer(
            $db: $db,
            $table: $db.partfieldLineStrings,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> polygonLineStringLineString(
    Expression<bool> Function($$PolygonLineStringsTableFilterComposer f) f,
  ) {
    final $$PolygonLineStringsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.polygonLineStrings,
      getReferencedColumn: (t) => t.lineString,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PolygonLineStringsTableFilterComposer(
            $db: $db,
            $table: $db.polygonLineStrings,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$LineStringsTableOrderingComposer
    extends Composer<_$Database, $LineStringsTable> {
  $$LineStringsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get lastUpdatedAt => $composableBuilder(
    column: $table.lastUpdatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get type => $composableBuilder(
    column: $table.type,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get width => $composableBuilder(
    column: $table.width,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get length => $composableBuilder(
    column: $table.length,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$LineStringsTableAnnotationComposer
    extends Composer<_$Database, $LineStringsTable> {
  $$LineStringsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get lastUpdatedAt => $composableBuilder(
    column: $table.lastUpdatedAt,
    builder: (column) => column,
  );

  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumnWithTypeConverter<LineStringType, int> get type =>
      $composableBuilder(column: $table.type, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<int> get width =>
      $composableBuilder(column: $table.width, builder: (column) => column);

  GeneratedColumn<int> get length =>
      $composableBuilder(column: $table.length, builder: (column) => column);

  Expression<T> guidancePatternLineString<T extends Object>(
    Expression<T> Function($$GuidancePatternsTableAnnotationComposer a) f,
  ) {
    final $$GuidancePatternsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.guidancePatterns,
      getReferencedColumn: (t) => t.lineString,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$GuidancePatternsTableAnnotationComposer(
            $db: $db,
            $table: $db.guidancePatterns,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> lineStringPointLineString<T extends Object>(
    Expression<T> Function($$LineStringPointsTableAnnotationComposer a) f,
  ) {
    final $$LineStringPointsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.lineStringPoints,
      getReferencedColumn: (t) => t.lineString,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$LineStringPointsTableAnnotationComposer(
            $db: $db,
            $table: $db.lineStringPoints,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> partfieldLineStringLineString<T extends Object>(
    Expression<T> Function($$PartfieldLineStringsTableAnnotationComposer a) f,
  ) {
    final $$PartfieldLineStringsTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.partfieldLineStrings,
          getReferencedColumn: (t) => t.lineString,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$PartfieldLineStringsTableAnnotationComposer(
                $db: $db,
                $table: $db.partfieldLineStrings,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }

  Expression<T> polygonLineStringLineString<T extends Object>(
    Expression<T> Function($$PolygonLineStringsTableAnnotationComposer a) f,
  ) {
    final $$PolygonLineStringsTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.polygonLineStrings,
          getReferencedColumn: (t) => t.lineString,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$PolygonLineStringsTableAnnotationComposer(
                $db: $db,
                $table: $db.polygonLineStrings,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }
}

class $$LineStringsTableTableManager
    extends
        RootTableManager<
          _$Database,
          $LineStringsTable,
          LineString,
          $$LineStringsTableFilterComposer,
          $$LineStringsTableOrderingComposer,
          $$LineStringsTableAnnotationComposer,
          $$LineStringsTableCreateCompanionBuilder,
          $$LineStringsTableUpdateCompanionBuilder,
          (LineString, $$LineStringsTableReferences),
          LineString,
          PrefetchHooks Function({
            bool guidancePatternLineString,
            bool lineStringPointLineString,
            bool partfieldLineStringLineString,
            bool polygonLineStringLineString,
          })
        > {
  $$LineStringsTableTableManager(_$Database db, $LineStringsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$LineStringsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$LineStringsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$LineStringsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime?> lastUpdatedAt = const Value.absent(),
                Value<int> id = const Value.absent(),
                Value<LineStringType> type = const Value.absent(),
                Value<String?> name = const Value.absent(),
                Value<int?> width = const Value.absent(),
                Value<int?> length = const Value.absent(),
              }) => LineStringsCompanion(
                createdAt: createdAt,
                lastUpdatedAt: lastUpdatedAt,
                id: id,
                type: type,
                name: name,
                width: width,
                length: length,
              ),
          createCompanionCallback:
              ({
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime?> lastUpdatedAt = const Value.absent(),
                Value<int> id = const Value.absent(),
                required LineStringType type,
                Value<String?> name = const Value.absent(),
                Value<int?> width = const Value.absent(),
                Value<int?> length = const Value.absent(),
              }) => LineStringsCompanion.insert(
                createdAt: createdAt,
                lastUpdatedAt: lastUpdatedAt,
                id: id,
                type: type,
                name: name,
                width: width,
                length: length,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$LineStringsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({
                guidancePatternLineString = false,
                lineStringPointLineString = false,
                partfieldLineStringLineString = false,
                polygonLineStringLineString = false,
              }) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (guidancePatternLineString) db.guidancePatterns,
                    if (lineStringPointLineString) db.lineStringPoints,
                    if (partfieldLineStringLineString) db.partfieldLineStrings,
                    if (polygonLineStringLineString) db.polygonLineStrings,
                  ],
                  addJoins: null,
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (guidancePatternLineString)
                        await $_getPrefetchedData<
                          LineString,
                          $LineStringsTable,
                          GuidancePattern
                        >(
                          currentTable: table,
                          referencedTable: $$LineStringsTableReferences
                              ._guidancePatternLineStringTable(db),
                          managerFromTypedResult: (p0) =>
                              $$LineStringsTableReferences(
                                db,
                                table,
                                p0,
                              ).guidancePatternLineString,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.lineString == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (lineStringPointLineString)
                        await $_getPrefetchedData<
                          LineString,
                          $LineStringsTable,
                          LineStringPoint
                        >(
                          currentTable: table,
                          referencedTable: $$LineStringsTableReferences
                              ._lineStringPointLineStringTable(db),
                          managerFromTypedResult: (p0) =>
                              $$LineStringsTableReferences(
                                db,
                                table,
                                p0,
                              ).lineStringPointLineString,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.lineString == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (partfieldLineStringLineString)
                        await $_getPrefetchedData<
                          LineString,
                          $LineStringsTable,
                          PartfieldLineString
                        >(
                          currentTable: table,
                          referencedTable: $$LineStringsTableReferences
                              ._partfieldLineStringLineStringTable(db),
                          managerFromTypedResult: (p0) =>
                              $$LineStringsTableReferences(
                                db,
                                table,
                                p0,
                              ).partfieldLineStringLineString,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.lineString == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (polygonLineStringLineString)
                        await $_getPrefetchedData<
                          LineString,
                          $LineStringsTable,
                          PolygonLineString
                        >(
                          currentTable: table,
                          referencedTable: $$LineStringsTableReferences
                              ._polygonLineStringLineStringTable(db),
                          managerFromTypedResult: (p0) =>
                              $$LineStringsTableReferences(
                                db,
                                table,
                                p0,
                              ).polygonLineStringLineString,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.lineString == item.id,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$LineStringsTableProcessedTableManager =
    ProcessedTableManager<
      _$Database,
      $LineStringsTable,
      LineString,
      $$LineStringsTableFilterComposer,
      $$LineStringsTableOrderingComposer,
      $$LineStringsTableAnnotationComposer,
      $$LineStringsTableCreateCompanionBuilder,
      $$LineStringsTableUpdateCompanionBuilder,
      (LineString, $$LineStringsTableReferences),
      LineString,
      PrefetchHooks Function({
        bool guidancePatternLineString,
        bool lineStringPointLineString,
        bool partfieldLineStringLineString,
        bool polygonLineStringLineString,
      })
    >;
typedef $$GuidancePatternsTableCreateCompanionBuilder =
    GuidancePatternsCompanion Function({
      Value<DateTime> createdAt,
      Value<DateTime?> lastUpdatedAt,
      Value<int> id,
      required int lineString,
      Value<int?> borderPolygon,
      required GuidancePatternType type,
      Value<String?> name,
      Value<double?> heading,
      Value<int?> radius,
      Value<GuidancePatternOptions?> options,
      Value<GuidancePatternPropagationDirection?> propagationDirection,
      Value<GuidancePatternExtension?> extension,
      Value<int?> numberOfSwathsLeft,
      Value<int?> numberOfSwathsRight,
    });
typedef $$GuidancePatternsTableUpdateCompanionBuilder =
    GuidancePatternsCompanion Function({
      Value<DateTime> createdAt,
      Value<DateTime?> lastUpdatedAt,
      Value<int> id,
      Value<int> lineString,
      Value<int?> borderPolygon,
      Value<GuidancePatternType> type,
      Value<String?> name,
      Value<double?> heading,
      Value<int?> radius,
      Value<GuidancePatternOptions?> options,
      Value<GuidancePatternPropagationDirection?> propagationDirection,
      Value<GuidancePatternExtension?> extension,
      Value<int?> numberOfSwathsLeft,
      Value<int?> numberOfSwathsRight,
    });

final class $$GuidancePatternsTableReferences
    extends
        BaseReferences<_$Database, $GuidancePatternsTable, GuidancePattern> {
  $$GuidancePatternsTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $LineStringsTable _lineStringTable(_$Database db) =>
      db.lineStrings.createAlias(
        $_aliasNameGenerator(db.guidancePatterns.lineString, db.lineStrings.id),
      );

  $$LineStringsTableProcessedTableManager get lineString {
    final $_column = $_itemColumn<int>('line_string')!;

    final manager = $$LineStringsTableTableManager(
      $_db,
      $_db.lineStrings,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_lineStringTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $PolygonsTable _borderPolygonTable(_$Database db) =>
      db.polygons.createAlias(
        $_aliasNameGenerator(db.guidancePatterns.borderPolygon, db.polygons.id),
      );

  $$PolygonsTableProcessedTableManager? get borderPolygon {
    final $_column = $_itemColumn<int>('border_polygon');
    if ($_column == null) return null;
    final manager = $$PolygonsTableTableManager(
      $_db,
      $_db.polygons,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_borderPolygonTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static MultiTypedResultKey<
    $GuidanceGroupPatternsTable,
    List<GuidanceGroupPattern>
  >
  _guidanceGroupPatternTable(_$Database db) => MultiTypedResultKey.fromTable(
    db.guidanceGroupPatterns,
    aliasName: $_aliasNameGenerator(
      db.guidancePatterns.id,
      db.guidanceGroupPatterns.guidancePattern,
    ),
  );

  $$GuidanceGroupPatternsTableProcessedTableManager get guidanceGroupPattern {
    final manager = $$GuidanceGroupPatternsTableTableManager(
      $_db,
      $_db.guidanceGroupPatterns,
    ).filter((f) => f.guidancePattern.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _guidanceGroupPatternTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$GuidancePatternsTableFilterComposer
    extends Composer<_$Database, $GuidancePatternsTable> {
  $$GuidancePatternsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get lastUpdatedAt => $composableBuilder(
    column: $table.lastUpdatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<GuidancePatternType, GuidancePatternType, int>
  get type => $composableBuilder(
    column: $table.type,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get heading => $composableBuilder(
    column: $table.heading,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get radius => $composableBuilder(
    column: $table.radius,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<
    GuidancePatternOptions?,
    GuidancePatternOptions,
    int
  >
  get options => $composableBuilder(
    column: $table.options,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );

  ColumnWithTypeConverterFilters<
    GuidancePatternPropagationDirection?,
    GuidancePatternPropagationDirection,
    int
  >
  get propagationDirection => $composableBuilder(
    column: $table.propagationDirection,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );

  ColumnWithTypeConverterFilters<
    GuidancePatternExtension?,
    GuidancePatternExtension,
    int
  >
  get extension => $composableBuilder(
    column: $table.extension,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );

  ColumnFilters<int> get numberOfSwathsLeft => $composableBuilder(
    column: $table.numberOfSwathsLeft,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get numberOfSwathsRight => $composableBuilder(
    column: $table.numberOfSwathsRight,
    builder: (column) => ColumnFilters(column),
  );

  $$LineStringsTableFilterComposer get lineString {
    final $$LineStringsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.lineString,
      referencedTable: $db.lineStrings,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$LineStringsTableFilterComposer(
            $db: $db,
            $table: $db.lineStrings,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$PolygonsTableFilterComposer get borderPolygon {
    final $$PolygonsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.borderPolygon,
      referencedTable: $db.polygons,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PolygonsTableFilterComposer(
            $db: $db,
            $table: $db.polygons,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<bool> guidanceGroupPattern(
    Expression<bool> Function($$GuidanceGroupPatternsTableFilterComposer f) f,
  ) {
    final $$GuidanceGroupPatternsTableFilterComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.guidanceGroupPatterns,
          getReferencedColumn: (t) => t.guidancePattern,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$GuidanceGroupPatternsTableFilterComposer(
                $db: $db,
                $table: $db.guidanceGroupPatterns,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }
}

class $$GuidancePatternsTableOrderingComposer
    extends Composer<_$Database, $GuidancePatternsTable> {
  $$GuidancePatternsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get lastUpdatedAt => $composableBuilder(
    column: $table.lastUpdatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get type => $composableBuilder(
    column: $table.type,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get heading => $composableBuilder(
    column: $table.heading,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get radius => $composableBuilder(
    column: $table.radius,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get options => $composableBuilder(
    column: $table.options,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get propagationDirection => $composableBuilder(
    column: $table.propagationDirection,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get extension => $composableBuilder(
    column: $table.extension,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get numberOfSwathsLeft => $composableBuilder(
    column: $table.numberOfSwathsLeft,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get numberOfSwathsRight => $composableBuilder(
    column: $table.numberOfSwathsRight,
    builder: (column) => ColumnOrderings(column),
  );

  $$LineStringsTableOrderingComposer get lineString {
    final $$LineStringsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.lineString,
      referencedTable: $db.lineStrings,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$LineStringsTableOrderingComposer(
            $db: $db,
            $table: $db.lineStrings,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$PolygonsTableOrderingComposer get borderPolygon {
    final $$PolygonsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.borderPolygon,
      referencedTable: $db.polygons,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PolygonsTableOrderingComposer(
            $db: $db,
            $table: $db.polygons,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$GuidancePatternsTableAnnotationComposer
    extends Composer<_$Database, $GuidancePatternsTable> {
  $$GuidancePatternsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get lastUpdatedAt => $composableBuilder(
    column: $table.lastUpdatedAt,
    builder: (column) => column,
  );

  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumnWithTypeConverter<GuidancePatternType, int> get type =>
      $composableBuilder(column: $table.type, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<double> get heading =>
      $composableBuilder(column: $table.heading, builder: (column) => column);

  GeneratedColumn<int> get radius =>
      $composableBuilder(column: $table.radius, builder: (column) => column);

  GeneratedColumnWithTypeConverter<GuidancePatternOptions?, int> get options =>
      $composableBuilder(column: $table.options, builder: (column) => column);

  GeneratedColumnWithTypeConverter<GuidancePatternPropagationDirection?, int>
  get propagationDirection => $composableBuilder(
    column: $table.propagationDirection,
    builder: (column) => column,
  );

  GeneratedColumnWithTypeConverter<GuidancePatternExtension?, int>
  get extension =>
      $composableBuilder(column: $table.extension, builder: (column) => column);

  GeneratedColumn<int> get numberOfSwathsLeft => $composableBuilder(
    column: $table.numberOfSwathsLeft,
    builder: (column) => column,
  );

  GeneratedColumn<int> get numberOfSwathsRight => $composableBuilder(
    column: $table.numberOfSwathsRight,
    builder: (column) => column,
  );

  $$LineStringsTableAnnotationComposer get lineString {
    final $$LineStringsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.lineString,
      referencedTable: $db.lineStrings,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$LineStringsTableAnnotationComposer(
            $db: $db,
            $table: $db.lineStrings,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$PolygonsTableAnnotationComposer get borderPolygon {
    final $$PolygonsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.borderPolygon,
      referencedTable: $db.polygons,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PolygonsTableAnnotationComposer(
            $db: $db,
            $table: $db.polygons,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<T> guidanceGroupPattern<T extends Object>(
    Expression<T> Function($$GuidanceGroupPatternsTableAnnotationComposer a) f,
  ) {
    final $$GuidanceGroupPatternsTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.guidanceGroupPatterns,
          getReferencedColumn: (t) => t.guidancePattern,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$GuidanceGroupPatternsTableAnnotationComposer(
                $db: $db,
                $table: $db.guidanceGroupPatterns,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }
}

class $$GuidancePatternsTableTableManager
    extends
        RootTableManager<
          _$Database,
          $GuidancePatternsTable,
          GuidancePattern,
          $$GuidancePatternsTableFilterComposer,
          $$GuidancePatternsTableOrderingComposer,
          $$GuidancePatternsTableAnnotationComposer,
          $$GuidancePatternsTableCreateCompanionBuilder,
          $$GuidancePatternsTableUpdateCompanionBuilder,
          (GuidancePattern, $$GuidancePatternsTableReferences),
          GuidancePattern,
          PrefetchHooks Function({
            bool lineString,
            bool borderPolygon,
            bool guidanceGroupPattern,
          })
        > {
  $$GuidancePatternsTableTableManager(
    _$Database db,
    $GuidancePatternsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$GuidancePatternsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$GuidancePatternsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$GuidancePatternsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime?> lastUpdatedAt = const Value.absent(),
                Value<int> id = const Value.absent(),
                Value<int> lineString = const Value.absent(),
                Value<int?> borderPolygon = const Value.absent(),
                Value<GuidancePatternType> type = const Value.absent(),
                Value<String?> name = const Value.absent(),
                Value<double?> heading = const Value.absent(),
                Value<int?> radius = const Value.absent(),
                Value<GuidancePatternOptions?> options = const Value.absent(),
                Value<GuidancePatternPropagationDirection?>
                    propagationDirection =
                    const Value.absent(),
                Value<GuidancePatternExtension?> extension =
                    const Value.absent(),
                Value<int?> numberOfSwathsLeft = const Value.absent(),
                Value<int?> numberOfSwathsRight = const Value.absent(),
              }) => GuidancePatternsCompanion(
                createdAt: createdAt,
                lastUpdatedAt: lastUpdatedAt,
                id: id,
                lineString: lineString,
                borderPolygon: borderPolygon,
                type: type,
                name: name,
                heading: heading,
                radius: radius,
                options: options,
                propagationDirection: propagationDirection,
                extension: extension,
                numberOfSwathsLeft: numberOfSwathsLeft,
                numberOfSwathsRight: numberOfSwathsRight,
              ),
          createCompanionCallback:
              ({
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime?> lastUpdatedAt = const Value.absent(),
                Value<int> id = const Value.absent(),
                required int lineString,
                Value<int?> borderPolygon = const Value.absent(),
                required GuidancePatternType type,
                Value<String?> name = const Value.absent(),
                Value<double?> heading = const Value.absent(),
                Value<int?> radius = const Value.absent(),
                Value<GuidancePatternOptions?> options = const Value.absent(),
                Value<GuidancePatternPropagationDirection?>
                    propagationDirection =
                    const Value.absent(),
                Value<GuidancePatternExtension?> extension =
                    const Value.absent(),
                Value<int?> numberOfSwathsLeft = const Value.absent(),
                Value<int?> numberOfSwathsRight = const Value.absent(),
              }) => GuidancePatternsCompanion.insert(
                createdAt: createdAt,
                lastUpdatedAt: lastUpdatedAt,
                id: id,
                lineString: lineString,
                borderPolygon: borderPolygon,
                type: type,
                name: name,
                heading: heading,
                radius: radius,
                options: options,
                propagationDirection: propagationDirection,
                extension: extension,
                numberOfSwathsLeft: numberOfSwathsLeft,
                numberOfSwathsRight: numberOfSwathsRight,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$GuidancePatternsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({
                lineString = false,
                borderPolygon = false,
                guidanceGroupPattern = false,
              }) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (guidanceGroupPattern) db.guidanceGroupPatterns,
                  ],
                  addJoins:
                      <
                        T extends TableManagerState<
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic
                        >
                      >(state) {
                        if (lineString) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.lineString,
                                    referencedTable:
                                        $$GuidancePatternsTableReferences
                                            ._lineStringTable(db),
                                    referencedColumn:
                                        $$GuidancePatternsTableReferences
                                            ._lineStringTable(db)
                                            .id,
                                  )
                                  as T;
                        }
                        if (borderPolygon) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.borderPolygon,
                                    referencedTable:
                                        $$GuidancePatternsTableReferences
                                            ._borderPolygonTable(db),
                                    referencedColumn:
                                        $$GuidancePatternsTableReferences
                                            ._borderPolygonTable(db)
                                            .id,
                                  )
                                  as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (guidanceGroupPattern)
                        await $_getPrefetchedData<
                          GuidancePattern,
                          $GuidancePatternsTable,
                          GuidanceGroupPattern
                        >(
                          currentTable: table,
                          referencedTable: $$GuidancePatternsTableReferences
                              ._guidanceGroupPatternTable(db),
                          managerFromTypedResult: (p0) =>
                              $$GuidancePatternsTableReferences(
                                db,
                                table,
                                p0,
                              ).guidanceGroupPattern,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.guidancePattern == item.id,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$GuidancePatternsTableProcessedTableManager =
    ProcessedTableManager<
      _$Database,
      $GuidancePatternsTable,
      GuidancePattern,
      $$GuidancePatternsTableFilterComposer,
      $$GuidancePatternsTableOrderingComposer,
      $$GuidancePatternsTableAnnotationComposer,
      $$GuidancePatternsTableCreateCompanionBuilder,
      $$GuidancePatternsTableUpdateCompanionBuilder,
      (GuidancePattern, $$GuidancePatternsTableReferences),
      GuidancePattern,
      PrefetchHooks Function({
        bool lineString,
        bool borderPolygon,
        bool guidanceGroupPattern,
      })
    >;
typedef $$GuidanceGroupPatternsTableCreateCompanionBuilder =
    GuidanceGroupPatternsCompanion Function({
      required int guidanceGroup,
      required int guidancePattern,
    });
typedef $$GuidanceGroupPatternsTableUpdateCompanionBuilder =
    GuidanceGroupPatternsCompanion Function({
      Value<int> guidanceGroup,
      Value<int> guidancePattern,
    });

final class $$GuidanceGroupPatternsTableReferences
    extends
        BaseReferences<
          _$Database,
          $GuidanceGroupPatternsTable,
          GuidanceGroupPattern
        > {
  $$GuidanceGroupPatternsTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $GuidanceGroupsTable _guidanceGroupTable(_$Database db) =>
      db.guidanceGroups.createAlias(
        $_aliasNameGenerator(
          db.guidanceGroupPatterns.guidanceGroup,
          db.guidanceGroups.id,
        ),
      );

  $$GuidanceGroupsTableProcessedTableManager get guidanceGroup {
    final $_column = $_itemColumn<int>('guidance_group')!;

    final manager = $$GuidanceGroupsTableTableManager(
      $_db,
      $_db.guidanceGroups,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_guidanceGroupTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $GuidancePatternsTable _guidancePatternTable(_$Database db) =>
      db.guidancePatterns.createAlias(
        $_aliasNameGenerator(
          db.guidanceGroupPatterns.guidancePattern,
          db.guidancePatterns.id,
        ),
      );

  $$GuidancePatternsTableProcessedTableManager get guidancePattern {
    final $_column = $_itemColumn<int>('guidance_pattern')!;

    final manager = $$GuidancePatternsTableTableManager(
      $_db,
      $_db.guidancePatterns,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_guidancePatternTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$GuidanceGroupPatternsTableFilterComposer
    extends Composer<_$Database, $GuidanceGroupPatternsTable> {
  $$GuidanceGroupPatternsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  $$GuidanceGroupsTableFilterComposer get guidanceGroup {
    final $$GuidanceGroupsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.guidanceGroup,
      referencedTable: $db.guidanceGroups,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$GuidanceGroupsTableFilterComposer(
            $db: $db,
            $table: $db.guidanceGroups,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$GuidancePatternsTableFilterComposer get guidancePattern {
    final $$GuidancePatternsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.guidancePattern,
      referencedTable: $db.guidancePatterns,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$GuidancePatternsTableFilterComposer(
            $db: $db,
            $table: $db.guidancePatterns,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$GuidanceGroupPatternsTableOrderingComposer
    extends Composer<_$Database, $GuidanceGroupPatternsTable> {
  $$GuidanceGroupPatternsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  $$GuidanceGroupsTableOrderingComposer get guidanceGroup {
    final $$GuidanceGroupsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.guidanceGroup,
      referencedTable: $db.guidanceGroups,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$GuidanceGroupsTableOrderingComposer(
            $db: $db,
            $table: $db.guidanceGroups,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$GuidancePatternsTableOrderingComposer get guidancePattern {
    final $$GuidancePatternsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.guidancePattern,
      referencedTable: $db.guidancePatterns,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$GuidancePatternsTableOrderingComposer(
            $db: $db,
            $table: $db.guidancePatterns,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$GuidanceGroupPatternsTableAnnotationComposer
    extends Composer<_$Database, $GuidanceGroupPatternsTable> {
  $$GuidanceGroupPatternsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  $$GuidanceGroupsTableAnnotationComposer get guidanceGroup {
    final $$GuidanceGroupsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.guidanceGroup,
      referencedTable: $db.guidanceGroups,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$GuidanceGroupsTableAnnotationComposer(
            $db: $db,
            $table: $db.guidanceGroups,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$GuidancePatternsTableAnnotationComposer get guidancePattern {
    final $$GuidancePatternsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.guidancePattern,
      referencedTable: $db.guidancePatterns,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$GuidancePatternsTableAnnotationComposer(
            $db: $db,
            $table: $db.guidancePatterns,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$GuidanceGroupPatternsTableTableManager
    extends
        RootTableManager<
          _$Database,
          $GuidanceGroupPatternsTable,
          GuidanceGroupPattern,
          $$GuidanceGroupPatternsTableFilterComposer,
          $$GuidanceGroupPatternsTableOrderingComposer,
          $$GuidanceGroupPatternsTableAnnotationComposer,
          $$GuidanceGroupPatternsTableCreateCompanionBuilder,
          $$GuidanceGroupPatternsTableUpdateCompanionBuilder,
          (GuidanceGroupPattern, $$GuidanceGroupPatternsTableReferences),
          GuidanceGroupPattern,
          PrefetchHooks Function({bool guidanceGroup, bool guidancePattern})
        > {
  $$GuidanceGroupPatternsTableTableManager(
    _$Database db,
    $GuidanceGroupPatternsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$GuidanceGroupPatternsTableFilterComposer(
                $db: db,
                $table: table,
              ),
          createOrderingComposer: () =>
              $$GuidanceGroupPatternsTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer: () =>
              $$GuidanceGroupPatternsTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<int> guidanceGroup = const Value.absent(),
                Value<int> guidancePattern = const Value.absent(),
              }) => GuidanceGroupPatternsCompanion(
                guidanceGroup: guidanceGroup,
                guidancePattern: guidancePattern,
              ),
          createCompanionCallback:
              ({required int guidanceGroup, required int guidancePattern}) =>
                  GuidanceGroupPatternsCompanion.insert(
                    guidanceGroup: guidanceGroup,
                    guidancePattern: guidancePattern,
                  ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$GuidanceGroupPatternsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({guidanceGroup = false, guidancePattern = false}) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [],
                  addJoins:
                      <
                        T extends TableManagerState<
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic
                        >
                      >(state) {
                        if (guidanceGroup) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.guidanceGroup,
                                    referencedTable:
                                        $$GuidanceGroupPatternsTableReferences
                                            ._guidanceGroupTable(db),
                                    referencedColumn:
                                        $$GuidanceGroupPatternsTableReferences
                                            ._guidanceGroupTable(db)
                                            .id,
                                  )
                                  as T;
                        }
                        if (guidancePattern) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.guidancePattern,
                                    referencedTable:
                                        $$GuidanceGroupPatternsTableReferences
                                            ._guidancePatternTable(db),
                                    referencedColumn:
                                        $$GuidanceGroupPatternsTableReferences
                                            ._guidancePatternTable(db)
                                            .id,
                                  )
                                  as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [];
                  },
                );
              },
        ),
      );
}

typedef $$GuidanceGroupPatternsTableProcessedTableManager =
    ProcessedTableManager<
      _$Database,
      $GuidanceGroupPatternsTable,
      GuidanceGroupPattern,
      $$GuidanceGroupPatternsTableFilterComposer,
      $$GuidanceGroupPatternsTableOrderingComposer,
      $$GuidanceGroupPatternsTableAnnotationComposer,
      $$GuidanceGroupPatternsTableCreateCompanionBuilder,
      $$GuidanceGroupPatternsTableUpdateCompanionBuilder,
      (GuidanceGroupPattern, $$GuidanceGroupPatternsTableReferences),
      GuidanceGroupPattern,
      PrefetchHooks Function({bool guidanceGroup, bool guidancePattern})
    >;
typedef $$PointsTableCreateCompanionBuilder =
    PointsCompanion Function({
      Value<DateTime> createdAt,
      Value<DateTime?> lastUpdatedAt,
      Value<int> id,
      required PointType type,
      Value<String?> name,
      required double latitude,
      required double longitude,
      Value<double?> elevation,
    });
typedef $$PointsTableUpdateCompanionBuilder =
    PointsCompanion Function({
      Value<DateTime> createdAt,
      Value<DateTime?> lastUpdatedAt,
      Value<int> id,
      Value<PointType> type,
      Value<String?> name,
      Value<double> latitude,
      Value<double> longitude,
      Value<double?> elevation,
    });

final class $$PointsTableReferences
    extends BaseReferences<_$Database, $PointsTable, Point> {
  $$PointsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$LineStringPointsTable, List<LineStringPoint>>
  _lineStringPointPointTable(_$Database db) => MultiTypedResultKey.fromTable(
    db.lineStringPoints,
    aliasName: $_aliasNameGenerator(db.points.id, db.lineStringPoints.point),
  );

  $$LineStringPointsTableProcessedTableManager get lineStringPointPoint {
    final manager = $$LineStringPointsTableTableManager(
      $_db,
      $_db.lineStringPoints,
    ).filter((f) => f.point.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _lineStringPointPointTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$PartfieldPointsTable, List<PartfieldPoint>>
  _partfieldPointPointTable(_$Database db) => MultiTypedResultKey.fromTable(
    db.partfieldPoints,
    aliasName: $_aliasNameGenerator(db.points.id, db.partfieldPoints.point),
  );

  $$PartfieldPointsTableProcessedTableManager get partfieldPointPoint {
    final manager = $$PartfieldPointsTableTableManager(
      $_db,
      $_db.partfieldPoints,
    ).filter((f) => f.point.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _partfieldPointPointTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$PointsTableFilterComposer extends Composer<_$Database, $PointsTable> {
  $$PointsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get lastUpdatedAt => $composableBuilder(
    column: $table.lastUpdatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<PointType, PointType, int> get type =>
      $composableBuilder(
        column: $table.type,
        builder: (column) => ColumnWithTypeConverterFilters(column),
      );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get latitude => $composableBuilder(
    column: $table.latitude,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get longitude => $composableBuilder(
    column: $table.longitude,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get elevation => $composableBuilder(
    column: $table.elevation,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> lineStringPointPoint(
    Expression<bool> Function($$LineStringPointsTableFilterComposer f) f,
  ) {
    final $$LineStringPointsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.lineStringPoints,
      getReferencedColumn: (t) => t.point,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$LineStringPointsTableFilterComposer(
            $db: $db,
            $table: $db.lineStringPoints,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> partfieldPointPoint(
    Expression<bool> Function($$PartfieldPointsTableFilterComposer f) f,
  ) {
    final $$PartfieldPointsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.partfieldPoints,
      getReferencedColumn: (t) => t.point,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PartfieldPointsTableFilterComposer(
            $db: $db,
            $table: $db.partfieldPoints,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$PointsTableOrderingComposer extends Composer<_$Database, $PointsTable> {
  $$PointsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get lastUpdatedAt => $composableBuilder(
    column: $table.lastUpdatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get type => $composableBuilder(
    column: $table.type,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get latitude => $composableBuilder(
    column: $table.latitude,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get longitude => $composableBuilder(
    column: $table.longitude,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get elevation => $composableBuilder(
    column: $table.elevation,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$PointsTableAnnotationComposer
    extends Composer<_$Database, $PointsTable> {
  $$PointsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get lastUpdatedAt => $composableBuilder(
    column: $table.lastUpdatedAt,
    builder: (column) => column,
  );

  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumnWithTypeConverter<PointType, int> get type =>
      $composableBuilder(column: $table.type, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<double> get latitude =>
      $composableBuilder(column: $table.latitude, builder: (column) => column);

  GeneratedColumn<double> get longitude =>
      $composableBuilder(column: $table.longitude, builder: (column) => column);

  GeneratedColumn<double> get elevation =>
      $composableBuilder(column: $table.elevation, builder: (column) => column);

  Expression<T> lineStringPointPoint<T extends Object>(
    Expression<T> Function($$LineStringPointsTableAnnotationComposer a) f,
  ) {
    final $$LineStringPointsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.lineStringPoints,
      getReferencedColumn: (t) => t.point,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$LineStringPointsTableAnnotationComposer(
            $db: $db,
            $table: $db.lineStringPoints,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> partfieldPointPoint<T extends Object>(
    Expression<T> Function($$PartfieldPointsTableAnnotationComposer a) f,
  ) {
    final $$PartfieldPointsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.partfieldPoints,
      getReferencedColumn: (t) => t.point,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PartfieldPointsTableAnnotationComposer(
            $db: $db,
            $table: $db.partfieldPoints,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$PointsTableTableManager
    extends
        RootTableManager<
          _$Database,
          $PointsTable,
          Point,
          $$PointsTableFilterComposer,
          $$PointsTableOrderingComposer,
          $$PointsTableAnnotationComposer,
          $$PointsTableCreateCompanionBuilder,
          $$PointsTableUpdateCompanionBuilder,
          (Point, $$PointsTableReferences),
          Point,
          PrefetchHooks Function({
            bool lineStringPointPoint,
            bool partfieldPointPoint,
          })
        > {
  $$PointsTableTableManager(_$Database db, $PointsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$PointsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$PointsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$PointsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime?> lastUpdatedAt = const Value.absent(),
                Value<int> id = const Value.absent(),
                Value<PointType> type = const Value.absent(),
                Value<String?> name = const Value.absent(),
                Value<double> latitude = const Value.absent(),
                Value<double> longitude = const Value.absent(),
                Value<double?> elevation = const Value.absent(),
              }) => PointsCompanion(
                createdAt: createdAt,
                lastUpdatedAt: lastUpdatedAt,
                id: id,
                type: type,
                name: name,
                latitude: latitude,
                longitude: longitude,
                elevation: elevation,
              ),
          createCompanionCallback:
              ({
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime?> lastUpdatedAt = const Value.absent(),
                Value<int> id = const Value.absent(),
                required PointType type,
                Value<String?> name = const Value.absent(),
                required double latitude,
                required double longitude,
                Value<double?> elevation = const Value.absent(),
              }) => PointsCompanion.insert(
                createdAt: createdAt,
                lastUpdatedAt: lastUpdatedAt,
                id: id,
                type: type,
                name: name,
                latitude: latitude,
                longitude: longitude,
                elevation: elevation,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) =>
                    (e.readTable(table), $$PointsTableReferences(db, table, e)),
              )
              .toList(),
          prefetchHooksCallback:
              ({lineStringPointPoint = false, partfieldPointPoint = false}) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (lineStringPointPoint) db.lineStringPoints,
                    if (partfieldPointPoint) db.partfieldPoints,
                  ],
                  addJoins: null,
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (lineStringPointPoint)
                        await $_getPrefetchedData<
                          Point,
                          $PointsTable,
                          LineStringPoint
                        >(
                          currentTable: table,
                          referencedTable: $$PointsTableReferences
                              ._lineStringPointPointTable(db),
                          managerFromTypedResult: (p0) =>
                              $$PointsTableReferences(
                                db,
                                table,
                                p0,
                              ).lineStringPointPoint,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.point == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (partfieldPointPoint)
                        await $_getPrefetchedData<
                          Point,
                          $PointsTable,
                          PartfieldPoint
                        >(
                          currentTable: table,
                          referencedTable: $$PointsTableReferences
                              ._partfieldPointPointTable(db),
                          managerFromTypedResult: (p0) =>
                              $$PointsTableReferences(
                                db,
                                table,
                                p0,
                              ).partfieldPointPoint,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.point == item.id,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$PointsTableProcessedTableManager =
    ProcessedTableManager<
      _$Database,
      $PointsTable,
      Point,
      $$PointsTableFilterComposer,
      $$PointsTableOrderingComposer,
      $$PointsTableAnnotationComposer,
      $$PointsTableCreateCompanionBuilder,
      $$PointsTableUpdateCompanionBuilder,
      (Point, $$PointsTableReferences),
      Point,
      PrefetchHooks Function({
        bool lineStringPointPoint,
        bool partfieldPointPoint,
      })
    >;
typedef $$LineStringPointsTableCreateCompanionBuilder =
    LineStringPointsCompanion Function({
      required int lineString,
      required int point,
    });
typedef $$LineStringPointsTableUpdateCompanionBuilder =
    LineStringPointsCompanion Function({
      Value<int> lineString,
      Value<int> point,
    });

final class $$LineStringPointsTableReferences
    extends
        BaseReferences<_$Database, $LineStringPointsTable, LineStringPoint> {
  $$LineStringPointsTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $LineStringsTable _lineStringTable(_$Database db) =>
      db.lineStrings.createAlias(
        $_aliasNameGenerator(db.lineStringPoints.lineString, db.lineStrings.id),
      );

  $$LineStringsTableProcessedTableManager get lineString {
    final $_column = $_itemColumn<int>('line_string')!;

    final manager = $$LineStringsTableTableManager(
      $_db,
      $_db.lineStrings,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_lineStringTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $PointsTable _pointTable(_$Database db) => db.points.createAlias(
    $_aliasNameGenerator(db.lineStringPoints.point, db.points.id),
  );

  $$PointsTableProcessedTableManager get point {
    final $_column = $_itemColumn<int>('point')!;

    final manager = $$PointsTableTableManager(
      $_db,
      $_db.points,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_pointTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$LineStringPointsTableFilterComposer
    extends Composer<_$Database, $LineStringPointsTable> {
  $$LineStringPointsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  $$LineStringsTableFilterComposer get lineString {
    final $$LineStringsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.lineString,
      referencedTable: $db.lineStrings,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$LineStringsTableFilterComposer(
            $db: $db,
            $table: $db.lineStrings,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$PointsTableFilterComposer get point {
    final $$PointsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.point,
      referencedTable: $db.points,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PointsTableFilterComposer(
            $db: $db,
            $table: $db.points,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$LineStringPointsTableOrderingComposer
    extends Composer<_$Database, $LineStringPointsTable> {
  $$LineStringPointsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  $$LineStringsTableOrderingComposer get lineString {
    final $$LineStringsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.lineString,
      referencedTable: $db.lineStrings,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$LineStringsTableOrderingComposer(
            $db: $db,
            $table: $db.lineStrings,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$PointsTableOrderingComposer get point {
    final $$PointsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.point,
      referencedTable: $db.points,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PointsTableOrderingComposer(
            $db: $db,
            $table: $db.points,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$LineStringPointsTableAnnotationComposer
    extends Composer<_$Database, $LineStringPointsTable> {
  $$LineStringPointsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  $$LineStringsTableAnnotationComposer get lineString {
    final $$LineStringsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.lineString,
      referencedTable: $db.lineStrings,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$LineStringsTableAnnotationComposer(
            $db: $db,
            $table: $db.lineStrings,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$PointsTableAnnotationComposer get point {
    final $$PointsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.point,
      referencedTable: $db.points,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PointsTableAnnotationComposer(
            $db: $db,
            $table: $db.points,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$LineStringPointsTableTableManager
    extends
        RootTableManager<
          _$Database,
          $LineStringPointsTable,
          LineStringPoint,
          $$LineStringPointsTableFilterComposer,
          $$LineStringPointsTableOrderingComposer,
          $$LineStringPointsTableAnnotationComposer,
          $$LineStringPointsTableCreateCompanionBuilder,
          $$LineStringPointsTableUpdateCompanionBuilder,
          (LineStringPoint, $$LineStringPointsTableReferences),
          LineStringPoint,
          PrefetchHooks Function({bool lineString, bool point})
        > {
  $$LineStringPointsTableTableManager(
    _$Database db,
    $LineStringPointsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$LineStringPointsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$LineStringPointsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$LineStringPointsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> lineString = const Value.absent(),
                Value<int> point = const Value.absent(),
              }) => LineStringPointsCompanion(
                lineString: lineString,
                point: point,
              ),
          createCompanionCallback:
              ({required int lineString, required int point}) =>
                  LineStringPointsCompanion.insert(
                    lineString: lineString,
                    point: point,
                  ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$LineStringPointsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({lineString = false, point = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (lineString) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.lineString,
                                referencedTable:
                                    $$LineStringPointsTableReferences
                                        ._lineStringTable(db),
                                referencedColumn:
                                    $$LineStringPointsTableReferences
                                        ._lineStringTable(db)
                                        .id,
                              )
                              as T;
                    }
                    if (point) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.point,
                                referencedTable:
                                    $$LineStringPointsTableReferences
                                        ._pointTable(db),
                                referencedColumn:
                                    $$LineStringPointsTableReferences
                                        ._pointTable(db)
                                        .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$LineStringPointsTableProcessedTableManager =
    ProcessedTableManager<
      _$Database,
      $LineStringPointsTable,
      LineStringPoint,
      $$LineStringPointsTableFilterComposer,
      $$LineStringPointsTableOrderingComposer,
      $$LineStringPointsTableAnnotationComposer,
      $$LineStringPointsTableCreateCompanionBuilder,
      $$LineStringPointsTableUpdateCompanionBuilder,
      (LineStringPoint, $$LineStringPointsTableReferences),
      LineStringPoint,
      PrefetchHooks Function({bool lineString, bool point})
    >;
typedef $$LinksTableCreateCompanionBuilder =
    LinksCompanion Function({
      required LinkTableRef tableRef,
      required int refId,
      Value<String> linkValue,
      Value<String?> name,
    });
typedef $$LinksTableUpdateCompanionBuilder =
    LinksCompanion Function({
      Value<LinkTableRef> tableRef,
      Value<int> refId,
      Value<String> linkValue,
      Value<String?> name,
    });

class $$LinksTableFilterComposer extends Composer<_$Database, $LinksTable> {
  $$LinksTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnWithTypeConverterFilters<LinkTableRef, LinkTableRef, String>
  get tableRef => $composableBuilder(
    column: $table.tableRef,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );

  ColumnFilters<int> get refId => $composableBuilder(
    column: $table.refId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get linkValue => $composableBuilder(
    column: $table.linkValue,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );
}

class $$LinksTableOrderingComposer extends Composer<_$Database, $LinksTable> {
  $$LinksTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get tableRef => $composableBuilder(
    column: $table.tableRef,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get refId => $composableBuilder(
    column: $table.refId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get linkValue => $composableBuilder(
    column: $table.linkValue,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$LinksTableAnnotationComposer extends Composer<_$Database, $LinksTable> {
  $$LinksTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumnWithTypeConverter<LinkTableRef, String> get tableRef =>
      $composableBuilder(column: $table.tableRef, builder: (column) => column);

  GeneratedColumn<int> get refId =>
      $composableBuilder(column: $table.refId, builder: (column) => column);

  GeneratedColumn<String> get linkValue =>
      $composableBuilder(column: $table.linkValue, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);
}

class $$LinksTableTableManager
    extends
        RootTableManager<
          _$Database,
          $LinksTable,
          Link,
          $$LinksTableFilterComposer,
          $$LinksTableOrderingComposer,
          $$LinksTableAnnotationComposer,
          $$LinksTableCreateCompanionBuilder,
          $$LinksTableUpdateCompanionBuilder,
          (Link, BaseReferences<_$Database, $LinksTable, Link>),
          Link,
          PrefetchHooks Function()
        > {
  $$LinksTableTableManager(_$Database db, $LinksTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$LinksTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$LinksTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$LinksTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<LinkTableRef> tableRef = const Value.absent(),
                Value<int> refId = const Value.absent(),
                Value<String> linkValue = const Value.absent(),
                Value<String?> name = const Value.absent(),
              }) => LinksCompanion(
                tableRef: tableRef,
                refId: refId,
                linkValue: linkValue,
                name: name,
              ),
          createCompanionCallback:
              ({
                required LinkTableRef tableRef,
                required int refId,
                Value<String> linkValue = const Value.absent(),
                Value<String?> name = const Value.absent(),
              }) => LinksCompanion.insert(
                tableRef: tableRef,
                refId: refId,
                linkValue: linkValue,
                name: name,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$LinksTableProcessedTableManager =
    ProcessedTableManager<
      _$Database,
      $LinksTable,
      Link,
      $$LinksTableFilterComposer,
      $$LinksTableOrderingComposer,
      $$LinksTableAnnotationComposer,
      $$LinksTableCreateCompanionBuilder,
      $$LinksTableUpdateCompanionBuilder,
      (Link, BaseReferences<_$Database, $LinksTable, Link>),
      Link,
      PrefetchHooks Function()
    >;
typedef $$PartfieldGuidanceGroupsTableCreateCompanionBuilder =
    PartfieldGuidanceGroupsCompanion Function({
      required int partfield,
      required int guidanceGroup,
    });
typedef $$PartfieldGuidanceGroupsTableUpdateCompanionBuilder =
    PartfieldGuidanceGroupsCompanion Function({
      Value<int> partfield,
      Value<int> guidanceGroup,
    });

final class $$PartfieldGuidanceGroupsTableReferences
    extends
        BaseReferences<
          _$Database,
          $PartfieldGuidanceGroupsTable,
          PartfieldGuidanceGroup
        > {
  $$PartfieldGuidanceGroupsTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $PartfieldsTable _partfieldTable(_$Database db) =>
      db.partfields.createAlias(
        $_aliasNameGenerator(
          db.partfieldGuidanceGroups.partfield,
          db.partfields.id,
        ),
      );

  $$PartfieldsTableProcessedTableManager get partfield {
    final $_column = $_itemColumn<int>('partfield')!;

    final manager = $$PartfieldsTableTableManager(
      $_db,
      $_db.partfields,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_partfieldTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $GuidanceGroupsTable _guidanceGroupTable(_$Database db) =>
      db.guidanceGroups.createAlias(
        $_aliasNameGenerator(
          db.partfieldGuidanceGroups.guidanceGroup,
          db.guidanceGroups.id,
        ),
      );

  $$GuidanceGroupsTableProcessedTableManager get guidanceGroup {
    final $_column = $_itemColumn<int>('guidance_group')!;

    final manager = $$GuidanceGroupsTableTableManager(
      $_db,
      $_db.guidanceGroups,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_guidanceGroupTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$PartfieldGuidanceGroupsTableFilterComposer
    extends Composer<_$Database, $PartfieldGuidanceGroupsTable> {
  $$PartfieldGuidanceGroupsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  $$PartfieldsTableFilterComposer get partfield {
    final $$PartfieldsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.partfield,
      referencedTable: $db.partfields,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PartfieldsTableFilterComposer(
            $db: $db,
            $table: $db.partfields,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$GuidanceGroupsTableFilterComposer get guidanceGroup {
    final $$GuidanceGroupsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.guidanceGroup,
      referencedTable: $db.guidanceGroups,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$GuidanceGroupsTableFilterComposer(
            $db: $db,
            $table: $db.guidanceGroups,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$PartfieldGuidanceGroupsTableOrderingComposer
    extends Composer<_$Database, $PartfieldGuidanceGroupsTable> {
  $$PartfieldGuidanceGroupsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  $$PartfieldsTableOrderingComposer get partfield {
    final $$PartfieldsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.partfield,
      referencedTable: $db.partfields,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PartfieldsTableOrderingComposer(
            $db: $db,
            $table: $db.partfields,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$GuidanceGroupsTableOrderingComposer get guidanceGroup {
    final $$GuidanceGroupsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.guidanceGroup,
      referencedTable: $db.guidanceGroups,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$GuidanceGroupsTableOrderingComposer(
            $db: $db,
            $table: $db.guidanceGroups,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$PartfieldGuidanceGroupsTableAnnotationComposer
    extends Composer<_$Database, $PartfieldGuidanceGroupsTable> {
  $$PartfieldGuidanceGroupsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  $$PartfieldsTableAnnotationComposer get partfield {
    final $$PartfieldsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.partfield,
      referencedTable: $db.partfields,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PartfieldsTableAnnotationComposer(
            $db: $db,
            $table: $db.partfields,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$GuidanceGroupsTableAnnotationComposer get guidanceGroup {
    final $$GuidanceGroupsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.guidanceGroup,
      referencedTable: $db.guidanceGroups,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$GuidanceGroupsTableAnnotationComposer(
            $db: $db,
            $table: $db.guidanceGroups,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$PartfieldGuidanceGroupsTableTableManager
    extends
        RootTableManager<
          _$Database,
          $PartfieldGuidanceGroupsTable,
          PartfieldGuidanceGroup,
          $$PartfieldGuidanceGroupsTableFilterComposer,
          $$PartfieldGuidanceGroupsTableOrderingComposer,
          $$PartfieldGuidanceGroupsTableAnnotationComposer,
          $$PartfieldGuidanceGroupsTableCreateCompanionBuilder,
          $$PartfieldGuidanceGroupsTableUpdateCompanionBuilder,
          (PartfieldGuidanceGroup, $$PartfieldGuidanceGroupsTableReferences),
          PartfieldGuidanceGroup,
          PrefetchHooks Function({bool partfield, bool guidanceGroup})
        > {
  $$PartfieldGuidanceGroupsTableTableManager(
    _$Database db,
    $PartfieldGuidanceGroupsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$PartfieldGuidanceGroupsTableFilterComposer(
                $db: db,
                $table: table,
              ),
          createOrderingComposer: () =>
              $$PartfieldGuidanceGroupsTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer: () =>
              $$PartfieldGuidanceGroupsTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<int> partfield = const Value.absent(),
                Value<int> guidanceGroup = const Value.absent(),
              }) => PartfieldGuidanceGroupsCompanion(
                partfield: partfield,
                guidanceGroup: guidanceGroup,
              ),
          createCompanionCallback:
              ({required int partfield, required int guidanceGroup}) =>
                  PartfieldGuidanceGroupsCompanion.insert(
                    partfield: partfield,
                    guidanceGroup: guidanceGroup,
                  ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$PartfieldGuidanceGroupsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({partfield = false, guidanceGroup = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (partfield) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.partfield,
                                referencedTable:
                                    $$PartfieldGuidanceGroupsTableReferences
                                        ._partfieldTable(db),
                                referencedColumn:
                                    $$PartfieldGuidanceGroupsTableReferences
                                        ._partfieldTable(db)
                                        .id,
                              )
                              as T;
                    }
                    if (guidanceGroup) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.guidanceGroup,
                                referencedTable:
                                    $$PartfieldGuidanceGroupsTableReferences
                                        ._guidanceGroupTable(db),
                                referencedColumn:
                                    $$PartfieldGuidanceGroupsTableReferences
                                        ._guidanceGroupTable(db)
                                        .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$PartfieldGuidanceGroupsTableProcessedTableManager =
    ProcessedTableManager<
      _$Database,
      $PartfieldGuidanceGroupsTable,
      PartfieldGuidanceGroup,
      $$PartfieldGuidanceGroupsTableFilterComposer,
      $$PartfieldGuidanceGroupsTableOrderingComposer,
      $$PartfieldGuidanceGroupsTableAnnotationComposer,
      $$PartfieldGuidanceGroupsTableCreateCompanionBuilder,
      $$PartfieldGuidanceGroupsTableUpdateCompanionBuilder,
      (PartfieldGuidanceGroup, $$PartfieldGuidanceGroupsTableReferences),
      PartfieldGuidanceGroup,
      PrefetchHooks Function({bool partfield, bool guidanceGroup})
    >;
typedef $$PartfieldPolygonsTableCreateCompanionBuilder =
    PartfieldPolygonsCompanion Function({
      required int partfield,
      required int polygon,
    });
typedef $$PartfieldPolygonsTableUpdateCompanionBuilder =
    PartfieldPolygonsCompanion Function({
      Value<int> partfield,
      Value<int> polygon,
    });

final class $$PartfieldPolygonsTableReferences
    extends
        BaseReferences<_$Database, $PartfieldPolygonsTable, PartfieldPolygon> {
  $$PartfieldPolygonsTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $PartfieldsTable _partfieldTable(_$Database db) =>
      db.partfields.createAlias(
        $_aliasNameGenerator(db.partfieldPolygons.partfield, db.partfields.id),
      );

  $$PartfieldsTableProcessedTableManager get partfield {
    final $_column = $_itemColumn<int>('partfield')!;

    final manager = $$PartfieldsTableTableManager(
      $_db,
      $_db.partfields,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_partfieldTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $PolygonsTable _polygonTable(_$Database db) => db.polygons.createAlias(
    $_aliasNameGenerator(db.partfieldPolygons.polygon, db.polygons.id),
  );

  $$PolygonsTableProcessedTableManager get polygon {
    final $_column = $_itemColumn<int>('polygon')!;

    final manager = $$PolygonsTableTableManager(
      $_db,
      $_db.polygons,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_polygonTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$PartfieldPolygonsTableFilterComposer
    extends Composer<_$Database, $PartfieldPolygonsTable> {
  $$PartfieldPolygonsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  $$PartfieldsTableFilterComposer get partfield {
    final $$PartfieldsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.partfield,
      referencedTable: $db.partfields,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PartfieldsTableFilterComposer(
            $db: $db,
            $table: $db.partfields,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$PolygonsTableFilterComposer get polygon {
    final $$PolygonsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.polygon,
      referencedTable: $db.polygons,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PolygonsTableFilterComposer(
            $db: $db,
            $table: $db.polygons,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$PartfieldPolygonsTableOrderingComposer
    extends Composer<_$Database, $PartfieldPolygonsTable> {
  $$PartfieldPolygonsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  $$PartfieldsTableOrderingComposer get partfield {
    final $$PartfieldsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.partfield,
      referencedTable: $db.partfields,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PartfieldsTableOrderingComposer(
            $db: $db,
            $table: $db.partfields,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$PolygonsTableOrderingComposer get polygon {
    final $$PolygonsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.polygon,
      referencedTable: $db.polygons,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PolygonsTableOrderingComposer(
            $db: $db,
            $table: $db.polygons,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$PartfieldPolygonsTableAnnotationComposer
    extends Composer<_$Database, $PartfieldPolygonsTable> {
  $$PartfieldPolygonsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  $$PartfieldsTableAnnotationComposer get partfield {
    final $$PartfieldsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.partfield,
      referencedTable: $db.partfields,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PartfieldsTableAnnotationComposer(
            $db: $db,
            $table: $db.partfields,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$PolygonsTableAnnotationComposer get polygon {
    final $$PolygonsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.polygon,
      referencedTable: $db.polygons,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PolygonsTableAnnotationComposer(
            $db: $db,
            $table: $db.polygons,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$PartfieldPolygonsTableTableManager
    extends
        RootTableManager<
          _$Database,
          $PartfieldPolygonsTable,
          PartfieldPolygon,
          $$PartfieldPolygonsTableFilterComposer,
          $$PartfieldPolygonsTableOrderingComposer,
          $$PartfieldPolygonsTableAnnotationComposer,
          $$PartfieldPolygonsTableCreateCompanionBuilder,
          $$PartfieldPolygonsTableUpdateCompanionBuilder,
          (PartfieldPolygon, $$PartfieldPolygonsTableReferences),
          PartfieldPolygon,
          PrefetchHooks Function({bool partfield, bool polygon})
        > {
  $$PartfieldPolygonsTableTableManager(
    _$Database db,
    $PartfieldPolygonsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$PartfieldPolygonsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$PartfieldPolygonsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$PartfieldPolygonsTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<int> partfield = const Value.absent(),
                Value<int> polygon = const Value.absent(),
              }) => PartfieldPolygonsCompanion(
                partfield: partfield,
                polygon: polygon,
              ),
          createCompanionCallback:
              ({required int partfield, required int polygon}) =>
                  PartfieldPolygonsCompanion.insert(
                    partfield: partfield,
                    polygon: polygon,
                  ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$PartfieldPolygonsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({partfield = false, polygon = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (partfield) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.partfield,
                                referencedTable:
                                    $$PartfieldPolygonsTableReferences
                                        ._partfieldTable(db),
                                referencedColumn:
                                    $$PartfieldPolygonsTableReferences
                                        ._partfieldTable(db)
                                        .id,
                              )
                              as T;
                    }
                    if (polygon) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.polygon,
                                referencedTable:
                                    $$PartfieldPolygonsTableReferences
                                        ._polygonTable(db),
                                referencedColumn:
                                    $$PartfieldPolygonsTableReferences
                                        ._polygonTable(db)
                                        .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$PartfieldPolygonsTableProcessedTableManager =
    ProcessedTableManager<
      _$Database,
      $PartfieldPolygonsTable,
      PartfieldPolygon,
      $$PartfieldPolygonsTableFilterComposer,
      $$PartfieldPolygonsTableOrderingComposer,
      $$PartfieldPolygonsTableAnnotationComposer,
      $$PartfieldPolygonsTableCreateCompanionBuilder,
      $$PartfieldPolygonsTableUpdateCompanionBuilder,
      (PartfieldPolygon, $$PartfieldPolygonsTableReferences),
      PartfieldPolygon,
      PrefetchHooks Function({bool partfield, bool polygon})
    >;
typedef $$PartfieldLineStringsTableCreateCompanionBuilder =
    PartfieldLineStringsCompanion Function({
      required int partfield,
      required int lineString,
    });
typedef $$PartfieldLineStringsTableUpdateCompanionBuilder =
    PartfieldLineStringsCompanion Function({
      Value<int> partfield,
      Value<int> lineString,
    });

final class $$PartfieldLineStringsTableReferences
    extends
        BaseReferences<
          _$Database,
          $PartfieldLineStringsTable,
          PartfieldLineString
        > {
  $$PartfieldLineStringsTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $PartfieldsTable _partfieldTable(_$Database db) =>
      db.partfields.createAlias(
        $_aliasNameGenerator(
          db.partfieldLineStrings.partfield,
          db.partfields.id,
        ),
      );

  $$PartfieldsTableProcessedTableManager get partfield {
    final $_column = $_itemColumn<int>('partfield')!;

    final manager = $$PartfieldsTableTableManager(
      $_db,
      $_db.partfields,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_partfieldTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $LineStringsTable _lineStringTable(_$Database db) =>
      db.lineStrings.createAlias(
        $_aliasNameGenerator(
          db.partfieldLineStrings.lineString,
          db.lineStrings.id,
        ),
      );

  $$LineStringsTableProcessedTableManager get lineString {
    final $_column = $_itemColumn<int>('line_string')!;

    final manager = $$LineStringsTableTableManager(
      $_db,
      $_db.lineStrings,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_lineStringTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$PartfieldLineStringsTableFilterComposer
    extends Composer<_$Database, $PartfieldLineStringsTable> {
  $$PartfieldLineStringsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  $$PartfieldsTableFilterComposer get partfield {
    final $$PartfieldsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.partfield,
      referencedTable: $db.partfields,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PartfieldsTableFilterComposer(
            $db: $db,
            $table: $db.partfields,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$LineStringsTableFilterComposer get lineString {
    final $$LineStringsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.lineString,
      referencedTable: $db.lineStrings,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$LineStringsTableFilterComposer(
            $db: $db,
            $table: $db.lineStrings,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$PartfieldLineStringsTableOrderingComposer
    extends Composer<_$Database, $PartfieldLineStringsTable> {
  $$PartfieldLineStringsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  $$PartfieldsTableOrderingComposer get partfield {
    final $$PartfieldsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.partfield,
      referencedTable: $db.partfields,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PartfieldsTableOrderingComposer(
            $db: $db,
            $table: $db.partfields,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$LineStringsTableOrderingComposer get lineString {
    final $$LineStringsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.lineString,
      referencedTable: $db.lineStrings,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$LineStringsTableOrderingComposer(
            $db: $db,
            $table: $db.lineStrings,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$PartfieldLineStringsTableAnnotationComposer
    extends Composer<_$Database, $PartfieldLineStringsTable> {
  $$PartfieldLineStringsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  $$PartfieldsTableAnnotationComposer get partfield {
    final $$PartfieldsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.partfield,
      referencedTable: $db.partfields,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PartfieldsTableAnnotationComposer(
            $db: $db,
            $table: $db.partfields,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$LineStringsTableAnnotationComposer get lineString {
    final $$LineStringsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.lineString,
      referencedTable: $db.lineStrings,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$LineStringsTableAnnotationComposer(
            $db: $db,
            $table: $db.lineStrings,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$PartfieldLineStringsTableTableManager
    extends
        RootTableManager<
          _$Database,
          $PartfieldLineStringsTable,
          PartfieldLineString,
          $$PartfieldLineStringsTableFilterComposer,
          $$PartfieldLineStringsTableOrderingComposer,
          $$PartfieldLineStringsTableAnnotationComposer,
          $$PartfieldLineStringsTableCreateCompanionBuilder,
          $$PartfieldLineStringsTableUpdateCompanionBuilder,
          (PartfieldLineString, $$PartfieldLineStringsTableReferences),
          PartfieldLineString,
          PrefetchHooks Function({bool partfield, bool lineString})
        > {
  $$PartfieldLineStringsTableTableManager(
    _$Database db,
    $PartfieldLineStringsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$PartfieldLineStringsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$PartfieldLineStringsTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer: () =>
              $$PartfieldLineStringsTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<int> partfield = const Value.absent(),
                Value<int> lineString = const Value.absent(),
              }) => PartfieldLineStringsCompanion(
                partfield: partfield,
                lineString: lineString,
              ),
          createCompanionCallback:
              ({required int partfield, required int lineString}) =>
                  PartfieldLineStringsCompanion.insert(
                    partfield: partfield,
                    lineString: lineString,
                  ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$PartfieldLineStringsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({partfield = false, lineString = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (partfield) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.partfield,
                                referencedTable:
                                    $$PartfieldLineStringsTableReferences
                                        ._partfieldTable(db),
                                referencedColumn:
                                    $$PartfieldLineStringsTableReferences
                                        ._partfieldTable(db)
                                        .id,
                              )
                              as T;
                    }
                    if (lineString) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.lineString,
                                referencedTable:
                                    $$PartfieldLineStringsTableReferences
                                        ._lineStringTable(db),
                                referencedColumn:
                                    $$PartfieldLineStringsTableReferences
                                        ._lineStringTable(db)
                                        .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$PartfieldLineStringsTableProcessedTableManager =
    ProcessedTableManager<
      _$Database,
      $PartfieldLineStringsTable,
      PartfieldLineString,
      $$PartfieldLineStringsTableFilterComposer,
      $$PartfieldLineStringsTableOrderingComposer,
      $$PartfieldLineStringsTableAnnotationComposer,
      $$PartfieldLineStringsTableCreateCompanionBuilder,
      $$PartfieldLineStringsTableUpdateCompanionBuilder,
      (PartfieldLineString, $$PartfieldLineStringsTableReferences),
      PartfieldLineString,
      PrefetchHooks Function({bool partfield, bool lineString})
    >;
typedef $$PartfieldPointsTableCreateCompanionBuilder =
    PartfieldPointsCompanion Function({
      required int partfield,
      required int point,
    });
typedef $$PartfieldPointsTableUpdateCompanionBuilder =
    PartfieldPointsCompanion Function({Value<int> partfield, Value<int> point});

final class $$PartfieldPointsTableReferences
    extends BaseReferences<_$Database, $PartfieldPointsTable, PartfieldPoint> {
  $$PartfieldPointsTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $PartfieldsTable _partfieldTable(_$Database db) =>
      db.partfields.createAlias(
        $_aliasNameGenerator(db.partfieldPoints.partfield, db.partfields.id),
      );

  $$PartfieldsTableProcessedTableManager get partfield {
    final $_column = $_itemColumn<int>('partfield')!;

    final manager = $$PartfieldsTableTableManager(
      $_db,
      $_db.partfields,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_partfieldTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $PointsTable _pointTable(_$Database db) => db.points.createAlias(
    $_aliasNameGenerator(db.partfieldPoints.point, db.points.id),
  );

  $$PointsTableProcessedTableManager get point {
    final $_column = $_itemColumn<int>('point')!;

    final manager = $$PointsTableTableManager(
      $_db,
      $_db.points,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_pointTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$PartfieldPointsTableFilterComposer
    extends Composer<_$Database, $PartfieldPointsTable> {
  $$PartfieldPointsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  $$PartfieldsTableFilterComposer get partfield {
    final $$PartfieldsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.partfield,
      referencedTable: $db.partfields,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PartfieldsTableFilterComposer(
            $db: $db,
            $table: $db.partfields,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$PointsTableFilterComposer get point {
    final $$PointsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.point,
      referencedTable: $db.points,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PointsTableFilterComposer(
            $db: $db,
            $table: $db.points,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$PartfieldPointsTableOrderingComposer
    extends Composer<_$Database, $PartfieldPointsTable> {
  $$PartfieldPointsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  $$PartfieldsTableOrderingComposer get partfield {
    final $$PartfieldsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.partfield,
      referencedTable: $db.partfields,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PartfieldsTableOrderingComposer(
            $db: $db,
            $table: $db.partfields,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$PointsTableOrderingComposer get point {
    final $$PointsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.point,
      referencedTable: $db.points,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PointsTableOrderingComposer(
            $db: $db,
            $table: $db.points,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$PartfieldPointsTableAnnotationComposer
    extends Composer<_$Database, $PartfieldPointsTable> {
  $$PartfieldPointsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  $$PartfieldsTableAnnotationComposer get partfield {
    final $$PartfieldsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.partfield,
      referencedTable: $db.partfields,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PartfieldsTableAnnotationComposer(
            $db: $db,
            $table: $db.partfields,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$PointsTableAnnotationComposer get point {
    final $$PointsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.point,
      referencedTable: $db.points,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PointsTableAnnotationComposer(
            $db: $db,
            $table: $db.points,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$PartfieldPointsTableTableManager
    extends
        RootTableManager<
          _$Database,
          $PartfieldPointsTable,
          PartfieldPoint,
          $$PartfieldPointsTableFilterComposer,
          $$PartfieldPointsTableOrderingComposer,
          $$PartfieldPointsTableAnnotationComposer,
          $$PartfieldPointsTableCreateCompanionBuilder,
          $$PartfieldPointsTableUpdateCompanionBuilder,
          (PartfieldPoint, $$PartfieldPointsTableReferences),
          PartfieldPoint,
          PrefetchHooks Function({bool partfield, bool point})
        > {
  $$PartfieldPointsTableTableManager(_$Database db, $PartfieldPointsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$PartfieldPointsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$PartfieldPointsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$PartfieldPointsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> partfield = const Value.absent(),
                Value<int> point = const Value.absent(),
              }) =>
                  PartfieldPointsCompanion(partfield: partfield, point: point),
          createCompanionCallback:
              ({required int partfield, required int point}) =>
                  PartfieldPointsCompanion.insert(
                    partfield: partfield,
                    point: point,
                  ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$PartfieldPointsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({partfield = false, point = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (partfield) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.partfield,
                                referencedTable:
                                    $$PartfieldPointsTableReferences
                                        ._partfieldTable(db),
                                referencedColumn:
                                    $$PartfieldPointsTableReferences
                                        ._partfieldTable(db)
                                        .id,
                              )
                              as T;
                    }
                    if (point) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.point,
                                referencedTable:
                                    $$PartfieldPointsTableReferences
                                        ._pointTable(db),
                                referencedColumn:
                                    $$PartfieldPointsTableReferences
                                        ._pointTable(db)
                                        .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$PartfieldPointsTableProcessedTableManager =
    ProcessedTableManager<
      _$Database,
      $PartfieldPointsTable,
      PartfieldPoint,
      $$PartfieldPointsTableFilterComposer,
      $$PartfieldPointsTableOrderingComposer,
      $$PartfieldPointsTableAnnotationComposer,
      $$PartfieldPointsTableCreateCompanionBuilder,
      $$PartfieldPointsTableUpdateCompanionBuilder,
      (PartfieldPoint, $$PartfieldPointsTableReferences),
      PartfieldPoint,
      PrefetchHooks Function({bool partfield, bool point})
    >;
typedef $$PolygonLineStringsTableCreateCompanionBuilder =
    PolygonLineStringsCompanion Function({
      required int polygon,
      required int lineString,
      Value<int> rowid,
    });
typedef $$PolygonLineStringsTableUpdateCompanionBuilder =
    PolygonLineStringsCompanion Function({
      Value<int> polygon,
      Value<int> lineString,
      Value<int> rowid,
    });

final class $$PolygonLineStringsTableReferences
    extends
        BaseReferences<
          _$Database,
          $PolygonLineStringsTable,
          PolygonLineString
        > {
  $$PolygonLineStringsTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $PolygonsTable _polygonTable(_$Database db) => db.polygons.createAlias(
    $_aliasNameGenerator(db.polygonLineStrings.polygon, db.polygons.id),
  );

  $$PolygonsTableProcessedTableManager get polygon {
    final $_column = $_itemColumn<int>('polygon')!;

    final manager = $$PolygonsTableTableManager(
      $_db,
      $_db.polygons,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_polygonTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $LineStringsTable _lineStringTable(_$Database db) =>
      db.lineStrings.createAlias(
        $_aliasNameGenerator(
          db.polygonLineStrings.lineString,
          db.lineStrings.id,
        ),
      );

  $$LineStringsTableProcessedTableManager get lineString {
    final $_column = $_itemColumn<int>('line_string')!;

    final manager = $$LineStringsTableTableManager(
      $_db,
      $_db.lineStrings,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_lineStringTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$PolygonLineStringsTableFilterComposer
    extends Composer<_$Database, $PolygonLineStringsTable> {
  $$PolygonLineStringsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  $$PolygonsTableFilterComposer get polygon {
    final $$PolygonsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.polygon,
      referencedTable: $db.polygons,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PolygonsTableFilterComposer(
            $db: $db,
            $table: $db.polygons,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$LineStringsTableFilterComposer get lineString {
    final $$LineStringsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.lineString,
      referencedTable: $db.lineStrings,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$LineStringsTableFilterComposer(
            $db: $db,
            $table: $db.lineStrings,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$PolygonLineStringsTableOrderingComposer
    extends Composer<_$Database, $PolygonLineStringsTable> {
  $$PolygonLineStringsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  $$PolygonsTableOrderingComposer get polygon {
    final $$PolygonsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.polygon,
      referencedTable: $db.polygons,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PolygonsTableOrderingComposer(
            $db: $db,
            $table: $db.polygons,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$LineStringsTableOrderingComposer get lineString {
    final $$LineStringsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.lineString,
      referencedTable: $db.lineStrings,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$LineStringsTableOrderingComposer(
            $db: $db,
            $table: $db.lineStrings,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$PolygonLineStringsTableAnnotationComposer
    extends Composer<_$Database, $PolygonLineStringsTable> {
  $$PolygonLineStringsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  $$PolygonsTableAnnotationComposer get polygon {
    final $$PolygonsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.polygon,
      referencedTable: $db.polygons,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PolygonsTableAnnotationComposer(
            $db: $db,
            $table: $db.polygons,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$LineStringsTableAnnotationComposer get lineString {
    final $$LineStringsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.lineString,
      referencedTable: $db.lineStrings,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$LineStringsTableAnnotationComposer(
            $db: $db,
            $table: $db.lineStrings,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$PolygonLineStringsTableTableManager
    extends
        RootTableManager<
          _$Database,
          $PolygonLineStringsTable,
          PolygonLineString,
          $$PolygonLineStringsTableFilterComposer,
          $$PolygonLineStringsTableOrderingComposer,
          $$PolygonLineStringsTableAnnotationComposer,
          $$PolygonLineStringsTableCreateCompanionBuilder,
          $$PolygonLineStringsTableUpdateCompanionBuilder,
          (PolygonLineString, $$PolygonLineStringsTableReferences),
          PolygonLineString,
          PrefetchHooks Function({bool polygon, bool lineString})
        > {
  $$PolygonLineStringsTableTableManager(
    _$Database db,
    $PolygonLineStringsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$PolygonLineStringsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$PolygonLineStringsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$PolygonLineStringsTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<int> polygon = const Value.absent(),
                Value<int> lineString = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => PolygonLineStringsCompanion(
                polygon: polygon,
                lineString: lineString,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required int polygon,
                required int lineString,
                Value<int> rowid = const Value.absent(),
              }) => PolygonLineStringsCompanion.insert(
                polygon: polygon,
                lineString: lineString,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$PolygonLineStringsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({polygon = false, lineString = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (polygon) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.polygon,
                                referencedTable:
                                    $$PolygonLineStringsTableReferences
                                        ._polygonTable(db),
                                referencedColumn:
                                    $$PolygonLineStringsTableReferences
                                        ._polygonTable(db)
                                        .id,
                              )
                              as T;
                    }
                    if (lineString) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.lineString,
                                referencedTable:
                                    $$PolygonLineStringsTableReferences
                                        ._lineStringTable(db),
                                referencedColumn:
                                    $$PolygonLineStringsTableReferences
                                        ._lineStringTable(db)
                                        .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$PolygonLineStringsTableProcessedTableManager =
    ProcessedTableManager<
      _$Database,
      $PolygonLineStringsTable,
      PolygonLineString,
      $$PolygonLineStringsTableFilterComposer,
      $$PolygonLineStringsTableOrderingComposer,
      $$PolygonLineStringsTableAnnotationComposer,
      $$PolygonLineStringsTableCreateCompanionBuilder,
      $$PolygonLineStringsTableUpdateCompanionBuilder,
      (PolygonLineString, $$PolygonLineStringsTableReferences),
      PolygonLineString,
      PrefetchHooks Function({bool polygon, bool lineString})
    >;
typedef $$SectionsTableCreateCompanionBuilder =
    SectionsCompanion Function({
      Value<DateTime> createdAt,
      Value<DateTime?> lastUpdatedAt,
      Value<int> id,
      required int implement,
      required double longitudinalOffset,
      required double lateralOffset,
      required double width,
      required double length,
      Value<bool> automateActivation,
      Value<Color?> color,
      Value<Color?> workedPathColor,
    });
typedef $$SectionsTableUpdateCompanionBuilder =
    SectionsCompanion Function({
      Value<DateTime> createdAt,
      Value<DateTime?> lastUpdatedAt,
      Value<int> id,
      Value<int> implement,
      Value<double> longitudinalOffset,
      Value<double> lateralOffset,
      Value<double> width,
      Value<double> length,
      Value<bool> automateActivation,
      Value<Color?> color,
      Value<Color?> workedPathColor,
    });

final class $$SectionsTableReferences
    extends BaseReferences<_$Database, $SectionsTable, Section> {
  $$SectionsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $ImplementsTable _implementTable(_$Database db) =>
      db.implements.createAlias(
        $_aliasNameGenerator(db.sections.implement, db.implements.id),
      );

  $$ImplementsTableProcessedTableManager get implement {
    final $_column = $_itemColumn<int>('implement')!;

    final manager = $$ImplementsTableTableManager(
      $_db,
      $_db.implements,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_implementTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$SectionsTableFilterComposer
    extends Composer<_$Database, $SectionsTable> {
  $$SectionsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get lastUpdatedAt => $composableBuilder(
    column: $table.lastUpdatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get longitudinalOffset => $composableBuilder(
    column: $table.longitudinalOffset,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get lateralOffset => $composableBuilder(
    column: $table.lateralOffset,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get width => $composableBuilder(
    column: $table.width,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get length => $composableBuilder(
    column: $table.length,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get automateActivation => $composableBuilder(
    column: $table.automateActivation,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<Color?, Color, String> get color =>
      $composableBuilder(
        column: $table.color,
        builder: (column) => ColumnWithTypeConverterFilters(column),
      );

  ColumnWithTypeConverterFilters<Color?, Color, String> get workedPathColor =>
      $composableBuilder(
        column: $table.workedPathColor,
        builder: (column) => ColumnWithTypeConverterFilters(column),
      );

  $$ImplementsTableFilterComposer get implement {
    final $$ImplementsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.implement,
      referencedTable: $db.implements,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ImplementsTableFilterComposer(
            $db: $db,
            $table: $db.implements,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$SectionsTableOrderingComposer
    extends Composer<_$Database, $SectionsTable> {
  $$SectionsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get lastUpdatedAt => $composableBuilder(
    column: $table.lastUpdatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get longitudinalOffset => $composableBuilder(
    column: $table.longitudinalOffset,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get lateralOffset => $composableBuilder(
    column: $table.lateralOffset,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get width => $composableBuilder(
    column: $table.width,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get length => $composableBuilder(
    column: $table.length,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get automateActivation => $composableBuilder(
    column: $table.automateActivation,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get color => $composableBuilder(
    column: $table.color,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get workedPathColor => $composableBuilder(
    column: $table.workedPathColor,
    builder: (column) => ColumnOrderings(column),
  );

  $$ImplementsTableOrderingComposer get implement {
    final $$ImplementsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.implement,
      referencedTable: $db.implements,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ImplementsTableOrderingComposer(
            $db: $db,
            $table: $db.implements,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$SectionsTableAnnotationComposer
    extends Composer<_$Database, $SectionsTable> {
  $$SectionsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get lastUpdatedAt => $composableBuilder(
    column: $table.lastUpdatedAt,
    builder: (column) => column,
  );

  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<double> get longitudinalOffset => $composableBuilder(
    column: $table.longitudinalOffset,
    builder: (column) => column,
  );

  GeneratedColumn<double> get lateralOffset => $composableBuilder(
    column: $table.lateralOffset,
    builder: (column) => column,
  );

  GeneratedColumn<double> get width =>
      $composableBuilder(column: $table.width, builder: (column) => column);

  GeneratedColumn<double> get length =>
      $composableBuilder(column: $table.length, builder: (column) => column);

  GeneratedColumn<bool> get automateActivation => $composableBuilder(
    column: $table.automateActivation,
    builder: (column) => column,
  );

  GeneratedColumnWithTypeConverter<Color?, String> get color =>
      $composableBuilder(column: $table.color, builder: (column) => column);

  GeneratedColumnWithTypeConverter<Color?, String> get workedPathColor =>
      $composableBuilder(
        column: $table.workedPathColor,
        builder: (column) => column,
      );

  $$ImplementsTableAnnotationComposer get implement {
    final $$ImplementsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.implement,
      referencedTable: $db.implements,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ImplementsTableAnnotationComposer(
            $db: $db,
            $table: $db.implements,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$SectionsTableTableManager
    extends
        RootTableManager<
          _$Database,
          $SectionsTable,
          Section,
          $$SectionsTableFilterComposer,
          $$SectionsTableOrderingComposer,
          $$SectionsTableAnnotationComposer,
          $$SectionsTableCreateCompanionBuilder,
          $$SectionsTableUpdateCompanionBuilder,
          (Section, $$SectionsTableReferences),
          Section,
          PrefetchHooks Function({bool implement})
        > {
  $$SectionsTableTableManager(_$Database db, $SectionsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$SectionsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$SectionsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$SectionsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime?> lastUpdatedAt = const Value.absent(),
                Value<int> id = const Value.absent(),
                Value<int> implement = const Value.absent(),
                Value<double> longitudinalOffset = const Value.absent(),
                Value<double> lateralOffset = const Value.absent(),
                Value<double> width = const Value.absent(),
                Value<double> length = const Value.absent(),
                Value<bool> automateActivation = const Value.absent(),
                Value<Color?> color = const Value.absent(),
                Value<Color?> workedPathColor = const Value.absent(),
              }) => SectionsCompanion(
                createdAt: createdAt,
                lastUpdatedAt: lastUpdatedAt,
                id: id,
                implement: implement,
                longitudinalOffset: longitudinalOffset,
                lateralOffset: lateralOffset,
                width: width,
                length: length,
                automateActivation: automateActivation,
                color: color,
                workedPathColor: workedPathColor,
              ),
          createCompanionCallback:
              ({
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime?> lastUpdatedAt = const Value.absent(),
                Value<int> id = const Value.absent(),
                required int implement,
                required double longitudinalOffset,
                required double lateralOffset,
                required double width,
                required double length,
                Value<bool> automateActivation = const Value.absent(),
                Value<Color?> color = const Value.absent(),
                Value<Color?> workedPathColor = const Value.absent(),
              }) => SectionsCompanion.insert(
                createdAt: createdAt,
                lastUpdatedAt: lastUpdatedAt,
                id: id,
                implement: implement,
                longitudinalOffset: longitudinalOffset,
                lateralOffset: lateralOffset,
                width: width,
                length: length,
                automateActivation: automateActivation,
                color: color,
                workedPathColor: workedPathColor,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$SectionsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({implement = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (implement) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.implement,
                                referencedTable: $$SectionsTableReferences
                                    ._implementTable(db),
                                referencedColumn: $$SectionsTableReferences
                                    ._implementTable(db)
                                    .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$SectionsTableProcessedTableManager =
    ProcessedTableManager<
      _$Database,
      $SectionsTable,
      Section,
      $$SectionsTableFilterComposer,
      $$SectionsTableOrderingComposer,
      $$SectionsTableAnnotationComposer,
      $$SectionsTableCreateCompanionBuilder,
      $$SectionsTableUpdateCompanionBuilder,
      (Section, $$SectionsTableReferences),
      Section,
      PrefetchHooks Function({bool implement})
    >;

class $DatabaseManager {
  final _$Database _db;
  $DatabaseManager(this._db);
  $$PartfieldsTableTableManager get partfields =>
      $$PartfieldsTableTableManager(_db, _db.partfields);
  $$TasksTableTableManager get tasks =>
      $$TasksTableTableManager(_db, _db.tasks);
  $$VehiclesTableTableManager get vehicles =>
      $$VehiclesTableTableManager(_db, _db.vehicles);
  $$ImplementsTableTableManager get implements =>
      $$ImplementsTableTableManager(_db, _db.implements);
  $$ConnectorsTableTableManager get connectors =>
      $$ConnectorsTableTableManager(_db, _db.connectors);
  $$ConnectionsTableTableManager get connections =>
      $$ConnectionsTableTableManager(_db, _db.connections);
  $$PolygonsTableTableManager get polygons =>
      $$PolygonsTableTableManager(_db, _db.polygons);
  $$GuidanceGroupsTableTableManager get guidanceGroups =>
      $$GuidanceGroupsTableTableManager(_db, _db.guidanceGroups);
  $$GuidanceAllocationsTableTableManager get guidanceAllocations =>
      $$GuidanceAllocationsTableTableManager(_db, _db.guidanceAllocations);
  $$LineStringsTableTableManager get lineStrings =>
      $$LineStringsTableTableManager(_db, _db.lineStrings);
  $$GuidancePatternsTableTableManager get guidancePatterns =>
      $$GuidancePatternsTableTableManager(_db, _db.guidancePatterns);
  $$GuidanceGroupPatternsTableTableManager get guidanceGroupPatterns =>
      $$GuidanceGroupPatternsTableTableManager(_db, _db.guidanceGroupPatterns);
  $$PointsTableTableManager get points =>
      $$PointsTableTableManager(_db, _db.points);
  $$LineStringPointsTableTableManager get lineStringPoints =>
      $$LineStringPointsTableTableManager(_db, _db.lineStringPoints);
  $$LinksTableTableManager get links =>
      $$LinksTableTableManager(_db, _db.links);
  $$PartfieldGuidanceGroupsTableTableManager get partfieldGuidanceGroups =>
      $$PartfieldGuidanceGroupsTableTableManager(
        _db,
        _db.partfieldGuidanceGroups,
      );
  $$PartfieldPolygonsTableTableManager get partfieldPolygons =>
      $$PartfieldPolygonsTableTableManager(_db, _db.partfieldPolygons);
  $$PartfieldLineStringsTableTableManager get partfieldLineStrings =>
      $$PartfieldLineStringsTableTableManager(_db, _db.partfieldLineStrings);
  $$PartfieldPointsTableTableManager get partfieldPoints =>
      $$PartfieldPointsTableTableManager(_db, _db.partfieldPoints);
  $$PolygonLineStringsTableTableManager get polygonLineStrings =>
      $$PolygonLineStringsTableTableManager(_db, _db.polygonLineStrings);
  $$SectionsTableTableManager get sections =>
      $$SectionsTableTableManager(_db, _db.sections);
}
