//
//  LoginErrorCode.swift
//  zalo-swiftui-demo
//
//  Created by Thang Nguyen on 10/26/20.
//

import Foundation

enum LoginErrorCode: Int, Decodable, CaseIterable {
    case successful
    case unknownException
    case invalidPhoneNumber
    case invalidActiveCode
    case userNotFound
    case passwordIncorrect
    case userWasBanned
    case invalidClient
    case tooManyRequest
    case deviceNotAccept
    case notSupportedVersion
    case invalidRejectCall
    case answerNotCorrect
    case questionAlreadyExceed
    case requireAnswer
    case answerNotCorrectAndFail
    case exceededCreateProfile
    case phoneNumberIsLocked
    case userNameIsInvalid
    case passwordIsReset
    case needVerifyAccount
    case lastWrongAnswer_exceedQuota
    
    
    var errorDescription: String {
        switch self {
        case .successful:
            return ""
        case .unknownException:
            return "Lỗi không xác định"
        case .invalidPhoneNumber:
            return "Số điện thoại không hợp lệ"
        case .invalidActiveCode:
            return "Sai mã kích hoạt"
        case .userNotFound:
            return "Tài khoản chưa được tạo"
        case .passwordIncorrect:
            return "Sai mật khẩu"
        case .userWasBanned:
            return "Tài khoản đã bị cấm"
        case .invalidClient:
            return "Thiết bị không hợp lệ"
        case .tooManyRequest:
            return "Quá nhiều yêu cầu đăng nhập"
        case .deviceNotAccept:
            return "Thiết bị không chấp thuận"
        case .notSupportedVersion:
            return "Phiên bản không hỗ trợ"
        case .invalidRejectCall:
            return "Từ chối cuộc gọi"
        case .answerNotCorrect:
            return "Câu trả lời không chính xác"
        case .questionAlreadyExceed:
            return "Quá nhiều lần trả lời câu hỏi"
        case .requireAnswer:
            return "Cần trả lời câu hỏi"
        case .answerNotCorrectAndFail:
            return "Câu trả lời không chính xác và thất bại"
        case .exceededCreateProfile:
            return "Chưa hoàn tất tạo tài khoản"
        case .phoneNumberIsLocked:
            return "Số điện thoại đã bị khóa"
        case .userNameIsInvalid:
            return "Tên đăng nhập không hợp lệ"
        case .passwordIsReset:
            return "Mật khẩu đã được đặt lại"
        case .needVerifyAccount:
            return "Cần xác thực tài khoản"
        case .lastWrongAnswer_exceedQuota:
            return "Vượt quá số lần trả lời sai câu hỏi"
        }
    }
}
