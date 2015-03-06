# vaalijako

## Development setup

```sh
git clone https://github.com/haphut/vaalijako
cd vaalijako
```

Run in R:
```R
# install.packages('devtools') # if necessary
library(devtools)
load_all()
# Warning: Downloads and writes some files.
result <- main()
```

## Install and run

Run in R:
```R
# install.packages('devtools') # if necessary
library(devtools)
install_github('haphut/vaalijako')
library(vaalijako)
# Warning: Downloads and writes some files.
result <- main()
```

## Get the data separately

The data is available from [avoindata.fi](https://www.avoindata.fi/data/fi/dataset/rakennusten-aanestysalueet).
