default: slit

slit:
	cat slit.lit | ./slit-bootstrap.awk root | sed -e 's/_/ /' > slit
	chmod +x ./slit
		
clean:
	rm slit
