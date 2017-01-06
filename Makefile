build:
	ocamlbuild -use-ocamlfind main.byte src/main.ml

clean:
	ocamlbuild -clean
