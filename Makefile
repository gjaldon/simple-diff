.PHONY: test clean

build:
	ocamlbuild -use-ocamlfind simple_diff.native src/simple_diff.ml

test:
	ocamlbuild -use-ocamlfind test.byte src_test/test.ml

clean:
	ocamlbuild -clean
