//
//  ClubRegisterListView.swift
//  gun-s-kids-iOS
//
//  Created by 권준상 on 2024/03/03.
//

import SwiftUI

struct ClubRegisterListView: View {
    @State var isButtonEnabled = false
    
    var body: some View {
        NavigationView {
            ScrollView(.vertical) {
                LazyVStack(spacing: 20) {
                    ForEach(RegisterInfo.sample) { info in
                        ClubRegisterRow(registerInfo: info)
                    }
                }
                Spacer(minLength: 30)
                confirmButton
            }
        }
    }
}

extension ClubRegisterListView {
    var confirmButton: some View {
        Button(action: {
            isButtonEnabled.toggle()
        }) {
            Text("승인")
                .font(.title3)
        }
        .padding([.horizontal], 40)
        .padding([.vertical], 15)
        .background(isButtonEnabled ? Color.mainColor4 : Color.mainColor2)
        .foregroundColor(.white)
        .clipShape(RoundedRectangle(cornerRadius: 15))
    }
}
struct ClubRegisterListView_Previews: PreviewProvider {
    static var previews: some View {
        ClubRegisterListView()
    }
}
