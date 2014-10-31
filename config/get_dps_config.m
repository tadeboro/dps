function val = get_dps_config (key)

# Function that returns proper configuration values
# Supported configuration options are:
#  * "play" - get play command
#  * "rec"  - get recording command
#  * "tmp"  - get temporary dir

  config.play = "play";
  config.rec  = "rec";
  config.tmp  = "/tmp/";

  val = "";
  if isfield (config, key)
    val = getfield (config, key);
  end
end
