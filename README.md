# Docker LaTeX compilation boilerplate repo

This is a boilerplate repository for writing and compiling LaTeX documents locally with VS Code and Docker. Based on the [`blang/latex:ctanfull`](https://hub.docker.com/r/blang/latex/#!) docker image.

To use this boilerplate, clone or download a copy of this repo, change LICENSE and README, rename whichever files finding you fancy and update references to them in other files.

## Usage

Make sure you have docker and docker-compose installed.

Compile latex to PDF with:

```sh
$ docker-compose up
```

The first time you do this, you have to download a 5 GiB docker image, which might take some time. After that, Docker should cache the image on your computer, and it should be a lot faster to compile afterwards.

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

- Automatic compile latex on file save
  - Requires extension "Run on Save" by emeraldwalk.
- Matplotlib integration
  - Store python files for plotting in `source_code/plot/`.
  - These plot scripts should use `plt.savefig()` to store plots to some location in the `report/` directory, preferably `report/figures/plots/`. See [`plot.py`](source_code/plot/plot.py) for an example.
  - These are automatically executed on save with the extension "Run on Save" by emeraldwalk.
  - Yes, it would be a lot cleaner to do this through docker in some way, but I would want you to have control of your plotting environment yourself. A separate docker container is a fantastic approach. I also anyways suggest committing the plot output to the repo. It makes reading the repository a lot easier.
- VS Code tasks
  - "Build report container"
  - "Compile report"
