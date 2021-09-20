import 'dart:async';
import 'package:floor/floor.dart';
import 'package:flutter_application_1/database/agencia_dao.dart';
import 'package:flutter_application_1/database/agendamentoDao.dart';
import 'package:flutter_application_1/database/banco_dao.dart';
import 'package:flutter_application_1/database/usuario_dao.dart';
import 'package:flutter_application_1/models/Agencia.dart';
import 'package:flutter_application_1/models/agendamento.dart';
import 'package:flutter_application_1/models/banco.dart';
import 'package:flutter_application_1/models/usuario.dart';
import 'package:sqflite/sqflite.dart' as sqflite;


part 'app_database.g.dart'; // the generated code will be there

@Database(version: 1, entities: [Agencia, Agendamento, Usuario, Banco])
abstract class AppDatabase extends FloorDatabase {
  AgenciaDao get agenciaDao;
  AgendamentoDao get agendamentoDao;
  BancoDao get bancoDao;
  UsuarioDao get usuarioDao;

}
