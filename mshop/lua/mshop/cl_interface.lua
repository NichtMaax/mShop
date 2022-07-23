    function mShop:BuyItem( price , class , model , isweapon )

        if isweapon then 

            net.Start( "mShop.WeaponBuy")
            net.WriteString( price )
            net.WriteString( class )
            net.SendToServer()

        else 

            net.Start( "mShop.EntitieBuy")
            net.WriteString( price )
            net.WriteString( class )
            net.WriteString( model )
            net.SendToServer()

        end
    
    end

    function mShop:Create()

        self.shop = vgui.Create("MLIB.Frame", self.escape)
        self.shop:Dock(FILL)
        self.shop:MakePopup()
        self.shop:SetTitle("Shop")
        self.shop:DockMargin(300,200,300,200)

        self.top = vgui.Create("DPanel", self.shop)
        self.top:Dock(TOP)
        self.top:DockMargin(10,10,10,10)
        self.top:SetTall(55)
        self.top.Paint = function() end

        self.weapons = vgui.Create("MLIB.Button", self.top)
        self.weapons:Dock(LEFT)
        self.weapons:SetText("Waffen")
        self.weapons:SetWide(ScrW() / 3)
        self.weapons.DoClick = function()
            self.items_weapons:SetVisible(true)
            self.items_enities:SetVisible(false)
        end

        self.enities = vgui.Create("MLIB.Button", self.top)
        self.enities:Dock(RIGHT)
        self.enities:SetText("Gegestände")
        self.enities:SetWide(ScrW() / 3)
        self.enities.DoClick = function()
            self.items_enities:SetVisible(true)
            self.items_weapons:SetVisible(false) 
        end


        self.items_enities = vgui.Create("DPanel", self.shop)
        self.items_enities:Dock(FILL)
        self.items_enities:DockMargin(10,2,10,10)
        self.items_enities:SetVisible(false)
        self.items_enities.Paint = function(self,w,h) 
            draw.RoundedBox(2, 0,0,w,h,Color(43, 43, 43))
        end


        if (table.Count(mShop.Config.Entities) > 1) then 
            

            self.head = vgui.Create("DPanel" , self.items_enities)
            self.head:Dock(TOP)
            self.head:SetTall(60)
            self.head.Paint = function() end

            self.enities_head = vgui.Create("DLabel" , self.head)
            self.enities_head:Dock(LEFT)
            self.enities_head:SetFont("mShop.HeadText")
            self.enities_head:SetText("Gegenstände - " ..table.Count(mShop.Config.Entities))
            self.enities_head:SetColor(Color(255,255,255))
            self.enities_head:DockMargin(10,10,10,10)
            self.enities_head:SetWide(200)
            self.enities_head:SetTall(40)

            self.list_enities = vgui.Create( "DScrollPanel" , self.items_enities)
            self.list_enities:Dock(FILL)
            self.list_enities:DockMargin(0,0,0,10) 

        else 
            
            self.items_enities.Paint = function(self,w,h) 
                draw.RoundedBox(2, 0,0,w,h,Color(43, 43, 43))

                draw.DrawText("Keine Items gefunden!", "mShop.HeadText", w/ 2 , h / 2, Color(255,255,255), TEXT_ALIGN_CENTER)
            end

        end


        for k,v in pairs(mShop.Config.Entities) do 
            
                self.itemcard = self.list_enities:Add("DPanel")
                self.itemcard:Dock(TOP)
                self.itemcard:DockMargin(10,10,10,10)
                self.itemcard:SetTall(90)
                self.itemcard.Paint = function(self,w,h)
                    
                    draw.RoundedBox(4, 0, 0, w,h, Color(120, 122, 125))

                    draw.DrawText( v.name , "mShop.HeadText", 125,10, Color(255, 255, 255), TEXT_ALIGN_LEFT)
                    draw.DrawText( "Preis: "..DarkRP.formatMoney(v.price) , "mShop.NoItems", 125,50, Color(255, 255, 255), TEXT_ALIGN_LEFT)


                end

                local model = v.model or "models/props_trainstation/TrackSign02.mdl"

                self.preview = vgui.Create("SpawnIcon", self.itemcard)
                self.preview:Dock(LEFT)
                self.preview:DockMargin(10,10,10,10)
                self.preview:SetModel(model)
                self.preview:SetWide(90)

                self.item_buy = vgui.Create("MLIB.Button" , self.itemcard)
                self.item_buy:DockMargin(10,20,10,20)
                self.item_buy:SetText("Kaufen")
                self.item_buy:Dock(RIGHT)
                self.item_buy:SetWide(300)
                self.item_buy.DoClick = function()

                        local money_topay = v.price
                        local money_player = LocalPlayer():getDarkRPVar( "money" )
                        if (money_topay > money_player) then
                            notification.AddLegacy("Du hast nicht genug Geld!", NOTIFY_ERROR, 3)
                        else 
                                mShop:BuyItem( v.price , v.entitie , v.model , true )
                        end 

                end


        end





        self.items_weapons = vgui.Create("DPanel", self.shop)
        self.items_weapons:Dock(FILL)
        self.items_weapons:DockMargin(10,2,10,10)
        self.items_weapons:SetVisible(true)
        self.items_weapons.Paint = function(self,w,h) 
            draw.RoundedBox(2, 0,0,w,h,Color(43, 43, 43))
        end


        if (table.Count(mShop.Config.Weapons) > 1) then

            self.weapons_head = vgui.Create("DLabel" , self.items_weapons)
            self.weapons_head:Dock(TOP)
            self.weapons_head:SetFont("mShop.HeadText")
            self.weapons_head:SetText("Waffen - " ..table.Count(mShop.Config.Weapons))
            self.weapons_head:SetColor(Color(255,255,255))
            self.weapons_head:DockMargin(10,10,10,10)
            self.weapons_head:SetTall(40)


            self.list_weapon = vgui.Create( "DScrollPanel" , self.items_weapons)
            self.list_weapon:Dock(FILL)
            self.list_weapon:DockMargin(0,0,0,10)
        
        else

            self.items_weapons.Paint = function(self,w,h) 
                draw.RoundedBox(2, 0,0,w,h,Color(43, 43, 43))

                draw.DrawText("Keine Items gefunden!", "mShop.HeadText", w/ 2 , h / 2, Color(255,255,255), TEXT_ALIGN_CENTER)
            end 


        end


        for k,v in pairs(mShop.Config.Weapons) do 
            
                self.itemcard = self.list_weapon:Add("DPanel")
                self.itemcard:Dock(TOP)
                self.itemcard:DockMargin(10,10,10,10)
                self.itemcard:SetTall(90)
                self.itemcard.Paint = function(self,w,h)
                    
                    draw.RoundedBox(4, 0, 0, w,h, Color(120, 122, 125))

                    draw.DrawText( v.name , "mShop.HeadText", 125,10, Color(255, 255, 255), TEXT_ALIGN_LEFT)
                    draw.DrawText( "Preis: "..DarkRP.formatMoney(v.price) , "mShop.NoItems", 125,50, Color(255, 255, 255), TEXT_ALIGN_LEFT)


                end

                local model = v.model or "models/props_trainstation/TrackSign02.mdl"

                self.preview = vgui.Create("SpawnIcon", self.itemcard)
                self.preview:Dock(LEFT)
                self.preview:DockMargin(10,10,10,10)
                self.preview:SetModel(model)
                self.preview:SetWide(90)

                self.item_buy = vgui.Create("MLIB.Button" , self.itemcard)
                self.item_buy:DockMargin(10,20,10,20)
                self.item_buy:SetText("Kaufen")
                self.item_buy:Dock(RIGHT)
                self.item_buy:SetWide(300)
                self.item_buy.DoClick = function()

                        local money_topay = v.price
                        local money_player = LocalPlayer():getDarkRPVar( "money" )
                        if (money_topay > money_player) then
                            notification.AddLegacy("Du hast nicht genug Geld!", NOTIFY_ERROR, 3)
                        else 
                                mShop:BuyItem( v.price , v.weapon , v.model , true )
                        end 

                end


        end





    end
    


    

    net.Receive("mShop.UseNPC", function() 
        mShop:Create()
    end)