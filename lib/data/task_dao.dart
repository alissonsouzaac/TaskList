import 'package:flutter_application_1/components/tasks.dart';
import 'package:flutter_application_1/data/database.dart';
import 'package:sqflite/sqflite.dart';

class TaskDao {
  static const String tableSql = 'CREATE TABLE $_tablename('
      '$_name TEXT, '
      '$_difficulty INTEGER, '
      '$_image TEXT)';

  static const String _tablename = 'taskTable';
  static const String _name = 'nome';
  static const String _difficulty = 'dificuldade';
  static const String _image = 'imagem';

  save(Tasks tarefa) async {
    print('criando task: ');
    final Database bancoDeDados = await getDatabase();
    var itemExists = await find(tarefa.nome);
    Map<String, dynamic> taskMap = toMap(tarefa);
    if (itemExists.isEmpty) {
      print('nova tarefa');
      return await bancoDeDados.insert(_tablename, taskMap);
    } else {
      print('tarefa já existe');
      return await bancoDeDados.update(_tablename, taskMap,
          where: '$_name = ?', whereArgs: [tarefa.nome]);
    }
  }

  Future<List<Tasks>> findAll() async {
    print('Acessando fildAll: ');
    final Database bancoDeDados = await getDatabase();
    final List<Map<String, dynamic>> result =
        await bancoDeDados.query(_tablename);
    print('Dados Encontrado: $result');

    return toList(result);
  }

  Future<List<Tasks>> find(String nomeDaTarefa) async {
    print('buscando uma tarefa: ');
    final Database bancoDeDados = await getDatabase();
    final List<Map<String, dynamic>> result = await bancoDeDados
        .query(_tablename, where: '$_name = ?', whereArgs: [nomeDaTarefa]);
    print('tarefa encontrada: ${toList(result)}');
    return toList(result);
  }

  delete(String nomeDaTarefa) async {
    print('entrou no delete: $nomeDaTarefa');
    final Database bancoDeDados = await getDatabase();
    return bancoDeDados
        .delete(_tablename, where: '$_name = ?', whereArgs: [nomeDaTarefa]);
  }

  List<Tasks> toList(List<Map<String, dynamic>> listaDeTarefa) {
    print('converte to List: ');
    final List<Tasks> tarefas = [];
    for (Map<String, dynamic> linha in listaDeTarefa) {
      final Tasks tarefa =
          Tasks(linha[_name], linha[_image], linha[_difficulty]);
      tarefas.add(tarefa);
    }

    print('Lista de tarefas $tarefas');
    return tarefas;
  }

  Map<String, dynamic> toMap(Tasks tarefa) {
    print('convertendo tarefa em map');
    final Map<String, dynamic> mapaDeTarefas = Map();
    mapaDeTarefas[_name] = tarefa.nome;
    mapaDeTarefas[_difficulty] = tarefa.dificuldade;
    mapaDeTarefas[_image] = tarefa.foto;
    print('mapa de tarefas: $mapaDeTarefas');

    return mapaDeTarefas;
  }
}
