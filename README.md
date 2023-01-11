# ReX-Surrogate

## Abstract
From a materials engineering standpoint, the development and understanding of process-microstructure-properties relationships is crucial for the design of both processes and products. To this end, phase-field modeling is widely used to simulate the microstructural evolution at the mesoscale. As a result, linkages between the process and the microstructure are created, which can also expand towards the properties and performance of the respective material. However, besides its significant computational cost, phase-field modeling primarily deals with the forward problem of microstructural evolution prediction. For the inversion of the linkages, and towards the optimization of the process parameters that lead to desirable microstructures and properties, the approach has to change. Here, we create a surrogate (or reduced-order) model for the phase-field simulation of recrystallization of copper-nickel alloys. First, we simulate the phenomenon for several strategically defined points in the process parameter space of annealing temperature and duration. Thus, we obtain the final microstructures, which form the basis for the dataset that will be used for the training and evaluation of the machine learning surrogate model. We then use two-point spatial correlations to effectively quantify the ensemble of final microstructures and principal component analysis to derive their low-dimensional representations, which can now be used by a machine learning model. A Gaussian process regression model is trained by treating the process parameters as inputs and the final low-dimensional representations of the microstructures as outputs. By implementing this methodology, we develop easily accessible linkages between the process of annealing and the microstructures of these specific alloys, which can be expanded towards the properties and inverted through Bayesian optimization.

## Installation Instructions

1. Clone and enter this repo: <br />
  `git clone https://github.com/d-dimos/csgm-mri-ddim.git` <br />
  `cd thesis_ntua_sbim`
2. Install the requirements: `pip install -r requirements.txt`
3. Download a small subset of the test dataset: <br />
  `gdown https://drive.google.com/uc?id=1mpnV1iXid1PG0RaJswM6t9yI76b2IPxc` <br />
  `tar -zxvf datasets.tar.gz`
4. Download the pretrained NCSNv2: <br />
  `gdown https://drive.google.com/uc?id=1vAIXf8n67yEAPmH2I9qiDWzmq9fGKPYL` <br />
  `tar -zxvf checkpoint.tar.gz`
5. For instructions on how to estimate sensitivity maps (apart from the ones downloaded along with the sample data above), please visit [this repo](https://github.com/utcsilab/csgm-mri-langevin).

## Sample Results

Microstructures            |  Autocorrelations
:-------------------------:|:-------------------------:
<img src="figures/samples/microstructure_a.png" style="width:600px;"/>  |  <img src="figures/samples/cor_a.png" style="width:600px;"/>
<img src="figures/samples/microstructure_b.png" style="width:600px;"/>  |  <img src="figures/samples/cor_b.png" style="width:600px;"/>

PCs for Microstructure Evolution             |  PCs for Microstructure Samples
:-------------------------:|:-------------------------:
<img src="figures/statistics/evolution_principal_components.png" style="width:600px;"/>  |  <img src="figures/statistics/principal_components.png" style="width:600px;"/>

Predictive Mean Surface for PC1             |  Predictive Mean Surface for PC2
:-------------------------:|:-------------------------:
<img src="figures/gp_regression/mean_surface_1.png" style="width:600px;"/>  |  <img src="figures/gp_regression/mean_surface_2.png" style="width:600px;"/>

## Citations

This code uses prior work from the following papers, which must be cited:
```
@article{jalal2021robust,
  title={Robust Compressed Sensing MRI with Deep Generative Priors},
  author={Jalal, Ajil and Arvinte, Marius and Daras, Giannis and Price, Eric and Dimakis, Alexandros G and Tamir, Jonathan I},
  journal={Advances in Neural Information Processing Systems},
  year={2021}
}

@inproceedings{song2019generative,
  title={Generative modeling by estimating gradients of the data distribution},
  author={Song, Yang and Ermon, Stefano},
  booktitle={Advances in Neural Information Processing Systems},
  pages={11918--11930},
  year={2019}
}

@article{song2020improved,
  title={Improved Techniques for Training Score-Based Generative Models},
  author={Song, Yang and Ermon, Stefano},
  journal={arXiv preprint arXiv:2006.09011},
  year={2020}
}
```

The data used belongs to the NYU fastMRI dataset, which must also be cited:
```
@inproceedings{zbontar2018fastMRI,
    title={{fastMRI}: An Open Dataset and Benchmarks for Accelerated {MRI}},
    author={Jure Zbontar and Florian Knoll and Anuroop Sriram and Tullie Murrell and Zhengnan Huang and Matthew J. Muckley and Aaron Defazio and Ruben Stern and Patricia Johnson and Mary Bruno and Marc Parente and Krzysztof J. Geras and Joe Katsnelson and Hersh Chandarana and Zizhao Zhang and Michal Drozdzal and Adriana Romero and Michael Rabbat and Pascal Vincent and Nafissa Yakubova and James Pinkerton and Duo Wang and Erich Owens and C. Lawrence Zitnick and Michael P. Recht and Daniel K. Sodickson and Yvonne W. Lui},
    journal = {ArXiv e-prints},
    archivePrefix = "arXiv",
    eprint = {1811.08839},
    year={2018}
}

@article{knoll2020fastmri,
  title={fastMRI: A publicly available raw k-space and DICOM dataset of knee images for accelerated MR image reconstruction using machine learning},
  author={Knoll, Florian and Zbontar, Jure and Sriram, Anuroop and Muckley, Matthew J and Bruno, Mary and Defazio, Aaron and Parente, Marc and Geras, Krzysztof J and Katsnelson, Joe and Chandarana, Hersh and others},
  journal={Radiology: Artificial Intelligence},
  volume={2},
  number={1},
  pages={e190007},
  year={2020},
  publisher={Radiological Society of North America}
}