const NODE_PATH = process.env.MY_NODE_PATH + "/lib/node_modules";

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

let globalConfig = {
  parserOptions: {
    ecmaFeatures: {
      jsx: true,
    },
    ecmaVersion: "latest",
    sourceType: "module",
  },
  env: {
    es2022: true,
    browser: true,
    node: true,
  },
  parser: "@typescript-eslint/parser",
  extends: [
    "eslint:recommended",
    "plugin:@typescript-eslint/recommended",
  ],
};

const localConfig = loadRcFile("eslint");

const config = localConfig || globalConfig;

console.log(config);

module.exports = config;
