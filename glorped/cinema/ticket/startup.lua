local input_inventory = peripheral.find("sophisticatedstorage:barrel")
local output_inventory = peripheral.find("minecraft:chest")

while true do
  for slot, item in pairs(input_inventory.list()) do
    if barrel.getItemDetail(slot).name == "minecraft:slime" then
        input_inventory.pushItems(output_inventory.name, 1)
    else
        print(slot, item)
    end
  end
  sleep(1)
end
