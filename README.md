What is this?
- Using this to learn how to structure my projects better
- Template with a whole load of tools/utilities that I will generally use in game development
- Everything in /library is written by other people
- Everything else is mine

General goals:
- Better scene management with decent service support
- A solid standard for how I should be laying out assets and configurations
- Shortcuts such as 'extends' and 'library' to make writing my applications a little faster
- Decent debugging interface (Through imgui)
- Have all basic utilities available such as searching, immutability, multidimensional arrays and table copying available


globals:
- hate: contains all state/scene management, with a way to easily access services
- config: stores the configuration in ./conf.lua
- extends: syntactic sugar for extending rxi/classic classes
- library: syntactic sugar for requiring a library

style guide:
- variables/functions/methods: snake_case
- classes: PascalCase
- private variables: __snake_case
- ini is for configs (likely should just apply to the global config.json)
- xml for spritesheet quads
- json is for data files

game configs are stored in config.ini

todo:
- a generic astar search algorithm, some sort of good utility for pathfinding on continuous maps
- a decent service for asset management to make sure that assets are destructed after a scene has concluded
- asynchronous sprite packing

what  i'll add in the future:
- more tools and utilities for 2d/3d tactics type games
- better logging, more imgui integration
- better documentation