
library( "ternaryplot" ) 


# Split the window in 4 sub-plots
# -------------------------------

#   Save and then set graphical parameters
op <- par( no.readonly = TRUE ) 
par( mfrow = c(2,2), cex = .5 )

# par( mar = c(3,2,0,2)+.1 ) # for larger triangles


# Default ternary plot
# ====================

s <- ternaryPlot() 


# Change axis orientation (clockwise vs counter-clockwise)
# ========================================================

# Set new orientation
blrClock( s ) <- rep( FALSE, 3 ) 

# Plot
ternaryPlot(s) 


# Change axis orientation and frame angles
# ========================================

# Set new orientation and angles
blrClock( s )  <- c( FALSE, TRUE, NA ) 
tlrAngles( s ) <- c( 45, 90, 45 ) 

# Plot
ternaryPlot(s) 


# Same, other direction
# =====================

blrClock( s ) <- c( TRUE, NA, FALSE ) 
tlrAngles( s ) <- c(45,45,90) 

ternaryPlot(s) 


# reset par
par( op )


# Custom colors, margins and arrow breaks
# =======================================

#   Set general graphical parameters (enlarged plot)
par( fg = "darkred", col.lab = "darkblue", mar = c(3,2,0,2)+.1 ) 
    # mar = c(bottom, left, top, right) 

#   Set specific graphical parameters
tpPar( grid.line.col = "white", arrowsBreak = FALSE, 
    plot.bg = gray( .95 ) )

ternaryPlot()


# reset par
par( op )
tpPar( reset = TRUE )
