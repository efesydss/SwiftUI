//
//  KisiKayitSayfa.swift
//  KisilerUygulamasi
//
//  Created by Kasım on 17.02.2023.
//

import SwiftUI

struct KisiKayitSayfa: View {
    @State private var tfKisiAd = ""
    @State private var tfKisiTel = ""
    
    var viewModel = KisiKayitViewModel()
    
    var body: some View {
        VStack(spacing: 100){
            TextField("Kişi Ad",text: $tfKisiAd)
                .textFieldStyle(RoundedBorderTextFieldStyle()).padding()
            TextField("Kişi Tel",text: $tfKisiTel)
                .textFieldStyle(RoundedBorderTextFieldStyle()).padding()
            Button("KAYDET"){
                viewModel.kaydet(kisi_ad: tfKisiAd, kisi_tel: tfKisiTel)
            }
        }.navigationTitle("Kişi Kayıt")
    }
}

struct KisiKayitSayfa_Previews: PreviewProvider {
    static var previews: some View {
        KisiKayitSayfa()
    }
}
