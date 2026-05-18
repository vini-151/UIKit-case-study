//
//  SwiftUIView.swift
//  Challenge14App
//
//  Created by Vini Oliveira  on 18/05/26.
//

import SwiftUI

struct SwiftUIView: View {
    @Environment(\.dismiss) var dismiss
    @State var songs: [Songs]
    var body: some View {
        NavigationStack(){
            HStack{
                Button("Voltar"){
                    dismiss()
                }
                
                Spacer()
                
                Button("a"){
                    
                }
            }
            .padding()
            
            ScrollView{
                Rectangle()
                    .frame(width: 300, height: 300)
                    .foregroundStyle(.red)
                
                Text("Pisando no UIKit!")
                    .font(.title2)
                    .bold()
                
                Text("Sabrina Carpenter Delmilio")
                    .font(.title3)
                    .bold()
                    .foregroundStyle(.red)
                
                Text("Metal pesadão - 2026")
                    .font(.callout)
                    .foregroundStyle(.gray)
                
                
                HStack{
                    Button(){
                        //abrir o play do storyboard
                    }label:{
                        Label("Play", systemImage: "play")
                            .font(.subheadline).fontWeight(.semibold)
                            .foregroundStyle(Color(red: 0.98, green: 0.18, blue: 0.33))
                            .frame(maxWidth: .infinity, minHeight: 44)
                            .background(RoundedRectangle(cornerRadius: 10).fill(.white.opacity(0.08)))
                    }
                    
                    Button(){
                        //shuffle
                    }label:{
                        Label("Shuffle", systemImage: "shuffle")
                            .font(.subheadline).fontWeight(.semibold)
                            .foregroundStyle(Color(red: 0.98, green: 0.18, blue: 0.33))
                            .frame(maxWidth: .infinity, minHeight: 44)
                            .background(RoundedRectangle(cornerRadius: 10).fill(.white.opacity(0.08)))
                    }
                } .buttonStyle(.plain)
                    .padding(.horizontal)
                Divider().overlay(.white.opacity(0.1)).padding(.horizontal)
                
                //MUSICAS LISTADAS
                VStack {
                    ForEach(songs.indices, id: \.self) { index in
                        HStack(spacing: 12) {
                            Button {
                                songs[index].isFavorite.toggle()
                            } label: {
                                Group {
                                    if songs[index].isFavorite {
                                        Image(systemName: "star.fill")
                                            .foregroundStyle(Color(red: 0.98, green: 0.18, blue: 0.33))
                                        Text("\(songs[index].number)")
                                            .foregroundStyle(.gray)
                                    } else {
                                        Text("\(songs[index].number)")
                                            .foregroundStyle(.gray)
                                    }
                                }
                                .font(.subheadline)
                                .frame(width: 24)
                            }
                            .buttonStyle(.plain)
                            
                            Text(songs[index].name)
                                .font(.body)
                                .foregroundStyle(.white)
                                .frame(maxWidth: .infinity, alignment: .leading)
                            
                            
                            Image(systemName: "arrow.down.circle")
                                .font(.title3)
                                .foregroundStyle(Color(red: 0.98, green: 0.18, blue: 0.33))
                            
                        }
                        Divider().overlay(.white.opacity(0.08)).padding(.horizontal)
                    }
                    
                }//hstack
                .padding(.horizontal)
                .padding(.vertical, 10)
                
                
            }
        }
        .background(Color(red: 0.11, green: 0.11, blue: 0.18).ignoresSafeArea())
        .navigationTitle("Listen Now")
        .navigationBarTitleDisplayMode(.inline)
        .toolbarColorScheme(.dark, for: .navigationBar)
        .preferredColorScheme(.dark)
        
        Spacer()
        
        
    }
}


#Preview {
    SwiftUIView(
        songs: [
            Songs(name: "lmao", number: 2, isFavorite: true),
            Songs(name: "lol", number: 1, isFavorite: true)
        ]
    )
}
