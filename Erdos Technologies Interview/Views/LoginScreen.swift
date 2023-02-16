//
//  LoginScreen.swift
//  Erdos Technologies Interview
//
//  Created by Bill Vivino on 2/15/23.
//

import SwiftUI

struct LoginScreen: View {
    @EnvironmentObject var profileViewModel: ProfileViewModel
    @StateObject var loginViewModel = LoginViewModel()
    @State var emailAddress = ""
    @State var password = ""
    @State var showingAlert = false
    @State var alertTitle = ""
    @State var alertText = ""
    @State var fetched = false
    
    var body: some View {
        NavigationStack {
            if loginViewModel.isLoggedIn,
               fetched {
                HomeScreen()
                    .environmentObject(loginViewModel)
            } else {
                VStack {
                    Image(systemName: "globe")
                        .resizable()
                        .padding()
                    VStack (alignment: .leading) {
                        Text("Email Address")
                            .font(.title)
                        TextField("Email Address", text: $emailAddress)
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
                        loginViewModel.login(userName: emailAddress, password: password) {
                            if loginViewModel.isLoggedIn {
                                profileViewModel.fetchUserProfile(emailAddress: emailAddress) { success in
                                    if success {
                                        self.fetched = true
                                    } else {
                                        self.fetched = false
                                        self.showingAlert = true
                                        self.alertTitle = "Error"
                                        self.alertText = "Failed to fetch profile. Please try again later."
                                    }
                                }
                            } else {
                                self.showingAlert = true
                                self.alertTitle = "Error"
                                self.alertText = "Invalid Username or Password"
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
                    }.disabled(emailAddress == "" || password == "")
                    Spacer()
                }.navigationTitle("Login")
            }
        }.alert(self.alertTitle, isPresented: $showingAlert) {
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
            .environmentObject(ProfileViewModel())
    }
}
