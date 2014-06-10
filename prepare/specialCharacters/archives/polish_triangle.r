TT.add( 
    "PL2.TT" = list(  #  Polish Triangle parameters according to Systematyka
                     #    gleb Polski (1989) for non-alluvial soils
        #
        main    = "PL", 
        # 
        #        The list below specify the CSS coordinates of the different POINTS
        #           that are used to draw soil texture classes. One points can be 
        #           used by several classes :
        #          = P01    P02    P03    P04    P05    P06    P07    P08    P09    P10    P11    P12
        #          = P13    P14    P15    P16    P17    P18    P19    P20    P21    P22    P23   
        #          = P24    P25    P26    P27    P28    P29    P30    P31    P32    P33 (submits)
        "tt.points"     = data.frame( 
            "CLAY"      = c( 1.000, 0.900, 0.750, 0.600, 0.650, 0.500, 0.500, 0.500, 0.500, 0.500, 0.350, 0.350,  
                     0.350, 0.350, 0.250, 0.250, 0.250, 0.200, 0.200, 0.200, 0.150, 0.150, 0.150,         
                     0.100, 0.100, 0.100, 0.050, 0.050, 0.050, 0.000, 0.000, 0.000, 0.000  ),  
                #
            "SILT"      = c( 0.000, 0.000, 0.250, 0.400, 0.250, 0.000, 0.250, 0.300, 0.400, 0.500, 0.000, 0.250,  
                     0.400, 0.650, 0.000, 0.250, 0.400, 0.000, 0.250, 0.400, 0.000, 0.250, 0.400,         
                     0.000, 0.250, 0.400, 0.000, 0.250, 0.400, 0.000, 0.250, 0.400, 1.000  ),  
                #
            "SAND"      = c( 0.000, 0.100, 0.000, 0.000, 0.100, 0.500, 0.250, 0.200, 0.100, 0.000, 0.650, 0.400,  
                     0.250, 0.000, 0.750, 0.500, 0.350, 0.800, 0.550, 0.400, 0.850, 0.600, 0.450,         
                     0.900, 0.650, 0.500, 0.950, 0.700, 0.550, 1.000, 0.750, 0.600, 0.000  )  
        ),  #
        #
        #   Abreviations;       Names of the texture cl;    Points marking the class limits (points specified above)
        "tt.polygons"   = list( 
            "i"         = list( "name" = "ił właściwy",            "points" = c(01,03,05,02)       ), 
            "ip"        = list( "name" = "ił pylasty",             "points" = c(03,10,09,05)       ), 
            "gc"        = list( "name" = "glina ciężka",           "points" = c(02,05,07,06)       ), 
            "gcp"       = list( "name" = "glina ciężka pylasta",           "points" = c(05,09,07)          ), 
            "gs"        = list( "name" = "glina średnia",          "points" = c(06,07,12,11)       ), 
            "gsp"       = list( "name" = "glina średnia pylasta",          "points" = c(07,09,13,12)       ), 
            "gl"        = list( "name" = "glina lekka silnie spiaszczona",         "points" = c(11,12,16,15)       ), 
            "glp"       = list( "name" = "glina lekka silnie spiaszczona pylasta", "points" = c(12,13,17,16)       ), 
            "gp"        = list( "name" = "glina lekka słabo spiaszczona",          "points" = c(15,16,19,18)       ), 
            "gpp"       = list( "name" = "glina lekka słabo spiaszczona pylasta",  "points" = c(16,17,20,19)       ), 
            "pgm"       = list( "name" = "piasek gliniasty mocny",         "points" = c(18,19,22,21)       ), 
            "pgpm"      = list( "name" = "piasek gliniasty mocny pylasty",         "points" = c(19,20,23,22)       ), 
            "pgl"       = list( "name" = "piasek gliniasty lekki",         "points" = c(21,22,25,24)       ), 
            "pglp"      = list( "name" = "piasek gliniasty lekki pylasty",         "points" = c(22,23,26,25)       ), 
            "ps"        = list( "name" = "piasek słabogliniasty",          "points" = c(24,25,28,27)       ), 
            "psp"       = list( "name" = "piasek słabogliniasty pylasty",          "points" = c(25,26,29,28)       ), 
            "pl"        = list( "name" = "piasek lekki",           "points" = c(27,28,31,30)       ), 
            "plp"       = list( "name" = "piasek lekki pylasty",           "points" = c(28,29,32,31)       ), 
            "płi"       = list( "name" = "pył ilasty",             "points" = c(09,10,14,13)       ), 
            "płz"       = list( "name" = "pył zwykły",             "points" = c(13,14,33,32)       )  
        ),  #
        #
        # Triangle specific parameters for triangle geometry / appearance
        #   See general parameters above for detailed description of them
        blr.clock       = rep(T,3), 
        tlr.an          = c(60,60,60), 
        #
        blr.tx      = c("SAND","CLAY","SILT"), 
        # 
        base.css.ps.lim = c(0,20,100,1000), 
        tri.css.ps.lim  = c(0,20,100,1000), 
        #
        unit.ps         = quote(bold(mu) * bold('m')), 
        unit.tx         = quote(bold('%')), 
        #
        text.sum        = 100 
    )   #
)   #


