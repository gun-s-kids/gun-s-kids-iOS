//
//  WriteBoardView.swift
//  gun-s-kids-iOS
//
//  Created by 권준상 on 2024/02/25.
//

import SwiftUI

struct WriteBoardView: View {
    @Environment(\.presentationMode) var presentationMode
    @State var title: String = ""
    @State var content: String = ""
    @State var placeholderText: String = "내용을 입력해주세요."
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading, spacing: 15) {
                Spacer(minLength: 15)
                TextField("", text: $title,
                          prompt: Text("제목을 입력해주세요.").foregroundColor(Color.grayColor))
                    .font(.system(size: 24, weight: .semibold))
                    .foregroundColor(.black)
                    .padding(.leading, 3)
                
                ZStack(alignment: .topLeading) {
                    if self.content.isEmpty {
                        TextEditor(text: $placeholderText)
                            .font(.system(size: 20))
                            .foregroundColor(Color.grayColor)
                            .disabled(true)
                    }
                    TextEditor(text: $content)
                        .font(.system(size: 20))
                        .foregroundColor(.black)
                        .opacity(self.content.isEmpty ? 0.25 : 1)
                }
            }
            .padding(.horizontal, 20)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    backButton
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    enrollButton
                }
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

extension WriteBoardView {
    var backButton: some View {
        Button {
            self.presentationMode.wrappedValue.dismiss()
        } label: {
            Image(systemName: "chevron.left")
                .aspectRatio(contentMode: .fit)
                .tint(.black)
        }
    }
    
    var enrollButton: some View {
        Button {
            self.presentationMode.wrappedValue.dismiss()
        } label: {
            Image(systemName: "plus")
                .aspectRatio(contentMode: .fit)
                .tint(.black)
        }
    }
}

struct WriteBoardView_Previews: PreviewProvider {
    static var previews: some View {
        WriteBoardView()
    }
}
