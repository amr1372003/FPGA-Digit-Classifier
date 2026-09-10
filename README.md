# FPGA Digit Classifier (Quantized Neural Network in Verilog)

A hardware implementation of a fully-connected, integer-quantized neural network that classifies handwritten digits (MNIST-style), written in Verilog and verified against a bit-exact Python golden model.

<p align="center">
  <img src="FPGA Digit Classifier.png" alt="Neural Network Accelerator Architecture" width="800">
</p>

## Overview

The network takes an 8-bit grayscale digit image as input and produces a predicted digit (0–9) via an argmax over the final layer's logits.

All arithmetic is performed using fixed-point integer operations on hardware, using the same per-layer quantization parameters (`IN_ZP`, `OUT_ZP`, `M0`, `SHIFT`) as the Python reference model. This allows the hardware implementation to be compared against the software model value-for-value.

### Architecture

| Layer  | Inputs            | Neurons | Notes                       |
| ------ | ----------------- | ------- | --------------------------- |
| L1     | 784 (28×28 image) | 32      | ReLU + requantize           |
| L2     | 32                | 16      | ReLU + requantize           |
| L3     | 16                | 10      | Final logits                |
| Argmax | 10                | —       | Selects the predicted digit |

Each neuron serially accumulates:

```text
(input - IN_ZP) × weight
```

The accumulated result is then processed by adding the bias, applying the fixed-point multiplier and shift, adding `OUT_ZP`, and applying the required activation/clipping behavior.

## Hardware Architecture

The design is divided into several Verilog modules responsible for neural-network computation, control, memory, and classification.

### File Layout

```text
nn.v
    Top-level neural-network module. Connects the network layers
    together and manages the layer outputs.

neuron.v
    Implements a single neuron, including the MAC accumulator,
    bias addition, requantization, and output generation.

control.v
    FSM controlling memory addresses, layer enables, accumulation
    operations, and the overall inference sequence.

mem.v
    Synchronous memory block used for storing weights and biases.

full_mem.v
    Instantiates the required weight and bias memories for the
    neurons across all network layers.

argmax.v
    Finds the index of the maximum value among the 10 final logits.

combined.v
    Top-level DUT wrapper used by the simulation environment.

combined_tb.v
    Testbench that loads images, starts inference, and prints
    intermediate layer outputs and the final prediction.

nn_model.ipynb
    Python bit-exact golden model used as the software reference
    for hardware verification.
```

## Inference Flow

For each input image, the hardware performs inference through three fully-connected layers followed by an argmax operation.

1. **Input:** 28×28 grayscale image containing 784 pixels.
2. **Layer 1:** 784 inputs → 32 neurons.
3. **Layer 2:** 32 inputs → 16 neurons.
4. **Layer 3:** 16 inputs → 10 final logits.
5. **Argmax:** Selects the index of the maximum logit as the predicted digit.

The `control.v` FSM coordinates the memory accesses and computation timing throughout the inference process.

## Quantized Computation

The network uses integer arithmetic instead of floating-point operations.

For each neuron, the computation follows the quantized form:

```text
accumulator = Σ (input - IN_ZP) × weight

accumulator = accumulator + bias

requantized = (accumulator × M0) >> SHIFT

output = requantized + OUT_ZP
```

The resulting output is then passed through the required activation and clipping operation.

The same quantization parameters and arithmetic behavior are implemented in the Python golden model, enabling bit-exact comparison between the Verilog implementation and the software reference.

## Memory Organization

Weights and biases are stored in synchronous memory blocks.

The `full_mem.v` module instantiates the required memories for the different neurons and network layers, while `mem.v` provides the underlying synchronous memory behavior.

The control FSM manages the memory addresses and enables required during each layer's computation.

## Simulation

The project can be simulated using the provided testbench.

### Simulation Steps

1. Load an image using the testbench's `read_image` mechanism.
2. Pulse `start` to begin inference.
3. The FSM executes the complete sequence:
   `L1 → L2 → L3 → ARGMAX`.
4. `combined_tb.v` prints the intermediate layer outputs and final predicted digit.
5. Compare the hardware outputs against the corresponding results from `nn_model.ipynb`.

### Simulation Outputs

The testbench reports:

```text
L1 OUTS
L2 OUTS
L3 OUTS
Predicted Digit
```

These outputs can be compared directly with the Python golden model.

## Verification

The Verilog implementation is verified against a Python golden model using the same model parameters and quantization arithmetic.

Verification includes:

* Layer 1 outputs
* Layer 2 outputs
* Layer 3 logits
* Final argmax prediction
* Quantized arithmetic
* Requantization behavior
* Memory access timing
* Layer-to-layer data transfer
* Complete inference sequence

The hardware and Python reference model are designed to produce **bit-exact results** for the same input image and model parameters.

## Technologies

* **Verilog HDL**
* **Python**
* **Jupyter Notebook**
* **Fixed-Point Integer Arithmetic**
* **Quantized Neural Networks**
* **ModelSim / Verilog Simulation**
* **MNIST-style handwritten digit classification**

## License

This project is intended for educational and research purposes.
