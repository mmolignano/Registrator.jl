stopregistrator:
	touch stopregistrator

stopserver:
	touch stopserver

stopall: stopregistrator stopserver

startregistrator:
	nohup ./registrator.sh &

startserver:
	nohup ./server.sh &

startall: startregistrator startserver

restartregistrator:
	./restart.sh registrator

restartserver:
	./restart.sh server

restartall: restartregistrator restartserver
