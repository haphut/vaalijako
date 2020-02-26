# vaalijako
[![FOSSA Status](https://app.fossa.io/api/projects/git%2Bgithub.com%2Fhaphut%2Fvaalijako.svg?type=shield)](https://app.fossa.io/projects/git%2Bgithub.com%2Fhaphut%2Fvaalijako?ref=badge_shield)


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


## License
[![FOSSA Status](https://app.fossa.io/api/projects/git%2Bgithub.com%2Fhaphut%2Fvaalijako.svg?type=large)](https://app.fossa.io/projects/git%2Bgithub.com%2Fhaphut%2Fvaalijako?ref=badge_large)