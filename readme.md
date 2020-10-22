# init

This is a shared library for Garry's Mod that is used to load any standard init directory (similar to gamemodes and entities) that contains `shared.lua`, `cl_init.lua` and `init.lua`, with the ability to also recursively load an entire directory of sub-init directories, including the root directory.

## Drop-In Replacement

There's [a version of this library](https://github.com/drincoxyz/cwdinit) that will automatically recursively load the directory that the script is in, making it a drop-in replacement for traditional `init.lua` and `cl_init.lua` files for things like gamemodes and entities, but doesn't provide the actual library itself.

## Examples

```lua
init.Load "hack"
```

This will load the `shared.lua`, `cl_init.lua` and `init.lua` files in the `GarrysMod/garrysmod/lua/hack` directory, in that order. `shared.lua` is added for clients to download and included by both realms, `cl_init.lua` is also added for clients, but only included by clients, and `init.lua` is only included by the server. If any of these files are absent, they will be skipped with no errors.

```lua
init.Load("hack", true)
```

This will do the exact same thing as the previous example, except this function will be called for **every level of sub-directories**, effectively loading every possible directory with recursion. This is the more useful aspect of the library, and for the example of a Lua-based hack, you could organize different aspects of the hack into sub-directories (eg. `hack/esp/*.lua`, `hack/aimbot/*.lua`) and have them load automatically.

## License

This is licensed under the [DBAD License](license.md).
