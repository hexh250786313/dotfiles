local latest_timestamp = 0
local throttle_ms = 200 -- c-d 快速重复滚动的时候 cursor 会跳到屏幕上方，增加这个值可以缓解（无法完全解决），但是同时也会导致两个可以展示动画的时间点之间过长
local throttle_scroll = function()
  local cur_time = vim.loop.hrtime()
  local res = 0.000001 * (cur_time - latest_timestamp) > throttle_ms
  if res then
    latest_timestamp = cur_time
  end
  return res
end
local animate = require("mini.animate")
animate.setup({
  scroll = {
    subscroll = animate.gen_subscroll.equal({ predicate = throttle_scroll }),
    timing = function(_, n)
      return math.min(250 / n, 5)
    end,
    -- enable = false,
  },
  cursor = {
    enable = true,
    path = animate.gen_path.line({
      predicate = function(destination)
        return destination[1] < -2 or 2 < destination[1]
      end,
    }),
  },
})
