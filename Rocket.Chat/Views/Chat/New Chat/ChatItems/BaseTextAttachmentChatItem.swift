//
//  BaseTextAttachmentChatItem.swift
//  Rocket.Chat
//
//  Created by Filipe Alvarenga on 06/11/18.
//  Copyright © 2018 Rocket.Chat. All rights reserved.
//

import Foundation

class BaseTextAttachmentChatItem: BaseMessageChatItem {
    let identifier: String
    let title: String
    let text: String?
    let collapsed: Bool
    let normalizedText: String

    init(
        identifier: String,
        title: String,
        text: String?,
        collapsed: Bool,
        user: UnmanagedUser?,
        message: UnmanagedMessage?
    ) {

        self.identifier = identifier
        self.title = title
        self.text = text
        self.collapsed = collapsed

        if let text = text {
            self.normalizedText = MarkdownManager.shared.normalizeString(text)
        } else {
            self.normalizedText = ""
        }

        super.init(
            user: user,
            message: message
        )
    }
}
