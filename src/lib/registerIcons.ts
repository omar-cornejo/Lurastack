import { addCollection } from "@iconify/react";
import mdiSubset from "./mdiSubset.json";
import weuiSubset from "./weuiSubset.json";
import lucideSubset from "./lucideSubset.json";

// Registers the icons the app actually uses so <Icon icon="prefix:name"> resolves
// from these local bundles instead of fetching from the Iconify CDN at runtime
// (which fails in the packaged desktop release: no network / blocked by CSP).
// Each *Subset.json is a self-contained Iconify collection copied from the
// Iconify API (https://api.iconify.design/<prefix>.json?icons=<name>). When you
// add a new icon to the UI, append it to the matching subset (or create a new
// one) so it ships offline. See public/icons/ATTRIBUTIONS.md for licensing.
addCollection(mdiSubset);
addCollection(weuiSubset);
addCollection(lucideSubset);
