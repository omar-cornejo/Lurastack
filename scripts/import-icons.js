#!/usr/bin/env node
// Script: copy icons from external Asset-Package into ./public/icons and build a manifest
// Usage: node scripts/import-icons.js /absolute/path/to/Architecture-Service-Icons

import fs from 'fs';
import path from 'path';

const srcRoot = process.argv[2];
if (!srcRoot) {
  console.error('Usage: node scripts/import-icons.js /path/to/Architecture-Service-Icons_07312025');
  process.exit(1);
}

const outRoot = path.resolve(process.cwd(), 'public', 'icons');

function isDir(p) {
  try { return fs.statSync(p).isDirectory(); } catch(e){ return false; }
}

function ensureDir(p){ if (!fs.existsSync(p)) fs.mkdirSync(p, { recursive: true }); }

ensureDir(outRoot);

const groups = {};

for (const entry of fs.readdirSync(srcRoot, { withFileTypes: true })){
  if (!entry.isDirectory()) continue;
  const groupName = entry.name;
  const sourceFolder = path.join(srcRoot, groupName, '64');
  if (!isDir(sourceFolder)) continue;

  const files = fs.readdirSync(sourceFolder).filter(f => /\.(svg)$/i.test(f));
  if (files.length === 0) continue;

  const destFolder = path.join(outRoot, groupName);
  ensureDir(destFolder);

  files.forEach(f => {
    const srcFile = path.join(sourceFolder, f);
    const destFile = path.join(destFolder, f);
    fs.copyFileSync(srcFile, destFile);
  });

  groups[groupName] = files.sort();
  console.log(`Copied ${files.length} files for group ${groupName}`);
}

const manifestPath = path.join(outRoot, 'manifest.json');
fs.writeFileSync(manifestPath, JSON.stringify(groups, null, 2), 'utf8');
console.log('Wrote manifest at', manifestPath);

console.log('Done. Now run npm run dev and open the app.');
