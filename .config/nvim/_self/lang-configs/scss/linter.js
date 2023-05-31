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

const postcssScss = `${NODE_PATH}/postcss-scss`;
const stylelintScss = `${NODE_PATH}/stylelint-scss`;
let standard = `${NODE_PATH}/stylelint-config-standard-scss`;

let globalConfig = {
  customSyntax: postcssScss,
  plugins: [stylelintScss],
  extends: [standard],
};

const localConfig = loadRcFile("stylelint");

const config = localConfig || globalConfig;

console.log(config);

module.exports = config;
