#!/bin/sh

# Installer des packages supplémentaires
Rscript -e "
install.packages(c(\"sp\", \"suntools\", \"rstudioapi\"), repos = \"https://cloud.r-project.org\")
"

# Créer un .Rprofile
echo "
# warn on partial matches
options(
    warnPartialMatchAttr = TRUE,
    warnPartialMatchDollar = TRUE,
    warnPartialMatchArgs = TRUE,
    showErrorCalls = TRUE
)

# Warnings are errors
# options(warn = 2L)

# Limit max element displayed
# options(max.print = 50L)

# Fancy quotes are annoying and lead to
# copy + paste bugs / frustrations
options(useFancyQuotes = FALSE)

invisible(Sys.setlocale(\"LC_ALL\", \"en_GB.UTF-8\"))

locations <- data.frame(lon = 2.3, lat = 48.8)
locations <- sp::SpatialPoints(locations, proj4string = sp::CRS(\"+proj=longlat +datum=WGS84\"))
datetime <- as.POSIXct(Sys.Date(), tz = \"UTC\")
suntimes <- suntools::crepuscule(
    crds = locations,
    dateTime = datetime,
    solarDep = 0.268,
    direction = \"dawn\",
    POSIXct.out = TRUE
)
sunrise <- suntimes\$time
suntimes <- suntools::crepuscule(
    crds = locations,
    dateTime = datetime,
    solarDep = 0.268,
    direction = \"dusk\",
    POSIXct.out = TRUE
)
sunset <- suntimes\$time

setHook(\"rstudio.sessionInit\", function(newSession) {
    if (newSession) {
        if (Sys.time() < sunrise || Sys.time() > sunset) {
            rstudioapi::applyTheme(\"Material\")
        } else {
            rstudioapi::applyTheme(\"Textmate (default)\")
        }

        rm(locations, suntimes, sunrise, sunset, datetime, envir = globalenv())

        PROJ_DIR <- Sys.getenv(\"PROJ_DIR\")
        RPROJ_DIR <- Sys.getenv(\"RPROJ_DIR\")
        if (nzchar(RPROJ_DIR)) {
            RPROJ_DIR <- normalizePath(RPROJ_DIR)

            if (!identical(RPROJ_DIR, getwd())) {
                message(\"Activation du projet RStudio\")
                rstudioapi::openProject(RPROJ_DIR)
            }
        } else if (nzchar(PROJ_DIR)) {
            PROJ_DIR <- normalizePath(PROJ_DIR)

            if (!identical(PROJ_DIR, getwd())) {
                message(\"Activation du projet\")
                setwd(PROJ_DIR)
                rstudioapi::filesPaneNavigate(path = PROJ_DIR)
            }
        }
    }
}, action = \"append\")

" >> "${HOME}/.Rprofile"
