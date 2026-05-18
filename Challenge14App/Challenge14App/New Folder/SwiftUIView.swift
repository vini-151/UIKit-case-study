//
//  SwiftUIView.swift
//  Challenge14App
//
//  Created by Vini Oliveira  on 18/05/26.
//

import SwiftUI

struct SwiftUIView: View {
    @Environment(\.dismiss) var dismiss
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
            
            
            
            
            Spacer()
            
            
        }
    }
}

#Preview {
    SwiftUIView()
}
