//
//  OTPVerification.swift
//  Campus Navigator
//
//  Created by Gayan 033 on 2025-02-16.
//

import SwiftUI

struct OTPVerificationView: View {
    @State private var otpCode: [String] = Array(repeating: "", count: 6)
    @FocusState private var focusedField: Int?

    var body: some View {
        VStack(spacing: 20) {
            Text("Enter OTP Code")
                .font(.system(size: 24, weight: .bold))

            Text("We have sent a 6-digit verification code to your phone.")
                .font(.system(size: 16))
                .foregroundColor(.gray)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 20)

            // OTP Input Fields
            HStack(spacing: 12) {
                ForEach(0..<6, id: \.self) { index in
                    ZStack {
                        RoundedRectangle(cornerRadius: 12)
                            .fill(Color.white)
                            .frame(width: 50, height: 60)
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
                    }
                }
            }

            // Verify Button
            Button(action: verifyOTP) {
                Text("Verify OTP")
                    .font(.system(size: 18, weight: .bold))
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(otpCode.joined().count < 6 ? Color.gray : Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                    .padding(.horizontal, 40)
                    .animation(.easeInOut(duration: 0.2), value: otpCode.joined().count)
            }
            .disabled(otpCode.joined().count < 6)

            // Resend OTP
            HStack {
                Text("Didn't receive the code?")
                    .foregroundColor(.gray)
                Button(action: {
                    print("Resend OTP")
                }) {
                    Text("Resend")
                        .foregroundColor(.blue)
                        .fontWeight(.bold)
                        .underline()
                }
            }
            .padding(.top, 10)

            Spacer()
        }
        .onAppear {
            focusedField = 0 // Auto-focus first field on load
        }
    }

    private func binding(for index: Int) -> Binding<String> {
        return Binding(
            get: { self.otpCode[index] },
            set: { newValue in
                if newValue.count > 1 { // Restrict to single digit
                    self.otpCode[index] = String(newValue.prefix(1))
                } else {
                    self.otpCode[index] = newValue
                }
                handleOTPInput(index: index, newValue: newValue)
            }
        )
    }

    private func handleOTPInput(index: Int, newValue: String) {
        if newValue.count == 1 {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                self.focusedField = (index + 1) < 6 ? index + 1 : nil // Move to next field
            }
        } else if newValue.isEmpty {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                self.focusedField = (index - 1) >= 0 ? index - 1 : 0 // Move back if deleted
            }
        }
    }

    private func verifyOTP() {
        let enteredOTP = otpCode.joined()
        print("Entered OTP: \(enteredOTP)")
    }
}

#Preview {
    OTPVerificationView()
}
