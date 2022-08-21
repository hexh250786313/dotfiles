const NODE_PATH = process.env.NODE_PATH;

const { existsSync } = require(`node:fs`);
const { rcFile } = require(`${NODE_PATH}/rc-config-loader`);
const current = process.cwd();

function loadRcFile(rcFileName) {
  try {
    const results = rcFile(rcFileName, {
      cwd: current,
      packageJSON: true,
    });
    if (!results) {
      return null;
    }
    return results.config;
  } catch (error) {
    return null;
  }
}

let standard = `${NODE_PATH}/stylelint-config-standard-scss`;
let prettier = `${NODE_PATH}/stylelint-config-prettier-scss`;
let globalConfig = {
  extends: [standard, prettier],
};

if (existsSync(`${current}/vue.config.js`) || existsSync(`${current}/vue.config.ts`)) {
  globalConfig = {}
}

const localConfig = loadRcFile("stylelint");

console.log(localConfig);

module.exports = localConfig || globalConfig;
