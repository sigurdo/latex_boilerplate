# Docker LaTeX compilation boilerplate repo

This is a boilerplate repository for writing and compiling LaTeX documents locally with VS Code and Docker. Uses the `blang/latex:ubuntu` docker image.

To use this boilerplate, clone or download a copy of this repo, change LICENSE and README, rename whichever files finding you fancy and update references to them in other files.

## Compiling

Make sure you have docker and docker-compose installed.

```sh
$ docker-compose up
```

The first time you do this, you have to download a 2.5 GiB docker image, which might take some time. After that, Docker should cache the image on your computer, and it should be a lot faster to compile afterwards.

## Source code

All LaTeX source code should be located in [`report/`](report/). If you want to rename this directory, remember to also rename referances to it in [`docker-compose.yaml`](docker-compose.yaml) and [`.vscode/settings.json`](.vscode/settings.json) (the latter is just required for the compile-on-save integration in vscode). The main LaTeX file is called `main.tex`. If you want to rename that, remember to also rename also references to `main` in [`docker-compose.yaml`](docker-compose.yaml).

## Output

The final PDF is stored as [`Report.pdf`](Report.pdf). If you want to rename this, remember to also rename the reference to it in [`docker-compose.yaml`](docker-compose.yaml).

All direct compilation output, including logs, are stored in [`report_output/`](report_ouput/) (gitignored). This includes the final PDF, as `main.pdf`.

## VS Code integration

The repo has VS Code integration with the following features:

- Automatic compile on file save
  - Requires extension "Run on Save" by emeraldwalk.
- VS Code tasks
  - "Build report container"
  - "Compile report"

## Known issues

- When using `minted`, you have to provide the output directory explicitly, like this
  ```latex
  \usepackage[outputdir=../output]{minted}
  ```
  - This is because the source code is compiled with `-output-dir` set to another directory than the source code directory, and apparently, minted doesn't get this information automatically. We could just compile everything in the same directory, but I think it's very messy to get all the outputs in the source code directory.
