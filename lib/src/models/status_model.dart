import 'carga_model.dart';
import 'kardex_model.dart';

class Status {
  final List<Carga> carga;
  final List<Kardex> kardex;

  Status({this.carga, this.kardex});

  Status.fromData(Map<String, dynamic> data)
      : carga = (data['carga'] as List)
            ?.map((cargaItem) => Carga.fromData(cargaItem))
            ?.toList(),
        kardex = (data['kardex'] as List)
            ?.map((kardexItem) => Kardex.fromData(kardexItem))
            ?.toList();

  String cargaToString() {
    return carga.map((cargaItem) => cargaItem.toJson().toString()).join();
  }
}
