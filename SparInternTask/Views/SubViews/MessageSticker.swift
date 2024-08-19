//
//  MessageSticker.swift
//  SparInternTask
//
//  Created by Lukman Makhaev on 19.08.2024.
//

import SwiftUI

struct MessageSticker: View {
    var message: ProductMessage
    
    var body: some View {
        HStack (alignment: .top) {
            Text(message.rawValue)
                .font(.system(size: 10))
                .foregroundColor(.white)
                .padding(.leading, 12)
                .padding(.trailing, 6)
                .padding(.top, 2)
                .padding(.bottom, 4)
                .background(Color(message.color))
                .clipShape(
                    .rect(
                        topLeadingRadius: 0,
                        bottomLeadingRadius: 0,
                        bottomTrailingRadius: 6,
                        topTrailingRadius: 6
                    )
                )
        }
    }
}
