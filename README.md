# cms-copy-nevents
 Copy the first n=10 events from a CMS Run 1 AOD data file into a new file.

## Introduction

Ever need a small example data file from CMS Run 1 from a much larger file? The most common use I've found is when I need to create a small AOD file for testing. This docker container will do the copy for you.

## Usage

1. Download this repo onto a machine that is running docker.
2. Build the image: `docker build --pull --rm -f "Dockerfile" -t copyttree:latest "."`
3. Run it!

If  you want to run against a file that exists on the web

```bash
docker run -v ${PWD}:/data -it --rm copyttree:latest root://eospublic.cern.ch//eos/opendata/cms/MonteCarlo2011/Summer11LegDR/SMHiggsToZZTo4L_M-125_7TeV-powheg15-JHUgenV3-pythia6/AODSIM/PU_S13_START53_LV6-v1/20000/0C74CD5B-4C92-E411-AC34-E0CB4E29C4F7.root
```

Running on a local file (note the `file:` as part of the input):

```bash
docker run -v ${PWD}:/data -it --rm copyttree:latest file:/data/trimmed_file_numEvent10.root
```

Command Line Options:

- `-n <nevents>` - Defaults to 10. How many events to copy.
- `-o <output-file-name-stem>` - The output filename stem. Note the CMS framework will alter the name - but it will start with this.

All arguments must be specified before the input filename.

```bash
docker run -v ${PWD}:/data -it --rm copyttree:latest -?
Usage cmd [-n <nevents>] [-o <output-file-name-stem>] input-file
```

## Development

PR's are, of course, open. Please feel free to contribute.

## Acknowledgement

This work was supported by the National Science Foundation under Cooperative Agreement OAC-1836650.

Thanks to conversations with my CMS friends (Andrew Melo, Kevin Pedro, Dan Riley, Jim Pivarski, Freya Blekman). It took me a while to explain what I wanted!
