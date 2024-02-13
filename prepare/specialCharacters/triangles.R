# keep this

oldWd <- getwd() 
pkgName <- "soiltexture"
setwd( file.path( Sys.getenv(x = "rPackagesDir" ), pkgName, "pkg", pkgName, "inst" ) ) 

trianglesPar2 <- list( 
    "PL.TT" = list(  #  Polish Triangle parameters according to Systematyka
                     #    gleb Polski (1989) for non-alluvial soils
        #
        main    = "Polish PTG (1956-1959)", 
        # 
        #        The list below specify the CSS coordinates of the different POINTS
        #           that are used to draw soil texture classes. One points can be 
        #           used by several classes :
        #         = P01    P02    P03    P04    P05    P06    P07    P08    P09    P10    P11    P12
        #         = P13    P14    P15    P16    P17    P18    P19    P20    P21    P22    P23   
        #         = P24    P25    P26    P27    P28    P29    P30    P31    P32    P33 (submits)
        "tt.points"     = data.frame( 
            "CLAY"      = c( 
                    1.000, 0.900, 0.750, 0.600, 0.650, 0.500, 0.500, 0.500, 0.500, 0.500, 0.350, 0.350,  
                    0.350, 0.350, 0.250, 0.250, 0.250, 0.200, 0.200, 0.200, 0.150, 0.150, 0.150,         
                    0.100, 0.100, 0.100, 0.050, 0.050, 0.050, 0.000, 0.000, 0.000, 0.000  ),  
                #
            "SILT"      = c( 
                    0.000, 0.000, 0.250, 0.400, 0.250, 0.000, 0.250, 0.300, 0.400, 0.500, 0.000, 0.250,  
                    0.400, 0.650, 0.000, 0.250, 0.400, 0.000, 0.250, 0.400, 0.000, 0.250, 0.400,         
                    0.000, 0.250, 0.400, 0.000, 0.250, 0.400, 0.000, 0.250, 0.400, 1.000  ),  
                #
            "SAND"      = c( 
                    0.000, 0.100, 0.000, 0.000, 0.100, 0.500, 0.250, 0.200, 0.100, 0.000, 0.650, 0.400,  
                    0.250, 0.000, 0.750, 0.500, 0.350, 0.800, 0.550, 0.400, 0.850, 0.600, 0.450,         
                    0.900, 0.650, 0.500, 0.950, 0.700, 0.550, 1.000, 0.750, 0.600, 0.000  )  
        ),  #
        #
        #   Abreviations;       Names of the texture cl;    Points marking the class limits (points specified above)
        "tt.polygons"   = list( 
            "i"         = list( "name" = "ił właściwy",                             "points" = c(01,03,05,02)       ), 
            "ip"        = list( "name" = "ił pylasty",                              "points" = c(03,10,09,05)       ), 
            "gc"        = list( "name" = "glina ciężka",                            "points" = c(02,05,07,06)       ), 
            "gcp"       = list( "name" = "glina ciężka pylasta",                    "points" = c(05,09,07)          ), 
            "gs"        = list( "name" = "glina średnia",                           "points" = c(06,07,12,11)       ), 
            "gsp"       = list( "name" = "glina średnia pylasta",                   "points" = c(07,09,13,12)       ), 
            "gl"        = list( "name" = "glina lekka silnie spiaszczona",          "points" = c(11,12,16,15)       ), 
            "glp"       = list( "name" = "glina lekka silnie spiaszczona pylasta",  "points" = c(12,13,17,16)       ), 
            "gp"        = list( "name" = "glina lekka słabo spiaszczona",           "points" = c(15,16,19,18)       ), 
            "gpp"       = list( "name" = "glina lekka słabo spiaszczona pylasta",   "points" = c(16,17,20,19)       ), 
            "pgm"       = list( "name" = "piasek gliniasty mocny",                  "points" = c(18,19,22,21)       ), 
            "pgpm"      = list( "name" = "piasek gliniasty mocny pylasty",          "points" = c(19,20,23,22)       ), 
            "pgl"       = list( "name" = "piasek gliniasty lekki",                  "points" = c(21,22,25,24)       ), 
            "pglp"      = list( "name" = "piasek gliniasty lekki pylasty",          "points" = c(22,23,26,25)       ), 
            "ps"        = list( "name" = "piasek słabogliniasty",                   "points" = c(24,25,28,27)       ), 
            "psp"       = list( "name" = "piasek słabogliniasty pylasty",           "points" = c(25,26,29,28)       ), 
            "pl"        = list( "name" = "piasek lekki",                            "points" = c(27,28,31,30)       ), 
            "plp"       = list( "name" = "piasek lekki pylasty",                    "points" = c(28,29,32,31)       ), 
            "płi"       = list( "name" = "pył ilasty",                              "points" = c(09,10,14,13)       ), 
            "płz"       = list( "name" = "pył zwykły",                              "points" = c(13,14,33,32)       )  
        ),  #
        
        # Triangle specific parameters for triangle geometry / appearance
        #   See general parameters above for detailed description of them
        blr.clock       = rep(T,3), 
        tlr.an          = c(60,60,60), 
        
        blr.tx          = c("SAND","CLAY","SILT"), 
         
        base.css.ps.lim = c(0,20,100,1000), 
        tri.css.ps.lim  = c(0,20,100,1000), 
        
        unit.ps         = quote(bold(mu) * bold('m')), 
        unit.tx         = quote(bold('%')), 
        
        text.sum        = 100 
    ),  
    
    "Polish_BN_1978.TT" = list(  #  Polish_BN_1978 Triangle parameters
            #
            #   Courtsesy of Michal Stepien, Warsaw University of Life Sciences
            #
            main            = "Polish BN 1978", 
            # 
            #                The list below specify the CSS coordinates of the different POINTS
            #                   that are used to draw soil texture classes. One points can be 
            #                   used by several classes :
            #                  = P01    P02    P03    P04    P05    P06    P07    P08    P09    P10    P11    P12
            #                  = P13    P14    P15    P16    P17    P18    P19    P20    P21    P22    P23    P24  
            #                  = P25    P26    P27    P28    P29    P30    P31    P32    P33    P34    P35    P36(submits)
            "tt.points"     = data.frame( 
                "CLAY"      = c( 1.000, 0.900, 0.750, 0.750, 0.750, 0.650, 0.500, 0.500, 0.500, 0.500, 0.350, 0.350,  
                                 0.350, 0.350, 0.250, 0.250, 0.250, 0.200, 0.200, 0.200, 0.200, 0.200, 0.150, 0.150,        
                                 0.150, 0.100, 0.100, 0.100, 0.050, 0.050, 0.050, 0.000, 0.000, 0.000, 0.000, 0.000  ),  
                            #
                "SILT"      = c( 0.000, 0.000, 0.000, 0.150, 0.250, 0.250, 0.000, 0.250, 0.400, 0.500, 0.000, 0.250,  
                                 0.400, 0.650, 0.000, 0.250, 0.400, 0.000, 0.250, 0.400, 0.550, 0.800, 0.000, 0.250,         
                                 0.400, 0.000, 0.250, 0.400, 0.000, 0.250, 0.400, 0.000, 0.250, 0.400, 0.750, 1.000  ),  
                            #
                "SAND"      = c( 0.000, 0.100, 0.250, 0.100, 0.000, 0.100, 0.500, 0.250, 0.100, 0.000, 0.650, 0.400,  
                                 0.250, 0.000, 0.750, 0.500, 0.350, 0.800, 0.550, 0.400, 0.250, 0.000, 0.850, 0.600,         
                                 0.450, 0.900, 0.650, 0.500, 0.950, 0.700, 0.550, 1.000, 0.750, 0.600, 0.250, 0.000  )  
            ),  #
            #
            #   Abreviations;       Names of the texture cl;    Points marking the class limits (points specified above)
            "tt.polygons"   = list( 
                "pl"        = list( "name" = "piasek luzny",                    "points" = c(29,30,33,32)     ), 
                "plp"       = list( "name" = "piasek luzny pylasty",            "points" = c(30,31,34,33)     ), 
                "ps"        = list( "name" = "piasek slabogliniasty",           "points" = c(26,27,30,29)     ), 
                "psp"       = list( "name" = "piasek slabogliniasty pylasty",   "points" = c(27,28,31,30)     ), 
                "pgl"       = list( "name" = "piasek gliniasty lekki",          "points" = c(23,24,27,26)     ), 
                "pglp"      = list( "name" = "piasek gliniasty lekki pylasty",  "points" = c(24,25,28,27)     ), 
                "pgm"       = list( "name" = "piasek gliniasty mocny",          "points" = c(18,19,24,23)     ), 
                "pgmp"      = list( "name" = "piasek gliniasty mocny pylasty",  "points" = c(19,20,25,24)     ), 
                "gp"        = list( "name" = "glina piaszczysta",               "points" = c(15,16,19,18)     ), 
                "gpp"       = list( "name" = "glina piaszczysta pylasta",       "points" = c(16,17,20,19)     ), 
                "gl"        = list( "name" = "glina lekka",                     "points" = c(11,12,16,15)     ), 
                "glp"       = list( "name" = "glina lekka pylasta",             "points" = c(12,13,17,16)     ),      
                "gs"        = list( "name" = "glina srednia",                   "points" = c(07,08,12,11)     ),
                "gsp"       = list( "name" = "glina srednia pylasta",           "points" = c(08,09,13,12)     ),
                "gc"        = list( "name" = "glina ciezka",                    "points" = c(03,04,06,08,07)  ),
                "gcp"       = list( "name" = "glina ciezka pylasta",            "points" = c(06,09,08)        ),
                "gbc"       = list( "name" = "glina bardzo ciezka",             "points" = c(02,04,03)        ),
                "i"         = list( "name" = "il",                              "points" = c(01,05,06,04,02)  ),
                "ip"        = list( "name" = "il pylasty",                      "points" = c(05,10,09,06)     ),
                "płi"       = list( "name" = "pyl ilasty",                      "points" = c(09,10,14,13)     ),
                "płg"       = list( "name" = "pyl gliniasty",                   "points" = c(13,14,22,21,20)  ),
                "płp"       = list( "name" = "pyl piaszczysty",                 "points" = c(20,21,35,34)     ),
                "płz"       = list( "name" = "pyl zwykly",                      "points" = c(21,22,36,35)     )
        ),  #
        
        # Triangle specific parameters for triangle geometry / appearance
        #   See general parameters above for detailed description of them
        blr.clock       = rep(F,3), 
        tlr.an          = c(60,60,60), 
        #
        blr.tx          = c("SILT","SAND","CLAY"), 
        # 
        base.css.ps.lim = c(0,20,100,1000), 
        tri.css.ps.lim  = c(0,20,100,1000), 
        #
        unit.ps         = quote(bold(mu) * bold('m')), 
        unit.tx         = quote(bold('%')), 
        #
        text.sum        = 100 
    ),  
    
    Polish_PTG_1956_Musierowicz.TT = list(  #  Polish_PTG_1956_Musierowicz Triangle parameters
            #
            #   Courtsesy of Michal Stepien, Warsaw University of Life Sciences
            #
            main            = "Polish PTG 1956 (Musierowicz)", 
            # 
            #                The list below specify the CSS coordinates of the different POINTS
            #                   that are used to draw soil texture classes. One points can be 
            #                   used by several classes :
            #                  = P01    P02    P03    P04    P05    P06    P07    P08    P09    P10    P11    P12
            #                  = P13    P14    P15    P16    P17    P18    P19    P20    P21    P22    P23    P24  
            #                  = P25    P26    P27    P28    (submits)
            "tt.points"     = data.frame( 
                "CLAY"      = c( 1.000, 0.900, 0.750, 0.650, 0.500, 0.500, 0.500, 0.500, 0.350, 0.350, 0.350, 0.350,  
                                 0.200, 0.200, 0.200, 0.150, 0.150, 0.150, 0.100, 0.100, 0.100, 0.050, 0.050, 0.050,        
                                 0.000, 0.000, 0.000, 0.000  ),  
                            #
                "SILT"      = c( 0.000, 0.000, 0.250, 0.250, 0.000, 0.250, 0.400, 0.500, 0.000, 0.250, 0.400, 0.650,  
                                 0.000, 0.250, 0.400, 0.000, 0.250, 0.400, 0.000, 0.250, 0.400, 0.000, 0.250, 0.400,         
                                 0.000, 0.250, 0.400, 1.000  ),  
                            #
                "SAND"      = c( 0.000, 0.100, 0.000, 0.100, 0.500, 0.250, 0.100, 0.000, 0.650, 0.400, 0.250, 0.000,  
                                 0.800, 0.550, 0.400, 0.850, 0.600, 0.450, 0.900, 0.650, 0.500, 0.950, 0.700, 0.550,         
                                 1.000, 0.750, 0.600, 0.000 )  
            ),  #
            #
            #   Abreviations;       Names of the texture cl;    Points marking the class limits (points specified above)
            "tt.polygons"   = list( 
                "pl"        = list( "name" = "piasek luzny",                   "points" = c(22,23,26,25)             ), 
                "plp"       = list( "name" = "piasek luzny pylasty",           "points" = c(23,24,27,26)             ), 
                "ps"        = list( "name" = "piasek slabogliniasty",          "points" = c(19,20,23,22)             ), 
                "psp"       = list( "name" = "piasek slabogliniasty pylasty",  "points" = c(20,21,24,23)             ), 
                "pgl"       = list( "name" = "piasek gliniasty lekki",         "points" = c(16,17,20,19)             ), 
                "pglp"      = list( "name" = "piasek gliniasty lekki pylasty", "points" = c(17,18,21,20)             ), 
                "pgm"       = list( "name" = "piasek gliniasty mocny",         "points" = c(13,14,17,16)             ), 
                "pgmp"      = list( "name" = "piasek gliniasty mocny pylasty", "points" = c(14,15,18,17)             ), 
                "gl"        = list( "name" = "glina lekka",                    "points" = c(09,10,14,13)             ), 
                "glp"       = list( "name" = "glina lekka pylasta",            "points" = c(10,11,15,14)             ),      
                "gs"        = list( "name" = "glina srednia",                  "points" = c(05,06,10,09)             ),
                "gsp"       = list( "name" = "glina srednia pylasta",          "points" = c(06,07,11,10)             ),
                "gc"        = list( "name" = "glina ciezka",                   "points" = c(02,04,06,05)             ),
                "gcp"       = list( "name" = "glina ciezka pylasta",           "points" = c(04,07,06)                ),
                "i"         = list( "name" = "il",                             "points" = c(01,03,04,02)             ),
                "ip"        = list( "name" = "il pylasty",                     "points" = c(03,08,07,04)             ),
                "płz"       = list( "name" = "pyl zwykly",                     "points" = c(11,12,28,27,24,21,18,15) ),
                "płi"       = list( "name" = "pyl ilasty",                     "points" = c(07,08,12,11)             )
        ),  #
        #
        # Triangle specific parameters for triangle geometry / appearance
        #   See general parameters above for detailed description of them
        blr.clock       = rep(F,3), 
        tlr.an          = c(60,60,60), 
        #
        blr.tx      = c("SILT","SAND","CLAY"), 
        # 
        base.css.ps.lim = c(0,20,100,1000), 
        tri.css.ps.lim  = c(0,20,100,1000), 
        #
        unit.ps         = quote(bold(mu) * bold('m')), 
        unit.tx         = quote(bold('%')), 
        #
        text.sum        = 100 
    ),  #
    
    "Polish_kategorie_agronomiczne_1990.TT" = list(  #  Polish_kategorie_agronomiczne_1990 Triangle parameters
        #
        #   Courtsesy of Michal Stepien, Warsaw University of Life Sciences
        #
        main            = "Polish kategorie agronomiczne 1990", 
        # 
        #                The list below specify the CSS coordinates of the different POINTS
        #                   that are used to draw soil texture classes. One points can be 
        #                   used by several classes :
        #                  = P01    P02    P03     P04    P05    P06    P07    P08    P09    P10 (submits)
        "tt.points"     = data.frame( 
            "CLAY"      = c( 1.000, 0.350, 0.350,  0.200, 0.200, 0.100, 0.100, 0.000, 0.000, 0.000  ),  
            "SILT"      = c( 0.000, 0.000, 0.650,  0.000, 0.800, 0.000, 0.400, 0.000, 0.400, 1.000  ),  
            "SAND"      = c( 0.000, 0.650, 0.000,  0.800, 0.000, 0.900, 0.500, 1.000, 0.600, 0.000  )  
        ),  #
        #
        #   Abreviations;       Names of the texture cl;    Points marking the class limits (points specified above)
        "tt.polygons"   = list( 
            "1. Gleby bardzo lekkie"    = list( "name" = "gleby bardzo lekkie", "points" = c(06,07,09,08)       ), 
            "2. Gleby lekkie"           = list( "name" = "gleby lekkie",        "points" = c(04,05,10,09,07,06) ), 
            "3. Gleby średnie"          = list( "name" = "gleby srednie",       "points" = c(02,03,05,04)       ), 
            "4. Gleby ciężkie"          = list( "name" = "gleby ciezkie",       "points" = c(01,03,02)          )
        ),  #
        #
        # Triangle specific parameters for triangle geometry / appearance
        #   See general parameters above for detailed description of them
        blr.clock       = rep(F,3), 
        tlr.an          = c(60,60,60), 
        #
        blr.tx      = c("SILT","SAND","CLAY"), 
        # 
        base.css.ps.lim = c(0,20,100,1000), 
        tri.css.ps.lim  = c(0,20,100,1000), 
        #
        unit.ps         = quote(bold(mu) * bold('m')), 
        unit.tx         = quote(bold('%')), 
        #
        text.sum        = 100 
    ),  #
    
    "PTG_2008.TT" = list(  #  PTG_2008 Triangle parameters
        #
        main            = "Polish PTG 2008", 
        # 
        #                The list below specify the CSS coordinates of the different POINTS
        #                   that are used to draw soil texture classes. One points can be 
        #                   used by several classes :
        #                      = P01    P02    P03    P04    P05    P06    P07    P08    P09    P10    P11    P12
        #                      = P13    P14    P15    P16    P17    P18    P19    P20    P21    P22    P23   
        #                      = P24    P25    P26    P27    P28    P29    P30    P31    P32 (submits)
        "tt.points"     = data.frame( 
            "CLAY"      = c( 1.000, 0.600, 0.600, 0.550, 0.400, 0.400, 0.400, 0.350, 0.350, 0.270, 0.270, 0.270, 
                             0.270, 0.200, 0.200, 0.200, 0.120, 0.120, 0.120, 0.070, 0.070, 0.070, 0.150,
                             0.100, 0.050, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000   ),  
                        #
            "SILT"      = c( 0.000, 0.000, 0.400, 0.000, 0.150, 0.400, 0.600, 0.000, 0.200, 0.280, 0.500, 0.530,  
                             0.730, 0.000, 0.150, 0.280, 0.500, 0.800, 0.880, 0.280, 0.410, 0.500, 0.000,
                             0.000, 0.000, 0.000, 0.100, 0.150, 0.300, 0.500, 0.800, 1.000   ),  
                        #
            "SAND"      = c( 0.000, 0.400, 0.000, 0.450, 0.450, 0.200, 0.000, 0.650, 0.450, 0.450, 0.230, 0.200,  
                             0.000, 0.800, 0.650, 0.520, 0.380, 0.080, 0.000, 0.650, 0.520, 0.430, 0.850,
                             0.900, 0.950, 1.000, 0.900, 0.850, 0.700, 0.500, 0.200, 0.000   )  
        ),  #
        #
        #   Abreviations;       Names of the texture cl;    Points marking the class limits (points specified above)
        "tt.polygons"    = list( 
            "ic(C)"      = list( "name" = "il ciezki",                "points" = c(01,02,03)                ), 
            "iz(C)"      = list( "name" = "il zwykly",                "points" = c(02,03,06,05,04)          ),
            "ipy(SiC)"   = list( "name" = "il pylasty",               "points" = c(03,07,06)                ), 
            "ip(SC)"     = list( "name" = "il piaszczysty",           "points" = c(04,05,09,08)             ), 
            "gi(CL)"     = list( "name" = "glina ilasta",             "points" = c(05,06,12,11,10,09)       ), 
            "gpyi(SiCL)" = list( "name" = "glina pylasto-ilasta",     "points" = c(06,07,13,12)             ), 
            "gpi(SCL)"   = list( "name" = "glina piaszczysto-ilasta", "points" = c(08,09,10,16,15,14)       ), 
            "gz(L)"      = list( "name" = "glina zwykla",             "points" = c(10,11,17,22,21,16)       ), 
            "pyi(SiL)"   = list( "name" = "pyl ilasty",               "points" = c(11,12,13,19,18,17)       ), 
            "pyg(SiL)"   = list( "name" = "pyl gliniasty",            "points" = c(17,18,31,30,22)          ),
            "gl(SL)"     = list( "name" = "glina lekka",              "points" = c(15,16,21,20)             ), 
            "gp(SL)"     = list( "name" = "glina piaszczysta",        "points" = c(14,15,20,21,22,30,29,23) ),
            "pyz(Si)"    = list( "name" = "pyl zwykly",               "points" = c(18,19,32,31)             ), 
            "pg(LS)"     = list( "name" = "piasek gliniasty",         "points" = c(23,29,28,24)             ), 
            "ps(S)"      = list( "name" = "piasek slabogliniasty",    "points" = c(24,28,27,25)             ),
            "pl(S)"      = list( "name" = "piasek luzny",             "points" = c(25,27,26)                )  
        ),  #
        #
        # Triangle specific parameters for triangle geometry / appearance
        #   See general parameters above for detailed description of them
        blr.clock       = rep(T,3), 
        tlr.an          = c(60,60,60), 
        #
        blr.tx          = c("SAND","CLAY","SILT"), 
        # 
        base.css.ps.lim = c(0,2,50,2000), 
        tri.css.ps.lim  = c(0,2,50,2000), 
        #
        unit.ps         = quote(bold(mu) * bold('m')), 
        unit.tx         = quote(bold('%')), 
        #
        text.sum        = 100 
    )
)   

saveRDS( object = trianglesPar2, file = "triangles.rds", ascii = FALSE)

# tools::showNonASCIIfile( file = file.path( Sys.getenv(x = "rPackagesDir" ), pkgName, "prepare", "specialCharacters", "triangles.R" ) )

setwd( oldWd )
