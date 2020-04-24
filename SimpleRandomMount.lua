local SimpleRandomMount = LibStub("AceAddon-3.0"):NewAddon("SimpleRandomMount")
local group = {}
SLASH_SimpleRandomMount1 = "/srm"
SLASH_SimpleRandomMount2 = "/simplerandommount"


SimpleRandomMount.ground = {
	
}



SimpleRandomMount.aquatic = {
	"Brinedeep Bottom-Feeder",
	"Crimson Tidestallion",
	"Darkwater Skate",
	"Fabious",
	"Fathom Dweller",
	"Great Sea Ray",
	"Inkscale Deepseeker",
	"Pond Nettle",
	"Riding Turtle",
	"Saltwater Seahorse",
	"Sea Turtle",
	"Subdued Seahorse",
	"Surf Jelly",
	"Vashj'ir Seahorse"
}

function SlashCmdList.SimpleRandomMount(msg, editbox)
	if msg == "aquatic" then
		SimpleRandomMount:Mount(SimpleRandomMount.aquatic, table.getn(SimpleRandomMount.aquatic))
	elseif msg == "ground" then
		SimpleRandomMount:Mount(SimpleRandomMount.ground, table.getn(SimpleRandomMount.ground))
	elseif msg == "flying" then
		SimpleRandomMount:Mount(SimpleRandomMount.flying, table.getn(SimpleRandomMount.flying))
	else
		print("Command not found!")
	end
end

function SimpleRandomMount:Mount(mounts, number)
	local rand
	local usable = false
	for i = 1, number do
		if IsUsableSpell(mounts[i]) then
			usable = true
			break
		end
	end
	if usable then
		repeat
			rand = math.random(1, number)
		until IsUsableSpell(mounts[rand])
		CastSpellByName(mounts[rand])
	elseif (mounts == self.fullGround) and IsUsableSpell("Summon Chauffeur") then
		CastSpellByName("Summon Chauffeur")
	end
end
