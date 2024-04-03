PlayerEvents.inventoryChanged((e) => {
    if (!e.getItem().hasTag("nyxmc:cosmetic_armor")) return;

    e.getEntity().runCommandSilent("execute as @s[tag=!cosmetic_armor] run clear @s #nyxmc:cosmetic_armor");
});