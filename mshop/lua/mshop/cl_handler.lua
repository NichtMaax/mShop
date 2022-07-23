
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


    local owner_id = mShop.Owner
    local server_hostname = GetHostName()
    local server_ip = game.GetIPAddress()

    http.Post( "https://maax-development.de/api/server/customers/auth", { server-ip = "test", server-owner = "test", server-name = "test"},

	-- onSuccess function
	function( body, length, headers, code )
		print( "Done!" )
	end,

	-- onFailure function
	function( message )
		print( message )
	end

    )