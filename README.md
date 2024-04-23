# An Analysis of Ontario Wildlife Harvest and Active Hunter Data From 2006 to 2023

## Abstract
This paper analyzes Ontario wildlife harvest counts, specifically moose and black bears, and the number of active hunters based on region. The analysis examines harvest counts from 2006 to 2023 across Northern, Southeastern, and Southwestern Ontario. It was found that moose harvests have decreased over the past 20 years whereas black bear hunting has stayed relatively consistent. The implications and causes of these trends are important for species population in Ontario as well as the Ontario hunting industry.

## Overview

This folder contains the code and data supporting an analysis of Ontario wildlife hunting of moose and black bears. This is done by looking at harvest numbers and number of active hunters since 2006.

## Obtaining Data
The two data sets used in this analysis need to be downloaded from the Ontario Data Catalogue. This is done manually and then moved to data/raw_data/.

Data set #1 (Moose Data): https://data.ontario.ca/dataset/moose-hunting-activity-and-harvests
Data set #2: (Black Bear Data): https://data.ontario.ca/dataset/black-bear-hunting-activity-and-harvests

## File Structure

The repo is structured as:

-   `inputs/raw_data` contains the raw data as obtained from Ontario Data Catalogue.
-   `inputs/sketches` contains initial sketches of the graphs, tables and data sets
-   `outputs/analysis_data` contains the cleaned dataset that was constructed.
-   `outputs/paper` contains the files used to generate the paper, including the Quarto document and reference bibliography file, as well as the PDF of the paper. 
-   `scripts` contains the R scripts used to simulate, download and clean data.

## Statement on LLM usage
No LLMs were used in this analysis or in the creation of graphs and tables. No LLMs were used for the R scripts.
