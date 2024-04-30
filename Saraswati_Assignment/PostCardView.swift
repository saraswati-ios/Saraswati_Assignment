//
//  PostCardView.swift
//  Saraswati_Assignment
//
//  Created by Channappa, Saraswati on 30/04/24.
//

import Foundation
import SwiftUI

struct PostCardView: View {
  let post: Post

  var body: some View {
    VStack(alignment: .leading, spacing: 8) {
      ZStack {
        RoundedRectangle(cornerRadius: 8)
          .shadow(color: Color.gray.opacity(0.3), radius: 5, x: 0, y: 3)
        HStack(alignment: .top) { // Use HStack for horizontal alignment
          Image("user")
            .resizable()
            .scaledToFit()
            .frame(width: 50, height: 50, alignment: .top)
            .clipShape(Circle())

          VStack(alignment: .leading, spacing: 4) {
            Text("\(post.id) - \(post.title)")
              .fontWeight(.medium)
              .font(.system(size: 16, weight: .medium))
              .lineLimit(2)
              .foregroundColor(.gray)

            Text(post.body)
              .lineLimit(3)
              .fontWeight(.regular)
              .font(.system(size: 14))
              .foregroundColor(.white)
          }
        }
        .padding()
      }

      // Placeholder for potential image loading (replace with actual logic)
      // Consider using CachedImageView or a custom solution for efficiency
      // if post.imageUrl != nil {
      //   // Implement image loading logic here
      // }
    }
  }
}
