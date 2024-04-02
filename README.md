# aux-agrupamento-dcmefo

[![Updated](https://github.com/splor-mg/aux-agrupamento-dcmefo/actions/workflows/all.yaml/badge.svg)](https://github.com/splor-mg/aux-agrupamento-dcmefo/actions/)

## Pré-requisitos

Esse projeto utiliza Docker para gerenciamento das dependências. Para fazer _build_  da imagem execute:

```bash
docker build --tag aux-agrupamento-dcmefo .
```

## Uso

Para executar o container

```bash
docker run -it --rm --mount type=bind,source=$(PWD),target=/project aux-agrupamento-dcmefo bash
```

Uma vez dentro do container execute os comandos do make

```bash
make all
```

_Gerado a partir de [cookiecutter-datapackage@5b0ff98](https://github.com/splor-mg/cookiecutter-datapackage/commit/5b0ff982463f67babbfcc94ecd1b758148bff814)_
