import Foundation
import SessionUtilitiesKit

public struct SNSnodeKitConfiguration {
    public let storage: SessionSnodeKitStorageProtocol

    internal static var shared: SNSnodeKitConfiguration!
}

public enum SNSnodeKit { // Just to make the external API nice
    public static func migrations() -> TargetMigrations {
        return TargetMigrations(
            identifier: .snodeKit,
            migrations: [
                [
                    _001_InitialSetupMigration.self
                ],
                [
                    _002_YDBToGRDBMigration.self
                ]
            ]
        )
    }

    public static func configure(storage: SessionSnodeKitStorageProtocol) {
        SNSnodeKitConfiguration.shared = SNSnodeKitConfiguration(storage: storage)
    }
}
