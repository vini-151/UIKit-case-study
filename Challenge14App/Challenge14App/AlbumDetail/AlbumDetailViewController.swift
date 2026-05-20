//
//  AlbumDetailViewController.swift
//  Challenge14App
//
//  Created by Rebeca Maria de Morais Guimães on 19/05/26.
//

import Foundation
import UIKit
import SwiftUI

class AlbumDetailViewController: UIHostingController<SwiftUIView> {

    required init?(coder aDecoder: NSCoder) {
        ///A tela principal desse HostingController será TesteView.(rootview)
        super.init(coder: aDecoder,
                   rootView: SwiftUIView(
                    songs: [
                        Songs(
                            name: "Escape of the Phoenix", number: 1,
                            isFavorite: true
                        ),
                        Songs(
                            name: "lmao da silva", number: 2,
                            isFavorite: false
                        )]
                   )//albumview
        )//init
    }
    
    override init(rootView: SwiftUIView) {
        super.init(rootView: rootView)
    }
    
    convenience init() {
        let songs = [
            Songs(name: "Escape of the Phoenix", number: 1, isFavorite: true),
            Songs(name: "lmao da silva", number: 2, isFavorite: false)
        ]
        let rootView = SwiftUIView(songs: songs)
        self.init(rootView: rootView)
    }

}
