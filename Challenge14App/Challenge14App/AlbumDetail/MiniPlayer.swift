//
//  MiniPlayer.swift
//  Challenge14App
//
//  Created by Letícia Delmilio Soares on 19/05/26.
//
import SwiftUI

struct MiniPlayer: View {
    var body: some View {
        
        HStack {
            HStack(alignment: .center, spacing: 20){
                Image("Album")
                    .resizable()
                    .scaledToFit()
                    .clipShape(Rectangle())
                    .border(Color(.gray), width: 2)
                    .frame(width: 50)
                    
                
                Text("Forever Outsider")
                    .font(Font.body.bold())
                    .multilineTextAlignment(.center)
                    .lineLimit(2)
            }
            .padding(.leading, 40)
            
            Spacer()
            
            HStack(spacing: 20){
                Button{
                }label: {
                    Image(systemName: "play.fill")
                        .font(.title)
                }
                .foregroundStyle(Color(.white))
                Button{
                }label: {
                    Image(systemName: "forward.fill")
                        .font(.title)
                }
                .foregroundStyle(Color(.white))
                
            }.padding(30)
               
            
            
        } .background(RoundedRectangle(cornerRadius: 600).fill(.btnBg))
//            .padding(.horizontal, 10)
           
           
        }
      
        
    }
#Preview {
    MiniPlayer()
}
