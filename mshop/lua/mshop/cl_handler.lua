
    function mEscape:GetVersion()
        return mEscape.Verison
    end

    local function version_print()

        MsgC(Color(255,255,255), "-------------------------------------------------------\n")
        MsgC(Color(255,255,255), "                     mEscape by: Maax               \n")
        MsgC(Color(255,255,255), "                 Verison:",mEscape.Verison ,"                     \n")
        MsgC(Color(255,255,255), "-------------------------------------------------------\n")
    
    end

    concommand.Add("mEscape_version", function()
        MsgC(Color(255,255,255), "-------------------------------------------------------\n")
        MsgC(Color(255,255,255), "                    mEscape by: Maax               \n")
        MsgC(Color(255,255,255), "                 Verison:",mEscape.Verison ,"                     \n")
        MsgC(Color(255,255,255), "-------------------------------------------------------\n")
    end) 


    version_print()
