# Analyzing Ontario Wildlife Populations and Hunting Permits

## Overview

This folder contains the code and data supporting an analysis of Ontario wildlfie populations and the impact of hunting on species such as white tailed deer, turkeys, and black bears. This is done by looking at harvest numbers, number of active hunters, and hunting permits over the past 10 years.

## Obtaining Data
The data need to be downloaded from the Ontario Data Catalogue (https://data.ontario.ca/dataset/white-tailed-deer-hunting-activity-and-harvest). This is done manually and then moved to data/raw_data/.

## File Structure

The repo is structured as:

-   `data/raw_data` contains the raw data as obtained from Ontario Data Catalogue.
-   `data/analysis_data` contains the cleaned dataset that was constructed.
-   `model` contains fitted models. 
-   `other` contains relevant sketches.
-   `paper` contains the files used to generate the paper, including the Quarto document and reference bibliography file, as well as the PDF of the paper. 
-   `scripts` contains the R scripts used to simulate, download and clean data.


## Statement on LLM usage
No LLMs were used in this analysis
