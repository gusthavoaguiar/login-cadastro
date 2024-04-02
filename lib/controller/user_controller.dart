import 'package:flutter/material.dart';
import 'package:login_cadastro/database/user_database.dart';

class UserController {
  //criamos o objeto DataBase para termos acesso a lista que fizemos nele
  UserDataBase userDataBase = UserDataBase();

  void login(context, String nome, String senha) {
    //passamos os valores que estão na lista de usuário para a variável lista
    var user = userDataBase.users;

    //uso um iterador para percorrer a lista e verificar se existe o nome passado
    //armazeno o resultado dessa iteraçõa na variável result
    var result = user.where((item) => item.name == nome);
    //verifica se existe algum valor na lista
    if (result.isNotEmpty) {
      Navigator.pushAndRemoveUntil(context,
          MaterialPageRoute(builder: (_) => NovaRota()), (route) => false);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        backgroundColor: Colors.red,
        content: Text('Senha invalida'),
      ));
    }
  }
}
