BINDIR=/usr/local/bin
OCAMLC=ocamlc
OCAMLOPT=ocamlopt
OCAMLDEP=ocamldep
ZOFILES=Lib.cmx MyList.cmx Stim.cmx EC.cmx Conn.cmx Cer.cmx main.cmx
TARGET=sp_sit

$(TARGET): $(ZOFILES)
	$(OCAMLOPT) $(ZOFILES) -o $(TARGET)

# Dependencies 
.depend: 
	$(OCAMLDEP) *.mli *.ml > .depend 

include .depend

# Common rules
.SUFFIXES: .ml .mli .cmo .cmi .cmx

.mli.cmi:
	$(OCAMLOPT) -c $<

.ml.cmo:
	$(OCAMLOPT) -c $<
	
.ml.cmx: 
	$(OCAMLOPT) -c $<

# Clean up 

clean: 
	rm -f *.cm[iox]
