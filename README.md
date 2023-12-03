# Fast_Marching_path_planning_examples

This repo contains the Matlab Toolbox for computing the Fast Marching method in 2D and 3D by Gabriel Peyre. The orginal version of the toolbox can be downloaded here: 

[Toolbox Fast Marchin Matlab](https://es.mathworks.com/matlabcentral/fileexchange/6110-toolbox-fast-marching)

The version in this repo has some modifications to correct errors that appear when compiling. 

## System Prerequisites
- Set your [Matlab supported compiler](http://www.mathworks.es/support/compilers/R2013b/index.html?sec=win64). 

- Then, in Matlab, move to the root directory of the toolbox and run the compile_mex.m script:

        compile_mex

## Setting the Matlab's Path
Next, configure Matlab's path to include the folders and subfolders of the toolbox. 

## Testing
Run the next script to test the toolbox:

    test_fast_marching_2d

## path planning examples
Besides, the repo contains 2 scripts with an example to execute the fast marching, and the fast marching square methods as a path planner, reading the map from an image. The methods are explained in the paper included in the [repo](https://jvgomez.github.io/files/pubs/fm2star.pdf):

- FM_tuto
- FM2_tuto