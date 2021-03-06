# Godot game of life shader
The Conway's Game of Life cellular automata made in Godot but running the simulation in the GPU using a shader.

This prototype is based on Alan Zucconi's work:
https://www.alanzucconi.com/2016/03/16/cellular-automata-with-shaders/

![Screenshot](https://i.imgur.com/tQLyGIW.png)

## Requirements

The project was made using [**Godot 3.2.2 - Standard version**](https://godotengine.org/), you will need to have at least version 3.1 or higher to open, edit and run this project.

## How it works

The grid size for cells is 640x480.
The project starts loading the texture **start.png**, then runs the simulation in a shader and output the result into a Viewport node called *SimulationViewport*.
After that, the *OutputViewport* gets *SimulationViewport*'s output and *SimulationTexture* uses *OutputViewport*'s output as input texture. 
*RenderTexture* node get *OutputViewport*'s output to render resulting image into screen.

![Scene](https://i.imgur.com/fhrf0A0.png)

![Pipeline](https://i.imgur.com/T601aHZ.png)

