import 'package:postgres/postgres.dart';

class AppDataBase{
  late PostgreSQLConnection connection;

  AppDataBase(){
    connection = ( connection == null || connection.isClosed == true
      ? PostgreSQLConnection(
          'ec2-52-20-143-167.compute-1.amazonaws.com',
          5432,
          'dd3v814jcok603',
          username: 'yzluwlnclkjeil',
          password: '9e4e3667212ee17a23c38c2853752d6929c22231fe69c422c4ec8bb9ea4d2b3c'
        )
      : connection);
  }
    
  Future loginUser(String email, String password) async{
    try {
      await connection.open();
      print('Connectado');
    } catch (e) {
      print('Error');
    }

  }

}


