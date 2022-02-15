// Copyright © 2022 Rangeproof Pty Ltd. All rights reserved.

import Foundation

extension OpenGroupAPI {
    struct UserPermissionsRequest: Codable {
        let rooms: [String]
        let timeout: TimeInterval
        let read: Bool
        let write: Bool
        let upload: Bool
    }
}
