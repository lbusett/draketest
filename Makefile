DRAKE_CACHE=D:/Documents/Source/git/draketest/.drake

all: \
$(DRAKE_CACHE)/ts/9040a0580e0e5fb5 \
$(DRAKE_CACHE)/ts/1f7570a66e07b3c7

$(DRAKE_CACHE)/ts/9040a0580e0e5fb5:
	Rscript -e 'drake::mk(target = "test", cache_path = "$(DRAKE_CACHE)")'

$(DRAKE_CACHE)/ts/1f7570a66e07b3c7:
	Rscript -e 'drake::mk(target = "test2", cache_path = "$(DRAKE_CACHE)")'
