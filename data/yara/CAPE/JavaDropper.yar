rule JavaDropper
{
    meta:
	    author = " Kevin Breen <kevin@techanarchy.net>"
	    ref = "http://malwareconfig.com/stats/AlienSpy"
	    maltype = "Remote Access Trojan"
	    filetype = "exe"
        cape_type = "JavaDropper Payload"

    strings:
	    $jar = "META-INF/MANIFEST.MF"

	    $a1 = "ePK"
	    $a2 = "kPK"

        $b1 = "config.ini"
        $b2 = "password.ini"

        $c1 = "stub/stub.dll"

        $d1 = "c.dat"

    condition:
        $jar and (all of ($a*) or all of ($b*) or all of ($c*) or all of ($d*))
}