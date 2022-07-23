
    mShop = mShop or {}

    mShop.Verison = "v1.0"
    mShop.Owner = "76561198824874521"


    AddCSLuaFile("mshop/cl_handler.lua")
    AddCSLuaFile("mshop/sh_config.lua")
    AddCSLuaFile("mshop/cl_fonts.lua")
    AddCSLuaFile("mshop/cl_interface.lua")
    
    if CLIENT then 


        MsgC(Color(194, 14, 14), "Maax´s Addons - mShop | Starting...\n" )
        
        include("mshop/cl_handler.lua")
        include("mshop/sh_config.lua")
        include("mshop/cl_fonts.lua")
        include("mshop/cl_interface.lua")

        MsgC(Color(194, 14, 14), "Maax´s Addons - mShop | Started!\n" )
        
    else
        
        MsgC(Color(194, 14, 14), "Maax´s Addons - mShop | Starting...\n" )

        include("mshop/sh_config.lua")
        include("mshop/sv_main.lua")

        MsgC(Color(194, 14, 14), "Maax´s Addons - mShop | Started!\n" )
        
    end