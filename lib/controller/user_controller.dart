import 'package:flutter/material.dart';
import 'package:cadastro/database/user_database.dart';
import 'package:cadastro/model/user_model.dart';
import 'package:cadastro/ui/pages/telaSucesso.dart';

class UserController {
  //criamos o objeto DataBase para termos acesso a lista que fizemos nele
  UserDataBase userDataBase = UserDataBase();

  void cadastro(context, String nomeNovo, String senhaNova) {
    var newUser = User(name: nomeNovo, password: senhaNova);
    UserDataBase.users.add(newUser);
  }

  void login(context, String nome, String senha) {
    //passamos os valores que estão na lista de usuário para a variável lista
    var user = UserDataBase.users;
    //uso um iterador para percorrer a lista e verificar se existe o nome passado
    //armazeno o resultado dessa iteração na variável result
    var result = user.where((item) => item.name == nome);
    var resultDois = user.where((item) => item.password == senha);
    if (result.isNotEmpty && resultDois.isNotEmpty) {
      Navigator.pushAndRemoveUntil(context,
          MaterialPageRoute(builder: (_) => TelaSucesso()), (route) => false);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          backgroundColor: Colors.red, content: Text('Senha Inválida')));
    }
    //print do resultado
    print(result);
    print(resultDois);
  }

  void cadastrarUsuario(BuildContext context, String text, String text2) {}
}

// Classe para representar os dados do usuário


