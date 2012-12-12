package com.icodeya
import eclothing.Produto

class Photo {

   byte[] photo
   String caption

   static mapping = {
   photo(sqlType: 'longblob')
  } 

  static constraints = {
    photo(nullable: false)
   caption(nullable: false, blank: true, inList:["Roupas Femininas", "Roupas Masculinas", "Roupas Infantis"])
   }
  
  static belongsTo = [produto:Produto]
}
