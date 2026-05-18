//
//  UIHostingViewController.swift
//  Challenge14App
//
//  Created by Vini Oliveira  on 18/05/26.
//

import SwiftUI


class UIHostingViewController: UIHostingController<SwiftUIView>{
    required init?(coder aDecoder: NSCoder) {
            ///A tela principal desse HostingController será TesteView.(rootview)
            super.init(coder: aDecoder, rootView: SwiftUIView())
        }
}
