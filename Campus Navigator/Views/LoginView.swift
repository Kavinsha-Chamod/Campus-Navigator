import SwiftUI

struct LoginView: View {
    @State private var username: String = ""
    @State private var password: String = ""
    @State private var isLoggedIn: Bool = false
    @State private var showError: Bool = false
    @State private var loggedInUser: User?
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color(red: 0.792, green: 0.941, blue: 0.973)
                    .edgesIgnoringSafeArea(.all)
                
                VStack {
                    Image("loginScreen")
                        .resizable()
                        .frame(height: 180)
                        .frame(maxWidth: 250)
                    
                    VStack(alignment: .leading) {
                        Text("Login")
                            .font(.system(size: 32, weight: .bold))
                        
                        Text("Login to continue using the app.")
                            .font(.system(size: 16, weight: .regular))
                            .foregroundColor(.gray)
                            .padding(.bottom)
                    }
                    .padding(.top, 20)
                    .padding(.leading, 20)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    
                    if showError {
                        Text("Invalid username or password")
                            .foregroundColor(.red)
                            .font(.system(size: 14))
                            .padding(.top, 10)
                    }
                    
                    VStack {
                        TextInputView(
                            title: "Username",
                            placeholder: "Enter your username",
                            text: $username
                        )
                        
                        TextInputView(
                            title: "Password",
                            placeholder: "Enter password",
                            text: $password,
                            isSecure: true
                        )
                        
                        HStack {
                            Spacer()
                            Text("Forgot Password?")
                                .foregroundColor(.blue)
                                .font(.system(size: 14))
                                .padding(.trailing, 20)
                        }
                        
                        ButtonView(
                            title: "LOGIN",
                            backgroundColor: Color(red: 2/255, green: 62/255, blue: 138/255),
                            foregroundColor: .white,
                            borderColor: Color(red: 2/255, green: 62/255, blue: 138/255)
                        ) {
                            loginUser()
                        }
                        .padding(.top, 30)
                        
                        HStack {
                            Text("Don’t have an account?")
                                .foregroundColor(.black)
                            
                            NavigationLink(destination: RegisterView()) {
                                Text("Register")
                                    .foregroundColor(.blue)
                                    .fontWeight(.bold)
                            }
                        }
                        .padding(.top, 10)
                    }
                    .padding(.horizontal, 20)
                }
            }
            .fullScreenCover(isPresented: $isLoggedIn) {
                if let user = loggedInUser {
                    
                    OTPVerificationView(user: user)
                } else {
                    
                    Text("Error: User data not found.")
                }
            }
            .onChange(of: loggedInUser) { newUser in
                if newUser != nil {
                    print("User data set, now navigating to OTP screen.")
                    isLoggedIn = true
                }
            }
        }
    }
    
    private func loginUser() {
        Login.handleLogin(username: username, password: password) { success, user in
            if success, let validUser = user {
                DispatchQueue.main.async {
                    loggedInUser = validUser
                }
                print("User successfully logged in: \(validUser)")
            } else {
                DispatchQueue.main.async {
                    showError = true
                }
                print("Login failed.")
            }
        }
    }
}

#Preview {
    LoginView() 
}
