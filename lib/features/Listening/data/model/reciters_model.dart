import '../../domain/entity/reciters_entity.dart';

class RecitersModel extends RecitersEntity {

  final String recitersName;

  final String recitersId;


  RecitersModel({
    required this.recitersName,
    required this.recitersId
  }):super(name: recitersName,id: recitersId);

  factory RecitersModel.formJson({required Map<String,dynamic> json}){
    return RecitersModel(
        recitersName: json["reciter_name"],
        recitersId: json["reciter_id"]
    );
  }

  static List<RecitersModel> formJsonList({required List<dynamic> jsonList}){
    return jsonList.map((json)=>RecitersModel.formJson(json: json)).toList();
  }

}