.PHONY: all offense_2000_2005 batch_header_1991_2024

# target to make the file report
all: team_agency_map.pdf

offense_2000_2005:
	# add code to run script to decompress the original file
	# and filter out the needed 5 years
	unzip offense_segment_csv_1991_2024.zip "nibrs_offense_segment_200[0-5].csv"


batch_header_1991_2024:  
	# add code to run script to decompress the batch header file 
	unzip batch_header_csv_1991_2024.zip


team_agency_map.pdf:
	Rscript -e "rmarkdown::render('team_agency_map.Rmd', output_format='pdf_document', clean=FALSE)"
