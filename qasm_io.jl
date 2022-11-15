using Jabalizer
using PythonCall

# Import cirq (needs PythonCall package in julia)
cirq = pyimport("cirq")

# Import cirq JSON file
path_to_input = joinpath(@__DIR__, "circuit.json")

# ICM decomposition
gates_to_decomp = ["T", "T^-1"];
icm_input = Jabalizer.load_circuit_from_cirq_json(path_to_input)

icm_circuit = Jabalizer.compile(icm_input, gates_to_decomp)

# Convert native Jabalizer circuit representation to cirq 
Jabalizer.save_circuit_to_cirq_json(icm_circuit, "icm_output.json");
cirq_circuit = cirq.read_json("icm_output.json")
rm("icm_output.json")
print(cirq_circuit)

# Export to qasm using cirq
path_to_output = path_to_input = joinpath(@__DIR__, "circuit.qasm")
cirq_circuit.save_qasm(path_to_output)