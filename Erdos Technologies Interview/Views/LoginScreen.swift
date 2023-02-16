//
//  LoginScreen.swift
//  Erdos Technologies Interview
//
//  Created by Bill Vivino on 2/15/23.
//

import SwiftUI

struct LoginScreen: View {
    @StateObject var loginViewModel = LoginViewModel()
    @State var userName = ""
    @State var password = ""
    @State var isLoggedIn = false
    @State var showingAlert = false
    @State var alertText = ""
    @State var alertTitle = ""
    
    var body: some View {
        NavigationStack {
            VStack {
                Image(systemName: "globe")
                    .resizable()
                    .padding()
                VStack (alignment: .leading) {
                    Text("User Name")
                        .font(.title)
                    TextField("UserName", text: $userName)
                        .textInputAutocapitalization(.never)
                        .padding()
                        .background {
                            RoundedRectangle(cornerRadius: 16.0)
                                .stroke()
                        }
                    Text("Password")
                        .font(.title)
                    SecureField("Password", text: $password)
                        .textInputAutocapitalization(.never)
                        .padding()
                        .background {
                            RoundedRectangle(cornerRadius: 16.0)
                                .stroke()
                        }
                }.padding()
                Button {
                    loginViewModel.login(userName: userName, password: password) { isLoggedIn in
                        if isLoggedIn {
                            self.isLoggedIn = true
                        } else {
                            self.isLoggedIn = false
                            self.showingAlert = true
                        }
                    }
                } label: {
                    Text("Login")
                        .font(.title)
                        .foregroundColor(.white)
                        .padding()
                        .background {
                            RoundedRectangle(cornerRadius: 16)
                        }
                }.disabled(userName == "" || password == "")
                Spacer()
            }.navigationTitle("Login")
                .navigationDestination(isPresented: $isLoggedIn) {
                    HomeScreen()
                }
        }.alert("Invalid Username or Password", isPresented: $showingAlert) {
            Button("OK") {
                self.showingAlert = false
            }
        } message: {
            Text(self.alertText)
        }
    }
}

struct LoginScreen_Previews: PreviewProvider {
    static var previews: some View {
        LoginScreen()
    }
}
