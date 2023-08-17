class QuotesModel{
  String quotes;
  String Auther;
  int id;
  
  QuotesModel({required this.Auther,required this.id,required this.quotes});
  
 factory QuotesModel.fromMap({required Map data}){
    return QuotesModel(Auther: data['author'], id: data['id'], quotes: data['quote']);
  }
}