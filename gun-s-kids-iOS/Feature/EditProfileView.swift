//
//  EditProfileView.swift
//  gun-s-kids-iOS
//
//  Created by 권준상 on 2023/10/09.
//

import SwiftUI
import PanModal

struct EditProfileView: View {
    @State var content: String = ""
    @State private var nickname = ""
    @State private var selectedCompanyIndex = 0
    @State private var selectedCompany = ""
    @State private var selectDepartmentIndex = 0
    @State private var displayLocationPanModal = false
    @State private var displayDayPanModal = false
    @State private var location = ""
    @State private var doIndex = 0
    @State private var siIndex = 0
    @State private var birthday: Date = Date()

    var companys = ["현대 IT&E", "현대홈쇼핑", "현대백화점"]
    var departments = ["SR팀", "온라인팀", "면세점팀", "한섬1팀"]
    var koreaDo = ["서울특별시", "경기도", "강원도", "충청북도", "충청남도", "전라북도", "전라남도", "경상북도", "경상남도", "제주특별자치도"]
    var koreaSi = ["성남시", "광주시", "용인시", "안성시"]

    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .center, spacing: 30) {
                    Text("프로필 수정하기")
                        .font(.title)
                        .fontWeight(.bold)
                        .padding(10)

                    HStack {
                        Spacer()
                            .frame(width: 20)
                        profileImage
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .background(Color.primary.colorInvert())
                    .cornerRadius(6)
                    .padding(.vertical, 8)

                    VStack(alignment: .leading, spacing: 20) {
                        nicknameTextField
                        HStack {
                            companyComboBox
                            Spacer()
                            departmentComboBox
                        }
                        locationButton
                        birthDayPicker
                    }

                    VStack(alignment: .leading) {
                        Text("자기소개로 나를 뽐내 보아요!")
                            .foregroundColor(.gray)
                            .font(.system(size: 15))
                        TextEditor(text: $content)
                                    .font(.body)
                                    .frame(maxWidth: 328)
                                    .frame(height: 188)
                                    .cornerRadius(10)
                                    .overlay(RoundedRectangle(cornerRadius: 10)
                                             .stroke(Color.dcdcdc, lineWidth: 1))
                    }

                    Button(action: { print("") },
                           label: {
                                Text("Edit")
                                    .font(.headline)
                                    .foregroundColor(.white)
                                    .frame(height: 32)
                                    .frame(maxWidth: 110)
                                    .background(.blue)
                                    .cornerRadius(10)
                                })
                            .buttonStyle(PressableButtonStyle())
                }
                .padding()
                .edgesIgnoringSafeArea(.all)
                }
        }
    }
}

extension EditProfileView {
    var profileImage: some View {
        Image("avocado")
            .resizable()
            .scaledToFill()
            .frame(width: 100, height: 100)
            .clipped()
    }

    var nicknameTextField: some View {
        VStack(alignment: .leading) {
            Text("닉네임")
                .foregroundColor(.secondary)
            TextField("", text: $nickname)
                           .frame(height: 50)
                           .cornerRadius(10)
                           .overlay(RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color.dcdcdc, lineWidth: 1))
        }
    }

    var companyComboBox: some View {
        VStack(alignment: .leading) {
            Text("소속 회사")
                .foregroundColor(.secondary)
            Picker("Select Choice", selection: $selectedCompanyIndex) {
                ForEach(0 ..< companys.count) {
                    Text(companys[$0])
                }
            }.frame(maxWidth: .infinity, minHeight: 50)
                .cornerRadius(10)
                .accentColor(.black)
                .padding([.leading, .trailing])
                .overlay(RoundedRectangle(cornerRadius: 10)
                    .stroke(Color.dcdcdc, lineWidth: 1))
        }
    }

    var departmentComboBox: some View {
        VStack(alignment: .leading) {
            Text("부서")
                .foregroundColor(.secondary)
            Picker("Select Choice", selection: $selectDepartmentIndex) {
                ForEach(0 ..< departments.count) {
                    Text(departments[$0])
                }
            }.frame(maxWidth: .infinity, minHeight: 50)
                .cornerRadius(10)
                .accentColor(.black)
                .padding([.leading, .trailing])
                .overlay(RoundedRectangle(cornerRadius: 10)
                .stroke(Color.dcdcdc, lineWidth: 1))
        }
    }

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

    var birthDayPicker: some View {
        VStack(alignment: .leading) {
            Text("생년 월일")
                .foregroundColor(.secondary)
            Button(action: {
                displayDayPanModal = true
            }) {
                Text(stringDate(date: birthday))
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
                displayDayPanModal = true
            }
        }.presentModal(modalCase: .day, displayPanModal: $displayDayPanModal) {
            VStack(alignment: .trailing) {
                Button("설정") {
                    print("### birthDay: \(stringDate(date: birthday))")
                    dismissModal()
                }.padding([.top, .trailing], 30)
                DatePicker(
                        "",
                        selection: $birthday,
                        displayedComponents: [.date]
                ).labelsHidden()
                .datePickerStyle(.wheel)
                .frame(minWidth: 0, maxWidth: .infinity, alignment: .center)
            }.onDisappear {
                displayDayPanModal = false
            }
        }
    }

    func stringDate(date: Date) -> String {
      let formatter = DateFormatter()
      formatter.dateFormat = "YYYY년 MM월 dd일"
      return formatter.string(from: date)
    }
}

struct EditProfileView_Previews: PreviewProvider {
    static var previews: some View {
        EditProfileView()
    }
}
