import SwiftUI

struct OTPVerificationView: View {
    @StateObject private var otpLogic = OTPVerificationLogic()
    @State private var isOTPValid = false
    @FocusState private var focusedField: Int?
    @State private var showError: Bool = false
    var user: User
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color(red: 255, green: 255, blue: 255)
                    .edgesIgnoringSafeArea(.all)
                
                VStack(spacing: 20) {
                    
                    Text("OTP Verification")
                        .font(.system(size: 32, weight: .bold))
                        .padding(.leading, 20)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                        .onAppear {
                            print("OTP Verification started for user: \(user)")
                        }
                    
                    Image("OTPicon")
                        .resizable()
                        .frame(height: 180)
                        .frame(maxWidth: 200)
                    
                    Text("We have sent a one-time password (OTP) to your registered mobile number")
                        .font(.system(size: 16, weight: .regular))
                        .foregroundColor(.gray)
                        .padding(.horizontal)
                    
                    if showError {
                        Text("Incorrect OTP, please try again.")
                            .foregroundColor(.red)
                            .font(.system(size: 14))
                            .padding(.top, 10)
                    }
                    
                    HStack(spacing: 10) {
                        ForEach(0..<4, id: \.self) { index in
                            ZStack {
                                RoundedRectangle(cornerRadius: 12)
                                    .fill(Color.white)
                                    .frame(width: 80, height: 80)
                                    .shadow(color: focusedField == index ? Color.blue.opacity(0.5) : Color.gray.opacity(0.2), radius: 5, x: 0, y: 3)
                                    .scaleEffect(focusedField == index ? 1.1 : 1.0)
                                    .animation(.spring(), value: focusedField)
                                
                                TextField("", text: binding(for: index))
                                    .frame(width: 50, height: 60)
                                    .font(.system(size: 24, weight: .bold))
                                    .multilineTextAlignment(.center)
                                    .keyboardType(.numberPad)
                                    .foregroundColor(.black)
                                    .focused($focusedField, equals: index)
                                    .onChange(of: otpLogic.otpCode[index]) { newValue in
                                        otpLogic.handleOTPInput(index: index, newValue: newValue, focusedField: &focusedField)
                                    }
                            }
                        }
                    }
                    .padding(.top, 10)
                    
                    ButtonView(
                        title: "VERIFY",
                        backgroundColor: Color.clear,
                        foregroundColor: .black,
                        borderColor: Color(hex:"007AFF")
                    ) {
                        if otpLogic.verifyOTP() {
                            isOTPValid = true
                            showError = false
                            print("OTP is valid. Moving to dashboard.")
                        } else {
                            showError = true
                            print("Invalid OTP.")
                        }
                    }
                    .padding(.top, 30)
                    
                    NavigationLink(
//                        destination: DashboardView(user: user)
                        destination: MainTabView(user: user)
                            .navigationBarBackButtonHidden(true),
                        isActive: $isOTPValid
                    ) { EmptyView() }
                        .hidden()
                }
            }
        }
    }
    
    private func binding(for index: Int) -> Binding<String> {
        Binding(
            get: { otpLogic.otpCode[index] },
            set: { newValue in otpLogic.otpCode[index] = newValue }
        )
    }
}

