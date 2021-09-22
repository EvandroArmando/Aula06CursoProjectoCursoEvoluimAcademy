// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

// ignore: avoid_classes_with_only_static_members
class $FloorAppDatabase {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDatabaseBuilder databaseBuilder(String name) =>
      _$AppDatabaseBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDatabaseBuilder inMemoryDatabaseBuilder() =>
      _$AppDatabaseBuilder(null);
}

class _$AppDatabaseBuilder {
  _$AppDatabaseBuilder(this.name);

  final String? name;

  final List<Migration> _migrations = [];

  Callback? _callback;

  /// Adds migrations to the builder.
  _$AppDatabaseBuilder addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  /// Adds a database [Callback] to the builder.
  _$AppDatabaseBuilder addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  /// Creates the database and initializes it.
  Future<AppDatabase> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name!)
        : ':memory:';
    final database = _$AppDatabase();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$AppDatabase extends AppDatabase {
  _$AppDatabase([StreamController<String>? listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  AgenciaDao? _agenciaDaoInstance;

  AgendamentoDao? _agendamentoDaoInstance;

  BancoDao? _bancoDaoInstance;

  UsuarioDao? _usuarioDaoInstance;

  Future<sqflite.Database> open(String path, List<Migration> migrations,
      [Callback? callback]) async {
    final databaseOptions = sqflite.OpenDatabaseOptions(
      version: 1,
      onConfigure: (database) async {
        await database.execute('PRAGMA foreign_keys = ON');
        await callback?.onConfigure?.call(database);
      },
      onOpen: (database) async {
        await callback?.onOpen?.call(database);
      },
      onUpgrade: (database, startVersion, endVersion) async {
        await MigrationAdapter.runMigrations(
            database, startVersion, endVersion, migrations);

        await callback?.onUpgrade?.call(database, startVersion, endVersion);
      },
      onCreate: (database, version) async {
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `Agencia` (`id` INTEGER PRIMARY KEY AUTOINCREMENT, `nome` TEXT NOT NULL, `endereco` TEXT NOT NULL, `banco_id` INTEGER NOT NULL)');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `Agendamento` (`id` INTEGER PRIMARY KEY AUTOINCREMENT, `servico` TEXT NOT NULL, `dia` TEXT NOT NULL, `estado` INTEGER NOT NULL, `Periodo` TEXT NOT NULL, `agencia_id` INTEGER NOT NULL, `usuario_id` INTEGER NOT NULL, `num_ficha` INTEGER NOT NULL)');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `Usuario` (`id` INTEGER PRIMARY KEY AUTOINCREMENT, `nome` TEXT NOT NULL)');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `Banco` (`id` INTEGER PRIMARY KEY AUTOINCREMENT, `nome` TEXT NOT NULL, `logo` TEXT NOT NULL)');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  AgenciaDao get agenciaDao {
    return _agenciaDaoInstance ??= _$AgenciaDao(database, changeListener);
  }

  @override
  AgendamentoDao get agendamentoDao {
    return _agendamentoDaoInstance ??=
        _$AgendamentoDao(database, changeListener);
  }

  @override
  BancoDao get bancoDao {
    return _bancoDaoInstance ??= _$BancoDao(database, changeListener);
  }

  @override
  UsuarioDao get usuarioDao {
    return _usuarioDaoInstance ??= _$UsuarioDao(database, changeListener);
  }
}

class _$AgenciaDao extends AgenciaDao {
  _$AgenciaDao(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database, changeListener),
        _agenciaInsertionAdapter = InsertionAdapter(
            database,
            'Agencia',
            (Agencia item) => <String, Object?>{
                  'id': item.id,
                  'nome': item.nome,
                  'endereco': item.endereco,
                  'banco_id': item.banco_id
                },
            changeListener),
        _agenciaDeletionAdapter = DeletionAdapter(
            database,
            'Agencia',
            ['id'],
            (Agencia item) => <String, Object?>{
                  'id': item.id,
                  'nome': item.nome,
                  'endereco': item.endereco,
                  'banco_id': item.banco_id
                },
            changeListener);

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<Agencia> _agenciaInsertionAdapter;

  final DeletionAdapter<Agencia> _agenciaDeletionAdapter;

  @override
  Future<List<Agencia>> findAllAgencias() async {
    return _queryAdapter.queryList('SELECT * FROM Agencia',
        mapper: (Map<String, Object?> row) => Agencia(row['endereco'] as String,
            row['id'] as int?, row['nome'] as String, row['banco_id'] as int));
  }

  @override
  Stream<Agencia?> findAgenciaById(int id) {
    return _queryAdapter.queryStream('SELECT * FROM Agencia WHERE id = ?1',
        mapper: (Map<String, Object?> row) => Agencia(row['endereco'] as String,
            row['id'] as int?, row['nome'] as String, row['banco_id'] as int),
        arguments: [id],
        queryableName: 'Agencia',
        isView: false);
  }

  @override
  Future<void> insertAgencia(Agencia agencia) async {
    await _agenciaInsertionAdapter.insert(agencia, OnConflictStrategy.abort);
  }

  @override
  Future<int> deleteAgencia(Agencia agencia) {
    return _agenciaDeletionAdapter.deleteAndReturnChangedRows(agencia);
  }
}

class _$AgendamentoDao extends AgendamentoDao {
  _$AgendamentoDao(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database, changeListener),
        _agendamentoInsertionAdapter = InsertionAdapter(
            database,
            'Agendamento',
            (Agendamento item) => <String, Object?>{
                  'id': item.id,
                  'servico': item.servico,
                  'dia': item.dia,
                  'estado': _estadoConverter.encode(item.estado),
                  'Periodo': item.Periodo,
                  'agencia_id': item.agencia_id,
                  'usuario_id': item.usuario_id,
                  'num_ficha': item.num_ficha
                },
            changeListener),
        _agendamentoDeletionAdapter = DeletionAdapter(
            database,
            'Agendamento',
            ['id'],
            (Agendamento item) => <String, Object?>{
                  'id': item.id,
                  'servico': item.servico,
                  'dia': item.dia,
                  'estado': _estadoConverter.encode(item.estado),
                  'Periodo': item.Periodo,
                  'agencia_id': item.agencia_id,
                  'usuario_id': item.usuario_id,
                  'num_ficha': item.num_ficha
                },
            changeListener);

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<Agendamento> _agendamentoInsertionAdapter;

  final DeletionAdapter<Agendamento> _agendamentoDeletionAdapter;

  @override
  Future<List<Agendamento>> findAllAgendamentos() async {
    return _queryAdapter.queryList('SELECT * FROM Agendamento',
        mapper: (Map<String, Object?> row) => Agendamento(
            row['id'] as int?,
            row['servico'] as String,
            row['Periodo'] as String,
            row['dia'] as String,
            row['num_ficha'] as int,
            row['agencia_id'] as int,
            row['usuario_id'] as int));
  }

  @override
  Stream<Agendamento?> findAgendamentoById(int id) {
    return _queryAdapter.queryStream('SELECT * FROM Agendamento WHERE id = ?1',
        mapper: (Map<String, Object?> row) => Agendamento(
            row['id'] as int?,
            row['servico'] as String,
            row['Periodo'] as String,
            row['dia'] as String,
            row['num_ficha'] as int,
            row['agencia_id'] as int,
            row['usuario_id'] as int),
        arguments: [id],
        queryableName: 'Agendamento',
        isView: false);
  }

  @override
  Future<void> insertAgendamento(Agendamento agendamento) async {
    await _agendamentoInsertionAdapter.insert(
        agendamento, OnConflictStrategy.abort);
  }

  @override
  Future<int> deleteAgendameto(Agendamento agendamento) {
    return _agendamentoDeletionAdapter.deleteAndReturnChangedRows(agendamento);
  }
}

class _$BancoDao extends BancoDao {
  _$BancoDao(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database, changeListener),
        _bancoInsertionAdapter = InsertionAdapter(
            database,
            'Banco',
            (Banco item) => <String, Object?>{
                  'id': item.id,
                  'nome': item.nome,
                  'logo': item.logo
                },
            changeListener),
        _bancoDeletionAdapter = DeletionAdapter(
            database,
            'Banco',
            ['id'],
            (Banco item) => <String, Object?>{
                  'id': item.id,
                  'nome': item.nome,
                  'logo': item.logo
                },
            changeListener);

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<Banco> _bancoInsertionAdapter;

  final DeletionAdapter<Banco> _bancoDeletionAdapter;

  @override
  Future<List<Banco>> findAllBancos() async {
    return _queryAdapter.queryList('SELECT * FROM Banco',
        mapper: (Map<String, Object?> row) => Banco(
            row['nome'] as String, row['logo'] as String, row['id'] as int?));
  }

  @override
  Stream<Banco?> findBancoById(int id) {
    return _queryAdapter.queryStream('SELECT * FROM Banco WHERE id = ?1',
        mapper: (Map<String, Object?> row) => Banco(
            row['nome'] as String, row['logo'] as String, row['id'] as int?),
        arguments: [id],
        queryableName: 'Banco',
        isView: false);
  }

  @override
  Future<void> insertBanco(Banco banco) async {
    await _bancoInsertionAdapter.insert(banco, OnConflictStrategy.abort);
  }

  @override
  Future<int> deleteBanco(Banco banco) {
    return _bancoDeletionAdapter.deleteAndReturnChangedRows(banco);
  }
}

class _$UsuarioDao extends UsuarioDao {
  _$UsuarioDao(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database, changeListener),
        _usuarioInsertionAdapter = InsertionAdapter(
            database,
            'Usuario',
            (Usuario item) =>
                <String, Object?>{'id': item.id, 'nome': item.nome},
            changeListener),
        _usuarioDeletionAdapter = DeletionAdapter(
            database,
            'Usuario',
            ['id'],
            (Usuario item) =>
                <String, Object?>{'id': item.id, 'nome': item.nome},
            changeListener);

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<Usuario> _usuarioInsertionAdapter;

  final DeletionAdapter<Usuario> _usuarioDeletionAdapter;

  @override
  Future<List<Usuario>> findAllUsuarios() async {
    return _queryAdapter.queryList('SELECT * FROM Usuario',
        mapper: (Map<String, Object?> row) =>
            Usuario(row['id'] as int?, row['nome'] as String));
  }

  @override
  Stream<Usuario?> findUsuarioById(int id) {
    return _queryAdapter.queryStream('SELECT * FROM Usuario WHERE id = ?1',
        mapper: (Map<String, Object?> row) =>
            Usuario(row['id'] as int?, row['nome'] as String),
        arguments: [id],
        queryableName: 'Usuario',
        isView: false);
  }

  @override
  Future<void> insertUsuario(Usuario usuario) async {
    await _usuarioInsertionAdapter.insert(usuario, OnConflictStrategy.abort);
  }

  @override
  Future<int> deleteUsuario(Usuario usuario) {
    return _usuarioDeletionAdapter.deleteAndReturnChangedRows(usuario);
  }
}

// ignore_for_file: unused_element
final _estadoConverter = EstadoConverter();