-- [[
-- for a given redis key and json property name return the value
-- 
-- $ redis-cli SET keyname '{"propname":"propvalue"}'
-- OK
-- $ redis-cli --eval get-json.lua , keyname propname 
-- "propvalue"
--
-- ]]

local key = ARGV[1]
local jsonPropertyName = ARGV[2]

local json = redis.call('GET',key)

if (json == false) then 
  return nil
else 
  return cjson.decode(json)[jsonPropertyName]
end
