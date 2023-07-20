//
//  FilmItem.swift
//  FilmlerUygulamasi
//
//  Created by Efe Soydas on 8.07.2023.
//

import SwiftUI

struct FilmItem: View {
    
    var film = Filmler()
    var genislik = 0.0
   
    var body: some View {
        VStack(spacing: 5){
            Image(film.film_resim!).resizable().frame(width: genislik)
            Text(film.film_adi!).foregroundColor(.gray)
            Text("Sepete Ekle").padding(5)
                .foregroundColor(.white)
                .background(.indigo)
                .cornerRadius(5)
                .padding(.bottom,5)
                .onTapGesture {
                    print("\(film.film_adi!) Sepete Eklendi")
                    
                }
        }.background(Rectangle().fill(.white).shadow(radius: 3))
    }
}
/*
 struct FilmItem_Previews: PreviewProvider {
 static var previews: some View {
 FilmItem()
 }
 }
 */
