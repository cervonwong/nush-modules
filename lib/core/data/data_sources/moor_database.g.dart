// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'moor_database.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class ModuleModel extends DataClass implements Insertable<ModuleModel> {
  final int id;
  final String code;
  final String name;
  final String description;
  final String remarks;
  final int modularCredits;
  final double workload;
  final int subjectId;
  final int semesterTypeId;
  final int moduleTypeId;
  ModuleModel(
      {@required this.id,
      @required this.code,
      @required this.name,
      @required this.description,
      this.remarks,
      @required this.modularCredits,
      @required this.workload,
      @required this.subjectId,
      @required this.semesterTypeId,
      @required this.moduleTypeId});
  factory ModuleModel.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    final doubleType = db.typeSystem.forDartType<double>();
    return ModuleModel(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      code: stringType.mapFromDatabaseResponse(data['${effectivePrefix}code']),
      name: stringType.mapFromDatabaseResponse(data['${effectivePrefix}name']),
      description: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}description']),
      remarks:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}remarks']),
      modularCredits: intType
          .mapFromDatabaseResponse(data['${effectivePrefix}modular_credits']),
      workload: doubleType
          .mapFromDatabaseResponse(data['${effectivePrefix}workload']),
      subjectId:
          intType.mapFromDatabaseResponse(data['${effectivePrefix}subject_id']),
      semesterTypeId: intType
          .mapFromDatabaseResponse(data['${effectivePrefix}semester_type_id']),
      moduleTypeId: intType
          .mapFromDatabaseResponse(data['${effectivePrefix}module_type_id']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int>(id);
    }
    if (!nullToAbsent || code != null) {
      map['code'] = Variable<String>(code);
    }
    if (!nullToAbsent || name != null) {
      map['name'] = Variable<String>(name);
    }
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    if (!nullToAbsent || remarks != null) {
      map['remarks'] = Variable<String>(remarks);
    }
    if (!nullToAbsent || modularCredits != null) {
      map['modular_credits'] = Variable<int>(modularCredits);
    }
    if (!nullToAbsent || workload != null) {
      map['workload'] = Variable<double>(workload);
    }
    if (!nullToAbsent || subjectId != null) {
      map['subject_id'] = Variable<int>(subjectId);
    }
    if (!nullToAbsent || semesterTypeId != null) {
      map['semester_type_id'] = Variable<int>(semesterTypeId);
    }
    if (!nullToAbsent || moduleTypeId != null) {
      map['module_type_id'] = Variable<int>(moduleTypeId);
    }
    return map;
  }

  ModulesCompanion toCompanion(bool nullToAbsent) {
    return ModulesCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      code: code == null && nullToAbsent ? const Value.absent() : Value(code),
      name: name == null && nullToAbsent ? const Value.absent() : Value(name),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
      remarks: remarks == null && nullToAbsent
          ? const Value.absent()
          : Value(remarks),
      modularCredits: modularCredits == null && nullToAbsent
          ? const Value.absent()
          : Value(modularCredits),
      workload: workload == null && nullToAbsent
          ? const Value.absent()
          : Value(workload),
      subjectId: subjectId == null && nullToAbsent
          ? const Value.absent()
          : Value(subjectId),
      semesterTypeId: semesterTypeId == null && nullToAbsent
          ? const Value.absent()
          : Value(semesterTypeId),
      moduleTypeId: moduleTypeId == null && nullToAbsent
          ? const Value.absent()
          : Value(moduleTypeId),
    );
  }

  factory ModuleModel.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return ModuleModel(
      id: serializer.fromJson<int>(json['id']),
      code: serializer.fromJson<String>(json['code']),
      name: serializer.fromJson<String>(json['name']),
      description: serializer.fromJson<String>(json['description']),
      remarks: serializer.fromJson<String>(json['remarks']),
      modularCredits: serializer.fromJson<int>(json['modularCredits']),
      workload: serializer.fromJson<double>(json['workload']),
      subjectId: serializer.fromJson<int>(json['subjectId']),
      semesterTypeId: serializer.fromJson<int>(json['semesterTypeId']),
      moduleTypeId: serializer.fromJson<int>(json['moduleTypeId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'code': serializer.toJson<String>(code),
      'name': serializer.toJson<String>(name),
      'description': serializer.toJson<String>(description),
      'remarks': serializer.toJson<String>(remarks),
      'modularCredits': serializer.toJson<int>(modularCredits),
      'workload': serializer.toJson<double>(workload),
      'subjectId': serializer.toJson<int>(subjectId),
      'semesterTypeId': serializer.toJson<int>(semesterTypeId),
      'moduleTypeId': serializer.toJson<int>(moduleTypeId),
    };
  }

  ModuleModel copyWith(
          {int id,
          String code,
          String name,
          String description,
          String remarks,
          int modularCredits,
          double workload,
          int subjectId,
          int semesterTypeId,
          int moduleTypeId}) =>
      ModuleModel(
        id: id ?? this.id,
        code: code ?? this.code,
        name: name ?? this.name,
        description: description ?? this.description,
        remarks: remarks ?? this.remarks,
        modularCredits: modularCredits ?? this.modularCredits,
        workload: workload ?? this.workload,
        subjectId: subjectId ?? this.subjectId,
        semesterTypeId: semesterTypeId ?? this.semesterTypeId,
        moduleTypeId: moduleTypeId ?? this.moduleTypeId,
      );
  @override
  String toString() {
    return (StringBuffer('ModuleModel(')
          ..write('id: $id, ')
          ..write('code: $code, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('remarks: $remarks, ')
          ..write('modularCredits: $modularCredits, ')
          ..write('workload: $workload, ')
          ..write('subjectId: $subjectId, ')
          ..write('semesterTypeId: $semesterTypeId, ')
          ..write('moduleTypeId: $moduleTypeId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      id.hashCode,
      $mrjc(
          code.hashCode,
          $mrjc(
              name.hashCode,
              $mrjc(
                  description.hashCode,
                  $mrjc(
                      remarks.hashCode,
                      $mrjc(
                          modularCredits.hashCode,
                          $mrjc(
                              workload.hashCode,
                              $mrjc(
                                  subjectId.hashCode,
                                  $mrjc(semesterTypeId.hashCode,
                                      moduleTypeId.hashCode))))))))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is ModuleModel &&
          other.id == this.id &&
          other.code == this.code &&
          other.name == this.name &&
          other.description == this.description &&
          other.remarks == this.remarks &&
          other.modularCredits == this.modularCredits &&
          other.workload == this.workload &&
          other.subjectId == this.subjectId &&
          other.semesterTypeId == this.semesterTypeId &&
          other.moduleTypeId == this.moduleTypeId);
}

class ModulesCompanion extends UpdateCompanion<ModuleModel> {
  final Value<int> id;
  final Value<String> code;
  final Value<String> name;
  final Value<String> description;
  final Value<String> remarks;
  final Value<int> modularCredits;
  final Value<double> workload;
  final Value<int> subjectId;
  final Value<int> semesterTypeId;
  final Value<int> moduleTypeId;
  const ModulesCompanion({
    this.id = const Value.absent(),
    this.code = const Value.absent(),
    this.name = const Value.absent(),
    this.description = const Value.absent(),
    this.remarks = const Value.absent(),
    this.modularCredits = const Value.absent(),
    this.workload = const Value.absent(),
    this.subjectId = const Value.absent(),
    this.semesterTypeId = const Value.absent(),
    this.moduleTypeId = const Value.absent(),
  });
  ModulesCompanion.insert({
    this.id = const Value.absent(),
    @required String code,
    @required String name,
    @required String description,
    this.remarks = const Value.absent(),
    @required int modularCredits,
    @required double workload,
    @required int subjectId,
    @required int semesterTypeId,
    @required int moduleTypeId,
  })  : code = Value(code),
        name = Value(name),
        description = Value(description),
        modularCredits = Value(modularCredits),
        workload = Value(workload),
        subjectId = Value(subjectId),
        semesterTypeId = Value(semesterTypeId),
        moduleTypeId = Value(moduleTypeId);
  static Insertable<ModuleModel> custom({
    Expression<int> id,
    Expression<String> code,
    Expression<String> name,
    Expression<String> description,
    Expression<String> remarks,
    Expression<int> modularCredits,
    Expression<double> workload,
    Expression<int> subjectId,
    Expression<int> semesterTypeId,
    Expression<int> moduleTypeId,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (code != null) 'code': code,
      if (name != null) 'name': name,
      if (description != null) 'description': description,
      if (remarks != null) 'remarks': remarks,
      if (modularCredits != null) 'modular_credits': modularCredits,
      if (workload != null) 'workload': workload,
      if (subjectId != null) 'subject_id': subjectId,
      if (semesterTypeId != null) 'semester_type_id': semesterTypeId,
      if (moduleTypeId != null) 'module_type_id': moduleTypeId,
    });
  }

  ModulesCompanion copyWith(
      {Value<int> id,
      Value<String> code,
      Value<String> name,
      Value<String> description,
      Value<String> remarks,
      Value<int> modularCredits,
      Value<double> workload,
      Value<int> subjectId,
      Value<int> semesterTypeId,
      Value<int> moduleTypeId}) {
    return ModulesCompanion(
      id: id ?? this.id,
      code: code ?? this.code,
      name: name ?? this.name,
      description: description ?? this.description,
      remarks: remarks ?? this.remarks,
      modularCredits: modularCredits ?? this.modularCredits,
      workload: workload ?? this.workload,
      subjectId: subjectId ?? this.subjectId,
      semesterTypeId: semesterTypeId ?? this.semesterTypeId,
      moduleTypeId: moduleTypeId ?? this.moduleTypeId,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (code.present) {
      map['code'] = Variable<String>(code.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (remarks.present) {
      map['remarks'] = Variable<String>(remarks.value);
    }
    if (modularCredits.present) {
      map['modular_credits'] = Variable<int>(modularCredits.value);
    }
    if (workload.present) {
      map['workload'] = Variable<double>(workload.value);
    }
    if (subjectId.present) {
      map['subject_id'] = Variable<int>(subjectId.value);
    }
    if (semesterTypeId.present) {
      map['semester_type_id'] = Variable<int>(semesterTypeId.value);
    }
    if (moduleTypeId.present) {
      map['module_type_id'] = Variable<int>(moduleTypeId.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ModulesCompanion(')
          ..write('id: $id, ')
          ..write('code: $code, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('remarks: $remarks, ')
          ..write('modularCredits: $modularCredits, ')
          ..write('workload: $workload, ')
          ..write('subjectId: $subjectId, ')
          ..write('semesterTypeId: $semesterTypeId, ')
          ..write('moduleTypeId: $moduleTypeId')
          ..write(')'))
        .toString();
  }
}

class $ModulesTable extends Modules with TableInfo<$ModulesTable, ModuleModel> {
  final GeneratedDatabase _db;
  final String _alias;
  $ModulesTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;
  @override
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, false,
        $customConstraints: 'UNIQUE');
  }

  final VerificationMeta _codeMeta = const VerificationMeta('code');
  GeneratedTextColumn _code;
  @override
  GeneratedTextColumn get code => _code ??= _constructCode();
  GeneratedTextColumn _constructCode() {
    return GeneratedTextColumn('code', $tableName, false,
        minTextLength: 6, maxTextLength: 7);
  }

  final VerificationMeta _nameMeta = const VerificationMeta('name');
  GeneratedTextColumn _name;
  @override
  GeneratedTextColumn get name => _name ??= _constructName();
  GeneratedTextColumn _constructName() {
    return GeneratedTextColumn('name', $tableName, false, maxTextLength: 150);
  }

  final VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  GeneratedTextColumn _description;
  @override
  GeneratedTextColumn get description =>
      _description ??= _constructDescription();
  GeneratedTextColumn _constructDescription() {
    return GeneratedTextColumn(
      'description',
      $tableName,
      false,
    );
  }

  final VerificationMeta _remarksMeta = const VerificationMeta('remarks');
  GeneratedTextColumn _remarks;
  @override
  GeneratedTextColumn get remarks => _remarks ??= _constructRemarks();
  GeneratedTextColumn _constructRemarks() {
    return GeneratedTextColumn(
      'remarks',
      $tableName,
      true,
    );
  }

  final VerificationMeta _modularCreditsMeta =
      const VerificationMeta('modularCredits');
  GeneratedIntColumn _modularCredits;
  @override
  GeneratedIntColumn get modularCredits =>
      _modularCredits ??= _constructModularCredits();
  GeneratedIntColumn _constructModularCredits() {
    return GeneratedIntColumn(
      'modular_credits',
      $tableName,
      false,
    );
  }

  final VerificationMeta _workloadMeta = const VerificationMeta('workload');
  GeneratedRealColumn _workload;
  @override
  GeneratedRealColumn get workload => _workload ??= _constructWorkload();
  GeneratedRealColumn _constructWorkload() {
    return GeneratedRealColumn(
      'workload',
      $tableName,
      false,
    );
  }

  final VerificationMeta _subjectIdMeta = const VerificationMeta('subjectId');
  GeneratedIntColumn _subjectId;
  @override
  GeneratedIntColumn get subjectId => _subjectId ??= _constructSubjectId();
  GeneratedIntColumn _constructSubjectId() {
    return GeneratedIntColumn('subject_id', $tableName, false,
        $customConstraints: 'NOT NULL REFERENCES subjects(id)');
  }

  final VerificationMeta _semesterTypeIdMeta =
      const VerificationMeta('semesterTypeId');
  GeneratedIntColumn _semesterTypeId;
  @override
  GeneratedIntColumn get semesterTypeId =>
      _semesterTypeId ??= _constructSemesterTypeId();
  GeneratedIntColumn _constructSemesterTypeId() {
    return GeneratedIntColumn(
      'semester_type_id',
      $tableName,
      false,
    );
  }

  final VerificationMeta _moduleTypeIdMeta =
      const VerificationMeta('moduleTypeId');
  GeneratedIntColumn _moduleTypeId;
  @override
  GeneratedIntColumn get moduleTypeId =>
      _moduleTypeId ??= _constructModuleTypeId();
  GeneratedIntColumn _constructModuleTypeId() {
    return GeneratedIntColumn(
      'module_type_id',
      $tableName,
      false,
    );
  }

  @override
  List<GeneratedColumn> get $columns => [
        id,
        code,
        name,
        description,
        remarks,
        modularCredits,
        workload,
        subjectId,
        semesterTypeId,
        moduleTypeId
      ];
  @override
  $ModulesTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'modules';
  @override
  final String actualTableName = 'modules';
  @override
  VerificationContext validateIntegrity(Insertable<ModuleModel> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id'], _idMeta));
    }
    if (data.containsKey('code')) {
      context.handle(
          _codeMeta, code.isAcceptableOrUnknown(data['code'], _codeMeta));
    } else if (isInserting) {
      context.missing(_codeMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name'], _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description'], _descriptionMeta));
    } else if (isInserting) {
      context.missing(_descriptionMeta);
    }
    if (data.containsKey('remarks')) {
      context.handle(_remarksMeta,
          remarks.isAcceptableOrUnknown(data['remarks'], _remarksMeta));
    }
    if (data.containsKey('modular_credits')) {
      context.handle(
          _modularCreditsMeta,
          modularCredits.isAcceptableOrUnknown(
              data['modular_credits'], _modularCreditsMeta));
    } else if (isInserting) {
      context.missing(_modularCreditsMeta);
    }
    if (data.containsKey('workload')) {
      context.handle(_workloadMeta,
          workload.isAcceptableOrUnknown(data['workload'], _workloadMeta));
    } else if (isInserting) {
      context.missing(_workloadMeta);
    }
    if (data.containsKey('subject_id')) {
      context.handle(_subjectIdMeta,
          subjectId.isAcceptableOrUnknown(data['subject_id'], _subjectIdMeta));
    } else if (isInserting) {
      context.missing(_subjectIdMeta);
    }
    if (data.containsKey('semester_type_id')) {
      context.handle(
          _semesterTypeIdMeta,
          semesterTypeId.isAcceptableOrUnknown(
              data['semester_type_id'], _semesterTypeIdMeta));
    } else if (isInserting) {
      context.missing(_semesterTypeIdMeta);
    }
    if (data.containsKey('module_type_id')) {
      context.handle(
          _moduleTypeIdMeta,
          moduleTypeId.isAcceptableOrUnknown(
              data['module_type_id'], _moduleTypeIdMeta));
    } else if (isInserting) {
      context.missing(_moduleTypeIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ModuleModel map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return ModuleModel.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $ModulesTable createAlias(String alias) {
    return $ModulesTable(_db, alias);
  }
}

class SubjectModel extends DataClass implements Insertable<SubjectModel> {
  final int id;
  final String name;
  final int subjectColorId;
  SubjectModel(
      {@required this.id, @required this.name, @required this.subjectColorId});
  factory SubjectModel.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    return SubjectModel(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      name: stringType.mapFromDatabaseResponse(data['${effectivePrefix}name']),
      subjectColorId: intType
          .mapFromDatabaseResponse(data['${effectivePrefix}subject_color_id']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int>(id);
    }
    if (!nullToAbsent || name != null) {
      map['name'] = Variable<String>(name);
    }
    if (!nullToAbsent || subjectColorId != null) {
      map['subject_color_id'] = Variable<int>(subjectColorId);
    }
    return map;
  }

  SubjectsCompanion toCompanion(bool nullToAbsent) {
    return SubjectsCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      name: name == null && nullToAbsent ? const Value.absent() : Value(name),
      subjectColorId: subjectColorId == null && nullToAbsent
          ? const Value.absent()
          : Value(subjectColorId),
    );
  }

  factory SubjectModel.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return SubjectModel(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      subjectColorId: serializer.fromJson<int>(json['subjectColorId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'subjectColorId': serializer.toJson<int>(subjectColorId),
    };
  }

  SubjectModel copyWith({int id, String name, int subjectColorId}) =>
      SubjectModel(
        id: id ?? this.id,
        name: name ?? this.name,
        subjectColorId: subjectColorId ?? this.subjectColorId,
      );
  @override
  String toString() {
    return (StringBuffer('SubjectModel(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('subjectColorId: $subjectColorId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      $mrjf($mrjc(id.hashCode, $mrjc(name.hashCode, subjectColorId.hashCode)));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is SubjectModel &&
          other.id == this.id &&
          other.name == this.name &&
          other.subjectColorId == this.subjectColorId);
}

class SubjectsCompanion extends UpdateCompanion<SubjectModel> {
  final Value<int> id;
  final Value<String> name;
  final Value<int> subjectColorId;
  const SubjectsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.subjectColorId = const Value.absent(),
  });
  SubjectsCompanion.insert({
    this.id = const Value.absent(),
    @required String name,
    @required int subjectColorId,
  })  : name = Value(name),
        subjectColorId = Value(subjectColorId);
  static Insertable<SubjectModel> custom({
    Expression<int> id,
    Expression<String> name,
    Expression<int> subjectColorId,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (subjectColorId != null) 'subject_color_id': subjectColorId,
    });
  }

  SubjectsCompanion copyWith(
      {Value<int> id, Value<String> name, Value<int> subjectColorId}) {
    return SubjectsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      subjectColorId: subjectColorId ?? this.subjectColorId,
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
    if (subjectColorId.present) {
      map['subject_color_id'] = Variable<int>(subjectColorId.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SubjectsCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('subjectColorId: $subjectColorId')
          ..write(')'))
        .toString();
  }
}

class $SubjectsTable extends Subjects
    with TableInfo<$SubjectsTable, SubjectModel> {
  final GeneratedDatabase _db;
  final String _alias;
  $SubjectsTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;
  @override
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, false,
        $customConstraints: 'UNIQUE');
  }

  final VerificationMeta _nameMeta = const VerificationMeta('name');
  GeneratedTextColumn _name;
  @override
  GeneratedTextColumn get name => _name ??= _constructName();
  GeneratedTextColumn _constructName() {
    return GeneratedTextColumn('name', $tableName, false,
        $customConstraints: 'UNIQUE');
  }

  final VerificationMeta _subjectColorIdMeta =
      const VerificationMeta('subjectColorId');
  GeneratedIntColumn _subjectColorId;
  @override
  GeneratedIntColumn get subjectColorId =>
      _subjectColorId ??= _constructSubjectColorId();
  GeneratedIntColumn _constructSubjectColorId() {
    return GeneratedIntColumn('subject_color_id', $tableName, false,
        $customConstraints: 'NOT NULL REFERENCES subject_colors(id)');
  }

  @override
  List<GeneratedColumn> get $columns => [id, name, subjectColorId];
  @override
  $SubjectsTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'subjects';
  @override
  final String actualTableName = 'subjects';
  @override
  VerificationContext validateIntegrity(Insertable<SubjectModel> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id'], _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name'], _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('subject_color_id')) {
      context.handle(
          _subjectColorIdMeta,
          subjectColorId.isAcceptableOrUnknown(
              data['subject_color_id'], _subjectColorIdMeta));
    } else if (isInserting) {
      context.missing(_subjectColorIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  SubjectModel map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return SubjectModel.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $SubjectsTable createAlias(String alias) {
    return $SubjectsTable(_db, alias);
  }
}

class SubjectColorModel extends DataClass
    implements Insertable<SubjectColorModel> {
  final int id;
  final String name;
  SubjectColorModel({@required this.id, @required this.name});
  factory SubjectColorModel.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    return SubjectColorModel(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      name: stringType.mapFromDatabaseResponse(data['${effectivePrefix}name']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int>(id);
    }
    if (!nullToAbsent || name != null) {
      map['name'] = Variable<String>(name);
    }
    return map;
  }

  SubjectColorsCompanion toCompanion(bool nullToAbsent) {
    return SubjectColorsCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      name: name == null && nullToAbsent ? const Value.absent() : Value(name),
    );
  }

  factory SubjectColorModel.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return SubjectColorModel(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
    };
  }

  SubjectColorModel copyWith({int id, String name}) => SubjectColorModel(
        id: id ?? this.id,
        name: name ?? this.name,
      );
  @override
  String toString() {
    return (StringBuffer('SubjectColorModel(')
          ..write('id: $id, ')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(id.hashCode, name.hashCode));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is SubjectColorModel &&
          other.id == this.id &&
          other.name == this.name);
}

class SubjectColorsCompanion extends UpdateCompanion<SubjectColorModel> {
  final Value<int> id;
  final Value<String> name;
  const SubjectColorsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
  });
  SubjectColorsCompanion.insert({
    this.id = const Value.absent(),
    @required String name,
  }) : name = Value(name);
  static Insertable<SubjectColorModel> custom({
    Expression<int> id,
    Expression<String> name,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
    });
  }

  SubjectColorsCompanion copyWith({Value<int> id, Value<String> name}) {
    return SubjectColorsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
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
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SubjectColorsCompanion(')
          ..write('id: $id, ')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }
}

class $SubjectColorsTable extends SubjectColors
    with TableInfo<$SubjectColorsTable, SubjectColorModel> {
  final GeneratedDatabase _db;
  final String _alias;
  $SubjectColorsTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;
  @override
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, false,
        $customConstraints: 'UNIQUE');
  }

  final VerificationMeta _nameMeta = const VerificationMeta('name');
  GeneratedTextColumn _name;
  @override
  GeneratedTextColumn get name => _name ??= _constructName();
  GeneratedTextColumn _constructName() {
    return GeneratedTextColumn('name', $tableName, false,
        $customConstraints: 'UNIQUE');
  }

  @override
  List<GeneratedColumn> get $columns => [id, name];
  @override
  $SubjectColorsTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'subject_colors';
  @override
  final String actualTableName = 'subject_colors';
  @override
  VerificationContext validateIntegrity(Insertable<SubjectColorModel> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id'], _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name'], _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  SubjectColorModel map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return SubjectColorModel.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $SubjectColorsTable createAlias(String alias) {
    return $SubjectColorsTable(_db, alias);
  }
}

abstract class _$MoorDatabase extends GeneratedDatabase {
  _$MoorDatabase(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  $ModulesTable _modules;
  $ModulesTable get modules => _modules ??= $ModulesTable(this);
  $SubjectsTable _subjects;
  $SubjectsTable get subjects => _subjects ??= $SubjectsTable(this);
  $SubjectColorsTable _subjectColors;
  $SubjectColorsTable get subjectColors =>
      _subjectColors ??= $SubjectColorsTable(this);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [modules, subjects, subjectColors];
}
