//
//  TextAttachmentChatItem.swift
//  Rocket.Chat
//
//  Created by Filipe Alvarenga on 30/09/18.
//  Copyright © 2018 Rocket.Chat. All rights reserved.
//

import Foundation
import DifferenceKit
import RocketChatViewController
import RealmSwift

final class TextAttachmentChatItem: BaseTextAttachmentChatItem, ChatItem, Differentiable {
    var relatedReuseIdentifier: String {
        return hasText ? TextAttachmentCell.identifier : TextAttachmentMessageCell.identifier
    }

    let fields: [UnmanagedField]
    let color: String?
    let hasText: Bool

    init(
        identifier: String,
        fields: [UnmanagedField],
        title: String,
        text: String?,
        color: String?,
        collapsed: Bool,
        hasText: Bool,
        user: UnmanagedUser?,
        message: UnmanagedMessage?
    ) {

        self.color = color
        self.fields = fields
        self.hasText = hasText

        super.init(
            identifier: identifier,
            title: title,
            text: text,
            collapsed: collapsed,
            user: user,
            message: message
        )
    }

    var differenceIdentifier: String {
        return identifier
    }

    func isContentEqual(to source: TextAttachmentChatItem) -> Bool {
        return collapsed == source.collapsed && fields == source.fields
    }
}
