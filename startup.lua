function chest()
monitor.clear()
monitor.setTextColor(colors.white)
monitor.setCursorPos(3,2)
monitor.write("Chest")
monitor.setCursorPos(25,2)
monitor.write("|")
monitor.setCursorPos(29,2)
monitor.write("Tank")
monitor.setCursorPos(3,3)
monitor.write("-----------------------------------------------")

for x=4,18 do
monitor.setCursorPos(25,x)
monitor.write("|")
end

--Chest
monitor.setCursorPos(3,4)
monitor.setTextColor(colors.white)
monitor.write("[][][]  Ore-Input")

monitor.setCursorPos(3,5)
monitor.setTextColor(colors.lightBlue)
monitor.write("[][][]  ME-Input")

monitor.setCursorPos(3,6)
monitor.setTextColor(colors.pink)
monitor.write("[]")
monitor.setTextColor(colors.white)
monitor.write("[]")
monitor.setTextColor(colors.white)
monitor.write("[]")
monitor.setTextColor(colors.pink)
monitor.write("  Ore-Input")

monitor.setCursorPos(3,7)
monitor.setTextColor(colors.green)
monitor.write("[]")
monitor.setTextColor(colors.green)
monitor.write("[]")
monitor.setTextColor(colors.green)
monitor.write("[]")
monitor.setTextColor(colors.green)
monitor.write("  Furnace-Input")
end

function tank()
--Tank
monitor.setTextColor(colors.orange)
monitor.setCursorPos(29,4)
monitor.write("[][][]  inaktiv-Lava")
end

while true do
--Left Monitor
monitor= peripheral.wrap("left")
chest()
tank()
sleep(3)
--Right Monitor
monitor= peripheral.wrap("right")
chest()
tank()
end