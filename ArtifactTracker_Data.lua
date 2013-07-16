local addon, data = ...

data.ITEMS = {
  ["MINING"] = {
    { k=1,  name={["EN"]="Tin Lode"}, icon="Data\\UI\\item_icons\\ore11a.dds", skill=1 },
    { k=2,  name={["EN"]="Copper Vein"}, icon="Data\\UI\\item_icons\\ore03a.dds", skill=35 },
    { k=3,  name={["EN"]="Iron Vein"}, icon="Data\\UI\\item_icons\\ore03b.dds", skill=75 },
    { k=4,  name={["EN"]="Chromite Vein"}, icon="Data\\UI\\item_icons\\ore02a.dds", skill=115 },
    { k=5,  name={["EN"]="Cobalt Lode"}, icon="Data\\UI\\item_icons\\ore11b.dds", skill=145 },
    { k=6,  name={["EN"]="Silver Vein"}, icon="Data\\UI\\item_icons\\ore08.dds", skill=145 },
    { k=7,  name={["EN"]="Gold Vein"}, icon="Data\\UI\\item_icons\\ore06a.dds", skill=150 },
    { k=8,  name={["EN"]="Titanium Vein"}, icon="Data\\UI\\item_icons\\ore07.dds", skill=185 },
    { k=9,  name={["EN"]="Carmintium Deposit"}, icon="Data\\UI\\item_icons\\ore12.dds", skill=225 },
    { k=10, name={["EN"]="Platinum Deposit"}, icon="Data\\UI\\item_icons\\ore09.dds", skill=230 },
    { k=11, name={["EN"]="Orichalcum"}, icon="Data\\UI\\item_icons\\ore17.dds", skill=250 },
    { k=12, name={["EN"]="Karthite Vein"}, icon="Data\\UI\\item_icons\\ore13.dds" },
    { k=13, name={["EN"]="Gantimite Vein"}, icon="Data\\UI\\item_icons\\ore04b.dds" },
    { k=14, name={["EN"]="Rhenium Vein"}, icon="Data\\UI\\item_icons\\ore02.dds", skill=375 }
  },
  ["WOOD"] = {
    { k=1, name={["EN"]="Yew Log"}, icon="Data\\UI\\item_icons\\softwood.dds", skill=1 },
    { k=2, name={["EN"]="Ashwood Log"}, icon="Data\\UI\\item_icons\\wood5.dds", skill=35 },
    { k=3, name={["EN"]="Oak Log"}, icon="Data\\UI\\item_icons\\wood2.dds", skill=75 },
    { k=4, name={["EN"]="Mahogany Log"}, icon="Data\\UI\\item_icons\\plant43.dds", skill=115 },
    { k=5, name={["EN"]="Kingswood Log"}, icon="Data\\UI\\item_icons\\wood4.dds", skill=145 },
    { k=6, name={["EN"]="Runebirch Log"}, icon="Data\\UI\\item_icons\\runebirch_log_b.dds", skill=185 },
    { k=7, name={["EN"]="Sagebrush Log"}, icon="Data\\UI\\item_icons\\sagebrush.dds", skill=225 },
    { k=8, name={["EN"]="Shadethorn Branch"}, icon="Data\\UI\\item_icons\\wood5a.dds", skill=250 },
    { k=9, name={["EN"]="Linden Timber"}, icon="Data\\UI\\item_icons\\wood8.dds", skill=290 },
    { k=10, name={["EN"]="Elm Timber"}, icon="Data\\UI\\item_icons\\wood1.dds", skill=335 },
    { k=11, name={["EN"]="Madrosa Timber"}, icon="Data\\UI\\item_icons\\wood6a.dds", skill=375 }
  },
  ["PLANTS"] = {
    { k=1, name={["EN"]="Coastal Glory"}, icon="Data\\UI\\item_icons\\plant12.dds", skill=1 },
    { k=2, name={["EN"]="Grieveblossom"}, icon="Data\\UI\\item_icons\\plant48.dds", skill=1 },
    { k=3, name={["EN"]="Creeperbrush"}, icon="Data\\UI\\item_icons\\plant3.dds", skill=30 },
    { k=4, name={["EN"]="Krakenweed"}, icon="Data\\UI\\item_icons\\plant34.dds", skill=60 },
    { k=5, name={["EN"]="Razorbrush"}, icon="Data\\UI\\item_icons\\plant43.dds", skill=70 },
    { k=6, name={["EN"]="Duskglory"}, icon="Data\\UI\\item_icons\\plant2b.dds", skill=80 },
    { k=7, name={["EN"]="Golden Nettle"}, icon="Data\\UI\\item_icons\\plant31a.dds", skill=80 },
    { k=8, name={["EN"]="Wyvernspurr"}, icon="Data\\UI\\item_icons\\plant26.dds", skill=115 },
    { k=9, name={["EN"]="Tattertwist"}, icon="Data\\UI\\item_icons\\plant7c.dds", skill=140 },
    { k=10, name={["EN"]="Roc Orchid"}, icon="Data\\UI\\item_icons\\plant33b.dds", skill=145 },
    { k=11, name={["EN"]="Drakefoot"}, icon="Data\\UI\\item_icons\\plant26a.dds", skill=180 },
    { k=12, name={["EN"]="Bloodshade"}, icon="Data\\UI\\item_icons\\plant40.dds", skill=200 },
    { k=13, name={["EN"]="Basiliskweed"}, icon="Data\\UI\\item_icons\\plant30.dds", skill=225 },
    { k=14, name={["EN"]="Tempestflower"}, icon="Data\\UI\\item_icons\\plant25a.dds", skill=230 },
    { k=15, name={["EN"]="Twilight Bloom"}, icon="Data\\UI\\item_icons\\plant29.dds", skill=250 },
    { k=16, name={["EN"]="Chimera's Cloak"}, icon="Data\\UI\\item_icons\\plant10a.dds", skill=290 },
    { k=17, name={["EN"]="Frazzleweed"}, icon="Data\\UI\\item_icons\\plant36b.dds", skill=335 },
    { k=18, name={["EN"]="Lucidflower"}, icon="Data\\UI\\item_icons\\plant22.dds", skill=375 }
  },
  ["FISH"] = {
    { k=1, name={["EN"]="School of Fish"}, icon="Data\\UI\\item_icons\\fish_43.dds", skill=375 },
    { k=2, name={["EN"]="School of Clever Fish"}, icon="Data\\UI\\item_icons\\fish_38.dds", skill=375 },
    { k=3, name={["EN"]="School of Rare Fish"}, icon="Data\\UI\\item_icons\\fish_39_a.dds", skill=375 },
    { k=4, name={["EN"]="School of Strangely Mutated Fish"}, icon="Data\\UI\\item_icons\\akylios_balloon.dds", skill=375 },
    { k=5, name={["EN"]="Sunken Boat"}, icon="Data\\UI\\item_icons\\magical_component6.dds", skill=375 }
  }
}

data.translate = {
  ["RU"] = {
    ["MINING"] = {
      { k=1, n="Оловянная жила"},
      { k=2, n="Медная жила"},
      { k=3, n="Железная жила"},
      { k=4, n="Хромитовая жила"},
      { k=5, n="Залежи кобальта"},
      { k=6, n="Серебряная жила"},
      { k=7, n="Золотая жила"},
      { k=8, n="Титановая жила"},
      { k=9, n="Месторождение карминтия"},
      { k=10, n="Платиновая жила"},
      { k=11, n="Орихалковая жила"},
      { k=12, n="Каритовая жила"},
      { k=13, n="Гантимитовая жила"},
      { k=14, n="Рениевая жила"}
    },
    ["WOOD"] = {
      { k=1, n="Древесина тиса"},
      { k=2, n="Древесина ясеня"},
      { k=3, n="Дубовое полено"},
      { k=4, n="Бревно красного дерева"},
      { k=5, n="Полено королевского дерева"},
      { k=6, n="Полено рунной березы"},
      { k=7, n="Стебель полыни"},
      { k=8, n="Полено сумрачного боярышника"},
      { k=9, n="Брус липы"},
      { k=10, n="Древесина вяза"},
      { k=11, n="Древесина Мадрозы"}
    },
    ["PLANTS"] = {
      { k=1, n="Прибрежная слава"},
      { k=2, n="Горецвет"},
      { k=3, n="Ползучий кустарник"},
      { k=4, n="Трава кракена"},
      { k=5, n="Бритвенник"},
      { k=6, n="Сумроцвет"},
      { k=7, n="Золотистая крапива"},
      { k=8, n="Виверновые шпоры"},
      { k=9, n="Тряпочник"},
      { k=10, n="Орхидея рух"},
      { k=11, n="Драконник"},
      { k=12, n="Кровотень"},
      { k=13, n="Василисник"},
      { k=14, n="Бурецвет"},
      { k=15, n="Сумеречник"},
      { k=16, n="Плащ химеры"},
      { k=17, n="Одолень-трава"},
      { k=18, n="Ясноцвет"}
    },
    ["FISH"] = {
      { k=1, n="Косяк рыбы"},
      { k=2, n="Косяк хитрой рыбы"},
      { k=3, n="Косяк редкой рыбы"},
      { k=4, n="Косяк странно мутировавшей рыбы"},
      { k=5, n="Затонувшая лодка"}
    }
  },
  ["DE"] = {
    ["MINING"] = {
      { k=1,  n="Zinnader"},
      { k=2,  n="Kupferader"},
      { k=3,  n="Eisenader"},
      { k=4,  n="Chromitader"},
      { k=5,  n="Kobaltader"},
      { k=6,  n="Silberader"},
      { k=7,  n="Goldader"},
      { k=8,  n="Titanader"},
      { k=9,  n="Carmintium-Lager"},
      { k=10, n="Platin-Lager"},
      { k=11, n="Orichalcum"},
      { k=12, n="Tuthonyader"},
      { k=13, n="Gantimitader"},
      { k=14, n="Rheniumader"}
    },
    ["WOOD"] = {
      { k=1, n="Eibenstamm"},
      { k=2, n="Eschenholzstamm"},
      { k=3, n="Eichenstamm"},
      { k=4, n="Mahagoni-Stamm"},
      { k=5, n="Königsholz-Stamm"},
      { k=6, n="Runenbirken-Stamm"},
      { k=7, n="Salbeistamm"},
      { k=8, n="Schattendorn-Ast"},
      { k=9, n="Lindenholz"},
      { k=10, n="Ulmenholz"},
      { k=11, n="Madrosaholz"}
    },
    ["PLANTS"] = {
      { k=1, n="Küstenpracht"},
      { k=2, n="Trauerblüte"},
      { k=3, n="Kreuchstrauch"},
      { k=4, n="Krakenkraut"},
      { k=5, n="Klingenstrauch"},
      { k=6, n="Dämmerruhm"},
      { k=7, n="Goldnessel"},
      { k=8, n="Lindwurmstachel"},
      { k=9, n="Fledderflechte"},
      { k=10, n="Rokh-Orchidee"},
      { k=11, n="Drakenfuß"},
      { k=12, n="Blutschatten"},
      { k=13, n="Basiliskenkraut"},
      { k=14, n="Sturmblume"},
      { k=15, n="Zwielichtblüte"},
      { k=16, n="Chimeras Mantel"},
      { k=17, n="Fransenkraut"},
      { k=18, n="Leuchtblume"}
    },
    ["FISH"] = {
      { k=1, n="Fischschwarm"},
      { k=2, n="Schwarm kluger Fische"},
      { k=3, n="Schwarm seltener Fische"},
      { k=4, n="Schwarm Seltsam Mutierter Fische"},
      { k=5, n="Sunken Boat"}
    }
  },
  ["FR"] = {
    ["MINING"] = {
      { k=1,  n="Filon de fer-blanc"},
      { k=2,  n="Veine de cuivre"},
      { k=3,  n="Veine de fer"},
      { k=4,  n="Veine de Chromite"},
      { k=5,  n="Filon de Cobalt"},
      { k=6,  n="Filon d'argent"},
      { k=7,  n="Veine d'or"},
      { k=8,  n="Veine de titane"},
      { k=9,  n="Gisement de carmintium"},
      { k=10, n="Gisement de platine"},
      { k=11, n="Orichalque"},
      { k=12, n="Veine de tuthonie"},
      { k=13, n="Veine de gantimite"},
      { k=14, n="Veine en rhénium"}
    },
    ["WOOD"] = {
      { k=1, n="Rondin d'if"},
      { k=2, n="Bûche de frêne"},
      { k=3, n="Bûche de chêne"},
      { k=4, n="Bûche d'acajou"},
      { k=5, n="Bûche de bois royal"},
      { k=6, n="Bûche de rune-bouleau"},
      { k=7, n="Bûche d'armoise"},
      { k=8, n="Branche d'ombrépine"},
      { k=9, n="Branche de tilleul"},
      { k=10, n="Branche d'orme"},
      { k=11, n="Branche de madrosa"}
    },
    ["PLANTS"] = {
      { k=1, n="Gloire côtière"},
      { k=2, n="Fleur de chagrin"},
      { k=3, n="Ronce grimpante"},
      { k=4, n="Herbe à kraken"},
      { k=5, n="Ronce tranchante"},
      { k=6, n="Gloire du couchant"},
      { k=7, n="Ortie dorée"},
      { k=8, n="Ergot de wyverne"},
      { k=9, n="Tournehaillon"},
      { k=10, n="Orchiderokh"},
      { k=11, n="Patte-de-drake"},
      { k=12, n="Ombresang"},
      { k=13, n="Herbasilic"},
      { k=14, n="Fleur de la Tempête"},
      { k=15, n="Fleur du crépuscule"},
      { k=16, n="Cape de la Chimère"},
      { k=17, n="Herbe calcinée"},
      { k=18, n="Floralucida"}
    },
    ["FISH"] = {
      { k=1, n="Banc de poissons"},
      { k=2, n="Banc de poissons malins"},
      { k=3, n="Banc de poissons rares"},
      { k=4, n="Banc de poissons étrangement mutés"},
      { k=5, n="Épave de bateau"}
    }
  },
}

for lk, lv in pairs(data.translate) do
  for rk, rv in pairs(lv) do
    for nk, nv in pairs(rv) do
      for ik, iv in pairs(data.ITEMS[rk]) do
        if iv.k == nv.k then
          data.ITEMS[rk][ik].name[lk] = nv.n
          --print(string.format("data.ITEMS[%s][%s].name[%s] = %s", rk, ik, lk, nv.n))
          break
        end
      end
    end
  end
end

data.LOOKUP = {}

for rk, rv in pairs(data.ITEMS) do
  for ni, nv in pairs(rv) do
    data.LOOKUP[nv.name["DE"]] = {rk=rk, i=ni, k=nv.k}
    data.LOOKUP[nv.name["FR"]] = {rk=rk, i=ni, k=nv.k}
    data.LOOKUP[nv.name["EN"]] = {rk=rk, i=ni, k=nv.k}
    data.LOOKUP[nv.name["RU"]] = {rk=rk, i=ni, k=nv.k}
  end
end

if Inspect.System.Language() == "French" then
  data.SYSLANG = "FR"
elseif Inspect.System.Language() == "German" then
  data.SYSLANG = "DE"
elseif Inspect.System.Language() == "Russian" then
  data.SYSLANG = "RU"
else
  data.SYSLANG = "EN"
end
