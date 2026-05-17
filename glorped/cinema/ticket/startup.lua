local input_inventory = peripheral.find("sophisticatedstorage:barrel_2")
local output_inventory = peripheral.find("minecraft:chest")

while true do
  for items in pairs(input_inventory.list()) do
    if barrel.getItemDetail(i).name == "minecraft:slime" then
        input_inventory.pushItems(output_inventory.name, 1)
    else
        print(i)
    end
  end
  sleep(1)
end
