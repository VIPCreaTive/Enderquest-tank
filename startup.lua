ChestCount = 0
Chest = {}
Chestnumber = 0
color = ""

for x=1,30 do
Chest[x] = {}
end

function loadvar()
	local file = fs.open("saves/variables","r")
	local fileData = {}
	local line = file.readLine()
repeat
	table.insert(fileData,line)
	line = file.readLine()
until line == nil
file.close()
	ChestCount = fileData[1]
end

function farben()
print("")
print("white	1	-	lightGray	256")
print("orange	2	-	cyan	512")
print("magenta	4	-	purple	1024")
print("lightBlue	8	-	blue	2048")
print("yellow	16	-	brown	4096")
print("lime	32	-	green	8192")
print("pink	64	-	red	16384")
print("gray	128	-	black	32768")
print("")
end

function newchest()
monitor.clear()
monitor.setCursorPos(1,1)
Chestnumber = ChestCount + 1
print("Geben Sie einen Chestnamen ein!	Neue Nummer wird : "..Chestnumber.." ")
monitor.write("Chestname: ")
Chestname = read()

Chest[Chestnumber][1] = Chestname

farben()
print("Geben Sie die erste Farbe ein!")
Chestcolor1 = read()
Chest[Chestnumber][2] = Chestcolor1

print("Geben Sie die zweite Farbe ein!")
Chestcolor2 = read()
Chest[Chestnumber][3] = Chestcolor2

print("Geben Sie die dritte Farbe ein!")
Chestcolor3 = read()
Chest[Chestnumber][4] = Chestcolor3

--Create Directory
fs.makeDir("saves")
--Create/Update File
setchest()

--Update Variables
updatevar()

--More Chests?
monitor.clear()
print("Moechten Sie weitere Chests hinzufuegen? (y/n)")
local input = read()
	if input == "y" then
		newchest()
	elseif input == "n" then
		chest()
	else
		print("Ungueltige Eingabe! Zeige Chests an")
		chest()
	end
end

function setchest()
local file = fs.open("saves/"..Chestnumber,"w")
file.writeLine(Chestname)
file.close()
local file = fs.open("saves/"..Chestnumber,"a")
file.writeLine(Chestcolor1)
file.writeLine(Chestcolor2)
file.writeLine(Chestcolor3)
file.close()
end

function updatevar()
local file = fs.open("saves/variables","w")
ChestCount = ChestCount + 1
file.writeLine(ChestCount)
file.close()
end

function readchests()
clear()
for x=1,ChestCount do
--repeat
local file = fs.open("saves/"..(x),"r")
local fileData = {}
local line = file.readLine()
repeat
table.insert(fileData,line)
line = file.readLine()
until line == nil
file.close()
	--Übergabe Chestdaten aus Datei
	for y=1,4 do
		Chest[x][y] = fileData[y]
		--prints all Chestdata
		--print((Chest[x][y]))
	end
end
chest()
end

function chest()
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
for x=1,ChestCount do 
	monitor.setCursorPos(3,(x) + 3)
	monitor.setTextColor(1)
	monitor.write((x) .. "  " .. (Chest[x][1]))
	
	monitor.setCursorPos(17,(x) + 3)
	monitor.setTextColor(tonumber(Chest[x][2]))
	monitor.write("[]")
	
	monitor.setTextColor(tonumber(Chest[x][3]))
	monitor.write("[]")
	
	monitor.setTextColor(tonumber(Chest[x][4]))
	monitor.write("[]")
end
tank()
end

function updatechest()
clear()
print("Welche Chest soll geaendert werden? (1-"..ChestCount..")")
Chestnumber = tonumber(read())
for x=1,1 do
--repeat
local file = fs.open("saves/"..(Chestnumber),"r")
local fileData = {}
local line = file.readLine()
repeat
table.insert(fileData,line)
line = file.readLine()
until line == nil
file.close()
	--Übergabe Chestdaten aus Datei
	for y=1,4 do
		Chest[Chestnumber][y] = fileData[y]
	end
--end
end
print("Geben Sie einen Chestnamen ein!")
print("Alter Name : "..(Chest[Chestnumber][1]).." ")
Chestname = read()
Chest[Chestnumber][1] = Chestname

farben()
print("Geben Sie die erste Farbe ein!")
print("Alte Farbe: "..(Chest[Chestnumber][2]))
Chestcolor1 = read()
Chest[Chestnumber][2] = Chestcolor1

print("Geben Sie die zweite Farbe ein!")
print("Alte Farbe: "..(Chest[Chestnumber][3]))
Chestcolor2 = read()
Chest[Chestnumber][3] = Chestcolor2

print("Geben Sie die dritte Farbe ein!")
print("Alte Farbe: "..(Chest[Chestnumber][4]))
Chestcolor3 = read()
Chest[Chestnumber][4] = Chestcolor3
	
setchest()
start()
end

function tank()
--Tank
monitor.setCursorPos(29,4)
monitor.write("Cryo")
monitor.setCursorPos(43,4)
monitor.setTextColor(colors.orange)
monitor.write("[]")
monitor.setTextColor(colors.white)
monitor.write("[]")
monitor.setTextColor(colors.orange)
monitor.write("[]")
start()
end

function start()
print(ChestCount)
print("Was soll gemacht werden?")
--print("a) - Daten anzeigen")
print("h) - Daten hinzufuegen")
print("l) - Daten lesen/anzeigen")
print("u) - Update Chest")
local input = read()
if input == "a" then
		chest()
	elseif input == "h" then
		newchest()
	elseif input == "l" then
		readchests()
	elseif input == "u" then
		updatechest()
	else 
		print("ungueltige Eingabe")
	end
end

function keepalive()	
	monitor = peripheral.wrap("right")
	tank()
	sleep(3)
	chest()
start()
end

function clear()
monitor.clear()
term.clear()
term.setCursorPos(1,1)
end

for x=1,1 do
loadvar() --load variables
monitor = peripheral.wrap("right")
	if (tonumber(ChestCount)) > 0 then
		readchests()
	else
		start()
	end
end