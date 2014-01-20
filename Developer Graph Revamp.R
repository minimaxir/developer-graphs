library("ggplot2")
library("extrafont")
library("scales")
library("grid")

font <- "Chalkduster"	# font: change if not on Mac
themecolor <- "#FAFAFA"
themebg <- "#333333"

theme_chalk <- function() {theme_bw(base_size = 6) +
                                       theme(text = element_text(color = themecolor, family=font),
                                             axis.ticks = element_line(color = themecolor),
                                             panel.border = element_rect(color = themecolor), plot.margin = unit(c(0.1,0.1,0.1,0.1), "cm"), panel.background=element_rect(fill = themebg), plot.background=element_rect(fill = themebg), panel.grid=element_blank())
                                     
}

df <- data.frame(lang=c("Java","PHP","C#","Android","JavaScript","Rails","Python","iOS",".net","C++"),perc=c(0.2226,0.1153,0.1074,0.0994,0.0923,0.0830,0.0829,0.0753,0.0722,0.0496))
df$lang <- reorder(df$lang,df$perc)  # internally sort lang by perc ascending


### Chart 1

ggplot(df, aes(lang,perc)) + 
geom_bar(fill=themebg, color=themecolor, width=0.75) +	# draw columns
scale_y_continuous(labels = percent) +	# percent scale
theme_chalk() +	# render theme
theme(axis.title.x = element_blank(), axis.title.y =  element_blank() ,axis.ticks.x = element_blank(),axis.text.x= element_blank()) +	# tweak theme
geom_text(label=df$lang, vjust=-1.0, color=themecolor, family=font, size=1.5)	# add annotations

ggsave("dev-graph-1.png",height=3,width=4)	# produces 1200x900px image

### Chart 2

ggplot(df, aes(lang,perc)) + 
geom_bar(fill=themebg, color=themecolor, width=0.75) +
scale_y_continuous(labels = percent) +
coord_flip() +	# convert columns to bars
theme_chalk() +
theme(axis.title.x = element_blank(), axis.title.y = element_blank(), axis.ticks.y = element_blank(),axis.text.y= element_blank()) +
geom_text(label=df$lang, hjust=-0.25, color=themecolor, family=font, size=1.5)

ggsave("dev-graph-2.png",height=3,width=4)

### Chart 3

perc_text = paste(df$perc*100,"%",sep='')

ggplot(df, aes(lang,perc)) + 
geom_bar(fill=themebg, color=themecolor, width=0.75) +
scale_y_continuous(labels = percent) +
coord_flip() +
theme_chalk() +
theme(axis.title.x = element_blank(), axis.title.y =  element_blank() ,axis.ticks.y = element_blank(),axis.ticks.x = element_blank(),axis.text.x = element_blank()) +
geom_text(label=perc_text, hjust=1.5, color=themecolor, family=font, size=1.5)

ggsave("dev-graph-3.png",height=3,width=4)