import 'dart:io';
import 'package:path_provider/path_provider.dart';

// essa classe vai salvar os dados offline
class StorageSave {
  // pega o localpath do device
  Future<String> get localPath async {
    try {
      final directory = await getApplicationDocumentsDirectory();
      return directory.path;
    } catch (e) {
      throw FileSystemException();
    }
  }

/*
  // salva o arquivo no storage do aparelho
  Future<dynamic> saveFile(String fileName) async {
    try {
      // pega o local path
      String path = await _localPath;
      // retorna um arquivo
      File file = new File('$path/$fileName.json');
      // cria o arquivo nessa referência

      // retorna o arquivo
      return file;
    } catch (error) {
      print(error);
    }
  }
*/
// escreve no arquivo
  Future<void> writeFile({String value, String fileName}) async {
    try {
      String path = await localPath;

      File loadFile = new File('$path/$fileName.json');
      // codifica o valor para json
      //  String parsedValue = jsonEncode(value);
// escreve algo no arquivo
// sobrescreve se já existir algo
      print("ARQUIVO ESCRITO$value ");

      File writtedFile = await loadFile.writeAsString(value);
      // File writtedFile =
      //   loadFile.writeAsStringSync(value);
      if (writtedFile == null) {
        throw Exception();
      }
    } catch (error) {
      print(error);
      throw FileSystemException();
    }
  }

// lê o arquivo
  Future<String> readFile(String fileName) async {
    try {
      // traz o arquivo
      // path do diretório
      final path = await localPath;

      File loadFile = new File('$path/$fileName.json');
      // bool b = await loadFile.exists();
      //  print("ARQUIVO EXISTE $b");
      String contents = await loadFile.readAsString();
      //  String contents = loadFile.readAsStringSync();
      return contents;
    } catch (error) {
      print(error);
      throw FileSystemException();
    }
  }

  Future<bool> deleteFile(String fileName) async {
    try {
      final path = await localPath;

      File loadFile = new File('$path/$fileName.json');
      FileSystemEntity fileEntity = await loadFile.delete();
      // loadFile.deleteSync();
      // print(fileEntity);
      return true;
    } catch (error) {
      throw FileSystemException();
    }
  }
}
