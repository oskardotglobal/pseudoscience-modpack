ItemEvents.armorTierRegistry((e) => {
  const cosmetic = (tier) => {
    tier.durabilityMultiplier = 1;
    tier.slotProtections = [0, 0, 0, 0];
    tier.enchantmentValue = 0;
    tier.equipSound = "minecraft:item.armor.equip_iron";
    tier.repairIngredient = "#forge:ingots/iron";
    tier.toughness = 0.0;
    tier.knockbackResistance = 0.0;
  };

  e.add("infernal_crimson", (tier) => cosmetic(tier));
  e.add("infernal_aurora", (tier) => cosmetic(tier));
});

StartupEvents.registry("item", (e) => {
  const createParts = (material) => {
    ["chestplate", "leggings", "boots"].forEach((part) => {
      e.create(`${material}_${part}`, part)
        .tier(material)
        .unstackable()
        .maxDamage(0);
    });
  };

  createParts("infernal_crimson");
  createParts("infernal_aurora");
});
