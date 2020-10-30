//
//  LogoutErrorCode.swift
//  zalo-swiftui-demo
//
//  Created by Thang Nguyen on 10/28/20.
//

import Foundation

enum LogoutErrorCode: Int, Decodable, Equatable {
    case successful
    case shouldBackupFirst
    case logoutByOtherDevice
}
