# No NPC Tramlines – Precision Farming (FS25)

This mod disables tramlines on **NPC-managed fields** when the Precision Farming DLC is active.

By default, Precision Farming also creates tramlines on fields that are not owned or worked by the player.  
This mod removes the corresponding **runtime data after the map has loaded**, preventing any tramlines from being generated on NPC fields.

Player-owned fields are **not affected**.

---

## Features

- Disables tramlines on NPC fields
- Works only on NPC-managed fields
- Player fields remain unchanged
- No XML modifications
- No base game overwrites
- No hooks into core gameplay logic
- Multiplayer-safe
- Compatible with existing savegames

---

## How It Works

Precision Farming stores NPC tramline configuration in runtime tables after the map is loaded.  
This mod waits until Precision Farming is fully initialized and then clears the following runtime table:

FS25_precisionFarming._G.g_precisionFarming.tramlineMap.npcFieldFruitTypes

yaml
Code kopieren

Only the **contents** of the table are removed — the reference itself remains intact.  
This ensures maximum compatibility and avoids side effects.

The operation is performed **once per map load**.

---

## Installation

1. Download the mod
2. Place the mod folder or ZIP file into:
Documents/My Games/FarmingSimulator2025/mods

yaml
Code kopieren
3. Activate the mod in the mod selection screen
4. Start or load a savegame with Precision Farming enabled

---

## Requirements

- Farming Simulator 25
- Precision Farming DLC

---

## Compatibility

- Works with all maps
- Works with modded maps
- Multiplayer compatible
- Safe to add or remove from an existing savegame

---

## Known Limitations

- If another mod or script **recreates NPC tramline data after map load**, additional hooks may be required.
- The mod intentionally does **not** alter player tramlines.

---

## Debugging

The mod writes a confirmation message to `log.txt` once the NPC tramline data has been cleared:

ClearNpcFieldFruitTypes: npcFieldFruitTypes cleared. before=X removed=X after=0

yaml
Code kopieren

If this message does not appear, Precision Farming may not have been initialized yet or the DLC may not be active.

---

## Author

- **LS-Farmers**
- GitHub: https://github.com/oschuhm

---

## License

This mod is provided as-is for personal and community use.  
Redistribution is allowed only with proper credit to the author.
