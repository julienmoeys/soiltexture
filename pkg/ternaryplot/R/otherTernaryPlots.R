
# # ade4
# # ==========================================================

# library( "ade4" )

# data (euro123)

# tot <- rbind.data.frame(euro123$in78, euro123$in86, euro123$in97)

# row.names(tot) <- paste(row.names(euro123$in78), rep(c(1,2,3), rep(12,3)),
    # sep = "")

# triangle.plot(tot, label = row.names(tot), clab = 1)

# par( mfrow = c( 1, 2 ) )

# triangle.plot(tot, label = row.names(tot), clab = 1)

# par( "mgp" = c( 4, 1, 0.5 ) )

# triangle.plot(tot, label = row.names(tot), clab = 1)

# # plotrix
# # ==========================================================

# library( "plotrix" )

# dev.off()

# soils.sw.percent<-data.frame(
  # Sand=c(67,67,66,67,36,25,24,59,27,9,8,8,20,
  # 45,50,56,34,29,39,41,94,98,97,93,96,99),
  # Silt=c(17,16,9,8,39,48,54,27,46,70,68,68,66,
  # 34,30,24,48,53,46,48,2,2,2,4,1,1),
  # Clay=c(16,17,25,25,25,27,22,14,27,21,24,24,
  # 14,21,20,20,18,18,15,11,4,0,1,3,3,0))
 # soils.sw.cols <- c(1, 1, 1, 1, 2, 2, 2, 2, 2, 3, 3,
  # 3, 3, 4, 4, 4, 5, 5, 5, 5, 6, 6, 6, 6, 6, 6)
 # soils.sw.names <- c("Ardington","Astrop","Atrim",
  # "Banbury","Beacon","Beckfoot")
 # soil.texture.uk(soils.sw.percent,
  # main = "Ternary Diagram for Some Soils from South West England",
  # col.lines = "black", col.names = "black", show.grid = TRUE,
  # col.grid = "blue", lty.grid = 2,  pch = 16, cex = 1.0,
  # col.symbols = soils.sw.cols, h1 = NA, h3 = NA, t1 = NA,
  # t3 = NA , lwduk = 2, xpos = NA, ypos = NA,
  # snames = NA, cexuk = 1.1)
 # legend("topleft", legend = soils.sw.names, col = 1:max(soils.sw.cols),
  # pch = 16, cex = 1.1, title = "Location", bty = "n")

# box( col = "red" )

# par( "mfrow" )

# dev.off()

# par( mfrow = c( 1, 2 ) )

# soil.texture.uk(soils.sw.percent,
  # main = "Ternary Diagram for Some Soils from South West England",
  # col.lines = "black", col.names = "black", show.grid = TRUE,
  # col.grid = "blue", lty.grid = 2,  pch = 16, cex = 1.0,
  # col.symbols = soils.sw.cols, h1 = NA, h3 = NA, t1 = NA,
  # t3 = NA , lwduk = 2, xpos = NA, ypos = NA,
  # snames = NA, cexuk = 1.1)

# box( col = "red" )

# par( "mgp" = c( 4, 1, 0.5 ) )

# soil.texture.uk(soils.sw.percent,
  # main = "Ternary Diagram for Some Soils from South West England",
  # col.lines = "black", col.names = "black", show.grid = TRUE,
  # col.grid = "blue", lty.grid = 2,  pch = 16, cex = 1.0,
  # col.symbols = soils.sw.cols, h1 = NA, h3 = NA, t1 = NA,
  # t3 = NA , lwduk = 2, xpos = NA, ypos = NA,
  # snames = NA, cexuk = 1.1)

# # vcd
# # ==========================================================

# library( "vcd" )
# data("Arthritis")

# ## Build table by crossing Treatment and Sex
# tab <- as.table(xtabs(~ I(Sex:Treatment) + Improved, data = Arthritis))

# ## Mark groups
# col <- c("red", "red", "blue", "blue")
# pch <- c(1, 19, 1, 19)

# dev.off()

# ## plot
# tp <- ternaryplot(
            # tab,
            # col = col,
            # pch = pch,
            # prop_size = TRUE,
            # bg = "lightgray",
            # grid_color = "white",
            # labels_color = "white",
            # main = "Arthritis Treatment Data"
           # )
# ## legend

# box( col = "green" )

# fg <- grid_legend(0.8, 0.7, pch, col, rownames(tab), title = "GROUP")

