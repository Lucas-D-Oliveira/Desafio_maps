import 'dart:io';

class Marker{
  late String titulo;
  late String tipo;
  late String descricao;
  late String long;
  late String lat;

  Marker(this.titulo, this.tipo, this.descricao, this.long, this.lat);

}

void main(){
  Map <int, Marker> listMap = Map <int, Marker>(); 
  int s =0;
  int cont = 1;
 
  print("Sistema de cadastro e consulta de markers\n");
  while(s != 3){
  print('Oque deseja fazer? (1)Cadastrar pontos no mapa -- (2)Listar pontos cadastrados -- (3)Sair\n'); int e = int.parse(stdin.readLineSync()!);

switch(e){
    
    case 1:
    
          print('Digite o titulo do marcador: '); String tituloI = stdin.readLineSync()!;

    print('Digite o tipo do marcador: '); String tipoI = stdin.readLineSync()!;

    print('Digite a descrição do marcador: '); String descricaoI = stdin.readLineSync()!;

    print(' Digite a longitude: '); String longI = stdin.readLineSync()!;

    print(' Digite a latitude: '); String latI = stdin.readLineSync()!;

      bool existeMarker = listMap.values.any((Marker) =>
      Marker.titulo == tituloI &&
      Marker.long == longI &&
      Marker.lat == latI);

  if (existeMarker) {
    print('Marker já cadastrado.');
    break;
  } else{
    listMap[cont] = Marker(tituloI, tipoI, descricaoI, longI, latI);
    cont += 1;
    break;
  }
    


  case 2:
  print('Digite como deseja procurar os markers cadastrados: (1)Ordem alfabética -- (2)Listar por tipo (3)Procurar por nome'); int i = int.parse(stdin.readLineSync()!);
  switch(i){
     case 1:
  case 1:
  List<Marker> titulos = listMap.values.toList();

  titulos.sort((a, b) => a.titulo.toLowerCase().compareTo(b.titulo.toLowerCase()));

  Map<int, Marker> novoMap = {};

  for (var marker in titulos) {
    novoMap[novoMap.length + 1] = marker;
  }

  for (var marker in novoMap.values) {
    print('Título: ${marker.titulo}');
    print('Tipo: ${marker.tipo}');
    print('Descrição: ${marker.descricao}');
    print('Longitude: ${marker.long}');
    print('Latitude: ${marker.lat}');
    print('---');
  }
  break;

    case 2:
         print("Digite o tipo do marker que deseja procurar: ");
            String tipoP = stdin.readLineSync()!;

            bool encontrado = false;

            for (var marker in listMap.values) {
              if (marker.tipo.toLowerCase() == tipoP.toLowerCase()) {
                print('Título: ${marker.titulo}');
                print('Tipo: ${marker.tipo}');
                print('Descrição: ${marker.descricao}');
                print('Longitude: ${marker.long}');
                print('Latitude: ${marker.lat}');
                print('---');
                encontrado = true;
              }
            }

            if (!encontrado) {
              print('Não há nenhum marcador com este tipo');
            }
            break;


    case 3:
   print("Digite o título do marker que procura: ");
            String tituloP = stdin.readLineSync()!;

            bool encontrado = false;

            for (var marker in listMap.values) {
              if (marker.titulo.toLowerCase() == tituloP.toLowerCase()) {
                print('Título: ${marker.titulo}');
                print('Tipo: ${marker.tipo}');
                print('Descrição: ${marker.descricao}');
                print('Longitude: ${marker.long}');
                print('Latitude: ${marker.lat}');
                print('---');
                encontrado = true;
              }
            }

            if (!encontrado) {
              print('Não há nenhum marcador com este título');
            }
            break;
        }
        break;
  

  case 3:
  s = 3;
  break;
}

  }
}
  


