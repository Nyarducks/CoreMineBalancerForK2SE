data:extend({
    {
        type = "int-setting",
        name = "deep-core-fragment-amount",
        setting_type = "startup",
        default_value = 20,
        minimum_value = 1,
        maximum_value = 100,
        order = "1110",
        localised_name = {"", "コアフラグメント必要数"},
        localised_description = {"", "レシピに必要なコアフラグメントの数を設定する。"},
        setting_description_key = "mod-setting-name.deep-core-fragment-amount"
    }
})

local resources = {
    {name = "stone", placeholder="石", description = "コアフラグメントから石を取得する", defaultAmount = 3, defaultChance = 1},
    {name = "iron", placeholder="鉄鉱石", description = "コアフラグメントから鉄鉱石を取得する", defaultAmount = 3, defaultChance = 1},
    {name = "copper", placeholder="銅鉱石", description = "コアフラグメントから銅鉱石を取得する", defaultAmount = 2, defaultChance = 1},
    {name = "coal", placeholder="石炭", description = "コアフラグメントから石炭を取得する", defaultAmount = 2, defaultChance = 1},
    {name = "uranium", placeholder="ウラン鉱石", description = "コアフラグメントからウラン鉱石を取得する", defaultAmount = 1, defaultChance = 0.32},
    {name = "rare", placeholder="レアメタル鉱石", description = "コアフラグメントからレアメタルを取得する（Krastorio2のみ）", defaultAmount = 1, defaultChance = 0.8},
    {name = "mwater", placeholder="鉱水", description = "コアフラグメントから鉱水を取得する（Krastorio2のみ）", defaultAmount = 8, defaultChance = 1},
    {name = "oil", placeholder="原油", description = "コアフラグメントから原油を取得する", defaultAmount = 16, defaultChance = 1},
    {name = "water", placeholder="水", description = "コアフラグメントから水を取得する", defaultAmount = 32, defaultChance = 1},
    {name = "pyro", placeholder="パイロフラックス", description = "コアフラグメントからを取得する", defaultAmount = 4, defaultChance = 1}
}

local settings = {}
local order = 1120

for _, resource in ipairs(resources) do
    table.insert(settings, {
        type = "bool-setting",
        name = "use-" .. resource.name,
        setting_type = "startup",
        default_value = true,
        order = tostring(order),
        localised_name = {"", resource.description}
    })

    table.insert(settings, {
        type = "int-setting",
        name = resource.name .. "-amount",
        setting_type = "startup",
        default_value = resource.defaultAmount,
        minimum_value = 1,
        maximum_value = 1000,
        order = tostring(order + 1),
        localised_name = {"", "" .. resource.placeholder .. "の獲得量"},
        localised_description = {"", "コアフラグメントから" .. resource.placeholder .. "を獲得できる量を設定する。"},
        setting_description_key = "mod-setting-name." .. resource.name .. "-amount"
    })

    table.insert(settings, {
        type = "double-setting",
        name = resource.name .. "-chance",
        setting_type = "startup",
        default_value = resource.defaultChance,
        minimum_value = 0.01,
        maximum_value = 1,
        order = tostring(order + 2),
        localised_name = {"", "" .. resource.placeholder .. "の獲得率"},
        localised_description = {"", "コアフラグメントから" .. resource.placeholder .. "を獲得できる確率を設定する。"},
        setting_description_key = "mod-setting-name." .. resource.name .. "-chance"
    })

    order = order + 10
end

data:extend(settings)
