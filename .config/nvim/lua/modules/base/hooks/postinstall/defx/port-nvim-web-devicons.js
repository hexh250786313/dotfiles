const fs = require("fs");
const HOME = require("os").homedir();

const target = `${HOME}/.local/share/nvim/site/pack/packer/start/nvim-web-devicons/lua/nvim-web-devicons/icons-default.lua`;
const template = `${__dirname}/template.vim`;

const luaData = fs.readFileSync(target, "utf8");
const templateData = fs.readFileSync(template, "utf8");

function rep(str) {
  str = str.replace(/\["(.*?)"\]/g, "\\ '$1'");
  str = str.replace(/\ =/g, ":");
  str = str.replace(/(?<=(,|{))\n.* icon/g, " 'icon'");
  str = str.replace(/(?<=(,|{))\n.* cterm_color/g, " 'term_color'");
  str = str.replace(/(?<=(,|{))\n.* color/g, " 'color'");
  str = str.replace(/(?<=(,|{))\n.* name.*\n.*}/g, " }");
  str = str.replace(/"/g, "'");
  str = str.replace(/\u0020'#/g, " '");
  str = str.replace(/\u0020'#/g, " '");
  str = str.replace(/^{\n^/gm, "");
  str = str.replace(/\n^}/gm, "");
  str = str.replace(/^/gm, "    ");
  return str;
}

// filename match
let iconForFilename = luaData.match(
  /(?<=(local icons_by_filename = )){(.*\n)+?}/gm,
)[0];
iconForFilename = rep(iconForFilename);

// file extension match
let iconForExtension = luaData.match(
  /(?<=(local icons_by_file_extension = )){(.*\n)+?}/gm,
)[0];
iconForExtension = rep(iconForExtension);

const fileContent = templateData
  // 使用函数可以避免默认替换模式导致的奇怪行为，例如：$'、$&、$`、$'、$n 等
  .replace(/__REPLACE_1__/, function () {
    return iconForFilename;
  })
  .replace(/__REPLACE_2__/, function () {
    return iconForExtension;
  });
fs.writeFileSync(`${HOME}/.config/nvim/_self/plugins/port-defx-icons/plugin/defx_icons.vim`, fileContent);
