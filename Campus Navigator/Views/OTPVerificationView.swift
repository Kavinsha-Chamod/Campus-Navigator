import SwiftUI

struct OTPVerificationView: View {
    @StateObject private var otpLogic = OTPVerificationLogic()
    @State private var isOTPValid = false
    @FocusState private var focusedField: Int?
    @State private var showError: Bool = false
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color(red: 0.792, green: 0.941, blue: 0.973)
                    .edgesIgnoringSafeArea(.all)
                
                VStack(spacing: 20) {
                    Text("OTP Verification")
                        .font(.system(size: 32, weight: .bold))
                        .padding(.leading, 20)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
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
                    
                    NavigationLink(
                        destination: DashboardView()
                            .navigationBarBackButtonHidden(true),
                        isActive: $isOTPValid
                    ) {
                        ButtonView(
                            title: "VERIFY",
                            backgroundColor: Color.clear,
                            foregroundColor: .black,
                            borderColor: Color(red: 2/255, green: 62/255, blue: 138/255, opacity: 1)
                        ) {
                            if otpLogic.verifyOTP() {
                                isOTPValid = true
                                showError = false
                            } else {
                                showError = true
                            }
                        }
                    }
                    .padding(.top, 30)
                    .navigationBarBackButtonHidden(true)
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

#Preview {
    OTPVerificationView()
}
