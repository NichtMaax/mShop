include("shared.lua")

function ENT:Draw()
	
	self:DrawModel()
	self:DrawInfo()
end

function ENT:Draw()
  self:DrawModel()

  local ply = LocalPlayer()
  local pos = self:GetPos()
  local eyePos = ply:GetPos()
  local dist = pos:Distance(eyePos)
  local alpha = math.Clamp(2500 - dist * 2.7, 0, 255)

  if (alpha <= 0) then return end

  local angle = self:GetAngles()
  local eyeAngle = ply:EyeAngles()

  angle:RotateAroundAxis(angle:Forward(), 90)
  angle:RotateAroundAxis(angle:Right(), - 90)

    cam.Start3D2D(pos + self:GetUp() * 90, Angle(0, eyeAngle.y - 90, 90), 0.04)
         draw.DrawText("Shop", "mShop.NPC", 0,180, Color( 255, 255, 255, 255 ), TEXT_ALIGN_CENTER)
    cam.End3D2D()
end
