ChestCount = 0
ChestNumber = {}
Chest = {}
ChestInfo = {}



function newchest()

monitor.clear()
monitor.setCursorPos(1,1)
print("Geben Sie einen Chestnamen ein!")
monitor.write("Chestname: ")
local input = read()
Chest[ChestCount + 1]ChestInfo[1] = input

monitor.setCursorPos(1,1)
print("Geben Sie die erste Farbe ein!")
monitor.write("Farbe Nr.1: ")
local input = read()
Chest[ChestCount + 1]ChestInfo[2] = input

print(Chest[1][1])
print(Chest[1][2])

end




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
newchest()
--tank()
--sleep(3)
--Right Monitor
monitor= peripheral.wrap("right")
newchest()
--tank()
end