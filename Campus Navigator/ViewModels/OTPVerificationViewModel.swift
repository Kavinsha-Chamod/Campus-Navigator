import SwiftUI

class OTPVerificationLogic: ObservableObject {
    @Published var otpCode: [String] = Array(repeating: "", count: 4)
    private let correctOTP = "3442"

    func handleOTPInput(index: Int, newValue: String, focusedField: inout Int?) { 
        if newValue.count > 1 {
            otpCode[index] = String(newValue.prefix(1))
        }
        if !newValue.isEmpty && index < 3 {
            focusedField = index + 1
        } else if newValue.isEmpty && index > 0 {
            focusedField = index - 1
        }
    }

    func verifyOTP() -> Bool {
        let enteredOTP = otpCode.joined()
        return enteredOTP == correctOTP
    }
}
