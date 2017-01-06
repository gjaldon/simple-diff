.PHONY: test clean

build:
	ocamlbuild -use-ocamlfind main.byte src/main.ml

test:
	ocamlbuild -use-ocamlfind test.byte src_test/test.ml

clean:
	ocamlbuild -clean
