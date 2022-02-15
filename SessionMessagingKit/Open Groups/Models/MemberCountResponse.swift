// Copyright © 2022 Rangeproof Pty Ltd. All rights reserved.

import Foundation

extension OpenGroupAPI {
    struct MemberCountResponse: Codable {
        enum CodingKeys: String, CodingKey {
            case memberCount = "member_count"
        }
        
        let memberCount: UInt64
    }
}
