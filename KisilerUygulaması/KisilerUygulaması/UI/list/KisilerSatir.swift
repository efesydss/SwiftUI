//
//  KisilerSatir.swift
//  KisilerUygulaması
//
//  Created by Efe Soydas on 8.07.2023.
//

import SwiftUI

struct KisilerSatir: View {
    var kisi = Kisiler()
    var body: some View {
        VStack(alignment: .leading, spacing:16){
            Text(kisi.kisi_ad!).font(.system(size: 25))
            Text(kisi.kisi_tel!).font(.system(size: 20)).foregroundColor(.gray)

        }
    }
}
/*
struct KisilerSatir_Previews: PreviewProvider {
    static var previews: some View {
        KisilerSatir()
    }
}*/
