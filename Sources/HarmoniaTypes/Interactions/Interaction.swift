//
//  Interaction.swift
//  Harmonia
//
//  Created by Helloyunho on 2025/9/28.
//

import Foundation

public enum InteractionType: Int, Codable {
    case PING = 1, APPLICATION_COMMAND, MESSAGE_COMPONENT, APPLICATION_COMMAND_AUTOCOMPLETE, MODAL_SUBMIT
}

public enum InteractionData: Codable {
    case applicationCommand(ApplicationCommandData)
    case messageComponent(MessageComponentData)
    case modalSubmit(ModalSubmitData)
}

public struct Interaction: Codable {
    public var id: Snowflake
    public var application_id: Snowflake
    public var type: InteractionType
    public var data: InteractionData?
}

public enum InteractionCallbackType: Int, Codable {
    case PONG = 1
    case CHANNEL_MESSAGE_WITH_SOURCE = 4, DEFERRED_CHANNEL_MESSAGE_WITH_SOURCE, DEFERRED_UPDATE_MESSAGE,
         UPDATE_MESSAGE, APPLICATION_COMMAND_AUTOCOMPLETE_RESULT, MODAL, PREMIUM_REQUIRED
    case LAUNCH_ACTIVITY = 12
}

public enum InteractionCallbackData: Codable {
    case message(MessageInteractionCallbackData)
    case autocomplete(AutocompleteInteractionCallbackData)
    case modal(ModalInteractionCallbackData)
}

public struct InteractionResponse: Codable {
    public var type: InteractionCallbackType
    public var data: InteractionCallbackData?
}

public struct InteractionCallback: Codable {
    public var id: Snowflake
    public var type: InteractionType
    public var activity_instance_id: String?
    public var response_message_id: Snowflake?
    public var response_message_loading: Bool?
    public var response_message_ephemeral: Bool?
}

public struct InteractionCallbackActivityInstanceResource: Codable {
    public var id: Snowflake
}

public struct InteractionCallbackResource: Codable {
    public var type: InteractionCallbackType
    public var activity_instance: InteractionCallbackActivityInstanceResource?
//    public var message: Message?
}

public struct InteractionCallbackResponse: Codable {
    public var interaction: InteractionCallback
    public var resource: InteractionResponse?
}
