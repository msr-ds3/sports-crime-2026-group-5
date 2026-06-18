library(tidyverse)

important_oris = c("OH0770100", "IA0850100","MI8121800", "OH0050100", "TX2270100", "VA0600100", "ID0010100",
    "SC0390200", "CO0210100", "SC0400100", "OHCOP0000", "TX0610200", "MI3336400", "AR0720100", "WV0060200",
    "IA0520200", "AR0160100", "MI3949900", "KS0230100", "UT0030100", "TX1520200", "WV0310100", "ID0290500",
    "MI3759900","TN0750100", "UT0250600")


offense_2000 <- read_csv("nibrs_offense_segment_2000.csv")
offense_2001 <- read_csv("nibrs_offense_segment_2001.csv")
offense_2002 <- read_csv("nibrs_offense_segment_2002.csv")
offense_2003 <- read_csv("nibrs_offense_segment_2003.csv")
offense_2004 <- read_csv("nibrs_offense_segment_2004.csv")
offense_2005 <- read_csv("nibrs_offense_segment_2005.csv")

offense_2000 <- offense_2000 %>%
    filter(ori %in% important_oris)

offense_2001 <- offense_2001 %>%
    filter(ori %in% important_oris)

offense_2002 <- offense_2002 %>%
    filter(ori %in% important_oris)

offense_2003 <- offense_2003 %>%
    filter(ori %in% important_oris)

offense_2004 <- offense_2004 %>%
    filter(ori %in% important_oris)

offense_2004 <- offense_2004 %>%
    filter(ori %in% important_oris)

offense_2005 <- offense_2005 %>%
    filter(ori %in% important_oris)

offenses=list(offense_2000, offense_2001, offense_2002, offense_2003, offense_2004, offense_2005)

offense <- bind_rows(offenses) %>%
    select(1:7) %>% 
    select(c("ori","year","state","incident_date","ucr_offense_code")) %>%
    filter(str_detect(ucr_offense_code,"assault offenses") | str_detect(ucr_offense_code,"vandalism"))

offense

write.csv(offense, file = "offense.csv")
