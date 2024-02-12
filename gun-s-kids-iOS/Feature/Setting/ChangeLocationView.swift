//
//  ChangeLocationView.swift
//  gun-s-kids-iOS
//
//  Created by 권준상 on 2024/02/12.
//

import SwiftUI

struct ChangeLocationView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>

    @State private var displayLocationPanModal = false
    @State private var location = ""
    @State private var doIndex = 0
    @State private var siIndex = 0
    
    var koreaDo = ["서울특별시", "경기도", "강원도", "충청북도", "충청남도", "전라북도", "전라남도", "경상북도", "경상남도", "제주특별자치도"]
    var koreaSi = ["성남시", "광주시", "용인시", "안성시"]
    
    var body: some View {
        GeometryReader { geometry in
            VStack(alignment: .center, spacing: 15) {
                Spacer()
                    .frame(height: 50)
                SettingTitleVStack(title: "활동지역 변경")
                Spacer()
                    .frame(height: 15)
                locationButton
                Spacer()
                    .frame(height: 17)
                Button(action: {
                    self.presentationMode.wrappedValue.dismiss()
                },
                label: {
                    Text("다음")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(height: 57)
                        .frame(maxWidth: 305)
                        .background(Color.mainColor3)
                        .cornerRadius(10)
                })
                .buttonStyle(PressableButtonStyle())
            }
            .padding()
            .edgesIgnoringSafeArea(.all)
            }
    }
}

extension ChangeLocationView {
    var locationButton: some View {
        VStack(alignment: .leading) {
            Text("활동 지역")
                .foregroundColor(.secondary)
            Button(action: {
                displayLocationPanModal = true
            }) {
                Text(location)
                    .frame(maxWidth: .infinity, minHeight: 50)
                    .accentColor(.black)
                    .background(
                        RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.dcdcdc, lineWidth: 1)
                    )
            }.background(
                RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.dcdcdc, lineWidth: 1)
            )
            .onTapGesture {
                displayLocationPanModal = true
            }
        }.presentModal(modalCase: .location, displayPanModal: $displayLocationPanModal) {
            VStack(alignment: .trailing) {
                Button("설정") {
                    print("### Do:\(koreaDo[doIndex]), Si: \(koreaSi[siIndex])")
                    location = "\(koreaDo[doIndex]) \(koreaSi[siIndex])"
                    dismissModal()
                }.padding([.top, .trailing], 30)
                HStack {
                    Picker("Select Choice", selection: $doIndex) {
                        ForEach(0 ..< koreaDo.count) {
                            Text(koreaDo[$0])
                        }
                    }
                    .pickerStyle(.wheel)
                    .frame(minWidth: 0)
                    .clipped()
                    
                    Picker("Select Choice", selection: $siIndex) {
                        ForEach(0 ..< koreaSi.count) {
                            Text(koreaSi[$0])
                        }
                    }
                    .pickerStyle(.wheel)
                    .frame(minWidth: 0)
                    .clipped()
                }
            }.onDisappear {
                displayLocationPanModal = false
            }
        }
    }
}

struct ChangeLocationView_Previews: PreviewProvider {
    static var previews: some View {
        ChangeLocationView()
    }
}
