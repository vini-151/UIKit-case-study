//
//  MiniPlayerRepresentable.swift
//  Challenge14App
//
//  Created by Vini Oliveira  on 19/05/26.
//

import UIKit
import SwiftUI

struct MiniPlayerRepresentable: UIViewRepresentable {
    func makeUIView(context: Context) -> UIView {
//        return UIHostingController(rootView: MiniPlayer())
        return UIHostingController(rootView: MiniPlayer()).view
    }
    
    //PARAMOS AQUI - dar um jeito desse representable funcionar pra mostarmos no vc que queremos
    //Vini 20/05 as 9h30 adicionei o .view e o erro sumiu!!!!111!!1!
    
    func updateUIView(_ uiView: UIView, context: Context) {
        
    }
}
