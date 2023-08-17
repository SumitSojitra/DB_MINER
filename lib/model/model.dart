class QuotesModel{
  String quotes;
  String Auther;
  String Char;
  
  QuotesModel({required this.Auther,required this.Char,required this.quotes});
  
 factory QuotesModel.fromMap({required Map data}){
    return QuotesModel(Auther: data['a'], Char: data['c'], quotes: data['q']);
  }
}