local MSG = {
  _Version      = '0.1',
  _Author       = 'Beelz',
  _Description  = 'Simple Love2D message queue.',
  _URL          = 'https://github.com/Beezlebub/Love-Hint',
  _LICENSE      = [[
    The MIT License (MIT)
    Copyright (c) 2014 Maciej Lopacinski
    Permission is hereby granted, free of charge, to any person obtaining a copy
    of this software and associated documentation files (the "Software"), to deal
    in the Software without restriction, including without limitation the rights
    to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
    copies of the Software, and to permit persons to whom the Software is
    furnished to do so, subject to the following conditions:
    The above copyright notice and this permission notice shall be included in all
    copies or substantial portions of the Software.
    THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
    IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
    FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
    AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
    LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
    OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
    SOFTWARE.
  ]]
}
local lg = love.graphics
local font = lg.newFont(16)

local modes = {
  info = {
    id    = "info",   
    color = {30,30,30}, 
    bg    = {200,200,200}
  },

  debug = {
    id    = "debug",  
    color = {30,200,30}, 
    bg    = {200,200,200}
  },

  warn = {
    id    = "warn",   
    color = {255,255,100}, 
    bg    = {130,130,130}
  },

  err = {
    id    = "err",    
    color = {50,50,50}, 
    bg    = {255,130,130}
  }
}

local hint = {
  delta = {
    min = 0,
    sec = 0
  },
  msgQueue = {}
}
  
function hint.new(msg, style, timer)
  local self = {}
  if not msg then hint.new("Error, hint not created!", "error", 10) return end
  self.msg = msg
  self.timer = timer or 5
  self.delta = hint.delta

  self.style = style or "info"
  self.color = modes[self.style].color
  self.bg = modes[self.style].bg

  hint.msgQueue[#hint.msgQueue+1] = self  
  return self
end

function hint.update(dt)
  hint.delta.sec = hint.delta.sec + dt
  if hint.delta.sec > 59 then
    hint.delta.min = hint.delta.min + 1
    hint.delta.sec = 0
  end


  if #hint.msgQueue == 0 then return end -- if queue > 0 then update self timers
  for i = #hint.msgQueue, 1, -1 do
    hint.msgQueue[i].timer = hint.msgQueue[i].timer - 1 * dt
    if hint.msgQueue[i].timer < 0 then
      table.remove(hint.msgQueue, i)
    end
  end
end

function hint.draw()
  for i, msg in ipairs(hint.msgQueue) do
    local tx, ty = 10, ((i-1)*40)+10
    local tm = msg.delta.min .. "." .. string.format("%.2f", msg.delta.sec) .. "  " .. msg.msg
    local tw = font:getWidth(tm) -10
    

    lg.setColor(0,0,0)
    lg.rectangle("line", tx, ty, tw-10, 30)
    lg.setColor(msg.bg)
    lg.rectangle("fill", tx, ty, tw-10, 30)

    lg.setColor(msg.color)
    lg.printf(tm, tx, ty+10, tw, "center")
  end
end

function hint.mouse(x, y, b)
  if 0 == 1 then
    -- check inside message boxes
    return true
  else
    return false
  end
end

return hint
