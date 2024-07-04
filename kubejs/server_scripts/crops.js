
ServerEvents.recipes(event => {
    event.shapeless(
        Item.of('create:cinder_flour', 1),
        [
            'gardens_of_the_dead:whistlecane'
        ]
    )
    event.shaped(
        Item.of('minecraft:stick', 2),
        [
            '1  ',
            '1  ',
            '   '
        ],
        {
            1: 'gardens_of_the_dead:whistlecane',
        }
    )
})
