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
                        ),
                        Songs(
                            name: "Deixa eu ver...", number: 3,
                            isFavorite: false
                        ),
                        Songs(
                            name: "Café com leite", number: 4,
                            isFavorite: false
                        ),
                        Songs(
                            name: "Tour da casa", number: 5,
                            isFavorite: false
                        ),
                        Songs(
                            name: "Casa house mojo dojo house", number: 6,
                            isFavorite: false
                        ),
                        Songs(
                            name: "I'm just Polly Pocket", number: 7,
                            isFavorite: false
                        ),
                        Songs(
                            name: "I was looking for a trampo", number: 8,
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
            Songs(
                name: "Escape of the Phoenix", number: 1,
                isFavorite: true
            ),
            Songs(
                name: "lmao da silva", number: 2,
                isFavorite: false
            ),
            Songs(
                name: "Deixa eu ver...", number: 3,
                isFavorite: false
            ),
            Songs(
                name: "Café com leite", number: 4,
                isFavorite: false
            ),
            Songs(
                name: "Tour da casa", number: 5,
                isFavorite: false
            ),
            Songs(
                name: "Casa house mojo dojo house", number: 6,
                isFavorite: false
            ),
            Songs(
                name: "I'm just Polly Pocket", number: 7,
                isFavorite: false
            ),
            Songs(
                name: "I was looking for a trampo", number: 8,
                isFavorite: false)
        ]
        let rootView = SwiftUIView(songs: songs)
        self.init(rootView: rootView)
    }

}
