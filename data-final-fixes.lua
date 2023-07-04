local recipe = data.raw.recipe["se-core-fragment-omni"]
local useStone = settings.startup["use-stone"].value
local useIron = settings.startup["use-iron"].value
local useCopper = settings.startup["use-copper"].value
local useCoal = settings.startup["use-coal"].value
local useUranium = settings.startup["use-uranium"].value
local useRare = settings.startup["use-rare"].value
local useMwater = settings.startup["use-mwater"].value
local useOil = settings.startup["use-oil"].value
local useWater = settings.startup["use-water"].value
local usePyro = settings.startup["use-pyro"].value

local resourceSettings = {
    Stone = { amount = settings.startup["stone-amount"].value, chance = settings.startup["stone-chance"].value },
    Iron = { amount = settings.startup["iron-amount"].value, chance = settings.startup["iron-chance"].value },
    Copper = { amount = settings.startup["copper-amount"].value, chance = settings.startup["copper-chance"].value },
    Coal = { amount = settings.startup["coal-amount"].value, chance = settings.startup["coal-chance"].value },
    Uranium = { amount = settings.startup["uranium-amount"].value, chance = settings.startup["uranium-chance"].value },
    Rare = { amount = settings.startup["rare-amount"].value, chance = settings.startup["rare-chance"].value },
    Mwater = { amount = settings.startup["mwater-amount"].value, chance = settings.startup["mwater-chance"].value },
    Oil = { amount = settings.startup["oil-amount"].value, chance = settings.startup["oil-chance"].value },
    Water = { amount = settings.startup["water-amount"].value, chance = settings.startup["water-chance"].value },
    Pyro = { amount = settings.startup["pyro-amount"].value, chance = settings.startup["pyro-chance"].value }
}

recipe.ingredients[1].amount = settings.startup["deep-core-fragment-amount"].value
recipe.energy_required = settings.startup["deep-core-fragment-amount"].value

recipe.results = {}

if useStone then
    table.insert(recipe.results, { type = "item", name = "stone", amount = resourceSettings.Stone.amount, probability = resourceSettings.Stone.chance })
end

if useIron then
    table.insert(recipe.results, { type = "item", name = "iron-ore", amount = resourceSettings.Iron.amount, probability = resourceSettings.Iron.chance })
end

if useCopper then
    table.insert(recipe.results, { type = "item", name = "copper-ore", amount = resourceSettings.Copper.amount, probability = resourceSettings.Copper.chance })
end

if useCoal then
    table.insert(recipe.results, { type = "item", name = "coal", amount = resourceSettings.Coal.amount, probability = resourceSettings.Coal.chance })
end

if useUranium then
    table.insert(recipe.results, { type = "item", name = "uranium-ore", amount = resourceSettings.Uranium.amount, probability = resourceSettings.Uranium.chance })
end

if mods["Krastorio2"] and useRare then
    table.insert(recipe.results, { type = "item", name = "raw-rare-metals", amount = resourceSettings.Rare.amount, probability = resourceSettings.Rare.chance })
end

if mods["Krastorio2"] and useMwater then
    table.insert(recipe.results, { type = "fluid", name = "mineral-water", amount = resourceSettings.Mwater.amount })
end

if useOil then
    table.insert(recipe.results, { type = "fluid", name = "crude-oil", amount = resourceSettings.Oil.amount })
end

if useWater then
    table.insert(recipe.results, { type = "fluid", name = "water", amount = resourceSettings.Water.amount })
end

if usePyro then
    table.insert(recipe.results, { type = "fluid", name = "se-pyroflux", amount = resourceSettings.Pyro.amount })
end
