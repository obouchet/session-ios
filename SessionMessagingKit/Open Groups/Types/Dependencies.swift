// Copyright © 2022 Rangeproof Pty Ltd. All rights reserved.

import Foundation
import Sodium
import SessionSnodeKit

extension OpenGroupAPI {
    public struct Dependencies {
        let api: OnionRequestAPIType.Type
        let storage: SessionMessagingKitStorageProtocol
        let sodium: SodiumType
        let aeadXChaCha20Poly1305Ietf: AeadXChaCha20Poly1305IetfType
        let sign: SignType
        let genericHash: GenericHashType
        let ed25519: Ed25519Type.Type
        let nonceGenerator: NonceGenerator16ByteType
        let date: Date
        
        public init(
            api: OnionRequestAPIType.Type = OnionRequestAPI.self,
            storage: SessionMessagingKitStorageProtocol = SNMessagingKitConfiguration.shared.storage,
            // TODO: Shift the next 3 to be abstracted behind a single "signing" class?
            sodium: SodiumType = Sodium(),
            aeadXChaCha20Poly1305Ietf: AeadXChaCha20Poly1305IetfType? = nil,
            sign: SignType? = nil,
            genericHash: GenericHashType? = nil,
            ed25519: Ed25519Type.Type = Ed25519.self,
            nonceGenerator: NonceGenerator16ByteType = NonceGenerator16Byte(),
            date: Date = Date()
        ) {
            self.api = api
            self.storage = storage
            self.sodium = sodium
            self.aeadXChaCha20Poly1305Ietf = (aeadXChaCha20Poly1305Ietf ?? sodium.getAeadXChaCha20Poly1305Ietf())
            self.sign = (sign ?? sodium.getSign())
            self.genericHash = (genericHash ?? sodium.getGenericHash())
            self.ed25519 = ed25519
            self.nonceGenerator = nonceGenerator
            self.date = date
        }
        
        // MARK: - Convenience
        
        public func with(
            api: OnionRequestAPIType.Type? = nil,
            storage: SessionMessagingKitStorageProtocol? = nil,
            sodium: SodiumType? = nil,
            aeadXChaCha20Poly1305Ietf: AeadXChaCha20Poly1305IetfType? = nil,
            sign: SignType? = nil,
            genericHash: GenericHashType? = nil,
            ed25519: Ed25519Type.Type? = nil,
            nonceGenerator: NonceGenerator16ByteType? = nil,
            date: Date? = nil
        ) -> Dependencies {
            return Dependencies(
                api: (api ?? self.api),
                storage: (storage ?? self.storage),
                sodium: (sodium ?? self.sodium),
                aeadXChaCha20Poly1305Ietf: (aeadXChaCha20Poly1305Ietf ?? self.aeadXChaCha20Poly1305Ietf),
                sign: (sign ?? self.sign),
                genericHash: (genericHash ?? self.genericHash),
                ed25519: (ed25519 ?? self.ed25519),
                nonceGenerator: (nonceGenerator ?? self.nonceGenerator),
                date: (date ?? self.date)
            )
        }
    }
}
