
    util.AddNetworkString("mShop.WeaponBuy")
    util.AddNetworkString("mShop.EntitieBuy")


    net.Receive("mShop.WeaponBuy", function(len, pl)

        local price = net.ReadString()
        local class = net.ReadString()

        pl:Give( class )
        pl:addMoney(-price)

    end)


    net.Receive("mShop.EntitieBuy", function(len, pl)

        local price = net.ReadString()
        local class = net.ReadString()
        local model = net.ReadString()

        pl:Give( class )
        pl:addMoney(-price)

        local pos = pl:GetPos()

        local ent = ents.Create(class)
        ent:SetModel( model )
        ent:SetPos( Vector( pos.x, pos.y, pos.z + 10 ) )
        ent:Spawn()

    end)
    