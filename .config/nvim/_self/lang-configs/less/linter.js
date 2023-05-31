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


const postcssLess = `${NODE_PATH}/postcss-less`
const stylelintLess = `${NODE_PATH}/stylelint-less`;
const recommend = `${NODE_PATH}/stylelint-config-recommended-less`;

let globalConfig = {
  "customSyntax": postcssLess,
  "plugins": [stylelintLess],
  "extends": [recommend],
  "rules": {
    "selector-pseudo-class-no-unknown": [
      true,
      {
        "ignorePseudoClasses": ["global"]
      }
    ]
  }
};

const localConfig = loadRcFile("stylelint");

const config = localConfig || globalConfig

console.log(config);

module.exports = config;
