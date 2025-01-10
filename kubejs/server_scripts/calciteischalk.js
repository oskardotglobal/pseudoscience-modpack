ServerEvents.recipes(chalcite => {
    chalcite.replaceInput(
        { input: 'regions_unexplored:chalk', not: { type: 'create:block_cutting' }, not: { type: 'minecraft:stonecutting' } }, // Arg 1: the filter
        'minecraft:stick',
        '#pseudoscience:chalk_stones'
    )
}) // replaces calcite as an ingredient with a tag containing calcite & chalk, in all but cutting recipes.