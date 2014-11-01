# Digital signal processing - Octave setup

This repo contains basic folder structure, library files and octave
settings, suitable to be used in class.


## Folder layout

There are 2 folders that exists: `config` and `library`. First folder
holds a single function that is used for querying global settings.
Second folder holds minimalistic collection of functions that come with
_official_ package in class scilab installation.


## Settings

To change default settings, simply mofify `config/get_dps_config.m` file
and set proper values in structure.


## Working from this environment

Using this environment is really simple:

    1. `git clone https://github.com/tadeboro/dps.git dps`
    2. `cd dps`
    3. `octave`
    4. Do some math and make it scream from speaker;)
    5. (Optional) Save your work and go to sleep

In order to keep any work files saved in git repo, simply fork this
template and start committing.


Author: Tadej Borovšak
