require("items.widgets.battery")
require("items.widgets.volume")
require("items.widgets.memory")
require("items.widgets.cpu")
require("items.widgets.wifi")

-- Execute the event provider binary which provides the event "network_update"
-- for the network interface "en0", which is fired every 2.0 seconds.
sbar.exec("killall network_load >/dev/null; $CONFIG_DIR/helpers/event_providers/network_load/bin/network_load en0 network_update 2.0")

-- Update with path to stats_provider
sbar.exec('killall stats_provider >/dev/null; $CONFIG_DIR/helpers/event_providers/stats_provider --cpu usage --memory ram_usage --interval 2')
