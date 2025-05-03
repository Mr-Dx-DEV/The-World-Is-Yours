--- Store resource name for later validation.
RESOURCE_NAME = GetCurrentResourceName()

--- @section Import Utils Modules

CALLBACKS = exports.boii_utils:get("modules.callbacks")
KEYS = exports.boii_utils:get("modules.keys")
TABLES = exports.boii_utils:get("modules.tables")
NOTIFICATIONS = exports.boii_utils:get("modules.notifications")
REQUESTS = exports.boii_utils:get("modules.requests")
PLAYER = exports.boii_utils:get("modules.player")
CORE = exports.boii_utils:get("modules.core")

--- @section External Resource Settings

--- @todo

--- @section Global Player Variables

is_placing = false