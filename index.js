import fs from 'fs';
import path from 'path';
import { exec } from 'child_process';

const result = exec('ipfs --version')
result.stdout.on('data', (data) => {
  console.log(data);
});
result.stderr.on('data', (data) => {
  console.error(data);
});


