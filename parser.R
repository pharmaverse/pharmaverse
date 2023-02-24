library(yaml)
library(jsonlite)

ymlDir <-"./data/packages"
ymlFiles <- list.files()

allPkg <- data.frame()
for (f in yml_files) {
  content <- read_yaml(file.path(ymlDir, f))
  pkgName <- content$name
  pkgRepo <- content$repo
  if (is.null(content$repo) | is.null(content$name)) {
    print(paste("WARNING - check your conf for this file", f))
  } else {
    pkgDf <- data.frame(package=c(pkgName), url=c(file.path("https://github.com", pkgRepo)))
    allPkg <- rbind(allPkg, pkgDf)
  }
}

print(allPkg)
jsonData <- prettify(toJSON(allPkg))
print(jsonData)
write(jsonData, "output.json")
