//
//  ModalView.swift
//  Saraswati_Assignment
//
//  Created by Channappa, Saraswati on 30/04/24.
//

import Foundation
import SwiftUI

struct ModalView: View {
    let post: Post
    @Binding var selectedPostBinding: Post?
    
    var body: some View {
            VStack(alignment: .leading) {
                
                Text("User \(post.userId)")
                    .fontWeight(.bold)
                    .font(.system(size: 20))
                    .padding(.top)
                
                Text(post.title)
                    .fontWeight(.medium)
                    .font(.system(size: 16))
                    .padding(.top)
                
                ScrollView {
                    Text(post.body)
                        .padding()
                }
                Spacer()
                
                Button(action: {
                    selectedPostBinding = nil
                }) {
                    
                    Text("Close")
                        .fontWeight(.medium)
                        .font(.title3)
                        
                        .frame(minWidth:200, maxWidth: 350)
                        .padding(10)
                        .foregroundColor(.black)
                        .background(.white)
                        .cornerRadius(40)
                        .overlay(
                            RoundedRectangle(cornerRadius: 40)
                                .stroke(Color.black, lineWidth: 2)
                        )
                }
                
            }
    }
}
