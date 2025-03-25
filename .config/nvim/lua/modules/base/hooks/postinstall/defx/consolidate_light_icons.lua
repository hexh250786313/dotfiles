local function read_file(path)
  local file = io.open(path, "r")
  if not file then
    print("无法打开文件: " .. path)
    return nil
  end
  local content = file:read("*all")
  file:close()
  return content
end

local function extract_table_content(content)
  -- 修正的正则表达式，不包含结尾的花括号
  local table_content = content:match("return%s*{(.-)%}%s*%-%-%[%[@as")
  if table_content then
    return table_content
  end
  -- 备选匹配方式
  return content:match("return%s*{(.-)%}%s*$")
end

-- 基础路径，使用环境变量获取用户主目录
local home = os.getenv("HOME")
local source_dir = home .. "/.local/share/nvim/site/pack/packer/start/nvim-web-devicons/lua/nvim-web-devicons/light/"
local output_dir = home .. "/.config/nvim/lua/modules/base/hooks/postinstall/defx/"

-- 确保输出目录存在
os.execute("mkdir -p " .. output_dir)

-- 文件名列表
local file_names = {
  "icons_by_desktop_environment.lua",
  "icons_by_file_extension.lua",
  "icons_by_filename.lua",
  "icons_by_operating_system.lua",
  "icons_by_window_manager.lua",
}

-- 完整文件路径
local file_paths = {}
for _, name in ipairs(file_names) do
  table.insert(file_paths, source_dir .. name)
end

-- 创建输出文件
local output_path = output_dir .. "icons_light.lua"
local output = io.open(output_path, "w")
if not output then
  print("创建输出文件失败: " .. output_path)
  return
end

-- 写入文件头部
output:write("-- 此文件为自动生成，请勿手动编辑\n")
output:write("-- 源文件来自 nvim-web-devicons 插件\n\n")

-- 处理每个文件
for i, file_path in ipairs(file_paths) do
  local content = read_file(file_path)
  if content then
    local var_name = file_names[i]:gsub("%.lua$", "")
    local table_content = extract_table_content(content)

    if table_content then
      output:write("local " .. var_name .. " = {\n" .. table_content .. "\n}\n\n")
    else
      print("无法从文件提取表格内容: " .. file_path)
    end
  end
end

-- 写入返回语句
output:write("return {\n")
for _, file_name in ipairs(file_names) do
  local var_name = file_name:gsub("%.lua$", "")
  local short_name = var_name:match("icons_by_(.*)")
  output:write("  " .. short_name .. " = " .. var_name .. ",\n")
end
output:write("}\n")

output:close()
print("合并文件创建成功: " .. output_path)
