import { addCollection } from "@iconify/react";
import mdiSubset from "./mdiSubset.json";

// Registers the mdi icons the app actually uses so <Icon icon="mdi:..."> resolves
// from this local bundle instead of fetching from the Iconify CDN at runtime.
// Regenerate mdiSubset.json from @iconify-json/mdi when adding new mdi icons.
addCollection(mdiSubset);
