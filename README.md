# Docker LaTeX compilation boilerplate repo

This is a boilerplate repository for writing and compiling LaTeX documents locally with VS Code and Docker.

To use this boilerplate, clone or download a copy of this repo, change LICENSE and README, rename whichever files finding you fancy and update references to them in other files.

## Usage

Make sure you have docker and docker-compose installed.

Full compile:

```sh
$ docker-compose up plot && docker-compose up report
```

Run loop that automatically recompiles on changes:

```sh
$ docker-compose up
```

The first time compile, you have to download a 5 GiB docker image, which might take some time. After that, Docker should cache the image on your computer, and it should be a lot faster to compile afterwards.

The result is stored as [`Report.pdf`](Report.pdf).

## Latex source code

All LaTeX source code should be located in the `report/` directory. The main/index/entry point LaTeX file must have the path `report/main.tex`, project source code will automatically be copied to `report/source_code/`, besides that you can use any template and organize everything exactly as you want.

## Project source code

This repository is intended as a boilerplate also for organizing all source code related to a project resulting in a report. This boilerplate targets to separate the actual source code of the project from the report, but still make it easily accessible within the report source code. This is done by simply copying the entire `source_code` directory to a subdirectory `source_code` of the `report_output` directory right before report compilation.

You can therefore simply organize all your project source code exactly as you want inside the `source_code` directory.

## Latex compilation output

The final PDF is stored as [`Report.pdf`](Report.pdf). If you want to rename this, remember to also rename the reference to it in [`docker-compose.yaml`](docker-compose.yaml).

All direct compilation output, including logs, are stored in [`report_output/`](report_ouput/) (gitignored). This includes the final PDF, as `main.pdf`.

## VS Code integration

The repo has VS Code integration with the following features:

- VS Code settings
  - Disable `latex-workshop.latex.autoBuild.run`
  - Enable word wrap by default
  - Set default SVG viewer to `svgPreviewer.customEditor`
- VS Code tasks
  - "Build docker containers"
    - Builds docker containers.
  - "Compile"
    - Compiles entire report.
  - "Reompile loop"
    - Starts automatic recompile on changes loop.
    - Runs automatically when you open the workspace.
