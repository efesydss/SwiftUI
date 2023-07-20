//
//  KisiDetaySayfa.swift
//  KisilerUygulaması
//
//  Created by Efe Soydas on 8.07.2023.
//

import SwiftUI
struct KisiDetaySayfa: View {
    @State private var tfKisiAd = ""
    @State private var tfKisiTel = ""
    var kisi = Kisiler()
    var viewModel = KisiDetayViewModel()
    
    var body: some View {
        VStack(spacing:100){
            
            TextField("Kişi Ad",text: $tfKisiAd)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            TextField("Kişi Tel",text: $tfKisiTel)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            Button("Güncele"){
                viewModel.guncelle(kisi_id: kisi.kisi_id!, kisi_ad: tfKisiAd, kisi_tel: tfKisiTel)
            }
            
        }.navigationTitle("Kişi Kayıt")
            .onAppear(){
                tfKisiAd = kisi.kisi_ad!
                tfKisiTel = kisi.kisi_tel!
            }
    }
    /*
    struct KisiDetaySayfa_Previews: PreviewProvider {
        static var previews: some View {
            KisiDetaySayfa()
        }
    }
     */
}
