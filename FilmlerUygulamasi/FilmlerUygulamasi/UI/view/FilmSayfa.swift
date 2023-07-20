//
//  ContentView.swift
//  FilmlerUygulamasi
//
//  Created by Efe Soydas on 8.07.2023.
//

import SwiftUI

struct FilmSayfa: View {
   @ObservedObject var viewModel = FilmSayfaViewModel()
    var kategori = Kategoriler()
    var body: some View {
        
            GeometryReader{geometry in
                let ekranGEnislik = geometry.size.width
                let itemGenislik = (ekranGEnislik-40)/2
                //10 x 20 x 10 = 40
                ScrollView{
                    LazyVGrid(columns: [GridItem(.flexible()),GridItem(.flexible())],spacing: 20){
                        ForEach(viewModel.filmlerListesi){film in
                            NavigationLink(destination:DetaySayfa(film: film)){
                                FilmItem(film: film, genislik: itemGenislik)
                            }
                            
                        }
                    }
                }.padding(10)
                    .navigationTitle(kategori.kategori_ad!)
                    .onAppear{
                        //tarihi önceki sayfadan ya da bu sayfadan picker dan falan al gönder gerisini viewmodelde anlattım.
                        viewModel.filmlerYukle(kategori_id: kategori.kategori_id!)
                       
                    }
                
            }
        
    }
}
/*
struct FilmSayfa_Previews: PreviewProvider {
    static var previews: some View {
        FilmSayfa()
    }
}*/
