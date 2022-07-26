
    function mEscape:GetVersion()
        return mEscape.Verison
    end

    local function version_print()

        MsgC(Color(255,255,255), "-------------------------------------------------------\n")
        MsgC(Color(255,255,255), "                     mShop by: Maax                    \n")
        MsgC(Color(255,255,255), "                   Verison: GitHub (1.0)               \n")
        MsgC(Color(255,255,255), "-------------------------------------------------------\n")
    
    end

    concommand.Add("mEscape_version", function()
        version_print()
    end) 
