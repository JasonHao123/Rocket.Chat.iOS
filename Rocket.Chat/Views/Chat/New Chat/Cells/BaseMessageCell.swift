//
//  MessageHeaderCell.swift
//  Rocket.Chat
//
//  Created by Filipe Alvarenga on 11/10/18.
//  Copyright © 2018 Rocket.Chat. All rights reserved.
//

import UIKit
import RocketChatViewController

class BaseMessageCell: UICollectionViewCell, ChatCell {
    var messageWidth: CGFloat = 0
    var viewModel: AnyChatItem?
    var messageSection: MessageSection?

    lazy var avatarView: AvatarView = {
        let avatarView = AvatarView()

        avatarView.layer.cornerRadius = 4
        avatarView.layer.masksToBounds = true

        return avatarView
    }()

    var settings: AuthSettings? {
        return AuthManager.isAuthenticated()?.settings
    }

    func configure(completeRendering: Bool) {}

    func configure(with avatarView: AvatarView, date: UILabel, and username: UILabel, completeRendering: Bool) {
        guard
            let viewModel = viewModel?.base as? BaseMessageChatItem,
            let user = viewModel.user
        else {
            return
        }

        date.text = viewModel.dateFormatted
        username.text = viewModel.alias ?? user.username

        if completeRendering {
            avatarView.emoji = viewModel.emoji
            avatarView.username = user.username

            if let avatar = viewModel.avatar {
                avatarView.avatarURL = URL(string: avatar)
            } else {
                avatarView.avatarURL = user.avatarURL
            }
        }
    }

    func configure(readReceipt button: UIButton) {
        guard
            let viewModel = viewModel?.base as? BaseMessageChatItem,
            let settings = settings
        else {
            return
        }

        if settings.messageReadReceiptEnabled {
            button.isHidden = false
        } else {
            button.isHidden = true
            button.changeWidth(to: 0)
            button.changeLeading(to: 0)

            let image = viewModel.isUnread ? UIImage(named: "Unread") : UIImage(named: "Read")
            button.setImage(image, for: .normal)
        }
    }
}