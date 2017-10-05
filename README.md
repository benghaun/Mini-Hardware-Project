# Mini-Hardware-Project
FSM on Mojo FPGA board for mini hardware project. It does automatic testing of a full adder circuit by cycling through all inputs, and displays an error (all LEDs flashing) if one of the outputs of the circuit is different from what was expected. 

FSM has 8 states, each corresponding to one of the 8 possible inputs to full adder circuit. The inputs to the state machine are the outputs of the full adder circuit, while the outputs of the state machine are the next inputs to the full adder circuit. 

The FSM will only change to the next state (and thus provide the next inputs for the full adder circuit) if the outputs for the current state are correct. Otherwise, it will transit to an error state.
